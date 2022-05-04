package com.android.wallpaper.module;

import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.AsyncTask;
import android.util.Log;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.module.BitmapCropper;
/* loaded from: classes.dex */
public final class DefaultBitmapCropper implements BitmapCropper {

    /* loaded from: classes.dex */
    public static class ScaleBitmapTask extends AsyncTask<Void, Void, Boolean> {
        public Bitmap mBitmap;
        public final BitmapCropper.Callback mCallback;
        public final Rect mCropRect;
        public OutOfMemoryError mThrowable;

        @Override // android.os.AsyncTask
        public final Boolean doInBackground(Void[] voidArr) {
            Bitmap bitmap = this.mBitmap;
            if (bitmap == null) {
                return Boolean.FALSE;
            }
            try {
                this.mBitmap = Bitmap.createScaledBitmap(bitmap, this.mCropRect.width(), this.mCropRect.height(), true);
                return Boolean.TRUE;
            } catch (OutOfMemoryError e) {
                Log.w("DefaultBitmapCropper", "Not enough memory to fit the final cropped and scaled bitmap to size", e);
                this.mThrowable = e;
                return Boolean.FALSE;
            }
        }

        @Override // android.os.AsyncTask
        public final void onPostExecute(Boolean bool) {
            if (bool.booleanValue()) {
                this.mCallback.onBitmapCropped(this.mBitmap);
            } else {
                this.mCallback.onError(this.mThrowable);
            }
        }

        public ScaleBitmapTask(Bitmap bitmap, Rect rect, BitmapCropper.Callback callback) {
            this.mBitmap = bitmap;
            this.mCropRect = rect;
            this.mCallback = callback;
        }
    }

    public final void cropAndScaleBitmap(Asset asset, float f, final Rect rect, boolean z, final BitmapCropper.Callback callback) {
        asset.decodeBitmapRegion(new Rect(Math.round(rect.left / f), Math.round(rect.top / f), Math.round(rect.right / f), Math.round(rect.bottom / f)), rect.width(), rect.height(), z, new Asset.BitmapReceiver() { // from class: com.android.wallpaper.module.DefaultBitmapCropper.1
            @Override // com.android.wallpaper.asset.Asset.BitmapReceiver
            public final void onBitmapDecoded(Bitmap bitmap) {
                new ScaleBitmapTask(bitmap, rect, callback).execute(new Void[0]);
            }
        });
    }
}
