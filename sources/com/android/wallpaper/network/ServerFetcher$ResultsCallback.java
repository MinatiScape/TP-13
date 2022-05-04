package com.android.wallpaper.network;

import com.android.volley.VolleyError;
import com.google.protobuf.Internal;
/* loaded from: classes.dex */
public interface ServerFetcher$ResultsCallback<T> {
    void onError(VolleyError volleyError);

    void onSuccess(Internal.ProtobufList protobufList);
}
