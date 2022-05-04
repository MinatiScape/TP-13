package com.android.wallpaper.picker;

import android.content.Context;
import android.graphics.Point;
import android.view.WindowManager;
import com.android.wallpaper.util.ScreenSizeCalculator;
import com.bumptech.glide.load.resource.bitmap.BitmapTransformation;
import java.security.MessageDigest;
/* loaded from: classes.dex */
public final class WallpaperPreviewBitmapTransformation extends BitmapTransformation {
    public final Context mContext;
    public Point mScreenSize;

    /* JADX WARN: Removed duplicated region for block: B:44:0x015b  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0160  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0168  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x016e  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x0173  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x017b  */
    /* JADX WARN: Removed duplicated region for block: B:73:? A[RETURN, SYNTHETIC] */
    @Override // com.bumptech.glide.load.resource.bitmap.BitmapTransformation
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final android.graphics.Bitmap transform(com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool r7, android.graphics.Bitmap r8, int r9, int r10) {
        /*
            Method dump skipped, instructions count: 419
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.wallpaper.picker.WallpaperPreviewBitmapTransformation.transform(com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool, android.graphics.Bitmap, int, int):android.graphics.Bitmap");
    }

    @Override // com.bumptech.glide.load.Key
    public final void updateDiskCacheKey(MessageDigest messageDigest) {
        messageDigest.update("preview".getBytes());
    }

    public WallpaperPreviewBitmapTransformation(Context context, boolean z) {
        this.mScreenSize = ScreenSizeCalculator.getInstance().getScreenSize(((WindowManager) context.getSystemService("window")).getDefaultDisplay());
        this.mContext = context;
    }
}
