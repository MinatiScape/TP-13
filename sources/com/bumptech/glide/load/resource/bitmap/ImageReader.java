package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.ParcelFileDescriptor;
import androidx.collection.ContainerHelpers;
import com.bumptech.glide.load.ImageHeaderParser;
import com.bumptech.glide.load.ImageHeaderParserUtils;
import com.bumptech.glide.load.data.InputStreamRewinder;
import com.bumptech.glide.load.data.ParcelFileDescriptorRewinder;
import com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
/* loaded from: classes.dex */
public interface ImageReader {

    /* loaded from: classes.dex */
    public static final class InputStreamImageReader implements ImageReader {
        public final ArrayPool byteArrayPool;
        public final InputStreamRewinder dataRewinder;
        public final List<ImageHeaderParser> parsers;

        @Override // com.bumptech.glide.load.resource.bitmap.ImageReader
        public final Bitmap decodeBitmap(BitmapFactory.Options options) throws IOException {
            InputStreamRewinder inputStreamRewinder = this.dataRewinder;
            inputStreamRewinder.bufferedStream.reset();
            return BitmapFactory.decodeStream(inputStreamRewinder.bufferedStream, null, options);
        }

        @Override // com.bumptech.glide.load.resource.bitmap.ImageReader
        public final int getImageOrientation() throws IOException {
            List<ImageHeaderParser> list = this.parsers;
            InputStreamRewinder inputStreamRewinder = this.dataRewinder;
            inputStreamRewinder.bufferedStream.reset();
            return ImageHeaderParserUtils.getOrientation(list, inputStreamRewinder.bufferedStream, this.byteArrayPool);
        }

        @Override // com.bumptech.glide.load.resource.bitmap.ImageReader
        public final ImageHeaderParser.ImageType getImageType() throws IOException {
            List<ImageHeaderParser> list = this.parsers;
            InputStreamRewinder inputStreamRewinder = this.dataRewinder;
            inputStreamRewinder.bufferedStream.reset();
            return ImageHeaderParserUtils.getType(list, inputStreamRewinder.bufferedStream, this.byteArrayPool);
        }

        @Override // com.bumptech.glide.load.resource.bitmap.ImageReader
        public final void stopGrowingBuffers() {
            RecyclableBufferedInputStream recyclableBufferedInputStream = this.dataRewinder.bufferedStream;
            synchronized (recyclableBufferedInputStream) {
                recyclableBufferedInputStream.marklimit = recyclableBufferedInputStream.buf.length;
            }
        }

        public InputStreamImageReader(InputStream inputStream, List<ImageHeaderParser> list, ArrayPool arrayPool) {
            ContainerHelpers.checkNotNull(arrayPool);
            this.byteArrayPool = arrayPool;
            ContainerHelpers.checkNotNull(list);
            this.parsers = list;
            this.dataRewinder = new InputStreamRewinder(inputStream, arrayPool);
        }
    }

    /* loaded from: classes.dex */
    public static final class ParcelFileDescriptorImageReader implements ImageReader {
        public final ArrayPool byteArrayPool;
        public final ParcelFileDescriptorRewinder dataRewinder;
        public final List<ImageHeaderParser> parsers;

        @Override // com.bumptech.glide.load.resource.bitmap.ImageReader
        public final void stopGrowingBuffers() {
        }

        @Override // com.bumptech.glide.load.resource.bitmap.ImageReader
        public final Bitmap decodeBitmap(BitmapFactory.Options options) throws IOException {
            return BitmapFactory.decodeFileDescriptor(this.dataRewinder.rewindAndGet().getFileDescriptor(), null, options);
        }

        @Override // com.bumptech.glide.load.resource.bitmap.ImageReader
        public final int getImageOrientation() throws IOException {
            Throwable th;
            RecyclableBufferedInputStream recyclableBufferedInputStream;
            List<ImageHeaderParser> list = this.parsers;
            ParcelFileDescriptorRewinder parcelFileDescriptorRewinder = this.dataRewinder;
            ArrayPool arrayPool = this.byteArrayPool;
            int size = list.size();
            for (int i = 0; i < size; i++) {
                ImageHeaderParser imageHeaderParser = list.get(i);
                try {
                    recyclableBufferedInputStream = new RecyclableBufferedInputStream(new FileInputStream(parcelFileDescriptorRewinder.rewindAndGet().getFileDescriptor()), arrayPool);
                    try {
                        int orientation = imageHeaderParser.getOrientation(recyclableBufferedInputStream, arrayPool);
                        try {
                            recyclableBufferedInputStream.close();
                        } catch (IOException unused) {
                        }
                        parcelFileDescriptorRewinder.rewindAndGet();
                        if (orientation != -1) {
                            return orientation;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        if (recyclableBufferedInputStream != null) {
                            try {
                                recyclableBufferedInputStream.close();
                            } catch (IOException unused2) {
                            }
                        }
                        parcelFileDescriptorRewinder.rewindAndGet();
                        throw th;
                    }
                } catch (Throwable th3) {
                    th = th3;
                    recyclableBufferedInputStream = null;
                }
            }
            return -1;
        }

        @Override // com.bumptech.glide.load.resource.bitmap.ImageReader
        public final ImageHeaderParser.ImageType getImageType() throws IOException {
            Throwable th;
            RecyclableBufferedInputStream recyclableBufferedInputStream;
            List<ImageHeaderParser> list = this.parsers;
            ParcelFileDescriptorRewinder parcelFileDescriptorRewinder = this.dataRewinder;
            ArrayPool arrayPool = this.byteArrayPool;
            int size = list.size();
            for (int i = 0; i < size; i++) {
                ImageHeaderParser imageHeaderParser = list.get(i);
                try {
                    recyclableBufferedInputStream = new RecyclableBufferedInputStream(new FileInputStream(parcelFileDescriptorRewinder.rewindAndGet().getFileDescriptor()), arrayPool);
                    try {
                        ImageHeaderParser.ImageType type = imageHeaderParser.getType(recyclableBufferedInputStream);
                        try {
                            recyclableBufferedInputStream.close();
                        } catch (IOException unused) {
                        }
                        parcelFileDescriptorRewinder.rewindAndGet();
                        if (type != ImageHeaderParser.ImageType.UNKNOWN) {
                            return type;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        if (recyclableBufferedInputStream != null) {
                            try {
                                recyclableBufferedInputStream.close();
                            } catch (IOException unused2) {
                            }
                        }
                        parcelFileDescriptorRewinder.rewindAndGet();
                        throw th;
                    }
                } catch (Throwable th3) {
                    th = th3;
                    recyclableBufferedInputStream = null;
                }
            }
            return ImageHeaderParser.ImageType.UNKNOWN;
        }

        public ParcelFileDescriptorImageReader(ParcelFileDescriptor parcelFileDescriptor, List<ImageHeaderParser> list, ArrayPool arrayPool) {
            ContainerHelpers.checkNotNull(arrayPool);
            this.byteArrayPool = arrayPool;
            ContainerHelpers.checkNotNull(list);
            this.parsers = list;
            this.dataRewinder = new ParcelFileDescriptorRewinder(parcelFileDescriptor);
        }
    }

    Bitmap decodeBitmap(BitmapFactory.Options options) throws IOException;

    int getImageOrientation() throws IOException;

    ImageHeaderParser.ImageType getImageType() throws IOException;

    void stopGrowingBuffers();
}
