package com.android.wallpaper.asset;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapRegionDecoder;
import android.graphics.Matrix;
import android.graphics.Point;
import android.graphics.Rect;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import com.android.wallpaper.asset.Asset;
import java.io.IOException;
import java.io.InputStream;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
/* loaded from: classes.dex */
public abstract class StreamableAsset extends Asset {
    public static final ExecutorService sExecutorService = Executors.newCachedThreadPool();
    public BitmapRegionDecoder mBitmapRegionDecoder;
    public Point mDimensions;

    /* loaded from: classes.dex */
    public interface StreamReceiver {
        void onInputStreamOpened(InputStream inputStream);
    }

    public static int getDegreesRotationForExifOrientation(int i) {
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

    public int getExifOrientation() {
        return 1;
    }

    public abstract InputStream openInputStream();

    public final Point calculateRawDimensions() {
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
        try {
            openInputStream.close();
        } catch (IOException unused) {
            Log.e("StreamableAsset", "There was an error closing the input stream used to calculate the image's raw dimensions");
        }
        int exifOrientation = getExifOrientation();
        if (exifOrientation == 6 || exifOrientation == 8) {
            this.mDimensions = new Point(options.outHeight, options.outWidth);
        } else {
            this.mDimensions = new Point(options.outWidth, options.outHeight);
        }
        return this.mDimensions;
    }

    @Override // com.android.wallpaper.asset.Asset
    public final void decodeBitmap(final int i, final int i2, final Asset.BitmapReceiver bitmapReceiver) {
        sExecutorService.execute(new Runnable() { // from class: com.android.wallpaper.asset.StreamableAsset$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                StreamableAsset streamableAsset = StreamableAsset.this;
                int i3 = i;
                int i4 = i2;
                Asset.BitmapReceiver bitmapReceiver2 = bitmapReceiver;
                int exifOrientation = streamableAsset.getExifOrientation();
                if (exifOrientation == 6 || exifOrientation == 8) {
                    i4 = i3;
                    i3 = i4;
                }
                BitmapFactory.Options options = new BitmapFactory.Options();
                Point calculateRawDimensions = streamableAsset.calculateRawDimensions();
                if (calculateRawDimensions == null) {
                    Asset.decodeBitmapCompleted(bitmapReceiver2, null);
                    return;
                }
                int i5 = calculateRawDimensions.x;
                int i6 = calculateRawDimensions.y / 2;
                int i7 = i5 / 2;
                int i8 = 0;
                while ((i6 >> i8) >= i4 && (i7 >> i8) >= i3) {
                    i8++;
                }
                options.inSampleSize = 1 << i8;
                options.inPreferredConfig = Bitmap.Config.HARDWARE;
                InputStream openInputStream = streamableAsset.openInputStream();
                Bitmap decodeStream = BitmapFactory.decodeStream(openInputStream, null, options);
                try {
                    openInputStream.close();
                } catch (IOException unused) {
                    Log.e("StreamableAsset", "Error closing the input stream used to decode the full bitmap");
                }
                int degreesRotationForExifOrientation = StreamableAsset.getDegreesRotationForExifOrientation(exifOrientation);
                if (degreesRotationForExifOrientation > 0) {
                    Matrix matrix = new Matrix();
                    matrix.setRotate(degreesRotationForExifOrientation);
                    decodeStream = Bitmap.createBitmap(decodeStream, 0, 0, decodeStream.getWidth(), decodeStream.getHeight(), matrix, false);
                }
                Asset.decodeBitmapCompleted(bitmapReceiver2, decodeStream);
            }
        });
    }

    @Override // com.android.wallpaper.asset.Asset
    public void decodeBitmapRegion(final Rect rect, final int i, final int i2, final boolean z, final Asset.BitmapReceiver bitmapReceiver) {
        sExecutorService.execute(new Runnable() { // from class: com.android.wallpaper.asset.StreamableAsset$$ExternalSyntheticLambda2
            /* JADX WARN: Can't wrap try/catch for region: R(4:(2:62|33)|60|42|44) */
            /* JADX WARN: Code restructure failed: missing block: B:43:0x00ea, code lost:
                android.util.Log.e("StreamableAsset", "Unable to close input stream used to create BitmapRegionDecoder");
             */
            /* JADX WARN: Removed duplicated region for block: B:69:0x00fc A[EXC_TOP_SPLITTER, SYNTHETIC] */
            @Override // java.lang.Runnable
            /*
                Code decompiled incorrectly, please refer to instructions dump.
                To view partially-correct add '--show-bad-code' argument
            */
            public final void run() {
                /*
                    Method dump skipped, instructions count: 307
                    To view this dump add '--comments-level debug' option
                */
                throw new UnsupportedOperationException("Method not decompiled: com.android.wallpaper.asset.StreamableAsset$$ExternalSyntheticLambda2.run():void");
            }
        });
    }

    @Override // com.android.wallpaper.asset.Asset
    public void decodeRawDimensions(Activity activity, final Asset.DimensionsReceiver dimensionsReceiver) {
        sExecutorService.execute(new Runnable() { // from class: com.android.wallpaper.asset.StreamableAsset$$ExternalSyntheticLambda4
            @Override // java.lang.Runnable
            public final void run() {
                StreamableAsset streamableAsset = StreamableAsset.this;
                new Handler(Looper.getMainLooper()).post(new StreamableAsset$$ExternalSyntheticLambda0(dimensionsReceiver, streamableAsset.calculateRawDimensions(), 0));
            }
        });
    }
}
