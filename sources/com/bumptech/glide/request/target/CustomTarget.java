package com.bumptech.glide.request.target;

import android.graphics.drawable.Drawable;
import androidx.recyclerview.widget.RecyclerView;
import com.bumptech.glide.request.Request;
import com.bumptech.glide.util.Util;
/* loaded from: classes.dex */
public abstract class CustomTarget<T> implements Target<T> {
    public final int height;
    public Request request;
    public final int width;

    @Override // com.bumptech.glide.manager.LifecycleListener
    public final void onDestroy() {
    }

    @Override // com.bumptech.glide.request.target.Target
    public final void onLoadFailed(Drawable drawable) {
    }

    @Override // com.bumptech.glide.request.target.Target
    public final void onLoadStarted(Drawable drawable) {
    }

    @Override // com.bumptech.glide.manager.LifecycleListener
    public final void onStart() {
    }

    @Override // com.bumptech.glide.manager.LifecycleListener
    public final void onStop() {
    }

    @Override // com.bumptech.glide.request.target.Target
    public final void removeCallback(SizeReadyCallback sizeReadyCallback) {
    }

    @Override // com.bumptech.glide.request.target.Target
    public final void getSize(SizeReadyCallback sizeReadyCallback) {
        sizeReadyCallback.onSizeReady(this.width, this.height);
    }

    public CustomTarget() {
        if (Util.isValidDimensions(RecyclerView.UNDEFINED_DURATION, RecyclerView.UNDEFINED_DURATION)) {
            this.width = RecyclerView.UNDEFINED_DURATION;
            this.height = RecyclerView.UNDEFINED_DURATION;
            return;
        }
        throw new IllegalArgumentException("Width and height must both be > 0 or Target#SIZE_ORIGINAL, but given width: -2147483648 and height: -2147483648");
    }

    @Override // com.bumptech.glide.request.target.Target
    public final void setRequest(Request request) {
        this.request = request;
    }

    @Override // com.bumptech.glide.request.target.Target
    public final Request getRequest() {
        return this.request;
    }
}
