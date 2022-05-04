package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.os.Build;
import android.util.Log;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import java.util.Arrays;
import java.util.HashSet;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
/* loaded from: classes.dex */
public final class TransformationUtils {
    public static final Lock BITMAP_DRAWABLE_LOCK;
    public static final Paint DEFAULT_PAINT = new Paint(6);

    /* loaded from: classes.dex */
    public static final class NoLock implements Lock {
        @Override // java.util.concurrent.locks.Lock
        public void lock() {
        }

        @Override // java.util.concurrent.locks.Lock
        public void lockInterruptibly() throws InterruptedException {
        }

        @Override // java.util.concurrent.locks.Lock
        public Condition newCondition() {
            throw new UnsupportedOperationException("Should not be called");
        }

        @Override // java.util.concurrent.locks.Lock
        public boolean tryLock() {
            return true;
        }

        @Override // java.util.concurrent.locks.Lock
        public boolean tryLock(long time, TimeUnit unit) throws InterruptedException {
            return true;
        }

        @Override // java.util.concurrent.locks.Lock
        public void unlock() {
        }
    }

    static {
        new Paint(7);
        BITMAP_DRAWABLE_LOCK = new HashSet(Arrays.asList("XT1085", "XT1092", "XT1093", "XT1094", "XT1095", "XT1096", "XT1097", "XT1098", "XT1031", "XT1028", "XT937C", "XT1032", "XT1008", "XT1033", "XT1035", "XT1034", "XT939G", "XT1039", "XT1040", "XT1042", "XT1045", "XT1063", "XT1064", "XT1068", "XT1069", "XT1072", "XT1077", "XT1078", "XT1079")).contains(Build.MODEL) ? new ReentrantLock() : new NoLock();
        new Paint(7).setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC_IN));
    }

    public static void applyMatrix(Bitmap inBitmap, Bitmap targetBitmap, Matrix matrix) {
        Lock lock = BITMAP_DRAWABLE_LOCK;
        lock.lock();
        try {
            Canvas canvas = new Canvas(targetBitmap);
            canvas.drawBitmap(inBitmap, matrix, DEFAULT_PAINT);
            canvas.setBitmap(null);
            lock.unlock();
        } catch (Throwable th) {
            BITMAP_DRAWABLE_LOCK.unlock();
            throw th;
        }
    }

    public static Bitmap fitCenter(BitmapPool pool, Bitmap inBitmap, int width, int height) {
        if (inBitmap.getWidth() == width && inBitmap.getHeight() == height) {
            if (Log.isLoggable("TransformationUtils", 2)) {
                Log.v("TransformationUtils", "requested target size matches input, returning input");
            }
            return inBitmap;
        }
        float min = Math.min(width / inBitmap.getWidth(), height / inBitmap.getHeight());
        int round = Math.round(inBitmap.getWidth() * min);
        int round2 = Math.round(inBitmap.getHeight() * min);
        if (inBitmap.getWidth() == round && inBitmap.getHeight() == round2) {
            if (Log.isLoggable("TransformationUtils", 2)) {
                Log.v("TransformationUtils", "adjusted target size matches input, returning input");
            }
            return inBitmap;
        }
        Bitmap bitmap = pool.get((int) (inBitmap.getWidth() * min), (int) (inBitmap.getHeight() * min), getNonNullConfig(inBitmap));
        bitmap.setHasAlpha(inBitmap.hasAlpha());
        if (Log.isLoggable("TransformationUtils", 2)) {
            StringBuilder sb = new StringBuilder(32);
            sb.append("request: ");
            sb.append(width);
            sb.append("x");
            sb.append(height);
            Log.v("TransformationUtils", sb.toString());
            int width2 = inBitmap.getWidth();
            int height2 = inBitmap.getHeight();
            StringBuilder sb2 = new StringBuilder(32);
            sb2.append("toFit:   ");
            sb2.append(width2);
            sb2.append("x");
            sb2.append(height2);
            Log.v("TransformationUtils", sb2.toString());
            int width3 = bitmap.getWidth();
            int height3 = bitmap.getHeight();
            StringBuilder sb3 = new StringBuilder(32);
            sb3.append("toReuse: ");
            sb3.append(width3);
            sb3.append("x");
            sb3.append(height3);
            Log.v("TransformationUtils", sb3.toString());
            StringBuilder sb4 = new StringBuilder(25);
            sb4.append("minPct:   ");
            sb4.append(min);
            Log.v("TransformationUtils", sb4.toString());
        }
        Matrix matrix = new Matrix();
        matrix.setScale(min, min);
        applyMatrix(inBitmap, bitmap, matrix);
        return bitmap;
    }

    public static Bitmap.Config getNonNullConfig(Bitmap bitmap) {
        return bitmap.getConfig() != null ? bitmap.getConfig() : Bitmap.Config.ARGB_8888;
    }

    public static void initializeMatrixForRotation(int exifOrientation, Matrix matrix) {
        switch (exifOrientation) {
            case 2:
                matrix.setScale(-1.0f, 1.0f);
                return;
            case 3:
                matrix.setRotate(180.0f);
                return;
            case 4:
                matrix.setRotate(180.0f);
                matrix.postScale(-1.0f, 1.0f);
                return;
            case 5:
                matrix.setRotate(90.0f);
                matrix.postScale(-1.0f, 1.0f);
                return;
            case 6:
                matrix.setRotate(90.0f);
                return;
            case 7:
                matrix.setRotate(-90.0f);
                matrix.postScale(-1.0f, 1.0f);
                return;
            case 8:
                matrix.setRotate(-90.0f);
                return;
            default:
                return;
        }
    }
}
