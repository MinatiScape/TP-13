package com.bumptech.glide.load;

import com.bumptech.glide.GlideContext;
import com.bumptech.glide.load.engine.Resource;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.List;
/* loaded from: classes.dex */
public final class MultiTransformation<T> implements Transformation<T> {
    public final List transformations;

    @Override // com.bumptech.glide.load.Key
    public final boolean equals(Object obj) {
        if (obj instanceof MultiTransformation) {
            return this.transformations.equals(((MultiTransformation) obj).transformations);
        }
        return false;
    }

    @Override // com.bumptech.glide.load.Key
    public final int hashCode() {
        return this.transformations.hashCode();
    }

    @Override // com.bumptech.glide.load.Transformation
    public final Resource transform(GlideContext glideContext, Resource resource, int i, int i2) {
        Resource resource2 = resource;
        for (Transformation transformation : this.transformations) {
            Resource transform = transformation.transform(glideContext, resource2, i, i2);
            if (resource2 != null && !resource2.equals(resource) && !resource2.equals(transform)) {
                resource2.recycle();
            }
            resource2 = transform;
        }
        return resource2;
    }

    @Override // com.bumptech.glide.load.Key
    public final void updateDiskCacheKey(MessageDigest messageDigest) {
        for (Transformation transformation : this.transformations) {
            transformation.updateDiskCacheKey(messageDigest);
        }
    }

    @SafeVarargs
    public MultiTransformation(Transformation<T>... transformationArr) {
        if (transformationArr.length != 0) {
            this.transformations = Arrays.asList(transformationArr);
            return;
        }
        throw new IllegalArgumentException("MultiTransformation must contain at least one Transformation");
    }
}
