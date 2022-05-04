package com.bumptech.glide.load.resource;

import com.bumptech.glide.GlideContext;
import com.bumptech.glide.load.Transformation;
import com.bumptech.glide.load.engine.Resource;
import java.security.MessageDigest;
/* loaded from: classes.dex */
public final class UnitTransformation<T> implements Transformation<T> {
    public static final UnitTransformation TRANSFORMATION = new UnitTransformation();

    @Override // com.bumptech.glide.load.Transformation
    public final Resource transform(GlideContext glideContext, Resource resource, int i, int i2) {
        return resource;
    }

    @Override // com.bumptech.glide.load.Key
    public final void updateDiskCacheKey(MessageDigest messageDigest) {
    }
}
