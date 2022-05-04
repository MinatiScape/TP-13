package com.google.common.collect;

import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableCollection;
import com.google.common.math.IntMath;
import java.io.Serializable;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Objects;
import java.util.Set;
/* loaded from: classes.dex */
public abstract class ImmutableSet<E> extends ImmutableCollection<E> implements Set<E> {
    public static final /* synthetic */ int $r8$clinit = 0;
    public transient ImmutableList<E> asList;

    /* loaded from: classes.dex */
    public static class Builder<E> extends ImmutableCollection.ArrayBasedBuilder<E> {
        public int hashCode;
        public Object[] hashTable;

        public Builder() {
            super(4);
        }

        @Override // com.google.common.collect.ImmutableCollection.ArrayBasedBuilder
        public Builder<E> add(E element) {
            Objects.requireNonNull(element);
            if (this.hashTable != null) {
                int chooseTableSize = ImmutableSet.chooseTableSize(this.size);
                Object[] objArr = this.hashTable;
                if (chooseTableSize <= objArr.length) {
                    int length = objArr.length - 1;
                    int hashCode = element.hashCode();
                    int smear = Hashing.smear(hashCode);
                    while (true) {
                        int i = smear & length;
                        Object[] objArr2 = this.hashTable;
                        Object obj = objArr2[i];
                        if (obj == null) {
                            objArr2[i] = element;
                            this.hashCode += hashCode;
                            add((Builder<E>) element);
                            break;
                        } else if (obj.equals(element)) {
                            break;
                        } else {
                            smear = i + 1;
                        }
                    }
                    return this;
                }
            }
            this.hashTable = null;
            add((Builder<E>) element);
            return this;
        }
    }

    /* loaded from: classes.dex */
    public static class SerializedForm implements Serializable {
        private static final long serialVersionUID = 0;
        public final Object[] elements;

        public SerializedForm(Object[] elements) {
            this.elements = elements;
        }

        public Object readResolve() {
            Object[] objArr = this.elements;
            int i = ImmutableSet.$r8$clinit;
            int length = objArr.length;
            if (length == 0) {
                return RegularImmutableSet.EMPTY;
            }
            if (length != 1) {
                return ImmutableSet.construct(objArr.length, (Object[]) objArr.clone());
            }
            return new SingletonImmutableSet(objArr[0]);
        }
    }

    public static int chooseTableSize(int setSize) {
        int max = Math.max(setSize, 2);
        boolean z = true;
        if (max < 751619276) {
            int highestOneBit = Integer.highestOneBit(max - 1) << 1;
            while (highestOneBit * 0.7d < max) {
                highestOneBit <<= 1;
            }
            return highestOneBit;
        }
        if (max >= 1073741824) {
            z = false;
        }
        Preconditions.checkArgument(z, "collection too large");
        return IntMath.MAX_SIGNED_POWER_OF_TWO;
    }

    public static <E> ImmutableSet<E> construct(int n, Object... elements) {
        if (n == 0) {
            return RegularImmutableSet.EMPTY;
        }
        boolean z = false;
        if (n == 1) {
            return new SingletonImmutableSet(elements[0]);
        }
        int chooseTableSize = chooseTableSize(n);
        Object[] objArr = new Object[chooseTableSize];
        int i = chooseTableSize - 1;
        int i2 = 0;
        int i3 = 0;
        for (int i4 = 0; i4 < n; i4++) {
            Object obj = elements[i4];
            ObjectArrays.checkElementNotNull(obj, i4);
            int hashCode = obj.hashCode();
            int smear = Hashing.smear(hashCode);
            while (true) {
                int i5 = smear & i;
                Object obj2 = objArr[i5];
                if (obj2 == null) {
                    i3++;
                    elements[i3] = obj;
                    objArr[i5] = obj;
                    i2 += hashCode;
                    break;
                } else if (obj2.equals(obj)) {
                    break;
                } else {
                    smear++;
                }
            }
        }
        Arrays.fill(elements, i3, n, (Object) null);
        if (i3 == 1) {
            return new SingletonImmutableSet(elements[0], i2);
        }
        if (chooseTableSize(i3) < chooseTableSize / 2) {
            return construct(i3, elements);
        }
        int length = elements.length;
        if (i3 < (length >> 1) + (length >> 2)) {
            z = true;
        }
        if (z) {
            elements = Arrays.copyOf(elements, i3);
        }
        return new RegularImmutableSet(elements, i2, objArr, i, i3);
    }

    public ImmutableList<E> asList() {
        ImmutableList<E> immutableList = this.asList;
        if (immutableList != null) {
            return immutableList;
        }
        ImmutableList<E> createAsList = createAsList();
        this.asList = createAsList;
        return createAsList;
    }

    public ImmutableList<E> createAsList() {
        return ImmutableList.asImmutableList(toArray());
    }

    @Override // java.util.Collection, java.util.Set
    public boolean equals(Object object) {
        if (object == this) {
            return true;
        }
        if (!(object instanceof ImmutableSet) || !isHashCodeFast() || !((ImmutableSet) object).isHashCodeFast() || hashCode() == object.hashCode()) {
            return Sets.equalsImpl(this, object);
        }
        return false;
    }

    @Override // java.util.Collection, java.util.Set
    public int hashCode() {
        return Sets.hashCodeImpl(this);
    }

    public boolean isHashCodeFast() {
        return this instanceof RegularImmutableSet;
    }

    @Override // com.google.common.collect.ImmutableCollection, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    public /* bridge */ /* synthetic */ Iterator iterator() {
        return iterator();
    }

    @Override // com.google.common.collect.ImmutableCollection
    Object writeReplace() {
        return new SerializedForm(toArray());
    }
}
