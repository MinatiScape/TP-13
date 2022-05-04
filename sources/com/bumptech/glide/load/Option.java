package com.bumptech.glide.load;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.text.TextUtils;
import java.security.MessageDigest;
/* loaded from: classes.dex */
public final class Option<T> {
    public static final AnonymousClass1 EMPTY_UPDATER = new CacheKeyUpdater<Object>() { // from class: com.bumptech.glide.load.Option.1
        @Override // com.bumptech.glide.load.Option.CacheKeyUpdater
        public final void update(byte[] bArr, Object obj, MessageDigest messageDigest) {
        }
    };
    public final CacheKeyUpdater<T> cacheKeyUpdater;
    public final T defaultValue;
    public final String key;
    public volatile byte[] keyBytes;

    /* loaded from: classes.dex */
    public interface CacheKeyUpdater<T> {
        void update(byte[] bArr, T t, MessageDigest messageDigest);
    }

    public static <T> Option<T> memory(String str, T t) {
        return new Option<>(str, t, EMPTY_UPDATER);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof Option) {
            return this.key.equals(((Option) obj).key);
        }
        return false;
    }

    public final int hashCode() {
        return this.key.hashCode();
    }

    public final String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Option{key='");
        m.append(this.key);
        m.append('\'');
        m.append('}');
        return m.toString();
    }

    public Option(String str, T t, CacheKeyUpdater<T> cacheKeyUpdater) {
        if (!TextUtils.isEmpty(str)) {
            this.key = str;
            this.defaultValue = t;
            this.cacheKeyUpdater = cacheKeyUpdater;
            return;
        }
        throw new IllegalArgumentException("Must not be null or empty");
    }
}
