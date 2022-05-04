package com.bumptech.glide.load.data.mediastore;

import android.net.Uri;
/* loaded from: classes.dex */
public final class MediaStoreUtil {
    public static boolean isMediaStoreUri(Uri uri) {
        return uri != null && "content".equals(uri.getScheme()) && "media".equals(uri.getAuthority());
    }

    public static boolean isThumbnailSize(int width, int height) {
        return width != Integer.MIN_VALUE && height != Integer.MIN_VALUE && width <= 512 && height <= 384;
    }
}
