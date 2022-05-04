package com.google.common.collect;

import androidx.cardview.R$style$$ExternalSyntheticOutline0;
import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableCollection;
import com.google.common.collect.ImmutableList;
import com.google.common.math.IntMath;
import java.io.Serializable;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Set;
/* loaded from: classes.dex */
public abstract class ImmutableSet<E> extends ImmutableCollection<E> implements Set<E> {
    public static final /* synthetic */ int $r8$clinit = 0;
    public transient ImmutableList<E> asList;

    /* loaded from: classes.dex */
    public static class Builder<E> extends ImmutableCollection.ArrayBasedBuilder<E> {
        public int hashCode;
        public Object[] hashTable;

        public ImmutableSet<E> build() {
            ImmutableSet<E> immutableSet;
            Object[] objArr;
            int i = this.size;
            if (i != 0) {
                boolean z = false;
                if (i != 1) {
                    if (this.hashTable == null || ImmutableSet.chooseTableSize(i) != this.hashTable.length) {
                        immutableSet = ImmutableSet.construct(this.size, this.contents);
                        this.size = immutableSet.size();
                    } else {
                        int i2 = this.size;
                        Object[] objArr2 = this.contents;
                        int length = objArr2.length;
                        if (i2 < (length >> 1) + (length >> 2)) {
                            z = true;
                        }
                        if (z) {
                            objArr2 = Arrays.copyOf(objArr2, i2);
                        }
                        immutableSet = new RegularImmutableSet<>(objArr2, this.hashCode, this.hashTable, objArr.length - 1, this.size);
                    }
                    this.forceCopy = true;
                    this.hashTable = null;
                    return immutableSet;
                }
                Object obj = this.contents[0];
                int i3 = ImmutableSet.$r8$clinit;
                return new SingletonImmutableSet(obj);
            }
            int i4 = ImmutableSet.$r8$clinit;
            return RegularImmutableSet.EMPTY;
        }

        public void add$1(Object element) {
            element.getClass();
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
                            add(element);
                            return;
                        } else if (!obj.equals(element)) {
                            smear = i + 1;
                        } else {
                            return;
                        }
                    }
                }
            }
            this.hashTable = null;
            add(element);
        }
    }

    /* loaded from: classes.dex */
    public static class SerializedForm implements Serializable {
        private static final long serialVersionUID = 0;
        public final Object[] elements;

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

        public SerializedForm(Object[] elements) {
            this.elements = elements;
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

    public boolean isHashCodeFast() {
        return this instanceof RegularImmutableSet;
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
            if (obj != null) {
                int hashCode = obj.hashCode();
                int smear = Hashing.smear(hashCode);
                while (true) {
                    int i5 = smear & i;
                    Object obj2 = objArr[i5];
                    if (obj2 == null) {
                        elements[i3] = obj;
                        objArr[i5] = obj;
                        i2 += hashCode;
                        i3++;
                        break;
                    } else if (obj2.equals(obj)) {
                        break;
                    } else {
                        smear++;
                    }
                }
            } else {
                throw new NullPointerException(R$style$$ExternalSyntheticOutline0.m(20, "at index ", i4));
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

    @Override // com.google.common.collect.ImmutableCollection
    Object writeReplace() {
        return new SerializedForm(toArray());
    }

    public ImmutableList<E> createAsList() {
        Object[] array = toArray();
        ImmutableList.Itr itr = ImmutableList.EMPTY_ITR;
        return ImmutableList.asImmutableList(array, array.length);
    }

    @Override // java.util.Collection, java.util.Set
    public int hashCode() {
        return Sets.hashCodeImpl(this);
    }

    @Override // com.google.common.collect.ImmutableCollection, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    /* renamed from: iterator */
    public /* bridge */ /* synthetic */ Iterator mo59iterator() {
        return iterator();
    }

    public static <E> ImmutableSet<E> of() {
        return RegularImmutableSet.EMPTY;
    }
}
