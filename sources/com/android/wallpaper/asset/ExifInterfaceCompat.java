package com.android.wallpaper.asset;

import android.media.ExifInterface;
import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes.dex */
public final class ExifInterfaceCompat {
    public ExifInterface mFrameworkExifInterface;

    public ExifInterfaceCompat(InputStream inputStream) throws IOException {
        this.mFrameworkExifInterface = new ExifInterface(inputStream);
    }
}
