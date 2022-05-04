package com.bumptech.glide.load.engine;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import androidx.collection.ContainerHelpers;
import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.Transformation;
import com.bumptech.glide.util.CachedHashCodeArrayMap;
import java.security.MessageDigest;
import java.util.Map;
/* loaded from: classes.dex */
public final class EngineKey implements Key {
    public int hashCode;
    public final int height;
    public final Object model;
    public final Options options;
    public final Class<?> resourceClass;
    public final Key signature;
    public final Class<?> transcodeClass;
    public final Map<Class<?>, Transformation<?>> transformations;
    public final int width;

    @Override // com.bumptech.glide.load.Key
    public final boolean equals(Object obj) {
        if (!(obj instanceof EngineKey)) {
            return false;
        }
        EngineKey engineKey = (EngineKey) obj;
        if (!this.model.equals(engineKey.model) || !this.signature.equals(engineKey.signature) || this.height != engineKey.height || this.width != engineKey.width || !this.transformations.equals(engineKey.transformations) || !this.resourceClass.equals(engineKey.resourceClass) || !this.transcodeClass.equals(engineKey.transcodeClass) || !this.options.equals(engineKey.options)) {
            return false;
        }
        return true;
    }

    @Override // com.bumptech.glide.load.Key
    public final int hashCode() {
        if (this.hashCode == 0) {
            int hashCode = this.model.hashCode();
            this.hashCode = hashCode;
            int hashCode2 = ((((this.signature.hashCode() + (hashCode * 31)) * 31) + this.width) * 31) + this.height;
            this.hashCode = hashCode2;
            int hashCode3 = this.transformations.hashCode() + (hashCode2 * 31);
            this.hashCode = hashCode3;
            int hashCode4 = this.resourceClass.hashCode() + (hashCode3 * 31);
            this.hashCode = hashCode4;
            int hashCode5 = this.transcodeClass.hashCode() + (hashCode4 * 31);
            this.hashCode = hashCode5;
            this.hashCode = this.options.hashCode() + (hashCode5 * 31);
        }
        return this.hashCode;
    }

    public final String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("EngineKey{model=");
        m.append(this.model);
        m.append(", width=");
        m.append(this.width);
        m.append(", height=");
        m.append(this.height);
        m.append(", resourceClass=");
        m.append(this.resourceClass);
        m.append(", transcodeClass=");
        m.append(this.transcodeClass);
        m.append(", signature=");
        m.append(this.signature);
        m.append(", hashCode=");
        m.append(this.hashCode);
        m.append(", transformations=");
        m.append(this.transformations);
        m.append(", options=");
        m.append(this.options);
        m.append('}');
        return m.toString();
    }

    @Override // com.bumptech.glide.load.Key
    public final void updateDiskCacheKey(MessageDigest messageDigest) {
        throw new UnsupportedOperationException();
    }

    public EngineKey(Object obj, Key key, int i, int i2, CachedHashCodeArrayMap cachedHashCodeArrayMap, Class cls, Class cls2, Options options) {
        ContainerHelpers.checkNotNull(obj);
        this.model = obj;
        if (key != null) {
            this.signature = key;
            this.width = i;
            this.height = i2;
            ContainerHelpers.checkNotNull(cachedHashCodeArrayMap);
            this.transformations = cachedHashCodeArrayMap;
            if (cls != null) {
                this.resourceClass = cls;
                if (cls2 != null) {
                    this.transcodeClass = cls2;
                    ContainerHelpers.checkNotNull(options);
                    this.options = options;
                    return;
                }
                throw new NullPointerException("Transcode class must not be null");
            }
            throw new NullPointerException("Resource class must not be null");
        }
        throw new NullPointerException("Signature must not be null");
    }
}
