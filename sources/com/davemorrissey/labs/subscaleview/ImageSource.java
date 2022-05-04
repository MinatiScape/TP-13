package com.davemorrissey.labs.subscaleview;

import android.graphics.Bitmap;
import android.net.Uri;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
/* loaded from: classes.dex */
public final class ImageSource {
    public final Bitmap bitmap;
    public boolean cached;
    public final Integer resource;
    public boolean tile;
    public final Uri uri;

    public ImageSource(Bitmap bitmap) {
        this.bitmap = bitmap;
        this.uri = null;
        this.resource = null;
        this.tile = false;
        bitmap.getWidth();
        bitmap.getHeight();
        this.cached = false;
    }

    public ImageSource(Uri uri) {
        String uri2 = uri.toString();
        if (uri2.startsWith("file:///") && !new File(uri2.substring(7)).exists()) {
            try {
                uri = Uri.parse(URLDecoder.decode(uri2, "UTF-8"));
            } catch (UnsupportedEncodingException unused) {
            }
        }
        this.bitmap = null;
        this.uri = uri;
        this.resource = null;
        this.tile = true;
    }

    public ImageSource(int i) {
        this.bitmap = null;
        this.uri = null;
        this.resource = Integer.valueOf(i);
        this.tile = true;
    }
}
