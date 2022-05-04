package com.android.volley;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.text.TextUtils;
/* loaded from: classes.dex */
public final class Header {
    public final String mName;
    public final String mValue;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || Header.class != obj.getClass()) {
            return false;
        }
        Header header = (Header) obj;
        return TextUtils.equals(this.mName, header.mName) && TextUtils.equals(this.mValue, header.mValue);
    }

    public final int hashCode() {
        return this.mValue.hashCode() + (this.mName.hashCode() * 31);
    }

    public final String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Header[name=");
        m.append(this.mName);
        m.append(",value=");
        m.append(this.mValue);
        m.append("]");
        return m.toString();
    }

    public Header(String str, String str2) {
        this.mName = str;
        this.mValue = str2;
    }
}
