package com.android.wallpaper.network;

import com.android.volley.VolleyError;
import com.google.chrome.dongle.imax.wallpaper2.protos.ImaxWallpaperProto$Image;
/* loaded from: classes.dex */
public interface ServerFetcher$NextImageInCollectionCallback {
    void onError(VolleyError volleyError);

    void onSuccess(ImaxWallpaperProto$Image imaxWallpaperProto$Image, String str);
}
