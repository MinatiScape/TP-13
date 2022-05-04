package com.bumptech.glide.load;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import com.bumptech.glide.load.Option;
import com.bumptech.glide.util.CachedHashCodeArrayMap;
import java.security.MessageDigest;
/* loaded from: classes.dex */
public final class Options implements Key {
    public final CachedHashCodeArrayMap values = new CachedHashCodeArrayMap();

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.bumptech.glide.load.Key
    public final void updateDiskCacheKey(MessageDigest messageDigest) {
        int i = 0;
        while (true) {
            CachedHashCodeArrayMap cachedHashCodeArrayMap = this.values;
            if (i < cachedHashCodeArrayMap.mSize) {
                Option option = (Option) cachedHashCodeArrayMap.keyAt(i);
                V valueAt = this.values.valueAt(i);
                Option.CacheKeyUpdater<T> cacheKeyUpdater = option.cacheKeyUpdater;
                if (option.keyBytes == null) {
                    option.keyBytes = option.key.getBytes(Key.CHARSET);
                }
                cacheKeyUpdater.update(option.keyBytes, valueAt, messageDigest);
                i++;
            } else {
                return;
            }
        }
    }

    @Override // com.bumptech.glide.load.Key
    public final boolean equals(Object obj) {
        if (obj instanceof Options) {
            return this.values.equals(((Options) obj).values);
        }
        return false;
    }

    public final <T> T get(Option<T> option) {
        if (this.values.containsKey(option)) {
            return (T) this.values.getOrDefault(option, null);
        }
        return option.defaultValue;
    }

    @Override // com.bumptech.glide.load.Key
    public final int hashCode() {
        return this.values.hashCode();
    }

    public final String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Options{values=");
        m.append(this.values);
        m.append('}');
        return m.toString();
    }
}
