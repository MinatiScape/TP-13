package com.bumptech.glide.load.engine;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import com.bumptech.glide.load.Key;
import java.security.MessageDigest;
/* loaded from: classes.dex */
public final class DataCacheKey implements Key {
    public final Key signature;
    public final Key sourceKey;

    @Override // com.bumptech.glide.load.Key
    public final boolean equals(Object obj) {
        if (!(obj instanceof DataCacheKey)) {
            return false;
        }
        DataCacheKey dataCacheKey = (DataCacheKey) obj;
        if (!this.sourceKey.equals(dataCacheKey.sourceKey) || !this.signature.equals(dataCacheKey.signature)) {
            return false;
        }
        return true;
    }

    @Override // com.bumptech.glide.load.Key
    public final int hashCode() {
        return this.signature.hashCode() + (this.sourceKey.hashCode() * 31);
    }

    public final String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("DataCacheKey{sourceKey=");
        m.append(this.sourceKey);
        m.append(", signature=");
        m.append(this.signature);
        m.append('}');
        return m.toString();
    }

    @Override // com.bumptech.glide.load.Key
    public final void updateDiskCacheKey(MessageDigest messageDigest) {
        this.sourceKey.updateDiskCacheKey(messageDigest);
        this.signature.updateDiskCacheKey(messageDigest);
    }

    public DataCacheKey(Key key, Key key2) {
        this.sourceKey = key;
        this.signature = key2;
    }
}
