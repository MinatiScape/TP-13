package com.google.common.collect;

import java.util.Set;
/* loaded from: classes.dex */
public abstract class ForwardingSet<E> extends ForwardingCollection<E> implements Set<E> {
    @Override // com.google.common.collect.ForwardingCollection, com.google.common.collect.ForwardingObject
    /* renamed from: delegate */
    public abstract Set<E> mo31delegate();

    @Override // java.util.Collection, java.util.Set
    public boolean equals(Object object) {
        return object == this || mo31delegate().equals(object);
    }

    @Override // java.util.Collection, java.util.Set
    public int hashCode() {
        return mo31delegate().hashCode();
    }
}
