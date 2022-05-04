package com.google.common.collect;

import com.google.common.base.Preconditions;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class RegularImmutableList<E> extends ImmutableList<E> {
    public static final ImmutableList<Object> EMPTY = new RegularImmutableList(new Object[0], 0);
    public final transient Object[] array;
    public final transient int size;

    @Override // com.google.common.collect.ImmutableCollection
    public final int internalArrayStart() {
        return 0;
    }

    @Override // com.google.common.collect.ImmutableCollection
    public final boolean isPartialView() {
        return false;
    }

    @Override // com.google.common.collect.ImmutableList, com.google.common.collect.ImmutableCollection
    public final int copyIntoArray(Object[] objArr) {
        System.arraycopy(this.array, 0, objArr, 0, this.size);
        return 0 + this.size;
    }

    @Override // java.util.List
    public final E get(int index) {
        Preconditions.checkElementIndex(index, this.size);
        return (E) this.array[index];
    }

    public RegularImmutableList(Object[] array, int size) {
        this.array = array;
        this.size = size;
    }

    @Override // com.google.common.collect.ImmutableCollection
    public final Object[] internalArray() {
        return this.array;
    }

    @Override // com.google.common.collect.ImmutableCollection
    public final int internalArrayEnd() {
        return this.size;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.size;
    }
}
