package com.bumptech.glide.signature;

import com.bumptech.glide.load.Key;
import java.security.MessageDigest;
import java.util.Objects;
/* loaded from: classes.dex */
public final class ObjectKey implements Key {
    public final Object object;

    public ObjectKey(Object object) {
        Objects.requireNonNull(object, "Argument must not be null");
        this.object = object;
    }

    @Override // com.bumptech.glide.load.Key
    public boolean equals(Object o) {
        if (o instanceof ObjectKey) {
            return this.object.equals(((ObjectKey) o).object);
        }
        return false;
    }

    @Override // com.bumptech.glide.load.Key
    public int hashCode() {
        return this.object.hashCode();
    }

    public String toString() {
        String valueOf = String.valueOf(this.object);
        StringBuilder sb = new StringBuilder(valueOf.length() + 18);
        sb.append("ObjectKey{object=");
        sb.append(valueOf);
        sb.append('}');
        return sb.toString();
    }

    @Override // com.bumptech.glide.load.Key
    public void updateDiskCacheKey(MessageDigest messageDigest) {
        messageDigest.update(this.object.toString().getBytes(Key.CHARSET));
    }
}
