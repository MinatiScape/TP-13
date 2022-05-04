package com.android.volley;

import com.android.volley.Cache;
import com.google.protobuf.MessageLite;
/* loaded from: classes.dex */
public final class Response<T> {
    public final Cache.Entry cacheEntry;
    public final VolleyError error;
    public boolean intermediate;
    public final T result;

    /* loaded from: classes.dex */
    public interface ErrorListener {
        void onErrorResponse(VolleyError volleyError);
    }

    /* loaded from: classes.dex */
    public interface Listener<T> {
        void onResponse(T t);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public Response(MessageLite messageLite, Cache.Entry entry) {
        this.intermediate = false;
        this.result = messageLite;
        this.cacheEntry = entry;
        this.error = null;
    }

    public Response(VolleyError volleyError) {
        this.intermediate = false;
        this.result = null;
        this.cacheEntry = null;
        this.error = volleyError;
    }
}
