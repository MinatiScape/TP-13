package com.bumptech.glide.request;

import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.engine.GlideException;
import com.bumptech.glide.request.target.Target;
/* loaded from: classes.dex */
public interface RequestListener<R> {
    boolean onLoadFailed(GlideException e, Object model, Target<R> target, boolean isFirstResource);

    boolean onResourceReady(R resource, Object model, Target<R> target, DataSource dataSource, boolean isFirstResource);
}
