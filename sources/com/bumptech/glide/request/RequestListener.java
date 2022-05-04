package com.bumptech.glide.request;

import com.bumptech.glide.load.engine.GlideException;
/* loaded from: classes.dex */
public interface RequestListener<R> {
    void onLoadFailed(GlideException glideException);

    void onResourceReady(Object obj);
}
