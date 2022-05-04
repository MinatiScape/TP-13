package com.bumptech.glide.signature;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import androidx.collection.ContainerHelpers;
import com.bumptech.glide.load.Key;
import java.security.MessageDigest;
/* loaded from: classes.dex */
public final class ObjectKey implements Key {
    public final Object object;

    @Override // com.bumptech.glide.load.Key
    public final boolean equals(Object obj) {
        if (obj instanceof ObjectKey) {
            return this.object.equals(((ObjectKey) obj).object);
        }
        return false;
    }

    @Override // com.bumptech.glide.load.Key
    public final int hashCode() {
        return this.object.hashCode();
    }

    public final String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("ObjectKey{object=");
        m.append(this.object);
        m.append('}');
        return m.toString();
    }

    @Override // com.bumptech.glide.load.Key
    public final void updateDiskCacheKey(MessageDigest messageDigest) {
        messageDigest.update(this.object.toString().getBytes(Key.CHARSET));
    }

    public ObjectKey(Object obj) {
        ContainerHelpers.checkNotNull(obj);
        this.object = obj;
    }
}
