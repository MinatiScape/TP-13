package com.bumptech.glide.load;

import com.bumptech.glide.GlideContext;
import com.bumptech.glide.load.engine.Resource;
/* loaded from: classes.dex */
public interface Transformation<T> extends Key {
    Resource transform(GlideContext glideContext, Resource resource, int i, int i2);
}
