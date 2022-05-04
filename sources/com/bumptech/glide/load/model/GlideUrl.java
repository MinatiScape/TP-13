package com.bumptech.glide.load.model;

import android.net.Uri;
import android.text.TextUtils;
import androidx.collection.ContainerHelpers;
import com.bumptech.glide.load.Key;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.MessageDigest;
/* loaded from: classes.dex */
public final class GlideUrl implements Key {
    public volatile byte[] cacheKeyBytes;
    public int hashCode;
    public final Headers headers;
    public String safeStringUrl;
    public URL safeUrl;
    public final String stringUrl;
    public final URL url;

    public GlideUrl(URL url) {
        LazyHeaders lazyHeaders = Headers.DEFAULT;
        ContainerHelpers.checkNotNull(url);
        this.url = url;
        this.stringUrl = null;
        ContainerHelpers.checkNotNull(lazyHeaders);
        this.headers = lazyHeaders;
    }

    @Override // com.bumptech.glide.load.Key
    public final boolean equals(Object obj) {
        if (!(obj instanceof GlideUrl)) {
            return false;
        }
        GlideUrl glideUrl = (GlideUrl) obj;
        if (!getCacheKey().equals(glideUrl.getCacheKey()) || !this.headers.equals(glideUrl.headers)) {
            return false;
        }
        return true;
    }

    public final String getCacheKey() {
        String str = this.stringUrl;
        if (str != null) {
            return str;
        }
        URL url = this.url;
        ContainerHelpers.checkNotNull(url);
        return url.toString();
    }

    @Override // com.bumptech.glide.load.Key
    public final int hashCode() {
        if (this.hashCode == 0) {
            int hashCode = getCacheKey().hashCode();
            this.hashCode = hashCode;
            this.hashCode = this.headers.hashCode() + (hashCode * 31);
        }
        return this.hashCode;
    }

    public final URL toURL() throws MalformedURLException {
        if (this.safeUrl == null) {
            if (TextUtils.isEmpty(this.safeStringUrl)) {
                String str = this.stringUrl;
                if (TextUtils.isEmpty(str)) {
                    URL url = this.url;
                    ContainerHelpers.checkNotNull(url);
                    str = url.toString();
                }
                this.safeStringUrl = Uri.encode(str, "@#&=*+-_.,:!?()/~'%;$");
            }
            this.safeUrl = new URL(this.safeStringUrl);
        }
        return this.safeUrl;
    }

    @Override // com.bumptech.glide.load.Key
    public final void updateDiskCacheKey(MessageDigest messageDigest) {
        if (this.cacheKeyBytes == null) {
            this.cacheKeyBytes = getCacheKey().getBytes(Key.CHARSET);
        }
        messageDigest.update(this.cacheKeyBytes);
    }

    public final String toString() {
        return getCacheKey();
    }

    public GlideUrl(String str) {
        LazyHeaders lazyHeaders = Headers.DEFAULT;
        this.url = null;
        if (!TextUtils.isEmpty(str)) {
            this.stringUrl = str;
            ContainerHelpers.checkNotNull(lazyHeaders);
            this.headers = lazyHeaders;
            return;
        }
        throw new IllegalArgumentException("Must not be null or empty");
    }
}
