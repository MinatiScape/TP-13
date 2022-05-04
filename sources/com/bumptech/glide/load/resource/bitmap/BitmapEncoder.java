package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import com.bumptech.glide.load.EncodeStrategy;
import com.bumptech.glide.load.Option;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.ResourceEncoder;
import com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool;
/* loaded from: classes.dex */
public class BitmapEncoder implements ResourceEncoder<Bitmap> {
    public final ArrayPool arrayPool;
    public static final Option<Integer> COMPRESSION_QUALITY = Option.memory("com.bumptech.glide.load.resource.bitmap.BitmapEncoder.CompressionQuality", 90);
    public static final Option<Bitmap.CompressFormat> COMPRESSION_FORMAT = new Option<>("com.bumptech.glide.load.resource.bitmap.BitmapEncoder.CompressionFormat", null, Option.EMPTY_UPDATER);

    public BitmapEncoder(ArrayPool arrayPool) {
        this.arrayPool = arrayPool;
    }

    /* JADX WARN: Code restructure failed: missing block: B:28:0x006c, code lost:
        if (r6 != null) goto L45;
     */
    @Override // com.bumptech.glide.load.Encoder
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean encode(java.lang.Object r9, java.io.File r10, com.bumptech.glide.load.Options r11) {
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
            int r2 = com.bumptech.glide.util.LogTime.$r8$clinit     // Catch: java.lang.Throwable -> Ld9
            long r2 = android.os.SystemClock.elapsedRealtimeNanos()     // Catch: java.lang.Throwable -> Ld9
            com.bumptech.glide.load.Option<java.lang.Integer> r4 = com.bumptech.glide.load.resource.bitmap.BitmapEncoder.COMPRESSION_QUALITY     // Catch: java.lang.Throwable -> Ld9
            java.lang.Object r4 = r11.get(r4)     // Catch: java.lang.Throwable -> Ld9
            java.lang.Integer r4 = (java.lang.Integer) r4     // Catch: java.lang.Throwable -> Ld9
            int r4 = r4.intValue()     // Catch: java.lang.Throwable -> Ld9
            r5 = 0
            r6 = 0
            java.io.FileOutputStream r7 = new java.io.FileOutputStream     // Catch: java.lang.Throwable -> L5d java.io.IOException -> L5f
            r7.<init>(r10)     // Catch: java.lang.Throwable -> L5d java.io.IOException -> L5f
            com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool r10 = r8.arrayPool     // Catch: java.lang.Throwable -> L57 java.io.IOException -> L5a
            if (r10 == 0) goto L4e
            com.bumptech.glide.load.data.BufferedOutputStream r10 = new com.bumptech.glide.load.data.BufferedOutputStream     // Catch: java.lang.Throwable -> L57 java.io.IOException -> L5a
            com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool r8 = r8.arrayPool     // Catch: java.lang.Throwable -> L57 java.io.IOException -> L5a
            r6 = 65536(0x10000, float:9.18355E-41)
            r10.<init>(r7, r8, r6)     // Catch: java.lang.Throwable -> L57 java.io.IOException -> L5a
            r6 = r10
            goto L4f
        L4e:
            r6 = r7
        L4f:
            r9.compress(r1, r4, r6)     // Catch: java.lang.Throwable -> L5d java.io.IOException -> L5f
            r6.close()     // Catch: java.lang.Throwable -> L5d java.io.IOException -> L5f
            r5 = 1
            goto L6e
        L57:
            r8 = move-exception
            goto Ld3
        L5a:
            r8 = move-exception
            r6 = r7
            goto L60
        L5d:
            r8 = move-exception
            goto Ld2
        L5f:
            r8 = move-exception
        L60:
            r10 = 3
            boolean r10 = android.util.Log.isLoggable(r0, r10)     // Catch: java.lang.Throwable -> L5d
            if (r10 == 0) goto L6c
            java.lang.String r10 = "Failed to encode Bitmap"
            android.util.Log.d(r0, r10, r8)     // Catch: java.lang.Throwable -> L5d
        L6c:
            if (r6 == 0) goto L71
        L6e:
            r6.close()     // Catch: java.io.IOException -> L71 java.lang.Throwable -> Ld9
        L71:
            r8 = 2
            boolean r8 = android.util.Log.isLoggable(r0, r8)     // Catch: java.lang.Throwable -> Ld9
            if (r8 == 0) goto Ld1
            java.lang.String r8 = java.lang.String.valueOf(r1)     // Catch: java.lang.Throwable -> Ld9
            int r10 = com.bumptech.glide.util.Util.getBitmapByteSize(r9)     // Catch: java.lang.Throwable -> Ld9
            double r1 = com.bumptech.glide.util.LogTime.getElapsedMillis(r2)     // Catch: java.lang.Throwable -> Ld9
            com.bumptech.glide.load.Option<android.graphics.Bitmap$CompressFormat> r3 = com.bumptech.glide.load.resource.bitmap.BitmapEncoder.COMPRESSION_FORMAT     // Catch: java.lang.Throwable -> Ld9
            java.lang.Object r11 = r11.get(r3)     // Catch: java.lang.Throwable -> Ld9
            java.lang.String r11 = java.lang.String.valueOf(r11)     // Catch: java.lang.Throwable -> Ld9
            boolean r9 = r9.hasAlpha()     // Catch: java.lang.Throwable -> Ld9
            int r3 = r8.length()     // Catch: java.lang.Throwable -> Ld9
            int r3 = r3 + 105
            int r4 = r11.length()     // Catch: java.lang.Throwable -> Ld9
            int r3 = r3 + r4
            java.lang.StringBuilder r4 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> Ld9
            r4.<init>(r3)     // Catch: java.lang.Throwable -> Ld9
            java.lang.String r3 = "Compressed with type: "
            r4.append(r3)     // Catch: java.lang.Throwable -> Ld9
            r4.append(r8)     // Catch: java.lang.Throwable -> Ld9
            java.lang.String r8 = " of size "
            r4.append(r8)     // Catch: java.lang.Throwable -> Ld9
            r4.append(r10)     // Catch: java.lang.Throwable -> Ld9
            java.lang.String r8 = " in "
            r4.append(r8)     // Catch: java.lang.Throwable -> Ld9
            r4.append(r1)     // Catch: java.lang.Throwable -> Ld9
            java.lang.String r8 = ", options format: "
            r4.append(r8)     // Catch: java.lang.Throwable -> Ld9
            r4.append(r11)     // Catch: java.lang.Throwable -> Ld9
            java.lang.String r8 = ", hasAlpha: "
            r4.append(r8)     // Catch: java.lang.Throwable -> Ld9
            r4.append(r9)     // Catch: java.lang.Throwable -> Ld9
            java.lang.String r8 = r4.toString()     // Catch: java.lang.Throwable -> Ld9
            android.util.Log.v(r0, r8)     // Catch: java.lang.Throwable -> Ld9
        Ld1:
            return r5
        Ld2:
            r7 = r6
        Ld3:
            if (r7 == 0) goto Ld8
            r7.close()     // Catch: java.io.IOException -> Ld8 java.lang.Throwable -> Ld9
        Ld8:
            throw r8     // Catch: java.lang.Throwable -> Ld9
        Ld9:
            r8 = move-exception
            throw r8
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bumptech.glide.load.resource.bitmap.BitmapEncoder.encode(java.lang.Object, java.io.File, com.bumptech.glide.load.Options):boolean");
    }

    @Override // com.bumptech.glide.load.ResourceEncoder
    public EncodeStrategy getEncodeStrategy(Options options) {
        return EncodeStrategy.TRANSFORMED;
    }
}
