package com.bumptech.glide.load.engine;

import androidx.recyclerview.R$attr$$ExternalSyntheticOutline0;
import com.bumptech.glide.load.Key;
import java.security.MessageDigest;
/* loaded from: classes.dex */
public final class DataCacheKey implements Key {
    public final Key signature;
    public final Key sourceKey;

    public DataCacheKey(Key sourceKey, Key signature) {
        this.sourceKey = sourceKey;
        this.signature = signature;
    }

    @Override // com.bumptech.glide.load.Key
    public boolean equals(Object o) {
        if (!(o instanceof DataCacheKey)) {
            return false;
        }
        DataCacheKey dataCacheKey = (DataCacheKey) o;
        return this.sourceKey.equals(dataCacheKey.sourceKey) && this.signature.equals(dataCacheKey.signature);
    }

    @Override // com.bumptech.glide.load.Key
    public int hashCode() {
        return this.signature.hashCode() + (this.sourceKey.hashCode() * 31);
    }

    public String toString() {
        String valueOf = String.valueOf(this.sourceKey);
        String valueOf2 = String.valueOf(this.signature);
        StringBuilder m = R$attr$$ExternalSyntheticOutline0.m(valueOf2.length() + valueOf.length() + 36, "DataCacheKey{sourceKey=", valueOf, ", signature=", valueOf2);
        m.append('}');
        return m.toString();
    }

    @Override // com.bumptech.glide.load.Key
    public void updateDiskCacheKey(MessageDigest messageDigest) {
        this.sourceKey.updateDiskCacheKey(messageDigest);
        this.signature.updateDiskCacheKey(messageDigest);
    }
}
