package com.bumptech.glide.load.resource.bitmap;

import android.util.Log;
import androidx.collection.ContainerHelpers;
import com.bumptech.glide.load.ImageHeaderParser;
import com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.Charset;
/* loaded from: classes.dex */
public final class DefaultImageHeaderParser implements ImageHeaderParser {
    public static final byte[] JPEG_EXIF_SEGMENT_PREAMBLE_BYTES = "Exif\u0000\u0000".getBytes(Charset.forName("UTF-8"));
    public static final int[] BYTES_PER_FORMAT = {0, 1, 1, 2, 4, 8, 1, 1, 2, 4, 8, 4, 8};

    /* loaded from: classes.dex */
    public static final class ByteBufferReader implements Reader {
        public final ByteBuffer byteBuffer;

        @Override // com.bumptech.glide.load.resource.bitmap.DefaultImageHeaderParser.Reader
        public final short getUInt8() throws Reader.EndOfFileException {
            if (this.byteBuffer.remaining() >= 1) {
                return (short) (this.byteBuffer.get() & 255);
            }
            throw new Reader.EndOfFileException();
        }

        @Override // com.bumptech.glide.load.resource.bitmap.DefaultImageHeaderParser.Reader
        public final long skip(long j) {
            int min = (int) Math.min(this.byteBuffer.remaining(), j);
            ByteBuffer byteBuffer = this.byteBuffer;
            byteBuffer.position(byteBuffer.position() + min);
            return min;
        }

        public ByteBufferReader(ByteBuffer byteBuffer) {
            this.byteBuffer = byteBuffer;
            byteBuffer.order(ByteOrder.BIG_ENDIAN);
        }

        @Override // com.bumptech.glide.load.resource.bitmap.DefaultImageHeaderParser.Reader
        public final int getUInt16() throws Reader.EndOfFileException {
            return getUInt8() | (getUInt8() << 8);
        }
    }

    /* loaded from: classes.dex */
    public static final class RandomAccessReader {
        public final ByteBuffer data;

        public final short getInt16(int i) {
            boolean z;
            if (this.data.remaining() - i >= 2) {
                z = true;
            } else {
                z = false;
            }
            if (z) {
                return this.data.getShort(i);
            }
            return (short) -1;
        }

        public RandomAccessReader(byte[] bArr, int i) {
            this.data = (ByteBuffer) ByteBuffer.wrap(bArr).order(ByteOrder.BIG_ENDIAN).limit(i);
        }
    }

    /* loaded from: classes.dex */
    public interface Reader {

        /* loaded from: classes.dex */
        public static final class EndOfFileException extends IOException {
            private static final long serialVersionUID = 1;

            public EndOfFileException() {
                super("Unexpectedly reached end of a file");
            }
        }

        int getUInt16() throws IOException;

        short getUInt8() throws IOException;

        long skip(long j) throws IOException;
    }

    /* loaded from: classes.dex */
    public static final class StreamReader implements Reader {
        public final InputStream is;

        public final int read(byte[] bArr, int i) throws IOException {
            int i2 = 0;
            int i3 = 0;
            while (i2 < i && (i3 = this.is.read(bArr, i2, i - i2)) != -1) {
                i2 += i3;
            }
            if (i2 != 0 || i3 != -1) {
                return i2;
            }
            throw new Reader.EndOfFileException();
        }

        @Override // com.bumptech.glide.load.resource.bitmap.DefaultImageHeaderParser.Reader
        public final short getUInt8() throws IOException {
            int read = this.is.read();
            if (read != -1) {
                return (short) read;
            }
            throw new Reader.EndOfFileException();
        }

        @Override // com.bumptech.glide.load.resource.bitmap.DefaultImageHeaderParser.Reader
        public final long skip(long j) throws IOException {
            if (j < 0) {
                return 0L;
            }
            long j2 = j;
            while (j2 > 0) {
                long skip = this.is.skip(j2);
                if (skip <= 0) {
                    if (this.is.read() == -1) {
                        break;
                    }
                    skip = 1;
                }
                j2 -= skip;
            }
            return j - j2;
        }

        public StreamReader(InputStream inputStream) {
            this.is = inputStream;
        }

        @Override // com.bumptech.glide.load.resource.bitmap.DefaultImageHeaderParser.Reader
        public final int getUInt16() throws IOException {
            return getUInt8() | (getUInt8() << 8);
        }
    }

    @Override // com.bumptech.glide.load.ImageHeaderParser
    public final ImageHeaderParser.ImageType getType(InputStream inputStream) throws IOException {
        ContainerHelpers.checkNotNull(inputStream);
        return getType(new StreamReader(inputStream));
    }

    public static int parseExifSegment(StreamReader streamReader, byte[] bArr, int i) throws IOException {
        boolean z;
        ByteOrder byteOrder;
        boolean z2;
        int i2;
        short int16;
        boolean z3;
        int i3;
        int read = streamReader.read(bArr, i);
        if (read != i) {
            if (Log.isLoggable("DfltImageHeaderParser", 3)) {
                Log.d("DfltImageHeaderParser", "Unable to read exif segment data, length: " + i + ", actually read: " + read);
            }
            return -1;
        }
        if (bArr == null || i <= JPEG_EXIF_SEGMENT_PREAMBLE_BYTES.length) {
            z = false;
        } else {
            z = true;
        }
        if (z) {
            int i4 = 0;
            while (true) {
                byte[] bArr2 = JPEG_EXIF_SEGMENT_PREAMBLE_BYTES;
                if (i4 >= bArr2.length) {
                    break;
                } else if (bArr[i4] != bArr2[i4]) {
                    z = false;
                    break;
                } else {
                    i4++;
                }
            }
        }
        if (z) {
            RandomAccessReader randomAccessReader = new RandomAccessReader(bArr, i);
            short int162 = randomAccessReader.getInt16(6);
            if (int162 == 18761) {
                byteOrder = ByteOrder.LITTLE_ENDIAN;
            } else if (int162 != 19789) {
                if (Log.isLoggable("DfltImageHeaderParser", 3)) {
                    Log.d("DfltImageHeaderParser", "Unknown endianness = " + ((int) int162));
                }
                byteOrder = ByteOrder.BIG_ENDIAN;
            } else {
                byteOrder = ByteOrder.BIG_ENDIAN;
            }
            randomAccessReader.data.order(byteOrder);
            if (randomAccessReader.data.remaining() - 10 >= 4) {
                z2 = true;
            } else {
                z2 = false;
            }
            if (z2) {
                i2 = randomAccessReader.data.getInt(10);
            } else {
                i2 = -1;
            }
            int i5 = i2 + 6;
            short int163 = randomAccessReader.getInt16(i5);
            for (int i6 = 0; i6 < int163; i6++) {
                int i7 = (i6 * 12) + i5 + 2;
                if (randomAccessReader.getInt16(i7) == 274) {
                    short int164 = randomAccessReader.getInt16(i7 + 2);
                    if (int164 >= 1 && int164 <= 12) {
                        int i8 = i7 + 4;
                        if (randomAccessReader.data.remaining() - i8 >= 4) {
                            z3 = true;
                        } else {
                            z3 = false;
                        }
                        if (z3) {
                            i3 = randomAccessReader.data.getInt(i8);
                        } else {
                            i3 = -1;
                        }
                        if (i3 >= 0) {
                            if (Log.isLoggable("DfltImageHeaderParser", 3)) {
                                Log.d("DfltImageHeaderParser", "Got tagIndex=" + i6 + " tagType=" + ((int) int16) + " formatCode=" + ((int) int164) + " componentCount=" + i3);
                            }
                            int i9 = i3 + BYTES_PER_FORMAT[int164];
                            if (i9 <= 4) {
                                int i10 = i7 + 8;
                                if (i10 < 0 || i10 > randomAccessReader.data.remaining()) {
                                    if (Log.isLoggable("DfltImageHeaderParser", 3)) {
                                        Log.d("DfltImageHeaderParser", "Illegal tagValueOffset=" + i10 + " tagType=" + ((int) int16));
                                    }
                                } else if (i9 >= 0 && i9 + i10 <= randomAccessReader.data.remaining()) {
                                    return randomAccessReader.getInt16(i10);
                                } else {
                                    if (Log.isLoggable("DfltImageHeaderParser", 3)) {
                                        Log.d("DfltImageHeaderParser", "Illegal number of bytes for TI tag data tagType=" + ((int) int16));
                                    }
                                }
                            } else if (Log.isLoggable("DfltImageHeaderParser", 3)) {
                                Log.d("DfltImageHeaderParser", "Got byte count > 4, not orientation, continuing, formatCode=" + ((int) int164));
                            }
                        } else if (Log.isLoggable("DfltImageHeaderParser", 3)) {
                            Log.d("DfltImageHeaderParser", "Negative tiff component count");
                        }
                    } else if (Log.isLoggable("DfltImageHeaderParser", 3)) {
                        Log.d("DfltImageHeaderParser", "Got invalid format code = " + ((int) int164));
                    }
                }
            }
            return -1;
        }
        if (Log.isLoggable("DfltImageHeaderParser", 3)) {
            Log.d("DfltImageHeaderParser", "Missing jpeg exif preamble");
        }
        return -1;
    }

    @Override // com.bumptech.glide.load.ImageHeaderParser
    public final int getOrientation(InputStream inputStream, ArrayPool arrayPool) throws IOException {
        boolean z;
        ContainerHelpers.checkNotNull(inputStream);
        StreamReader streamReader = new StreamReader(inputStream);
        ContainerHelpers.checkNotNull(arrayPool);
        int i = -1;
        try {
            int uInt16 = streamReader.getUInt16();
            if ((uInt16 & 65496) == 65496 || uInt16 == 19789 || uInt16 == 18761) {
                z = true;
            } else {
                z = false;
            }
            if (z) {
                int moveToExifSegmentAndGetLength = moveToExifSegmentAndGetLength(streamReader);
                if (moveToExifSegmentAndGetLength != -1) {
                    byte[] bArr = (byte[]) arrayPool.get(moveToExifSegmentAndGetLength, byte[].class);
                    int parseExifSegment = parseExifSegment(streamReader, bArr, moveToExifSegmentAndGetLength);
                    arrayPool.put(bArr);
                    i = parseExifSegment;
                } else if (Log.isLoggable("DfltImageHeaderParser", 3)) {
                    Log.d("DfltImageHeaderParser", "Failed to parse exif segment length, or exif segment not found");
                }
            } else if (Log.isLoggable("DfltImageHeaderParser", 3)) {
                Log.d("DfltImageHeaderParser", "Parser doesn't handle magic number: " + uInt16);
            }
        } catch (Reader.EndOfFileException unused) {
        }
        return i;
    }

    @Override // com.bumptech.glide.load.ImageHeaderParser
    public final ImageHeaderParser.ImageType getType(ByteBuffer byteBuffer) throws IOException {
        ContainerHelpers.checkNotNull(byteBuffer);
        return getType(new ByteBufferReader(byteBuffer));
    }

    public static ImageHeaderParser.ImageType getType(Reader reader) throws IOException {
        try {
            int uInt16 = reader.getUInt16();
            if (uInt16 == 65496) {
                return ImageHeaderParser.ImageType.JPEG;
            }
            int uInt8 = (uInt16 << 8) | reader.getUInt8();
            if (uInt8 == 4671814) {
                return ImageHeaderParser.ImageType.GIF;
            }
            int uInt82 = (uInt8 << 8) | reader.getUInt8();
            if (uInt82 == -1991225785) {
                reader.skip(21L);
                try {
                    return reader.getUInt8() >= 3 ? ImageHeaderParser.ImageType.PNG_A : ImageHeaderParser.ImageType.PNG;
                } catch (Reader.EndOfFileException unused) {
                    return ImageHeaderParser.ImageType.PNG;
                }
            } else if (uInt82 != 1380533830) {
                return ImageHeaderParser.ImageType.UNKNOWN;
            } else {
                reader.skip(4L);
                if (((reader.getUInt16() << 16) | reader.getUInt16()) != 1464156752) {
                    return ImageHeaderParser.ImageType.UNKNOWN;
                }
                int uInt162 = (reader.getUInt16() << 16) | reader.getUInt16();
                if ((uInt162 & (-256)) != 1448097792) {
                    return ImageHeaderParser.ImageType.UNKNOWN;
                }
                int i = uInt162 & 255;
                if (i == 88) {
                    reader.skip(4L);
                    return (reader.getUInt8() & 16) != 0 ? ImageHeaderParser.ImageType.WEBP_A : ImageHeaderParser.ImageType.WEBP;
                } else if (i != 76) {
                    return ImageHeaderParser.ImageType.WEBP;
                } else {
                    reader.skip(4L);
                    return (reader.getUInt8() & 8) != 0 ? ImageHeaderParser.ImageType.WEBP_A : ImageHeaderParser.ImageType.WEBP;
                }
            }
        } catch (Reader.EndOfFileException unused2) {
            return ImageHeaderParser.ImageType.UNKNOWN;
        }
    }

    public static int moveToExifSegmentAndGetLength(StreamReader streamReader) throws IOException {
        short uInt8;
        short uInt82;
        int uInt16;
        long j;
        long skip;
        do {
            if (streamReader.getUInt8() != 255) {
                if (Log.isLoggable("DfltImageHeaderParser", 3)) {
                    Log.d("DfltImageHeaderParser", "Unknown segmentId=" + ((int) uInt8));
                }
                return -1;
            }
            uInt82 = streamReader.getUInt8();
            if (uInt82 == 218) {
                return -1;
            }
            if (uInt82 == 217) {
                if (Log.isLoggable("DfltImageHeaderParser", 3)) {
                    Log.d("DfltImageHeaderParser", "Found MARKER_EOI in exif segment");
                }
                return -1;
            }
            uInt16 = streamReader.getUInt16() - 2;
            if (uInt82 == 225) {
                return uInt16;
            }
            j = uInt16;
            skip = streamReader.skip(j);
        } while (skip == j);
        if (Log.isLoggable("DfltImageHeaderParser", 3)) {
            Log.d("DfltImageHeaderParser", "Unable to skip enough data, type: " + ((int) uInt82) + ", wanted to skip: " + uInt16 + ", but actually skipped: " + skip);
        }
        return -1;
    }
}
