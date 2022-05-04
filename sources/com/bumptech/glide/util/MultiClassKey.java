package com.bumptech.glide.util;

import androidx.recyclerview.R$attr$$ExternalSyntheticOutline0;
/* loaded from: classes.dex */
public class MultiClassKey {
    public Class<?> first;
    public Class<?> second;
    public Class<?> third;

    public MultiClassKey() {
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || MultiClassKey.class != o.getClass()) {
            return false;
        }
        MultiClassKey multiClassKey = (MultiClassKey) o;
        return this.first.equals(multiClassKey.first) && this.second.equals(multiClassKey.second) && Util.bothNullOrEqual(this.third, multiClassKey.third);
    }

    public int hashCode() {
        int hashCode = (this.second.hashCode() + (this.first.hashCode() * 31)) * 31;
        Class<?> cls = this.third;
        return hashCode + (cls != null ? cls.hashCode() : 0);
    }

    public String toString() {
        String valueOf = String.valueOf(this.first);
        String valueOf2 = String.valueOf(this.second);
        StringBuilder m = R$attr$$ExternalSyntheticOutline0.m(valueOf2.length() + valueOf.length() + 30, "MultiClassKey{first=", valueOf, ", second=", valueOf2);
        m.append('}');
        return m.toString();
    }

    public MultiClassKey(Class<?> first, Class<?> second, Class<?> third) {
        this.first = first;
        this.second = second;
        this.third = third;
    }
}
