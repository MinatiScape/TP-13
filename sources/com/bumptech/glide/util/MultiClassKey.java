package com.bumptech.glide.util;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
/* loaded from: classes.dex */
public final class MultiClassKey {
    public Class<?> first;
    public Class<?> second;
    public Class<?> third;

    public MultiClassKey() {
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || MultiClassKey.class != obj.getClass()) {
            return false;
        }
        MultiClassKey multiClassKey = (MultiClassKey) obj;
        return this.first.equals(multiClassKey.first) && this.second.equals(multiClassKey.second) && Util.bothNullOrEqual(this.third, multiClassKey.third);
    }

    public MultiClassKey(Class<?> cls, Class<?> cls2, Class<?> cls3) {
        this.first = cls;
        this.second = cls2;
        this.third = cls3;
    }

    public final int hashCode() {
        int i;
        int hashCode = (this.second.hashCode() + (this.first.hashCode() * 31)) * 31;
        Class<?> cls = this.third;
        if (cls != null) {
            i = cls.hashCode();
        } else {
            i = 0;
        }
        return hashCode + i;
    }

    public final String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("MultiClassKey{first=");
        m.append(this.first);
        m.append(", second=");
        m.append(this.second);
        m.append('}');
        return m.toString();
    }
}
