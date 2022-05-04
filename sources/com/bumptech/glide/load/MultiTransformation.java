package com.bumptech.glide.load;

import android.content.Context;
import com.bumptech.glide.load.engine.Resource;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Collection;
/* loaded from: classes.dex */
public class MultiTransformation<T> implements Transformation<T> {
    public final Collection<? extends Transformation<T>> transformations;

    @SafeVarargs
    public MultiTransformation(Transformation<T>... transformations) {
        if (transformations.length != 0) {
            this.transformations = Arrays.asList(transformations);
            return;
        }
        throw new IllegalArgumentException("MultiTransformation must contain at least one Transformation");
    }

    @Override // com.bumptech.glide.load.Key
    public boolean equals(Object o) {
        if (o instanceof MultiTransformation) {
            return this.transformations.equals(((MultiTransformation) o).transformations);
        }
        return false;
    }

    @Override // com.bumptech.glide.load.Key
    public int hashCode() {
        return this.transformations.hashCode();
    }

    @Override // com.bumptech.glide.load.Transformation
    public Resource<T> transform(Context context, Resource<T> resource, int outWidth, int outHeight) {
        Resource<T> resource2 = resource;
        for (Transformation<T> transformation : this.transformations) {
            Resource<T> transform = transformation.transform(context, resource2, outWidth, outHeight);
            if (resource2 != null && !resource2.equals(resource) && !resource2.equals(transform)) {
                resource2.recycle();
            }
            resource2 = transform;
        }
        return resource2;
    }

    @Override // com.bumptech.glide.load.Key
    public void updateDiskCacheKey(MessageDigest messageDigest) {
        for (Transformation<T> transformation : this.transformations) {
            transformation.updateDiskCacheKey(messageDigest);
        }
    }
}
