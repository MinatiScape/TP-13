package com.bumptech.glide.load.model;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.text.TextUtils;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/* loaded from: classes.dex */
public final class LazyHeaders implements Headers {
    public volatile Map<String, String> combinedHeaders;
    public final Map<String, List<LazyHeaderFactory>> headers;

    /* loaded from: classes.dex */
    public static final class Builder {
        public static final Map<String, List<LazyHeaderFactory>> DEFAULT_HEADERS;
        public Map<String, List<LazyHeaderFactory>> headers = DEFAULT_HEADERS;

        public static String getSanitizedUserAgent() {
            String property = System.getProperty("http.agent");
            if (TextUtils.isEmpty(property)) {
                return property;
            }
            int length = property.length();
            StringBuilder sb = new StringBuilder(property.length());
            for (int i = 0; i < length; i++) {
                char charAt = property.charAt(i);
                if ((charAt > 31 || charAt == '\t') && charAt < 127) {
                    sb.append(charAt);
                } else {
                    sb.append('?');
                }
            }
            return sb.toString();
        }

        static {
            String sanitizedUserAgent = getSanitizedUserAgent();
            HashMap hashMap = new HashMap(2);
            if (!TextUtils.isEmpty(sanitizedUserAgent)) {
                hashMap.put("User-Agent", Collections.singletonList(new StringHeaderFactory(sanitizedUserAgent)));
            }
            DEFAULT_HEADERS = Collections.unmodifiableMap(hashMap);
        }
    }

    /* loaded from: classes.dex */
    public static final class StringHeaderFactory implements LazyHeaderFactory {
        public final String value;

        public final boolean equals(Object obj) {
            if (obj instanceof StringHeaderFactory) {
                return this.value.equals(((StringHeaderFactory) obj).value);
            }
            return false;
        }

        public final int hashCode() {
            return this.value.hashCode();
        }

        public final String toString() {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("StringHeaderFactory{value='");
            m.append(this.value);
            m.append('\'');
            m.append('}');
            return m.toString();
        }

        public StringHeaderFactory(String str) {
            this.value = str;
        }

        @Override // com.bumptech.glide.load.model.LazyHeaderFactory
        public final String buildHeader() {
            return this.value;
        }
    }

    public final boolean equals(Object obj) {
        if (obj instanceof LazyHeaders) {
            return this.headers.equals(((LazyHeaders) obj).headers);
        }
        return false;
    }

    public final HashMap generateHeaders() {
        HashMap hashMap = new HashMap();
        for (Map.Entry<String, List<LazyHeaderFactory>> entry : this.headers.entrySet()) {
            List<LazyHeaderFactory> value = entry.getValue();
            StringBuilder sb = new StringBuilder();
            int size = value.size();
            for (int i = 0; i < size; i++) {
                String buildHeader = value.get(i).buildHeader();
                if (!TextUtils.isEmpty(buildHeader)) {
                    sb.append(buildHeader);
                    if (i != value.size() - 1) {
                        sb.append(',');
                    }
                }
            }
            String sb2 = sb.toString();
            if (!TextUtils.isEmpty(sb2)) {
                hashMap.put(entry.getKey(), sb2);
            }
        }
        return hashMap;
    }

    @Override // com.bumptech.glide.load.model.Headers
    public final Map<String, String> getHeaders() {
        if (this.combinedHeaders == null) {
            synchronized (this) {
                if (this.combinedHeaders == null) {
                    this.combinedHeaders = Collections.unmodifiableMap(generateHeaders());
                }
            }
        }
        return this.combinedHeaders;
    }

    public final int hashCode() {
        return this.headers.hashCode();
    }

    public final String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("LazyHeaders{headers=");
        m.append(this.headers);
        m.append('}');
        return m.toString();
    }

    public LazyHeaders(Map<String, List<LazyHeaderFactory>> map) {
        this.headers = Collections.unmodifiableMap(map);
    }
}
