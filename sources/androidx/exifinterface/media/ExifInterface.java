package androidx.exifinterface.media;

import android.content.res.AssetManager;
import android.media.MediaDataSource;
import android.media.MediaMetadataRetriever;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.system.Os;
import android.system.OsConstants;
import android.util.Log;
import com.android.systemui.shared.system.QuickStepContract;
import com.android.systemui.shared.system.SysUiStatsLog;
import java.io.BufferedInputStream;
import java.io.DataInput;
import java.io.DataInputStream;
import java.io.EOFException;
import java.io.FileDescriptor;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import java.util.regex.Pattern;
import java.util.zip.CRC32;
/* loaded from: classes.dex */
public final class ExifInterface {
    public static final Charset ASCII;
    public static final ExifTag[][] EXIF_TAGS;
    public static final byte[] IDENTIFIER_EXIF_APP1;
    public static final byte[] IDENTIFIER_XMP_APP1;
    public boolean mAreThumbnailStripsConsecutive;
    public AssetManager.AssetInputStream mAssetInputStream;
    public final HashMap<String, ExifAttribute>[] mAttributes;
    public HashSet mAttributesOffsets;
    public ByteOrder mExifByteOrder = ByteOrder.BIG_ENDIAN;
    public int mMimeType;
    public int mOffsetToExifData;
    public int mOrfMakerNoteOffset;
    public int mOrfThumbnailLength;
    public int mOrfThumbnailOffset;
    public FileDescriptor mSeekableFileDescriptor;
    public static final boolean DEBUG = Log.isLoggable("ExifInterface", 3);
    public static final List<Integer> ROTATION_ORDER = Arrays.asList(1, 6, 3, 8);
    public static final List<Integer> FLIPPED_ROTATION_ORDER = Arrays.asList(2, 7, 4, 5);
    public static final int[] BITS_PER_SAMPLE_RGB = {8, 8, 8};
    public static final int[] BITS_PER_SAMPLE_GREYSCALE_2 = {8};
    public static final byte[] JPEG_SIGNATURE = {-1, -40, -1};
    public static final byte[] HEIF_TYPE_FTYP = {102, 116, 121, 112};
    public static final byte[] HEIF_BRAND_MIF1 = {109, 105, 102, 49};
    public static final byte[] HEIF_BRAND_HEIC = {104, 101, 105, 99};
    public static final byte[] ORF_MAKER_NOTE_HEADER_1 = {79, 76, 89, 77, 80, 0};
    public static final byte[] ORF_MAKER_NOTE_HEADER_2 = {79, 76, 89, 77, 80, 85, 83, 0, 73, 73};
    public static final byte[] PNG_SIGNATURE = {-119, 80, 78, 71, 13, 10, 26, 10};
    public static final byte[] PNG_CHUNK_TYPE_EXIF = {101, 88, 73, 102};
    public static final byte[] PNG_CHUNK_TYPE_IHDR = {73, 72, 68, 82};
    public static final byte[] PNG_CHUNK_TYPE_IEND = {73, 69, 78, 68};
    public static final byte[] WEBP_SIGNATURE_1 = {82, 73, 70, 70};
    public static final byte[] WEBP_SIGNATURE_2 = {87, 69, 66, 80};
    public static final byte[] WEBP_CHUNK_TYPE_EXIF = {69, 88, 73, 70};
    public static final String[] IFD_FORMAT_NAMES = {"", "BYTE", "STRING", "USHORT", "ULONG", "URATIONAL", "SBYTE", "UNDEFINED", "SSHORT", "SLONG", "SRATIONAL", "SINGLE", "DOUBLE", "IFD"};
    public static final int[] IFD_FORMAT_BYTES_PER_FORMAT = {0, 1, 1, 2, 4, 8, 1, 1, 2, 4, 8, 4, 8, 1};
    public static final byte[] EXIF_ASCII_PREFIX = {65, 83, 67, 73, 73, 0, 0, 0};
    public static final ExifTag TAG_RAF_IMAGE_SIZE = new ExifTag("StripOffsets", 273, 3);
    public static final ExifTag[] EXIF_POINTER_TAGS = {new ExifTag("SubIFDPointer", 330, 4), new ExifTag("ExifIFDPointer", 34665, 4), new ExifTag("GPSInfoIFDPointer", 34853, 4), new ExifTag("InteroperabilityIFDPointer", 40965, 4), new ExifTag("CameraSettingsIFDPointer", 8224, 1), new ExifTag("ImageProcessingIFDPointer", 8256, 1)};
    public static final HashMap<Integer, ExifTag>[] sExifTagMapsForReading = new HashMap[10];
    public static final HashMap<String, ExifTag>[] sExifTagMapsForWriting = new HashMap[10];
    public static final HashSet<String> sTagSetForCompatibility = new HashSet<>(Arrays.asList("FNumber", "DigitalZoomRatio", "ExposureTime", "SubjectDistance", "GPSTimeStamp"));
    public static final HashMap<Integer, Integer> sExifPointerTagMap = new HashMap<>();

    /* loaded from: classes.dex */
    public static class ByteOrderedDataInputStream extends InputStream implements DataInput {
        public ByteOrder mByteOrder;
        public final DataInputStream mDataInputStream;
        public int mPosition;
        public byte[] mSkipBuffer;
        public static final ByteOrder LITTLE_ENDIAN = ByteOrder.LITTLE_ENDIAN;
        public static final ByteOrder BIG_ENDIAN = ByteOrder.BIG_ENDIAN;

        public ByteOrderedDataInputStream(InputStream inputStream, int i) throws IOException {
            ByteOrder byteOrder = ByteOrder.BIG_ENDIAN;
            this.mByteOrder = byteOrder;
            DataInputStream dataInputStream = new DataInputStream(inputStream);
            this.mDataInputStream = dataInputStream;
            dataInputStream.mark(0);
            this.mPosition = 0;
            this.mByteOrder = byteOrder;
        }

        @Override // java.io.InputStream
        public final int read() throws IOException {
            this.mPosition++;
            return this.mDataInputStream.read();
        }

        @Override // java.io.DataInput
        public final void readFully(byte[] bArr, int i, int i2) throws IOException {
            this.mPosition += i2;
            this.mDataInputStream.readFully(bArr, i, i2);
        }

        public final void skipFully(int i) throws IOException {
            int i2 = 0;
            while (i2 < i) {
                int i3 = i - i2;
                int skip = (int) this.mDataInputStream.skip(i3);
                if (skip <= 0) {
                    if (this.mSkipBuffer == null) {
                        this.mSkipBuffer = new byte[QuickStepContract.SYSUI_STATE_ASSIST_GESTURE_CONSTRAINED];
                    }
                    skip = this.mDataInputStream.read(this.mSkipBuffer, 0, Math.min((int) QuickStepContract.SYSUI_STATE_ASSIST_GESTURE_CONSTRAINED, i3));
                    if (skip == -1) {
                        throw new EOFException("Reached EOF while skipping " + i + " bytes.");
                    }
                }
                i2 += skip;
            }
            this.mPosition += i2;
        }

        @Override // java.io.InputStream
        public final int available() throws IOException {
            return this.mDataInputStream.available();
        }

        @Override // java.io.InputStream
        public final void mark(int i) {
            throw new UnsupportedOperationException("Mark is currently unsupported");
        }

        @Override // java.io.DataInput
        public final boolean readBoolean() throws IOException {
            this.mPosition++;
            return this.mDataInputStream.readBoolean();
        }

        @Override // java.io.DataInput
        public final byte readByte() throws IOException {
            this.mPosition++;
            int read = this.mDataInputStream.read();
            if (read >= 0) {
                return (byte) read;
            }
            throw new EOFException();
        }

        @Override // java.io.DataInput
        public final char readChar() throws IOException {
            this.mPosition += 2;
            return this.mDataInputStream.readChar();
        }

        @Override // java.io.DataInput
        public final int readInt() throws IOException {
            this.mPosition += 4;
            int read = this.mDataInputStream.read();
            int read2 = this.mDataInputStream.read();
            int read3 = this.mDataInputStream.read();
            int read4 = this.mDataInputStream.read();
            if ((read | read2 | read3 | read4) >= 0) {
                ByteOrder byteOrder = this.mByteOrder;
                if (byteOrder == LITTLE_ENDIAN) {
                    return (read4 << 24) + (read3 << 16) + (read2 << 8) + read;
                }
                if (byteOrder == BIG_ENDIAN) {
                    return (read << 24) + (read2 << 16) + (read3 << 8) + read4;
                }
                StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Invalid byte order: ");
                m.append(this.mByteOrder);
                throw new IOException(m.toString());
            }
            throw new EOFException();
        }

        @Override // java.io.DataInput
        public final String readLine() throws IOException {
            Log.d("ExifInterface", "Currently unsupported");
            return null;
        }

        @Override // java.io.DataInput
        public final long readLong() throws IOException {
            this.mPosition += 8;
            int read = this.mDataInputStream.read();
            int read2 = this.mDataInputStream.read();
            int read3 = this.mDataInputStream.read();
            int read4 = this.mDataInputStream.read();
            int read5 = this.mDataInputStream.read();
            int read6 = this.mDataInputStream.read();
            int read7 = this.mDataInputStream.read();
            int read8 = this.mDataInputStream.read();
            if ((read | read2 | read3 | read4 | read5 | read6 | read7 | read8) >= 0) {
                ByteOrder byteOrder = this.mByteOrder;
                if (byteOrder == LITTLE_ENDIAN) {
                    return (read8 << 56) + (read7 << 48) + (read6 << 40) + (read5 << 32) + (read4 << 24) + (read3 << 16) + (read2 << 8) + read;
                }
                if (byteOrder == BIG_ENDIAN) {
                    return (read << 56) + (read2 << 48) + (read3 << 40) + (read4 << 32) + (read5 << 24) + (read6 << 16) + (read7 << 8) + read8;
                }
                StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Invalid byte order: ");
                m.append(this.mByteOrder);
                throw new IOException(m.toString());
            }
            throw new EOFException();
        }

        @Override // java.io.DataInput
        public final short readShort() throws IOException {
            int i;
            this.mPosition += 2;
            int read = this.mDataInputStream.read();
            int read2 = this.mDataInputStream.read();
            if ((read | read2) >= 0) {
                ByteOrder byteOrder = this.mByteOrder;
                if (byteOrder == LITTLE_ENDIAN) {
                    i = (read2 << 8) + read;
                } else if (byteOrder == BIG_ENDIAN) {
                    i = (read << 8) + read2;
                } else {
                    StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Invalid byte order: ");
                    m.append(this.mByteOrder);
                    throw new IOException(m.toString());
                }
                return (short) i;
            }
            throw new EOFException();
        }

        @Override // java.io.DataInput
        public final String readUTF() throws IOException {
            this.mPosition += 2;
            return this.mDataInputStream.readUTF();
        }

        @Override // java.io.DataInput
        public final int readUnsignedByte() throws IOException {
            this.mPosition++;
            return this.mDataInputStream.readUnsignedByte();
        }

        @Override // java.io.DataInput
        public final int readUnsignedShort() throws IOException {
            this.mPosition += 2;
            int read = this.mDataInputStream.read();
            int read2 = this.mDataInputStream.read();
            if ((read | read2) >= 0) {
                ByteOrder byteOrder = this.mByteOrder;
                if (byteOrder == LITTLE_ENDIAN) {
                    return (read2 << 8) + read;
                }
                if (byteOrder == BIG_ENDIAN) {
                    return (read << 8) + read2;
                }
                StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Invalid byte order: ");
                m.append(this.mByteOrder);
                throw new IOException(m.toString());
            }
            throw new EOFException();
        }

        @Override // java.io.InputStream
        public final void reset() {
            throw new UnsupportedOperationException("Reset is currently unsupported");
        }

        @Override // java.io.DataInput
        public final int skipBytes(int i) throws IOException {
            throw new UnsupportedOperationException("skipBytes is currently unsupported");
        }

        @Override // java.io.InputStream
        public final int read(byte[] bArr, int i, int i2) throws IOException {
            int read = this.mDataInputStream.read(bArr, i, i2);
            this.mPosition += read;
            return read;
        }

        @Override // java.io.DataInput
        public final double readDouble() throws IOException {
            return Double.longBitsToDouble(readLong());
        }

        @Override // java.io.DataInput
        public final float readFloat() throws IOException {
            return Float.intBitsToFloat(readInt());
        }

        @Override // java.io.DataInput
        public final void readFully(byte[] bArr) throws IOException {
            this.mPosition += bArr.length;
            this.mDataInputStream.readFully(bArr);
        }

        /* JADX WARN: Illegal instructions before constructor call */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public ByteOrderedDataInputStream(byte[] r2) throws java.io.IOException {
            /*
                r1 = this;
                java.io.ByteArrayInputStream r0 = new java.io.ByteArrayInputStream
                r0.<init>(r2)
                java.nio.ByteOrder r2 = java.nio.ByteOrder.BIG_ENDIAN
                r2 = 0
                r1.<init>(r0, r2)
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: androidx.exifinterface.media.ExifInterface.ByteOrderedDataInputStream.<init>(byte[]):void");
        }

        /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
        public ByteOrderedDataInputStream(InputStream inputStream) throws IOException {
            this(inputStream, 0);
            ByteOrder byteOrder = ByteOrder.BIG_ENDIAN;
        }
    }

    /* loaded from: classes.dex */
    public static class ExifAttribute {
        public final byte[] bytes;
        public final long bytesOffset;
        public final int format;
        public final int numberOfComponents;

        public ExifAttribute(int i, int i2, byte[] bArr) {
            this(i, i2, -1L, bArr);
        }

        public static ExifAttribute createULong(long j, ByteOrder byteOrder) {
            long[] jArr = {j};
            ByteBuffer wrap = ByteBuffer.wrap(new byte[ExifInterface.IFD_FORMAT_BYTES_PER_FORMAT[4] * 1]);
            wrap.order(byteOrder);
            for (int i = 0; i < 1; i++) {
                wrap.putInt((int) jArr[i]);
            }
            return new ExifAttribute(4, 1, wrap.array());
        }

        public static ExifAttribute createURational(Rational rational, ByteOrder byteOrder) {
            Rational[] rationalArr = {rational};
            ByteBuffer wrap = ByteBuffer.wrap(new byte[ExifInterface.IFD_FORMAT_BYTES_PER_FORMAT[5] * 1]);
            wrap.order(byteOrder);
            for (int i = 0; i < 1; i++) {
                Rational rational2 = rationalArr[i];
                wrap.putInt((int) rational2.numerator);
                wrap.putInt((int) rational2.denominator);
            }
            return new ExifAttribute(5, 1, wrap.array());
        }

        public static ExifAttribute createUShort(int i, ByteOrder byteOrder) {
            int[] iArr = {i};
            ByteBuffer wrap = ByteBuffer.wrap(new byte[ExifInterface.IFD_FORMAT_BYTES_PER_FORMAT[3] * 1]);
            wrap.order(byteOrder);
            for (int i2 = 0; i2 < 1; i2++) {
                wrap.putShort((short) iArr[i2]);
            }
            return new ExifAttribute(3, 1, wrap.array());
        }

        public ExifAttribute(int i, int i2, long j, byte[] bArr) {
            this.format = i;
            this.numberOfComponents = i2;
            this.bytesOffset = j;
            this.bytes = bArr;
        }

        public static ExifAttribute createString(String str) {
            byte[] bytes = (str + (char) 0).getBytes(ExifInterface.ASCII);
            return new ExifAttribute(2, bytes.length, bytes);
        }

        /* JADX WARN: Not initialized variable reg: 3, insn: 0x01a3: MOVE  (r2 I:??[OBJECT, ARRAY]) = (r3 I:??[OBJECT, ARRAY]), block:B:136:0x01a3 */
        /* JADX WARN: Removed duplicated region for block: B:161:0x01a6 A[EXC_TOP_SPLITTER, SYNTHETIC] */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final java.lang.Object getValue(java.nio.ByteOrder r13) {
            /*
                Method dump skipped, instructions count: 460
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: androidx.exifinterface.media.ExifInterface.ExifAttribute.getValue(java.nio.ByteOrder):java.lang.Object");
        }

        public final String toString() {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("(");
            m.append(ExifInterface.IFD_FORMAT_NAMES[this.format]);
            m.append(", data length:");
            m.append(this.bytes.length);
            m.append(")");
            return m.toString();
        }

        public final double getDoubleValue(ByteOrder byteOrder) {
            Object value = getValue(byteOrder);
            if (value == null) {
                throw new NumberFormatException("NULL can't be converted to a double value");
            } else if (value instanceof String) {
                return Double.parseDouble((String) value);
            } else {
                if (value instanceof long[]) {
                    long[] jArr = (long[]) value;
                    if (jArr.length == 1) {
                        return jArr[0];
                    }
                    throw new NumberFormatException("There are more than one component");
                } else if (value instanceof int[]) {
                    int[] iArr = (int[]) value;
                    if (iArr.length == 1) {
                        return iArr[0];
                    }
                    throw new NumberFormatException("There are more than one component");
                } else if (value instanceof double[]) {
                    double[] dArr = (double[]) value;
                    if (dArr.length == 1) {
                        return dArr[0];
                    }
                    throw new NumberFormatException("There are more than one component");
                } else if (value instanceof Rational[]) {
                    Rational[] rationalArr = (Rational[]) value;
                    if (rationalArr.length == 1) {
                        Rational rational = rationalArr[0];
                        return rational.numerator / rational.denominator;
                    }
                    throw new NumberFormatException("There are more than one component");
                } else {
                    throw new NumberFormatException("Couldn't find a double value");
                }
            }
        }

        public final int getIntValue(ByteOrder byteOrder) {
            Object value = getValue(byteOrder);
            if (value == null) {
                throw new NumberFormatException("NULL can't be converted to a integer value");
            } else if (value instanceof String) {
                return Integer.parseInt((String) value);
            } else {
                if (value instanceof long[]) {
                    long[] jArr = (long[]) value;
                    if (jArr.length == 1) {
                        return (int) jArr[0];
                    }
                    throw new NumberFormatException("There are more than one component");
                } else if (value instanceof int[]) {
                    int[] iArr = (int[]) value;
                    if (iArr.length == 1) {
                        return iArr[0];
                    }
                    throw new NumberFormatException("There are more than one component");
                } else {
                    throw new NumberFormatException("Couldn't find a integer value");
                }
            }
        }

        public final String getStringValue(ByteOrder byteOrder) {
            Object value = getValue(byteOrder);
            if (value == null) {
                return null;
            }
            if (value instanceof String) {
                return (String) value;
            }
            StringBuilder sb = new StringBuilder();
            int i = 0;
            if (value instanceof long[]) {
                long[] jArr = (long[]) value;
                while (i < jArr.length) {
                    sb.append(jArr[i]);
                    i++;
                    if (i != jArr.length) {
                        sb.append(",");
                    }
                }
                return sb.toString();
            } else if (value instanceof int[]) {
                int[] iArr = (int[]) value;
                while (i < iArr.length) {
                    sb.append(iArr[i]);
                    i++;
                    if (i != iArr.length) {
                        sb.append(",");
                    }
                }
                return sb.toString();
            } else if (value instanceof double[]) {
                double[] dArr = (double[]) value;
                while (i < dArr.length) {
                    sb.append(dArr[i]);
                    i++;
                    if (i != dArr.length) {
                        sb.append(",");
                    }
                }
                return sb.toString();
            } else if (!(value instanceof Rational[])) {
                return null;
            } else {
                Rational[] rationalArr = (Rational[]) value;
                while (i < rationalArr.length) {
                    sb.append(rationalArr[i].numerator);
                    sb.append('/');
                    sb.append(rationalArr[i].denominator);
                    i++;
                    if (i != rationalArr.length) {
                        sb.append(",");
                    }
                }
                return sb.toString();
            }
        }
    }

    /* loaded from: classes.dex */
    public static class Rational {
        public final long denominator;
        public final long numerator;

        public final String toString() {
            return this.numerator + "/" + this.denominator;
        }

        public Rational(long j, long j2) {
            if (j2 == 0) {
                this.numerator = 0L;
                this.denominator = 1L;
                return;
            }
            this.numerator = j;
            this.denominator = j2;
        }
    }

    /* loaded from: classes.dex */
    public static class SeekableByteOrderedDataInputStream extends ByteOrderedDataInputStream {
        public SeekableByteOrderedDataInputStream(byte[] bArr) throws IOException {
            super(bArr);
            this.mDataInputStream.mark(Integer.MAX_VALUE);
        }

        public final void seek(long j) throws IOException {
            int i = this.mPosition;
            if (i > j) {
                this.mPosition = 0;
                this.mDataInputStream.reset();
            } else {
                j -= i;
            }
            skipFully((int) j);
        }

        public SeekableByteOrderedDataInputStream(InputStream inputStream) throws IOException {
            super(inputStream);
            if (inputStream.markSupported()) {
                this.mDataInputStream.mark(Integer.MAX_VALUE);
                return;
            }
            throw new IllegalArgumentException("Cannot create SeekableByteOrderedDataInputStream with stream that does not support mark/reset");
        }
    }

    static {
        ExifTag[] exifTagArr;
        "VP8X".getBytes(Charset.defaultCharset());
        "VP8L".getBytes(Charset.defaultCharset());
        "VP8 ".getBytes(Charset.defaultCharset());
        "ANIM".getBytes(Charset.defaultCharset());
        "ANMF".getBytes(Charset.defaultCharset());
        ExifTag[] exifTagArr2 = {new ExifTag("NewSubfileType", 254, 4), new ExifTag("SubfileType", 255, 4), new ExifTag("ImageWidth", 256, 3, 4), new ExifTag("ImageLength", 257, 3, 4), new ExifTag("BitsPerSample", 258, 3), new ExifTag("Compression", 259, 3), new ExifTag("PhotometricInterpretation", SysUiStatsLog.LAUNCHER_SNAPSHOT, 3), new ExifTag("ImageDescription", 270, 2), new ExifTag("Make", 271, 2), new ExifTag("Model", 272, 2), new ExifTag("StripOffsets", 273, 3, 4), new ExifTag("Orientation", 274, 3), new ExifTag("SamplesPerPixel", SysUiStatsLog.MEDIAOUTPUT_OP_SWITCH_REPORTED, 3), new ExifTag("RowsPerStrip", 278, 3, 4), new ExifTag("StripByteCounts", 279, 3, 4), new ExifTag("XResolution", 282, 5), new ExifTag("YResolution", 283, 5), new ExifTag("PlanarConfiguration", 284, 3), new ExifTag("ResolutionUnit", 296, 3), new ExifTag("TransferFunction", 301, 3), new ExifTag("Software", 305, 2), new ExifTag("DateTime", 306, 2), new ExifTag("Artist", 315, 2), new ExifTag("WhitePoint", 318, 5), new ExifTag("PrimaryChromaticities", 319, 5), new ExifTag("SubIFDPointer", 330, 4), new ExifTag("JPEGInterchangeFormat", 513, 4), new ExifTag("JPEGInterchangeFormatLength", 514, 4), new ExifTag("YCbCrCoefficients", 529, 5), new ExifTag("YCbCrSubSampling", 530, 3), new ExifTag("YCbCrPositioning", 531, 3), new ExifTag("ReferenceBlackWhite", 532, 5), new ExifTag("Copyright", 33432, 2), new ExifTag("ExifIFDPointer", 34665, 4), new ExifTag("GPSInfoIFDPointer", 34853, 4), new ExifTag("SensorTopBorder", 4, 4), new ExifTag("SensorLeftBorder", 5, 4), new ExifTag("SensorBottomBorder", 6, 4), new ExifTag("SensorRightBorder", 7, 4), new ExifTag("ISO", 23, 3), new ExifTag("JpgFromRaw", 46, 7), new ExifTag("Xmp", 700, 1)};
        EXIF_TAGS = new ExifTag[][]{exifTagArr2, new ExifTag[]{new ExifTag("ExposureTime", 33434, 5), new ExifTag("FNumber", 33437, 5), new ExifTag("ExposureProgram", 34850, 3), new ExifTag("SpectralSensitivity", 34852, 2), new ExifTag("PhotographicSensitivity", 34855, 3), new ExifTag("OECF", 34856, 7), new ExifTag("SensitivityType", 34864, 3), new ExifTag("StandardOutputSensitivity", 34865, 4), new ExifTag("RecommendedExposureIndex", 34866, 4), new ExifTag("ISOSpeed", 34867, 4), new ExifTag("ISOSpeedLatitudeyyy", 34868, 4), new ExifTag("ISOSpeedLatitudezzz", 34869, 4), new ExifTag("ExifVersion", 36864, 2), new ExifTag("DateTimeOriginal", 36867, 2), new ExifTag("DateTimeDigitized", 36868, 2), new ExifTag("OffsetTime", 36880, 2), new ExifTag("OffsetTimeOriginal", 36881, 2), new ExifTag("OffsetTimeDigitized", 36882, 2), new ExifTag("ComponentsConfiguration", 37121, 7), new ExifTag("CompressedBitsPerPixel", 37122, 5), new ExifTag("ShutterSpeedValue", 37377, 10), new ExifTag("ApertureValue", 37378, 5), new ExifTag("BrightnessValue", 37379, 10), new ExifTag("ExposureBiasValue", 37380, 10), new ExifTag("MaxApertureValue", 37381, 5), new ExifTag("SubjectDistance", 37382, 5), new ExifTag("MeteringMode", 37383, 3), new ExifTag("LightSource", 37384, 3), new ExifTag("Flash", 37385, 3), new ExifTag("FocalLength", 37386, 5), new ExifTag("SubjectArea", 37396, 3), new ExifTag("MakerNote", 37500, 7), new ExifTag("UserComment", 37510, 7), new ExifTag("SubSecTime", 37520, 2), new ExifTag("SubSecTimeOriginal", 37521, 2), new ExifTag("SubSecTimeDigitized", 37522, 2), new ExifTag("FlashpixVersion", 40960, 7), new ExifTag("ColorSpace", 40961, 3), new ExifTag("PixelXDimension", 40962, 3, 4), new ExifTag("PixelYDimension", 40963, 3, 4), new ExifTag("RelatedSoundFile", 40964, 2), new ExifTag("InteroperabilityIFDPointer", 40965, 4), new ExifTag("FlashEnergy", 41483, 5), new ExifTag("SpatialFrequencyResponse", 41484, 7), new ExifTag("FocalPlaneXResolution", 41486, 5), new ExifTag("FocalPlaneYResolution", 41487, 5), new ExifTag("FocalPlaneResolutionUnit", 41488, 3), new ExifTag("SubjectLocation", 41492, 3), new ExifTag("ExposureIndex", 41493, 5), new ExifTag("SensingMethod", 41495, 3), new ExifTag("FileSource", 41728, 7), new ExifTag("SceneType", 41729, 7), new ExifTag("CFAPattern", 41730, 7), new ExifTag("CustomRendered", 41985, 3), new ExifTag("ExposureMode", 41986, 3), new ExifTag("WhiteBalance", 41987, 3), new ExifTag("DigitalZoomRatio", 41988, 5), new ExifTag("FocalLengthIn35mmFilm", 41989, 3), new ExifTag("SceneCaptureType", 41990, 3), new ExifTag("GainControl", 41991, 3), new ExifTag("Contrast", 41992, 3), new ExifTag("Saturation", 41993, 3), new ExifTag("Sharpness", 41994, 3), new ExifTag("DeviceSettingDescription", 41995, 7), new ExifTag("SubjectDistanceRange", 41996, 3), new ExifTag("ImageUniqueID", 42016, 2), new ExifTag("CameraOwnerName", 42032, 2), new ExifTag("BodySerialNumber", 42033, 2), new ExifTag("LensSpecification", 42034, 5), new ExifTag("LensMake", 42035, 2), new ExifTag("LensModel", 42036, 2), new ExifTag("Gamma", 42240, 5), new ExifTag("DNGVersion", 50706, 1), new ExifTag("DefaultCropSize", 50720, 3, 4)}, new ExifTag[]{new ExifTag("GPSVersionID", 0, 1), new ExifTag("GPSLatitudeRef", 1, 2), new ExifTag("GPSLatitude", 2, 5, 10), new ExifTag("GPSLongitudeRef", 3, 2), new ExifTag("GPSLongitude", 4, 5, 10), new ExifTag("GPSAltitudeRef", 5, 1), new ExifTag("GPSAltitude", 6, 5), new ExifTag("GPSTimeStamp", 7, 5), new ExifTag("GPSSatellites", 8, 2), new ExifTag("GPSStatus", 9, 2), new ExifTag("GPSMeasureMode", 10, 2), new ExifTag("GPSDOP", 11, 5), new ExifTag("GPSSpeedRef", 12, 2), new ExifTag("GPSSpeed", 13, 5), new ExifTag("GPSTrackRef", 14, 2), new ExifTag("GPSTrack", 15, 5), new ExifTag("GPSImgDirectionRef", 16, 2), new ExifTag("GPSImgDirection", 17, 5), new ExifTag("GPSMapDatum", 18, 2), new ExifTag("GPSDestLatitudeRef", 19, 2), new ExifTag("GPSDestLatitude", 20, 5), new ExifTag("GPSDestLongitudeRef", 21, 2), new ExifTag("GPSDestLongitude", 22, 5), new ExifTag("GPSDestBearingRef", 23, 2), new ExifTag("GPSDestBearing", 24, 5), new ExifTag("GPSDestDistanceRef", 25, 2), new ExifTag("GPSDestDistance", 26, 5), new ExifTag("GPSProcessingMethod", 27, 7), new ExifTag("GPSAreaInformation", 28, 7), new ExifTag("GPSDateStamp", 29, 2), new ExifTag("GPSDifferential", 30, 3), new ExifTag("GPSHPositioningError", 31, 5)}, new ExifTag[]{new ExifTag("InteroperabilityIndex", 1, 2)}, new ExifTag[]{new ExifTag("NewSubfileType", 254, 4), new ExifTag("SubfileType", 255, 4), new ExifTag("ThumbnailImageWidth", 256, 3, 4), new ExifTag("ThumbnailImageLength", 257, 3, 4), new ExifTag("BitsPerSample", 258, 3), new ExifTag("Compression", 259, 3), new ExifTag("PhotometricInterpretation", SysUiStatsLog.LAUNCHER_SNAPSHOT, 3), new ExifTag("ImageDescription", 270, 2), new ExifTag("Make", 271, 2), new ExifTag("Model", 272, 2), new ExifTag("StripOffsets", 273, 3, 4), new ExifTag("ThumbnailOrientation", 274, 3), new ExifTag("SamplesPerPixel", SysUiStatsLog.MEDIAOUTPUT_OP_SWITCH_REPORTED, 3), new ExifTag("RowsPerStrip", 278, 3, 4), new ExifTag("StripByteCounts", 279, 3, 4), new ExifTag("XResolution", 282, 5), new ExifTag("YResolution", 283, 5), new ExifTag("PlanarConfiguration", 284, 3), new ExifTag("ResolutionUnit", 296, 3), new ExifTag("TransferFunction", 301, 3), new ExifTag("Software", 305, 2), new ExifTag("DateTime", 306, 2), new ExifTag("Artist", 315, 2), new ExifTag("WhitePoint", 318, 5), new ExifTag("PrimaryChromaticities", 319, 5), new ExifTag("SubIFDPointer", 330, 4), new ExifTag("JPEGInterchangeFormat", 513, 4), new ExifTag("JPEGInterchangeFormatLength", 514, 4), new ExifTag("YCbCrCoefficients", 529, 5), new ExifTag("YCbCrSubSampling", 530, 3), new ExifTag("YCbCrPositioning", 531, 3), new ExifTag("ReferenceBlackWhite", 532, 5), new ExifTag("Xmp", 700, 1), new ExifTag("Copyright", 33432, 2), new ExifTag("ExifIFDPointer", 34665, 4), new ExifTag("GPSInfoIFDPointer", 34853, 4), new ExifTag("DNGVersion", 50706, 1), new ExifTag("DefaultCropSize", 50720, 3, 4)}, exifTagArr2, new ExifTag[]{new ExifTag("ThumbnailImage", 256, 7), new ExifTag("CameraSettingsIFDPointer", 8224, 4), new ExifTag("ImageProcessingIFDPointer", 8256, 4)}, new ExifTag[]{new ExifTag("PreviewImageStart", 257, 4), new ExifTag("PreviewImageLength", 258, 4)}, new ExifTag[]{new ExifTag("AspectFrame", 4371, 3)}, new ExifTag[]{new ExifTag("ColorSpace", 55, 3)}};
        Charset forName = Charset.forName("US-ASCII");
        ASCII = forName;
        IDENTIFIER_EXIF_APP1 = "Exif\u0000\u0000".getBytes(forName);
        IDENTIFIER_XMP_APP1 = "http://ns.adobe.com/xap/1.0/\u0000".getBytes(forName);
        Locale locale = Locale.US;
        new SimpleDateFormat("yyyy:MM:dd HH:mm:ss", locale).setTimeZone(TimeZone.getTimeZone("UTC"));
        new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", locale).setTimeZone(TimeZone.getTimeZone("UTC"));
        int i = 0;
        while (true) {
            ExifTag[][] exifTagArr3 = EXIF_TAGS;
            if (i < exifTagArr3.length) {
                sExifTagMapsForReading[i] = new HashMap<>();
                sExifTagMapsForWriting[i] = new HashMap<>();
                for (ExifTag exifTag : exifTagArr3[i]) {
                    sExifTagMapsForReading[i].put(Integer.valueOf(exifTag.number), exifTag);
                    sExifTagMapsForWriting[i].put(exifTag.name, exifTag);
                }
                i++;
            } else {
                HashMap<Integer, Integer> hashMap = sExifPointerTagMap;
                ExifTag[] exifTagArr4 = EXIF_POINTER_TAGS;
                hashMap.put(Integer.valueOf(exifTagArr4[0].number), 5);
                hashMap.put(Integer.valueOf(exifTagArr4[1].number), 1);
                hashMap.put(Integer.valueOf(exifTagArr4[2].number), 2);
                hashMap.put(Integer.valueOf(exifTagArr4[3].number), 3);
                hashMap.put(Integer.valueOf(exifTagArr4[4].number), 7);
                hashMap.put(Integer.valueOf(exifTagArr4[5].number), 8);
                Pattern.compile(".*[1-9].*");
                Pattern.compile("^(\\d{2}):(\\d{2}):(\\d{2})$");
                Pattern.compile("^(\\d{4}):(\\d{2}):(\\d{2})\\s(\\d{2}):(\\d{2}):(\\d{2})$");
                Pattern.compile("^(\\d{4})-(\\d{2})-(\\d{2})\\s(\\d{2}):(\\d{2}):(\\d{2})$");
                return;
            }
        }
    }

    public final void printAttributes() {
        for (int i = 0; i < this.mAttributes.length; i++) {
            StringBuilder m = ExifInterface$$ExternalSyntheticOutline0.m("The size of tag group[", i, "]: ");
            m.append(this.mAttributes[i].size());
            Log.d("ExifInterface", m.toString());
            for (Map.Entry<String, ExifAttribute> entry : this.mAttributes[i].entrySet()) {
                ExifAttribute value = entry.getValue();
                StringBuilder m2 = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("tagName: ");
                m2.append(entry.getKey());
                m2.append(", tagType: ");
                m2.append(value.toString());
                m2.append(", tagValue: '");
                m2.append(value.getStringValue(this.mExifByteOrder));
                m2.append("'");
                Log.d("ExifInterface", m2.toString());
            }
        }
    }

    public final void validateImages() throws IOException {
        swapBasedOnImageSize(0, 5);
        swapBasedOnImageSize(0, 4);
        swapBasedOnImageSize(5, 4);
        ExifAttribute exifAttribute = this.mAttributes[1].get("PixelXDimension");
        ExifAttribute exifAttribute2 = this.mAttributes[1].get("PixelYDimension");
        if (!(exifAttribute == null || exifAttribute2 == null)) {
            this.mAttributes[0].put("ImageWidth", exifAttribute);
            this.mAttributes[0].put("ImageLength", exifAttribute2);
        }
        if (this.mAttributes[4].isEmpty() && isThumbnail(this.mAttributes[5])) {
            HashMap<String, ExifAttribute>[] hashMapArr = this.mAttributes;
            hashMapArr[4] = hashMapArr[5];
            hashMapArr[5] = new HashMap<>();
        }
        if (!isThumbnail(this.mAttributes[4])) {
            Log.d("ExifInterface", "No image meets the size requirements of a thumbnail image.");
        }
        replaceInvalidTags(0, "ThumbnailOrientation", "Orientation");
        replaceInvalidTags(0, "ThumbnailImageLength", "ImageLength");
        replaceInvalidTags(0, "ThumbnailImageWidth", "ImageWidth");
        replaceInvalidTags(5, "ThumbnailOrientation", "Orientation");
        replaceInvalidTags(5, "ThumbnailImageLength", "ImageLength");
        replaceInvalidTags(5, "ThumbnailImageWidth", "ImageWidth");
        replaceInvalidTags(4, "Orientation", "ThumbnailOrientation");
        replaceInvalidTags(4, "ImageLength", "ThumbnailImageLength");
        replaceInvalidTags(4, "ImageWidth", "ThumbnailImageWidth");
    }

    public final void addDefaultValuesForCompatibility() {
        String attribute = getAttribute("DateTimeOriginal");
        if (attribute != null && getAttribute("DateTime") == null) {
            this.mAttributes[0].put("DateTime", ExifAttribute.createString(attribute));
        }
        if (getAttribute("ImageWidth") == null) {
            this.mAttributes[0].put("ImageWidth", ExifAttribute.createULong(0L, this.mExifByteOrder));
        }
        if (getAttribute("ImageLength") == null) {
            this.mAttributes[0].put("ImageLength", ExifAttribute.createULong(0L, this.mExifByteOrder));
        }
        if (getAttribute("Orientation") == null) {
            this.mAttributes[0].put("Orientation", ExifAttribute.createULong(0L, this.mExifByteOrder));
        }
        if (getAttribute("LightSource") == null) {
            this.mAttributes[1].put("LightSource", ExifAttribute.createULong(0L, this.mExifByteOrder));
        }
    }

    public final ExifAttribute getExifAttribute(String str) {
        if ("ISOSpeedRatings".equals(str)) {
            if (DEBUG) {
                Log.d("ExifInterface", "getExifAttribute: Replacing TAG_ISO_SPEED_RATINGS with TAG_PHOTOGRAPHIC_SENSITIVITY.");
            }
            str = "PhotographicSensitivity";
        }
        for (int i = 0; i < EXIF_TAGS.length; i++) {
            ExifAttribute exifAttribute = this.mAttributes[i].get(str);
            if (exifAttribute != null) {
                return exifAttribute;
            }
        }
        return null;
    }

    public final void getHeifAttributes(final SeekableByteOrderedDataInputStream seekableByteOrderedDataInputStream) throws IOException {
        String str;
        String str2;
        MediaMetadataRetriever mediaMetadataRetriever = new MediaMetadataRetriever();
        try {
            try {
                mediaMetadataRetriever.setDataSource(new MediaDataSource() { // from class: androidx.exifinterface.media.ExifInterface.1
                    public long mPosition;

                    @Override // java.io.Closeable, java.lang.AutoCloseable
                    public final void close() throws IOException {
                    }

                    @Override // android.media.MediaDataSource
                    public final long getSize() throws IOException {
                        return -1L;
                    }

                    @Override // android.media.MediaDataSource
                    public final int readAt(long j, byte[] bArr, int i, int i2) throws IOException {
                        if (i2 == 0) {
                            return 0;
                        }
                        if (j < 0) {
                            return -1;
                        }
                        try {
                            long j2 = this.mPosition;
                            if (j2 != j) {
                                if (j2 >= 0 && j >= j2 + SeekableByteOrderedDataInputStream.this.available()) {
                                    return -1;
                                }
                                SeekableByteOrderedDataInputStream.this.seek(j);
                                this.mPosition = j;
                            }
                            if (i2 > SeekableByteOrderedDataInputStream.this.available()) {
                                i2 = SeekableByteOrderedDataInputStream.this.available();
                            }
                            int read = SeekableByteOrderedDataInputStream.this.read(bArr, i, i2);
                            if (read >= 0) {
                                this.mPosition += read;
                                return read;
                            }
                        } catch (IOException unused) {
                        }
                        this.mPosition = -1L;
                        return -1;
                    }
                });
                String extractMetadata = mediaMetadataRetriever.extractMetadata(33);
                String extractMetadata2 = mediaMetadataRetriever.extractMetadata(34);
                String extractMetadata3 = mediaMetadataRetriever.extractMetadata(26);
                String extractMetadata4 = mediaMetadataRetriever.extractMetadata(17);
                String str3 = null;
                if ("yes".equals(extractMetadata3)) {
                    str3 = mediaMetadataRetriever.extractMetadata(29);
                    str2 = mediaMetadataRetriever.extractMetadata(30);
                    str = mediaMetadataRetriever.extractMetadata(31);
                } else if ("yes".equals(extractMetadata4)) {
                    str3 = mediaMetadataRetriever.extractMetadata(18);
                    str2 = mediaMetadataRetriever.extractMetadata(19);
                    str = mediaMetadataRetriever.extractMetadata(24);
                } else {
                    str2 = null;
                    str = null;
                }
                if (str3 != null) {
                    this.mAttributes[0].put("ImageWidth", ExifAttribute.createUShort(Integer.parseInt(str3), this.mExifByteOrder));
                }
                if (str2 != null) {
                    this.mAttributes[0].put("ImageLength", ExifAttribute.createUShort(Integer.parseInt(str2), this.mExifByteOrder));
                }
                if (str != null) {
                    int i = 1;
                    int parseInt = Integer.parseInt(str);
                    if (parseInt == 90) {
                        i = 6;
                    } else if (parseInt == 180) {
                        i = 3;
                    } else if (parseInt == 270) {
                        i = 8;
                    }
                    this.mAttributes[0].put("Orientation", ExifAttribute.createUShort(i, this.mExifByteOrder));
                }
                if (!(extractMetadata == null || extractMetadata2 == null)) {
                    int parseInt2 = Integer.parseInt(extractMetadata);
                    int parseInt3 = Integer.parseInt(extractMetadata2);
                    if (parseInt3 > 6) {
                        seekableByteOrderedDataInputStream.seek(parseInt2);
                        byte[] bArr = new byte[6];
                        if (seekableByteOrderedDataInputStream.read(bArr) == 6) {
                            int i2 = parseInt2 + 6;
                            int i3 = parseInt3 - 6;
                            if (Arrays.equals(bArr, IDENTIFIER_EXIF_APP1)) {
                                byte[] bArr2 = new byte[i3];
                                if (seekableByteOrderedDataInputStream.read(bArr2) == i3) {
                                    this.mOffsetToExifData = i2;
                                    readExifSegment(bArr2, 0);
                                } else {
                                    throw new IOException("Can't read exif");
                                }
                            } else {
                                throw new IOException("Invalid identifier");
                            }
                        } else {
                            throw new IOException("Can't read identifier");
                        }
                    } else {
                        throw new IOException("Invalid exif length");
                    }
                }
                if (DEBUG) {
                    Log.d("ExifInterface", "Heif meta: " + str3 + "x" + str2 + ", rotation " + str);
                }
            } catch (RuntimeException unused) {
                throw new UnsupportedOperationException("Failed to read EXIF from HEIF file. Given stream is either malformed or unsupported.");
            }
        } finally {
            mediaMetadataRetriever.release();
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:85:0x01a2, code lost:
        r19.mByteOrder = r18.mExifByteOrder;
     */
    /* JADX WARN: Code restructure failed: missing block: B:86:0x01a6, code lost:
        return;
     */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00ae A[FALL_THROUGH] */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0137  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x014e  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0168  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void getJpegAttributes(androidx.exifinterface.media.ExifInterface.ByteOrderedDataInputStream r19, int r20, int r21) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 536
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.exifinterface.media.ExifInterface.getJpegAttributes(androidx.exifinterface.media.ExifInterface$ByteOrderedDataInputStream, int, int):void");
    }

    /* JADX WARN: Code restructure failed: missing block: B:67:0x00cf, code lost:
        if (r8 != null) goto L68;
     */
    /* JADX WARN: Removed duplicated region for block: B:114:0x0143 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:115:0x0146  */
    /* JADX WARN: Removed duplicated region for block: B:146:0x018f  */
    /* JADX WARN: Removed duplicated region for block: B:153:0x0111 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:93:0x010f A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final int getMimeType(java.io.BufferedInputStream r18) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 403
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.exifinterface.media.ExifInterface.getMimeType(java.io.BufferedInputStream):int");
    }

    public final void getPngAttributes(ByteOrderedDataInputStream byteOrderedDataInputStream) throws IOException {
        if (DEBUG) {
            Log.d("ExifInterface", "getPngAttributes starting with: " + byteOrderedDataInputStream);
        }
        byteOrderedDataInputStream.mByteOrder = ByteOrder.BIG_ENDIAN;
        byte[] bArr = PNG_SIGNATURE;
        byteOrderedDataInputStream.skipFully(bArr.length);
        int length = bArr.length + 0;
        while (true) {
            try {
                int readInt = byteOrderedDataInputStream.readInt();
                int i = length + 4;
                byte[] bArr2 = new byte[4];
                if (byteOrderedDataInputStream.read(bArr2) == 4) {
                    int i2 = i + 4;
                    if (i2 == 16 && !Arrays.equals(bArr2, PNG_CHUNK_TYPE_IHDR)) {
                        throw new IOException("Encountered invalid PNG file--IHDR chunk should appearas the first chunk");
                    }
                    if (!Arrays.equals(bArr2, PNG_CHUNK_TYPE_IEND)) {
                        if (Arrays.equals(bArr2, PNG_CHUNK_TYPE_EXIF)) {
                            byte[] bArr3 = new byte[readInt];
                            if (byteOrderedDataInputStream.read(bArr3) == readInt) {
                                int readInt2 = byteOrderedDataInputStream.readInt();
                                CRC32 crc32 = new CRC32();
                                crc32.update(bArr2);
                                crc32.update(bArr3);
                                if (((int) crc32.getValue()) == readInt2) {
                                    this.mOffsetToExifData = i2;
                                    readExifSegment(bArr3, 0);
                                    validateImages();
                                    setThumbnailData(new ByteOrderedDataInputStream(bArr3));
                                    return;
                                }
                                throw new IOException("Encountered invalid CRC value for PNG-EXIF chunk.\n recorded CRC value: " + readInt2 + ", calculated CRC value: " + crc32.getValue());
                            }
                            throw new IOException("Failed to read given length for given PNG chunk type: " + ExifInterfaceUtils.byteArrayToHexString(bArr2));
                        }
                        int i3 = readInt + 4;
                        byteOrderedDataInputStream.skipFully(i3);
                        length = i2 + i3;
                    } else {
                        return;
                    }
                } else {
                    throw new IOException("Encountered invalid length while parsing PNG chunktype");
                }
            } catch (EOFException unused) {
                throw new IOException("Encountered corrupt PNG file.");
            }
        }
    }

    public final void getRafAttributes(ByteOrderedDataInputStream byteOrderedDataInputStream) throws IOException {
        boolean z = DEBUG;
        if (z) {
            Log.d("ExifInterface", "getRafAttributes starting with: " + byteOrderedDataInputStream);
        }
        byteOrderedDataInputStream.skipFully(84);
        byte[] bArr = new byte[4];
        byte[] bArr2 = new byte[4];
        byte[] bArr3 = new byte[4];
        byteOrderedDataInputStream.read(bArr);
        byteOrderedDataInputStream.read(bArr2);
        byteOrderedDataInputStream.read(bArr3);
        int i = ByteBuffer.wrap(bArr).getInt();
        int i2 = ByteBuffer.wrap(bArr2).getInt();
        int i3 = ByteBuffer.wrap(bArr3).getInt();
        byte[] bArr4 = new byte[i2];
        byteOrderedDataInputStream.skipFully(i - byteOrderedDataInputStream.mPosition);
        byteOrderedDataInputStream.read(bArr4);
        getJpegAttributes(new ByteOrderedDataInputStream(bArr4), i, 5);
        byteOrderedDataInputStream.skipFully(i3 - byteOrderedDataInputStream.mPosition);
        byteOrderedDataInputStream.mByteOrder = ByteOrder.BIG_ENDIAN;
        int readInt = byteOrderedDataInputStream.readInt();
        if (z) {
            Log.d("ExifInterface", "numberOfDirectoryEntry: " + readInt);
        }
        for (int i4 = 0; i4 < readInt; i4++) {
            int readUnsignedShort = byteOrderedDataInputStream.readUnsignedShort();
            int readUnsignedShort2 = byteOrderedDataInputStream.readUnsignedShort();
            if (readUnsignedShort == TAG_RAF_IMAGE_SIZE.number) {
                short readShort = byteOrderedDataInputStream.readShort();
                short readShort2 = byteOrderedDataInputStream.readShort();
                ExifAttribute createUShort = ExifAttribute.createUShort(readShort, this.mExifByteOrder);
                ExifAttribute createUShort2 = ExifAttribute.createUShort(readShort2, this.mExifByteOrder);
                this.mAttributes[0].put("ImageLength", createUShort);
                this.mAttributes[0].put("ImageWidth", createUShort2);
                if (DEBUG) {
                    Log.d("ExifInterface", "Updated to length: " + ((int) readShort) + ", width: " + ((int) readShort2));
                    return;
                }
                return;
            }
            byteOrderedDataInputStream.skipFully(readUnsignedShort2);
        }
    }

    public final void getRw2Attributes(SeekableByteOrderedDataInputStream seekableByteOrderedDataInputStream) throws IOException {
        if (DEBUG) {
            Log.d("ExifInterface", "getRw2Attributes starting with: " + seekableByteOrderedDataInputStream);
        }
        getRawAttributes(seekableByteOrderedDataInputStream);
        ExifAttribute exifAttribute = this.mAttributes[0].get("JpgFromRaw");
        if (exifAttribute != null) {
            getJpegAttributes(new ByteOrderedDataInputStream(exifAttribute.bytes), (int) exifAttribute.bytesOffset, 5);
        }
        ExifAttribute exifAttribute2 = this.mAttributes[0].get("ISO");
        ExifAttribute exifAttribute3 = this.mAttributes[1].get("PhotographicSensitivity");
        if (exifAttribute2 != null && exifAttribute3 == null) {
            this.mAttributes[1].put("PhotographicSensitivity", exifAttribute2);
        }
    }

    public final void getWebpAttributes(ByteOrderedDataInputStream byteOrderedDataInputStream) throws IOException {
        if (DEBUG) {
            Log.d("ExifInterface", "getWebpAttributes starting with: " + byteOrderedDataInputStream);
        }
        byteOrderedDataInputStream.mByteOrder = ByteOrder.LITTLE_ENDIAN;
        byteOrderedDataInputStream.skipFully(WEBP_SIGNATURE_1.length);
        int readInt = byteOrderedDataInputStream.readInt() + 8;
        byte[] bArr = WEBP_SIGNATURE_2;
        byteOrderedDataInputStream.skipFully(bArr.length);
        int length = bArr.length + 8;
        while (true) {
            try {
                byte[] bArr2 = new byte[4];
                if (byteOrderedDataInputStream.read(bArr2) == 4) {
                    int readInt2 = byteOrderedDataInputStream.readInt();
                    int i = length + 4 + 4;
                    if (Arrays.equals(WEBP_CHUNK_TYPE_EXIF, bArr2)) {
                        byte[] bArr3 = new byte[readInt2];
                        if (byteOrderedDataInputStream.read(bArr3) == readInt2) {
                            this.mOffsetToExifData = i;
                            readExifSegment(bArr3, 0);
                            setThumbnailData(new ByteOrderedDataInputStream(bArr3));
                            return;
                        }
                        throw new IOException("Failed to read given length for given PNG chunk type: " + ExifInterfaceUtils.byteArrayToHexString(bArr2));
                    }
                    if (readInt2 % 2 == 1) {
                        readInt2++;
                    }
                    length = i + readInt2;
                    if (length != readInt) {
                        if (length <= readInt) {
                            byteOrderedDataInputStream.skipFully(readInt2);
                        } else {
                            throw new IOException("Encountered WebP file with invalid chunk size");
                        }
                    } else {
                        return;
                    }
                } else {
                    throw new IOException("Encountered invalid length while parsing WebP chunktype");
                }
            } catch (EOFException unused) {
                throw new IOException("Encountered corrupt WebP file.");
            }
        }
    }

    public final void handleThumbnailFromJfif(ByteOrderedDataInputStream byteOrderedDataInputStream, HashMap hashMap) throws IOException {
        ExifAttribute exifAttribute = (ExifAttribute) hashMap.get("JPEGInterchangeFormat");
        ExifAttribute exifAttribute2 = (ExifAttribute) hashMap.get("JPEGInterchangeFormatLength");
        if (exifAttribute != null && exifAttribute2 != null) {
            int intValue = exifAttribute.getIntValue(this.mExifByteOrder);
            int intValue2 = exifAttribute2.getIntValue(this.mExifByteOrder);
            if (this.mMimeType == 7) {
                intValue += this.mOrfMakerNoteOffset;
            }
            if (intValue > 0 && intValue2 > 0 && this.mAssetInputStream == null && this.mSeekableFileDescriptor == null) {
                byteOrderedDataInputStream.skip(intValue);
                byteOrderedDataInputStream.read(new byte[intValue2]);
            }
            if (DEBUG) {
                Log.d("ExifInterface", "Setting thumbnail attributes with offset: " + intValue + ", length: " + intValue2);
            }
        }
    }

    public final boolean isThumbnail(HashMap hashMap) throws IOException {
        ExifAttribute exifAttribute = (ExifAttribute) hashMap.get("ImageLength");
        ExifAttribute exifAttribute2 = (ExifAttribute) hashMap.get("ImageWidth");
        if (exifAttribute == null || exifAttribute2 == null) {
            return false;
        }
        int intValue = exifAttribute.getIntValue(this.mExifByteOrder);
        int intValue2 = exifAttribute2.getIntValue(this.mExifByteOrder);
        if (intValue > 512 || intValue2 > 512) {
            return false;
        }
        return true;
    }

    public final void readExifSegment(byte[] bArr, int i) throws IOException {
        SeekableByteOrderedDataInputStream seekableByteOrderedDataInputStream = new SeekableByteOrderedDataInputStream(bArr);
        parseTiffHeaders(seekableByteOrderedDataInputStream);
        readImageFileDirectory(seekableByteOrderedDataInputStream, i);
    }

    /* JADX WARN: Removed duplicated region for block: B:109:0x024d  */
    /* JADX WARN: Removed duplicated region for block: B:112:0x026b  */
    /* JADX WARN: Removed duplicated region for block: B:117:0x02a7  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00e9  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x010c  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x015f  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x0164  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void readImageFileDirectory(androidx.exifinterface.media.ExifInterface.SeekableByteOrderedDataInputStream r22, int r23) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 957
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.exifinterface.media.ExifInterface.readImageFileDirectory(androidx.exifinterface.media.ExifInterface$SeekableByteOrderedDataInputStream, int):void");
    }

    public final void replaceInvalidTags(int i, String str, String str2) {
        if (!this.mAttributes[i].isEmpty() && this.mAttributes[i].get(str) != null) {
            HashMap<String, ExifAttribute> hashMap = this.mAttributes[i];
            hashMap.put(str2, hashMap.get(str));
            this.mAttributes[i].remove(str);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x007c  */
    /* JADX WARN: Removed duplicated region for block: B:78:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void setThumbnailData(androidx.exifinterface.media.ExifInterface.ByteOrderedDataInputStream r18) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 343
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.exifinterface.media.ExifInterface.setThumbnailData(androidx.exifinterface.media.ExifInterface$ByteOrderedDataInputStream):void");
    }

    public final void swapBasedOnImageSize(int i, int i2) throws IOException {
        if (!this.mAttributes[i].isEmpty() && !this.mAttributes[i2].isEmpty()) {
            ExifAttribute exifAttribute = this.mAttributes[i].get("ImageLength");
            ExifAttribute exifAttribute2 = this.mAttributes[i].get("ImageWidth");
            ExifAttribute exifAttribute3 = this.mAttributes[i2].get("ImageLength");
            ExifAttribute exifAttribute4 = this.mAttributes[i2].get("ImageWidth");
            if (exifAttribute == null || exifAttribute2 == null) {
                if (DEBUG) {
                    Log.d("ExifInterface", "First image does not contain valid size information");
                }
            } else if (exifAttribute3 != null && exifAttribute4 != null) {
                int intValue = exifAttribute.getIntValue(this.mExifByteOrder);
                int intValue2 = exifAttribute2.getIntValue(this.mExifByteOrder);
                int intValue3 = exifAttribute3.getIntValue(this.mExifByteOrder);
                int intValue4 = exifAttribute4.getIntValue(this.mExifByteOrder);
                if (intValue < intValue3 && intValue2 < intValue4) {
                    HashMap<String, ExifAttribute>[] hashMapArr = this.mAttributes;
                    HashMap<String, ExifAttribute> hashMap = hashMapArr[i];
                    hashMapArr[i] = hashMapArr[i2];
                    hashMapArr[i2] = hashMap;
                }
            } else if (DEBUG) {
                Log.d("ExifInterface", "Second image does not contain valid size information");
            }
        } else if (DEBUG) {
            Log.d("ExifInterface", "Cannot perform swap since only one image data exists");
        }
    }

    public final void updateImageSizeValues(SeekableByteOrderedDataInputStream seekableByteOrderedDataInputStream, int i) throws IOException {
        ExifAttribute exifAttribute;
        ExifAttribute exifAttribute2;
        ExifAttribute exifAttribute3 = this.mAttributes[i].get("DefaultCropSize");
        ExifAttribute exifAttribute4 = this.mAttributes[i].get("SensorTopBorder");
        ExifAttribute exifAttribute5 = this.mAttributes[i].get("SensorLeftBorder");
        ExifAttribute exifAttribute6 = this.mAttributes[i].get("SensorBottomBorder");
        ExifAttribute exifAttribute7 = this.mAttributes[i].get("SensorRightBorder");
        if (exifAttribute3 != null) {
            if (exifAttribute3.format == 5) {
                Rational[] rationalArr = (Rational[]) exifAttribute3.getValue(this.mExifByteOrder);
                if (rationalArr == null || rationalArr.length != 2) {
                    StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Invalid crop size values. cropSize=");
                    m.append(Arrays.toString(rationalArr));
                    Log.w("ExifInterface", m.toString());
                    return;
                }
                exifAttribute2 = ExifAttribute.createURational(rationalArr[0], this.mExifByteOrder);
                exifAttribute = ExifAttribute.createURational(rationalArr[1], this.mExifByteOrder);
            } else {
                int[] iArr = (int[]) exifAttribute3.getValue(this.mExifByteOrder);
                if (iArr == null || iArr.length != 2) {
                    StringBuilder m2 = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Invalid crop size values. cropSize=");
                    m2.append(Arrays.toString(iArr));
                    Log.w("ExifInterface", m2.toString());
                    return;
                }
                exifAttribute2 = ExifAttribute.createUShort(iArr[0], this.mExifByteOrder);
                exifAttribute = ExifAttribute.createUShort(iArr[1], this.mExifByteOrder);
            }
            this.mAttributes[i].put("ImageWidth", exifAttribute2);
            this.mAttributes[i].put("ImageLength", exifAttribute);
        } else if (exifAttribute4 == null || exifAttribute5 == null || exifAttribute6 == null || exifAttribute7 == null) {
            ExifAttribute exifAttribute8 = this.mAttributes[i].get("ImageLength");
            ExifAttribute exifAttribute9 = this.mAttributes[i].get("ImageWidth");
            if (exifAttribute8 == null || exifAttribute9 == null) {
                ExifAttribute exifAttribute10 = this.mAttributes[i].get("JPEGInterchangeFormat");
                ExifAttribute exifAttribute11 = this.mAttributes[i].get("JPEGInterchangeFormatLength");
                if (exifAttribute10 != null && exifAttribute11 != null) {
                    int intValue = exifAttribute10.getIntValue(this.mExifByteOrder);
                    int intValue2 = exifAttribute10.getIntValue(this.mExifByteOrder);
                    seekableByteOrderedDataInputStream.seek(intValue);
                    byte[] bArr = new byte[intValue2];
                    seekableByteOrderedDataInputStream.read(bArr);
                    getJpegAttributes(new ByteOrderedDataInputStream(bArr), intValue, i);
                }
            }
        } else {
            int intValue3 = exifAttribute4.getIntValue(this.mExifByteOrder);
            int intValue4 = exifAttribute6.getIntValue(this.mExifByteOrder);
            int intValue5 = exifAttribute7.getIntValue(this.mExifByteOrder);
            int intValue6 = exifAttribute5.getIntValue(this.mExifByteOrder);
            if (intValue4 > intValue3 && intValue5 > intValue6) {
                ExifAttribute createUShort = ExifAttribute.createUShort(intValue4 - intValue3, this.mExifByteOrder);
                ExifAttribute createUShort2 = ExifAttribute.createUShort(intValue5 - intValue6, this.mExifByteOrder);
                this.mAttributes[i].put("ImageLength", createUShort);
                this.mAttributes[i].put("ImageWidth", createUShort2);
            }
        }
    }

    public ExifInterface(InputStream inputStream) throws IOException {
        boolean z;
        boolean z2;
        ExifTag[][] exifTagArr = EXIF_TAGS;
        this.mAttributes = new HashMap[exifTagArr.length];
        this.mAttributesOffsets = new HashSet(exifTagArr.length);
        if (inputStream != null) {
            boolean z3 = true;
            if (inputStream instanceof AssetManager.AssetInputStream) {
                this.mAssetInputStream = (AssetManager.AssetInputStream) inputStream;
                this.mSeekableFileDescriptor = null;
            } else {
                if (inputStream instanceof FileInputStream) {
                    FileInputStream fileInputStream = (FileInputStream) inputStream;
                    try {
                        Os.lseek(fileInputStream.getFD(), 0L, OsConstants.SEEK_CUR);
                        z2 = true;
                    } catch (Exception unused) {
                        if (DEBUG) {
                            Log.d("ExifInterface", "The file descriptor for the given input is not seekable");
                        }
                        z2 = false;
                    }
                    if (z2) {
                        this.mAssetInputStream = null;
                        this.mSeekableFileDescriptor = fileInputStream.getFD();
                    }
                }
                this.mAssetInputStream = null;
                this.mSeekableFileDescriptor = null;
            }
            for (int i = 0; i < EXIF_TAGS.length; i++) {
                try {
                    try {
                        this.mAttributes[i] = new HashMap<>();
                    } catch (IOException | UnsupportedOperationException e) {
                        boolean z4 = DEBUG;
                        if (z4) {
                            Log.w("ExifInterface", "Invalid image: ExifInterface got an unsupported image format file(ExifInterface supports JPEG and some RAW image formats only) or a corrupted JPEG file to ExifInterface.", e);
                        }
                        addDefaultValuesForCompatibility();
                        if (!z4) {
                            return;
                        }
                    }
                } finally {
                    addDefaultValuesForCompatibility();
                    if (DEBUG) {
                        printAttributes();
                    }
                }
            }
            BufferedInputStream bufferedInputStream = new BufferedInputStream(inputStream, 5000);
            int mimeType = getMimeType(bufferedInputStream);
            this.mMimeType = mimeType;
            if ((mimeType == 4 || mimeType == 9 || mimeType == 13 || mimeType == 14) ? false : z3) {
                SeekableByteOrderedDataInputStream seekableByteOrderedDataInputStream = new SeekableByteOrderedDataInputStream(bufferedInputStream);
                int i2 = this.mMimeType;
                if (i2 == 12) {
                    getHeifAttributes(seekableByteOrderedDataInputStream);
                } else if (i2 == 7) {
                    getOrfAttributes(seekableByteOrderedDataInputStream);
                } else if (i2 == 10) {
                    getRw2Attributes(seekableByteOrderedDataInputStream);
                } else {
                    getRawAttributes(seekableByteOrderedDataInputStream);
                }
                seekableByteOrderedDataInputStream.seek(this.mOffsetToExifData);
                setThumbnailData(seekableByteOrderedDataInputStream);
            } else {
                ByteOrderedDataInputStream byteOrderedDataInputStream = new ByteOrderedDataInputStream(bufferedInputStream);
                int i3 = this.mMimeType;
                if (i3 == 4) {
                    getJpegAttributes(byteOrderedDataInputStream, 0, 0);
                } else if (i3 == 13) {
                    getPngAttributes(byteOrderedDataInputStream);
                } else if (i3 == 9) {
                    getRafAttributes(byteOrderedDataInputStream);
                } else if (i3 == 14) {
                    getWebpAttributes(byteOrderedDataInputStream);
                }
            }
            if (!z) {
                return;
            }
            return;
        }
        throw new NullPointerException("inputStream cannot be null");
    }

    public static ByteOrder readByteOrder(ByteOrderedDataInputStream byteOrderedDataInputStream) throws IOException {
        short readShort = byteOrderedDataInputStream.readShort();
        if (readShort == 18761) {
            if (DEBUG) {
                Log.d("ExifInterface", "readExifSegment: Byte Align II");
            }
            return ByteOrder.LITTLE_ENDIAN;
        } else if (readShort == 19789) {
            if (DEBUG) {
                Log.d("ExifInterface", "readExifSegment: Byte Align MM");
            }
            return ByteOrder.BIG_ENDIAN;
        } else {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Invalid byte order: ");
            m.append(Integer.toHexString(readShort));
            throw new IOException(m.toString());
        }
    }

    public final String getAttribute(String str) {
        ExifAttribute exifAttribute = getExifAttribute(str);
        if (exifAttribute != null) {
            if (!sTagSetForCompatibility.contains(str)) {
                return exifAttribute.getStringValue(this.mExifByteOrder);
            }
            if (str.equals("GPSTimeStamp")) {
                int i = exifAttribute.format;
                if (i == 5 || i == 10) {
                    Rational[] rationalArr = (Rational[]) exifAttribute.getValue(this.mExifByteOrder);
                    if (rationalArr == null || rationalArr.length != 3) {
                        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Invalid GPS Timestamp array. array=");
                        m.append(Arrays.toString(rationalArr));
                        Log.w("ExifInterface", m.toString());
                        return null;
                    }
                    Rational rational = rationalArr[0];
                    Rational rational2 = rationalArr[1];
                    Rational rational3 = rationalArr[2];
                    return String.format("%02d:%02d:%02d", Integer.valueOf((int) (((float) rational.numerator) / ((float) rational.denominator))), Integer.valueOf((int) (((float) rational2.numerator) / ((float) rational2.denominator))), Integer.valueOf((int) (((float) rational3.numerator) / ((float) rational3.denominator))));
                }
                StringBuilder m2 = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("GPS Timestamp format is not rational. format=");
                m2.append(exifAttribute.format);
                Log.w("ExifInterface", m2.toString());
                return null;
            }
            try {
                return Double.toString(exifAttribute.getDoubleValue(this.mExifByteOrder));
            } catch (NumberFormatException unused) {
            }
        }
        return null;
    }

    public final void getOrfAttributes(SeekableByteOrderedDataInputStream seekableByteOrderedDataInputStream) throws IOException {
        int i;
        int i2;
        getRawAttributes(seekableByteOrderedDataInputStream);
        ExifAttribute exifAttribute = this.mAttributes[1].get("MakerNote");
        if (exifAttribute != null) {
            SeekableByteOrderedDataInputStream seekableByteOrderedDataInputStream2 = new SeekableByteOrderedDataInputStream(exifAttribute.bytes);
            seekableByteOrderedDataInputStream2.mByteOrder = this.mExifByteOrder;
            byte[] bArr = ORF_MAKER_NOTE_HEADER_1;
            byte[] bArr2 = new byte[bArr.length];
            seekableByteOrderedDataInputStream2.readFully(bArr2);
            seekableByteOrderedDataInputStream2.seek(0L);
            byte[] bArr3 = ORF_MAKER_NOTE_HEADER_2;
            byte[] bArr4 = new byte[bArr3.length];
            seekableByteOrderedDataInputStream2.readFully(bArr4);
            if (Arrays.equals(bArr2, bArr)) {
                seekableByteOrderedDataInputStream2.seek(8L);
            } else if (Arrays.equals(bArr4, bArr3)) {
                seekableByteOrderedDataInputStream2.seek(12L);
            }
            readImageFileDirectory(seekableByteOrderedDataInputStream2, 6);
            ExifAttribute exifAttribute2 = this.mAttributes[7].get("PreviewImageStart");
            ExifAttribute exifAttribute3 = this.mAttributes[7].get("PreviewImageLength");
            if (!(exifAttribute2 == null || exifAttribute3 == null)) {
                this.mAttributes[5].put("JPEGInterchangeFormat", exifAttribute2);
                this.mAttributes[5].put("JPEGInterchangeFormatLength", exifAttribute3);
            }
            ExifAttribute exifAttribute4 = this.mAttributes[8].get("AspectFrame");
            if (exifAttribute4 != null) {
                int[] iArr = (int[]) exifAttribute4.getValue(this.mExifByteOrder);
                if (iArr == null || iArr.length != 4) {
                    StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Invalid aspect frame values. frame=");
                    m.append(Arrays.toString(iArr));
                    Log.w("ExifInterface", m.toString());
                    return;
                }
                int i3 = iArr[2];
                int i4 = iArr[0];
                if (i3 > i4 && (i = iArr[3]) > (i2 = iArr[1])) {
                    int i5 = (i3 - i4) + 1;
                    int i6 = (i - i2) + 1;
                    if (i5 < i6) {
                        int i7 = i5 + i6;
                        i6 = i7 - i6;
                        i5 = i7 - i6;
                    }
                    ExifAttribute createUShort = ExifAttribute.createUShort(i5, this.mExifByteOrder);
                    ExifAttribute createUShort2 = ExifAttribute.createUShort(i6, this.mExifByteOrder);
                    this.mAttributes[0].put("ImageWidth", createUShort);
                    this.mAttributes[0].put("ImageLength", createUShort2);
                }
            }
        }
    }

    public final void getRawAttributes(SeekableByteOrderedDataInputStream seekableByteOrderedDataInputStream) throws IOException {
        ExifAttribute exifAttribute;
        parseTiffHeaders(seekableByteOrderedDataInputStream);
        readImageFileDirectory(seekableByteOrderedDataInputStream, 0);
        updateImageSizeValues(seekableByteOrderedDataInputStream, 0);
        updateImageSizeValues(seekableByteOrderedDataInputStream, 5);
        updateImageSizeValues(seekableByteOrderedDataInputStream, 4);
        validateImages();
        if (this.mMimeType == 8 && (exifAttribute = this.mAttributes[1].get("MakerNote")) != null) {
            SeekableByteOrderedDataInputStream seekableByteOrderedDataInputStream2 = new SeekableByteOrderedDataInputStream(exifAttribute.bytes);
            seekableByteOrderedDataInputStream2.mByteOrder = this.mExifByteOrder;
            seekableByteOrderedDataInputStream2.skipFully(6);
            readImageFileDirectory(seekableByteOrderedDataInputStream2, 9);
            ExifAttribute exifAttribute2 = this.mAttributes[9].get("ColorSpace");
            if (exifAttribute2 != null) {
                this.mAttributes[1].put("ColorSpace", exifAttribute2);
            }
        }
    }

    public final void parseTiffHeaders(ByteOrderedDataInputStream byteOrderedDataInputStream) throws IOException {
        ByteOrder readByteOrder = readByteOrder(byteOrderedDataInputStream);
        this.mExifByteOrder = readByteOrder;
        byteOrderedDataInputStream.mByteOrder = readByteOrder;
        int readUnsignedShort = byteOrderedDataInputStream.readUnsignedShort();
        int i = this.mMimeType;
        if (i == 7 || i == 10 || readUnsignedShort == 42) {
            int readInt = byteOrderedDataInputStream.readInt();
            if (readInt >= 8) {
                int i2 = readInt - 8;
                if (i2 > 0) {
                    byteOrderedDataInputStream.skipFully(i2);
                    return;
                }
                return;
            }
            throw new IOException("Invalid first Ifd offset: " + readInt);
        }
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Invalid start code: ");
        m.append(Integer.toHexString(readUnsignedShort));
        throw new IOException(m.toString());
    }

    /* loaded from: classes.dex */
    public static class ExifTag {
        public final String name;
        public final int number;
        public final int primaryFormat;
        public final int secondaryFormat;

        public ExifTag(String str, int i, int i2) {
            this.name = str;
            this.number = i;
            this.primaryFormat = i2;
            this.secondaryFormat = -1;
        }

        public ExifTag(String str, int i, int i2, int i3) {
            this.name = str;
            this.number = i;
            this.primaryFormat = i2;
            this.secondaryFormat = i3;
        }
    }
}
