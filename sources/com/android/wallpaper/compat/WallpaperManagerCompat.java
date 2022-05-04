package com.android.wallpaper.compat;

import android.graphics.Bitmap;
import android.os.ParcelFileDescriptor;
import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes.dex */
public abstract class WallpaperManagerCompat {
    public static WallpaperManagerCompatVN sInstance;
    public static final Object sInstanceLock = new Object();

    public abstract ParcelFileDescriptor getWallpaperFile(int i);

    public abstract int getWallpaperId(int i);

    public abstract int setBitmap(Bitmap bitmap, boolean z, int i) throws IOException;

    public abstract int setStream(InputStream inputStream, boolean z, int i) throws IOException;
}
