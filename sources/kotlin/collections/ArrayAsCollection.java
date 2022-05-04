package kotlin.collections;

import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import kotlin.jvm.internal.ArrayIterator;
import kotlin.jvm.internal.CollectionToArray;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: Collections.kt */
/* loaded from: classes.dex */
public final class ArrayAsCollection<T> implements Collection<T> {
    public final boolean isVarargs = false;
    @NotNull
    public final T[] values;

    @Override // java.util.Collection
    public final boolean add(T t) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Collection
    public final boolean addAll(Collection<? extends T> collection) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Collection
    public final void clear() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Collection
    public final boolean remove(Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Collection
    public final boolean removeAll(Collection<? extends Object> collection) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Collection
    public final boolean retainAll(Collection<? extends Object> collection) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Collection
    public final <T> T[] toArray(T[] array) {
        Intrinsics.checkNotNullParameter(array, "array");
        return (T[]) CollectionToArray.toArray(this, array);
    }

    @Override // java.util.Collection
    public final boolean contains(Object obj) {
        int i;
        T[] tArr = this.values;
        Intrinsics.checkNotNullParameter(tArr, "<this>");
        if (obj == null) {
            int length = tArr.length;
            i = 0;
            while (i < length) {
                int i2 = i + 1;
                if (tArr[i] == null) {
                    break;
                }
                i = i2;
            }
            i = -1;
        } else {
            int length2 = tArr.length;
            int i3 = 0;
            while (i3 < length2) {
                int i4 = i3 + 1;
                if (Intrinsics.areEqual(obj, tArr[i3])) {
                    i = i3;
                    break;
                }
                i3 = i4;
            }
            i = -1;
        }
        if (i >= 0) {
            return true;
        }
        return false;
    }

    @Override // java.util.Collection
    public final boolean containsAll(@NotNull Collection<? extends Object> elements) {
        Intrinsics.checkNotNullParameter(elements, "elements");
        if (elements.isEmpty()) {
            return true;
        }
        Iterator<T> it = elements.iterator();
        while (it.hasNext()) {
            if (!contains(it.next())) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.Collection
    public final boolean isEmpty() {
        if (this.values.length == 0) {
            return true;
        }
        return false;
    }

    @Override // java.util.Collection, java.lang.Iterable
    @NotNull
    public final Iterator<T> iterator() {
        T[] array = this.values;
        Intrinsics.checkNotNullParameter(array, "array");
        return new ArrayIterator(array);
    }

    @Override // java.util.Collection
    public final int size() {
        return this.values.length;
    }

    @Override // java.util.Collection
    @NotNull
    public final Object[] toArray() {
        T[] tArr = this.values;
        boolean z = this.isVarargs;
        Intrinsics.checkNotNullParameter(tArr, "<this>");
        if (z && Intrinsics.areEqual(tArr.getClass(), Object[].class)) {
            return tArr;
        }
        Object[] copyOf = Arrays.copyOf(tArr, tArr.length, Object[].class);
        Intrinsics.checkNotNullExpressionValue(copyOf, "copyOf(this, this.size, Array<Any?>::class.java)");
        return copyOf;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public ArrayAsCollection(@NotNull Object[] objArr) {
        this.values = objArr;
    }
}
