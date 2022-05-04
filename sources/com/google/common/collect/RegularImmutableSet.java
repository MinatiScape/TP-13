package com.google.common.collect;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class RegularImmutableSet<E> extends ImmutableSet<E> {
    public static final RegularImmutableSet<Object> EMPTY = new RegularImmutableSet<>(new Object[0], 0, null, 0, 0);
    public final transient Object[] elements;
    public final transient int hashCode;
    public final transient int mask;
    public final transient int size;
    public final transient Object[] table;

    @Override // com.google.common.collect.ImmutableCollection
    public final int internalArrayStart() {
        return 0;
    }

    @Override // com.google.common.collect.ImmutableCollection, java.util.AbstractCollection, java.util.Collection
    public final boolean contains(Object target) {
        Object[] objArr = this.table;
        if (target == null || objArr == null) {
            return false;
        }
        int smearedHash = Hashing.smearedHash(target);
        while (true) {
            int i = smearedHash & this.mask;
            Object obj = objArr[i];
            if (obj == null) {
                return false;
            }
            if (obj.equals(target)) {
                return true;
            }
            smearedHash = i + 1;
        }
    }

    @Override // com.google.common.collect.ImmutableCollection
    public final int copyIntoArray(Object[] objArr) {
        System.arraycopy(this.elements, 0, objArr, 0, this.size);
        return 0 + this.size;
    }

    @Override // com.google.common.collect.ImmutableSet
    public final ImmutableList<E> createAsList() {
        return ImmutableList.asImmutableList(this.elements, this.size);
    }

    @Override // com.google.common.collect.ImmutableSet, com.google.common.collect.ImmutableCollection, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    /* renamed from: iterator */
    public final UnmodifiableIterator<E> mo59iterator() {
        return asList().listIterator(0);
    }

    public RegularImmutableSet(Object[] elements, int hashCode, Object[] table, int mask, int size) {
        this.elements = elements;
        this.table = table;
        this.mask = mask;
        this.hashCode = hashCode;
        this.size = size;
    }

    @Override // com.google.common.collect.ImmutableSet, java.util.Collection, java.util.Set
    public final int hashCode() {
        return this.hashCode;
    }

    @Override // com.google.common.collect.ImmutableCollection
    public final Object[] internalArray() {
        return this.elements;
    }

    @Override // com.google.common.collect.ImmutableCollection
    public final int internalArrayEnd() {
        return this.size;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return this.size;
    }
}
