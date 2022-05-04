package com.android.wallpaper.asset;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapRegionDecoder;
import android.graphics.Matrix;
import android.graphics.Point;
import android.graphics.Rect;
import android.os.AsyncTask;
import android.util.Log;
import androidx.cardview.R$color;
import com.android.wallpaper.asset.Asset;
import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes.dex */
public abstract class StreamableAsset extends Asset {
    public BitmapRegionDecoder mBitmapRegionDecoder;
    public Point mDimensions;

    /* renamed from: com.android.wallpaper.asset.StreamableAsset$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass1 extends AsyncTask<Void, Void, InputStream> {
        public final /* synthetic */ StreamReceiver val$streamReceiver;

        public AnonymousClass1(StreamReceiver streamReceiver) {
            this.val$streamReceiver = streamReceiver;
        }

        @Override // android.os.AsyncTask
        public InputStream doInBackground(Void[] voidArr) {
            return StreamableAsset.this.openInputStream();
        }

        @Override // android.os.AsyncTask
        public void onPostExecute(InputStream inputStream) {
            this.val$streamReceiver.onInputStreamOpened(inputStream);
        }
    }

    /* loaded from: classes.dex */
    public class DecodeBitmapAsyncTask extends AsyncTask<Void, Void, Bitmap> {
        public Asset.BitmapReceiver mReceiver;
        public int mTargetHeight;
        public int mTargetWidth;

        public DecodeBitmapAsyncTask(int i, int i2, Asset.BitmapReceiver bitmapReceiver) {
            this.mReceiver = bitmapReceiver;
            this.mTargetWidth = i;
            this.mTargetHeight = i2;
        }

        @Override // android.os.AsyncTask
        public Bitmap doInBackground(Void[] voidArr) {
            int exifOrientation = StreamableAsset.this.getExifOrientation();
            if (exifOrientation == 6 || exifOrientation == 8) {
                int i = this.mTargetHeight;
                this.mTargetHeight = this.mTargetWidth;
                this.mTargetWidth = i;
            }
            BitmapFactory.Options options = new BitmapFactory.Options();
            Point calculateRawDimensions = StreamableAsset.this.calculateRawDimensions();
            if (calculateRawDimensions == null) {
                return null;
            }
            options.inSampleSize = R$color.calculateInSampleSize(calculateRawDimensions.x, calculateRawDimensions.y, this.mTargetWidth, this.mTargetHeight);
            options.inPreferredConfig = Bitmap.Config.HARDWARE;
            InputStream openInputStream = StreamableAsset.this.openInputStream();
            Bitmap decodeStream = BitmapFactory.decodeStream(openInputStream, null, options);
            StreamableAsset.this.closeInputStream(openInputStream, "Error closing the input stream used to decode the full bitmap");
            int access$100 = StreamableAsset.access$100(exifOrientation);
            if (access$100 <= 0) {
                return decodeStream;
            }
            Matrix matrix = new Matrix();
            matrix.setRotate(access$100);
            return Bitmap.createBitmap(decodeStream, 0, 0, decodeStream.getWidth(), decodeStream.getHeight(), matrix, false);
        }

        @Override // android.os.AsyncTask
        public void onPostExecute(Bitmap bitmap) {
            this.mReceiver.onBitmapDecoded(bitmap);
        }
    }

    /* loaded from: classes.dex */
    public class DecodeBitmapRegionAsyncTask extends AsyncTask<Void, Void, Bitmap> {
        public Rect mCropRect;
        public final boolean mIsRtl;
        public final Asset.BitmapReceiver mReceiver;
        public int mTargetHeight;
        public int mTargetWidth;

        public DecodeBitmapRegionAsyncTask(Rect rect, int i, int i2, boolean z, Asset.BitmapReceiver bitmapReceiver) {
            this.mCropRect = rect;
            this.mReceiver = bitmapReceiver;
            this.mTargetWidth = i;
            this.mTargetHeight = i2;
            this.mIsRtl = z;
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Removed duplicated region for block: B:53:0x00ef A[EXC_TOP_SPLITTER, SYNTHETIC] */
        /* JADX WARN: Removed duplicated region for block: B:55:? A[RETURN, SYNTHETIC] */
        @Override // android.os.AsyncTask
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public android.graphics.Bitmap doInBackground(java.lang.Void[] r14) {
            /*
                Method dump skipped, instructions count: 293
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: com.android.wallpaper.asset.StreamableAsset.DecodeBitmapRegionAsyncTask.doInBackground(java.lang.Object[]):java.lang.Object");
        }

        @Override // android.os.AsyncTask
        public void onPostExecute(Bitmap bitmap) {
            this.mReceiver.onBitmapDecoded(bitmap);
        }
    }

    /* loaded from: classes.dex */
    public class DecodeDimensionsAsyncTask extends AsyncTask<Void, Void, Point> {
        public Asset.DimensionsReceiver mReceiver;

        public DecodeDimensionsAsyncTask(Asset.DimensionsReceiver dimensionsReceiver) {
            this.mReceiver = dimensionsReceiver;
        }

        @Override // android.os.AsyncTask
        public Point doInBackground(Void[] voidArr) {
            return StreamableAsset.this.calculateRawDimensions();
        }

        @Override // android.os.AsyncTask
        public void onPostExecute(Point point) {
            this.mReceiver.onDimensionsDecoded(point);
        }
    }

    /* loaded from: classes.dex */
    public interface StreamReceiver {
        void onInputStreamOpened(InputStream inputStream);
    }

    public static int access$100(int i) {
        if (i == 1) {
            return 0;
        }
        if (i == 3) {
            return 180;
        }
        if (i == 6) {
            return 90;
        }
        if (i == 8) {
            return 270;
        }
        Log.w("StreamableAsset", "Unsupported EXIF orientation " + i);
        return 0;
    }

    public Point calculateRawDimensions() {
        Point point = this.mDimensions;
        if (point != null) {
            return point;
        }
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inJustDecodeBounds = true;
        InputStream openInputStream = openInputStream();
        if (openInputStream == null) {
            return null;
        }
        BitmapFactory.decodeStream(openInputStream, null, options);
        closeInputStream(openInputStream, "There was an error closing the input stream used to calculate the image's raw dimensions");
        int exifOrientation = getExifOrientation();
        if (exifOrientation == 6 || exifOrientation == 8) {
            this.mDimensions = new Point(options.outHeight, options.outWidth);
        } else {
            this.mDimensions = new Point(options.outWidth, options.outHeight);
        }
        return this.mDimensions;
    }

    public final void closeInputStream(InputStream inputStream, String str) {
        try {
            inputStream.close();
        } catch (IOException unused) {
            Log.e("StreamableAsset", str);
        }
    }

    @Override // com.android.wallpaper.asset.Asset
    public void decodeBitmap(int i, int i2, Asset.BitmapReceiver bitmapReceiver) {
        new DecodeBitmapAsyncTask(i, i2, bitmapReceiver).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
    }

    @Override // com.android.wallpaper.asset.Asset
    public void decodeBitmapRegion(Rect rect, int i, int i2, boolean z, Asset.BitmapReceiver bitmapReceiver) {
        new DecodeBitmapRegionAsyncTask(rect, i, i2, z, bitmapReceiver).execute(new Void[0]);
    }

    @Override // com.android.wallpaper.asset.Asset
    public void decodeRawDimensions(Activity activity, Asset.DimensionsReceiver dimensionsReceiver) {
        new DecodeDimensionsAsyncTask(dimensionsReceiver).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
    }

    public int getExifOrientation() {
        return 1;
    }

    public abstract InputStream openInputStream();
}
