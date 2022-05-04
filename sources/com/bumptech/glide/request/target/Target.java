package com.bumptech.glide.request.target;

import android.graphics.drawable.Drawable;
import com.bumptech.glide.manager.LifecycleListener;
import com.bumptech.glide.request.Request;
import com.bumptech.glide.request.transition.Transition;
/* loaded from: classes.dex */
public interface Target<R> extends LifecycleListener {
    Request getRequest();

    void getSize(SizeReadyCallback cb);

    void onLoadCleared(Drawable placeholder);

    void onLoadFailed(Drawable errorDrawable);

    void onLoadStarted(Drawable placeholder);

    void onResourceReady(R resource, Transition<? super R> transition);

    void removeCallback(SizeReadyCallback cb);

    void setRequest(Request request);
}
