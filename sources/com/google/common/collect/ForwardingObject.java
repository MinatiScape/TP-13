package com.google.common.collect;
/* loaded from: classes.dex */
public abstract class ForwardingObject {
    /* renamed from: delegate */
    public abstract Object mo31delegate();

    public String toString() {
        return mo31delegate().toString();
    }
}
