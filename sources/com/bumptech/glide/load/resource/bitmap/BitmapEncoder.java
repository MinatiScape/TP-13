package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import com.bumptech.glide.load.EncodeStrategy;
import com.bumptech.glide.load.Option;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.ResourceEncoder;
import com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool;
/* loaded from: classes.dex */
public final class BitmapEncoder implements ResourceEncoder<Bitmap> {
    public final ArrayPool arrayPool;
    public static final Option<Integer> COMPRESSION_QUALITY = Option.memory("com.bumptech.glide.load.resource.bitmap.BitmapEncoder.CompressionQuality", 90);
    public static final Option<Bitmap.CompressFormat> COMPRESSION_FORMAT = new Option<>("com.bumptech.glide.load.resource.bitmap.BitmapEncoder.CompressionFormat", null, Option.EMPTY_UPDATER);

    /* JADX WARN: Code restructure failed: missing block: B:28:0x006b, code lost:
        if (r6 != null) goto L46;
     */
    @Override // com.bumptech.glide.load.Encoder
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean encode(java.lang.Object r9, java.io.File r10, com.bumptech.glide.load.Options r11) {
        /*
            r8 = this;
            com.bumptech.glide.load.engine.Resource r9 = (com.bumptech.glide.load.engine.Resource) r9
            java.lang.String r0 = "BitmapEncoder"
            java.lang.Object r9 = r9.get()
            android.graphics.Bitmap r9 = (android.graphics.Bitmap) r9
            com.bumptech.glide.load.Option<android.graphics.Bitmap$CompressFormat> r1 = com.bumptech.glide.load.resource.bitmap.BitmapEncoder.COMPRESSION_FORMAT
            java.lang.Object r1 = r11.get(r1)
            android.graphics.Bitmap$CompressFormat r1 = (android.graphics.Bitmap.CompressFormat) r1
            if (r1 == 0) goto L15
            goto L20
        L15:
            boolean r1 = r9.hasAlpha()
            if (r1 == 0) goto L1e
            android.graphics.Bitmap$CompressFormat r1 = android.graphics.Bitmap.CompressFormat.PNG
            goto L20
        L1e:
            android.graphics.Bitmap$CompressFormat r1 = android.graphics.Bitmap.CompressFormat.JPEG
        L20:
            r9.getWidth()
            r9.getHeight()
            int r2 = com.bumptech.glide.util.LogTime.$r8$clinit     // Catch: java.lang.Throwable -> Lc5
            long r2 = android.os.SystemClock.elapsedRealtimeNanos()     // Catch: java.lang.Throwable -> Lc5
            com.bumptech.glide.load.Option<java.lang.Integer> r4 = com.bumptech.glide.load.resource.bitmap.BitmapEncoder.COMPRESSION_QUALITY     // Catch: java.lang.Throwable -> Lc5
            java.lang.Object r4 = r11.get(r4)     // Catch: java.lang.Throwable -> Lc5
            java.lang.Integer r4 = (java.lang.Integer) r4     // Catch: java.lang.Throwable -> Lc5
            int r4 = r4.intValue()     // Catch: java.lang.Throwable -> Lc5
            r5 = 0
            r6 = 0
            java.io.FileOutputStream r7 = new java.io.FileOutputStream     // Catch: java.lang.Throwable -> L5c java.io.IOException -> L5e
            r7.<init>(r10)     // Catch: java.lang.Throwable -> L5c java.io.IOException -> L5e
            com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool r10 = r8.arrayPool     // Catch: java.lang.Throwable -> L57 java.io.IOException -> L59
            if (r10 == 0) goto L4e
            com.bumptech.glide.load.data.BufferedOutputStream r10 = new com.bumptech.glide.load.data.BufferedOutputStream     // Catch: java.lang.Throwable -> L57 java.io.IOException -> L59
            com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool r8 = r8.arrayPool     // Catch: java.lang.Throwable -> L57 java.io.IOException -> L59
            r6 = 65536(0x10000, float:9.18355E-41)
            r10.<init>(r7, r8, r6)     // Catch: java.lang.Throwable -> L57 java.io.IOException -> L59
            r6 = r10
            goto L4f
        L4e:
            r6 = r7
        L4f:
            r9.compress(r1, r4, r6)     // Catch: java.lang.Throwable -> L5c java.io.IOException -> L5e
            r6.close()     // Catch: java.lang.Throwable -> L5c java.io.IOException -> L5e
            r5 = 1
            goto L6d
        L57:
            r8 = move-exception
            goto Lbf
        L59:
            r8 = move-exception
            r6 = r7
            goto L5f
        L5c:
            r8 = move-exception
            goto Lbe
        L5e:
            r8 = move-exception
        L5f:
            r10 = 3
            boolean r10 = android.util.Log.isLoggable(r0, r10)     // Catch: java.lang.Throwable -> L5c
            if (r10 == 0) goto L6b
            java.lang.String r10 = "Failed to encode Bitmap"
            android.util.Log.d(r0, r10, r8)     // Catch: java.lang.Throwable -> L5c
        L6b:
            if (r6 == 0) goto L70
        L6d:
            r6.close()     // Catch: java.io.IOException -> L70 java.lang.Throwable -> Lc5
        L70:
            r8 = 2
            boolean r8 = android.util.Log.isLoggable(r0, r8)     // Catch: java.lang.Throwable -> Lc5
            if (r8 == 0) goto Lbd
            java.lang.StringBuilder r8 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> Lc5
            r8.<init>()     // Catch: java.lang.Throwable -> Lc5
            java.lang.String r10 = "Compressed with type: "
            r8.append(r10)     // Catch: java.lang.Throwable -> Lc5
            r8.append(r1)     // Catch: java.lang.Throwable -> Lc5
            java.lang.String r10 = " of size "
            r8.append(r10)     // Catch: java.lang.Throwable -> Lc5
            int r10 = com.bumptech.glide.util.Util.getBitmapByteSize(r9)     // Catch: java.lang.Throwable -> Lc5
            r8.append(r10)     // Catch: java.lang.Throwable -> Lc5
            java.lang.String r10 = " in "
            r8.append(r10)     // Catch: java.lang.Throwable -> Lc5
            double r1 = com.bumptech.glide.util.LogTime.getElapsedMillis(r2)     // Catch: java.lang.Throwable -> Lc5
            r8.append(r1)     // Catch: java.lang.Throwable -> Lc5
            java.lang.String r10 = ", options format: "
            r8.append(r10)     // Catch: java.lang.Throwable -> Lc5
            com.bumptech.glide.load.Option<android.graphics.Bitmap$CompressFormat> r10 = com.bumptech.glide.load.resource.bitmap.BitmapEncoder.COMPRESSION_FORMAT     // Catch: java.lang.Throwable -> Lc5
            java.lang.Object r10 = r11.get(r10)     // Catch: java.lang.Throwable -> Lc5
            r8.append(r10)     // Catch: java.lang.Throwable -> Lc5
            java.lang.String r10 = ", hasAlpha: "
            r8.append(r10)     // Catch: java.lang.Throwable -> Lc5
            boolean r9 = r9.hasAlpha()     // Catch: java.lang.Throwable -> Lc5
            r8.append(r9)     // Catch: java.lang.Throwable -> Lc5
            java.lang.String r8 = r8.toString()     // Catch: java.lang.Throwable -> Lc5
            android.util.Log.v(r0, r8)     // Catch: java.lang.Throwable -> Lc5
        Lbd:
            return r5
        Lbe:
            r7 = r6
        Lbf:
            if (r7 == 0) goto Lc4
            r7.close()     // Catch: java.io.IOException -> Lc4 java.lang.Throwable -> Lc5
        Lc4:
            throw r8     // Catch: java.lang.Throwable -> Lc5
        Lc5:
            r8 = move-exception
            throw r8
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bumptech.glide.load.resource.bitmap.BitmapEncoder.encode(java.lang.Object, java.io.File, com.bumptech.glide.load.Options):boolean");
    }

    public BitmapEncoder(ArrayPool arrayPool) {
        this.arrayPool = arrayPool;
    }

    @Override // com.bumptech.glide.load.ResourceEncoder
    public final EncodeStrategy getEncodeStrategy(Options options) {
        return EncodeStrategy.TRANSFORMED;
    }
}
