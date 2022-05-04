package com.google.protobuf;

import com.google.protobuf.Internal;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public final class ProtobufArrayList<E> extends AbstractProtobufList<E> {
    public static final ProtobufArrayList<Object> EMPTY_LIST;
    public final List<E> list;

    static {
        ProtobufArrayList<Object> protobufArrayList = new ProtobufArrayList<>(new ArrayList(0));
        EMPTY_LIST = protobufArrayList;
        protobufArrayList.isMutable = false;
    }

    @Override // java.util.AbstractList, java.util.List
    public final E get(int i) {
        return this.list.get(i);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.list.size();
    }

    public ProtobufArrayList(ArrayList arrayList) {
        this.list = arrayList;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i, E e) {
        ensureIsMutable();
        this.list.add(i, e);
        ((AbstractList) this).modCount++;
    }

    @Override // com.google.protobuf.Internal.ProtobufList
    public final Internal.ProtobufList mutableCopyWithCapacity(int i) {
        if (i >= size()) {
            ArrayList arrayList = new ArrayList(i);
            arrayList.addAll(this.list);
            return new ProtobufArrayList(arrayList);
        }
        throw new IllegalArgumentException();
    }

    @Override // java.util.AbstractList, java.util.List
    public final E remove(int i) {
        ensureIsMutable();
        E remove = this.list.remove(i);
        ((AbstractList) this).modCount++;
        return remove;
    }

    @Override // java.util.AbstractList, java.util.List
    public final E set(int i, E e) {
        ensureIsMutable();
        E e2 = this.list.set(i, e);
        ((AbstractList) this).modCount++;
        return e2;
    }
}
