package com.bumptech.glide.load;

import android.text.TextUtils;
import com.adobe.xmp.XMPPathFactory$$ExternalSyntheticOutline0;
import java.security.MessageDigest;
import java.util.Objects;
/* loaded from: classes.dex */
public final class Option<T> {
    public static final CacheKeyUpdater<Object> EMPTY_UPDATER = new CacheKeyUpdater<Object>() { // from class: com.bumptech.glide.load.Option.1
        @Override // com.bumptech.glide.load.Option.CacheKeyUpdater
        public void update(byte[] keyBytes, Object value, MessageDigest messageDigest) {
        }
    };
    public final CacheKeyUpdater<T> cacheKeyUpdater;
    public final T defaultValue;
    public final String key;
    public volatile byte[] keyBytes;

    /* loaded from: classes.dex */
    public interface CacheKeyUpdater<T> {
        void update(byte[] keyBytes, T value, MessageDigest messageDigest);
    }

    public Option(String key, T defaultValue, CacheKeyUpdater<T> cacheKeyUpdater) {
        if (!TextUtils.isEmpty(key)) {
            this.key = key;
            this.defaultValue = defaultValue;
            Objects.requireNonNull(cacheKeyUpdater, "Argument must not be null");
            this.cacheKeyUpdater = cacheKeyUpdater;
            return;
        }
        throw new IllegalArgumentException("Must not be null or empty");
    }

    public static <T> Option<T> memory(String key, T defaultValue) {
        return new Option<>(key, defaultValue, EMPTY_UPDATER);
    }

    public boolean equals(Object o) {
        if (o instanceof Option) {
            return this.key.equals(((Option) o).key);
        }
        return false;
    }

    public int hashCode() {
        return this.key.hashCode();
    }

    public String toString() {
        String str = this.key;
        StringBuilder sb = new StringBuilder(XMPPathFactory$$ExternalSyntheticOutline0.m(str, 14));
        sb.append("Option{key='");
        sb.append(str);
        sb.append('\'');
        sb.append('}');
        return sb.toString();
    }
}
