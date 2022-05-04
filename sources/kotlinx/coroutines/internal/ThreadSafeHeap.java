package kotlinx.coroutines.internal;

import java.lang.Comparable;
import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.atomicfu.AtomicInt;
import kotlinx.coroutines.DebugKt;
import kotlinx.coroutines.EventLoopImplBase;
import kotlinx.coroutines.internal.ThreadSafeHeapNode;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: ThreadSafeHeap.kt */
/* loaded from: classes.dex */
public class ThreadSafeHeap<T extends ThreadSafeHeapNode & Comparable<? super T>> {
    @NotNull
    public final AtomicInt _size = new AtomicInt();
    @Nullable
    public T[] a;

    public final void addImpl(@NotNull T t) {
        boolean z = DebugKt.DEBUG;
        t.setHeap((EventLoopImplBase.DelayedTaskQueue) this);
        T[] tArr = this.a;
        if (tArr == null) {
            tArr = (T[]) new ThreadSafeHeapNode[4];
            this.a = tArr;
        } else if (this._size.value >= tArr.length) {
            Object[] copyOf = Arrays.copyOf(tArr, this._size.value * 2);
            Intrinsics.checkNotNullExpressionValue(copyOf, "copyOf(this, newSize)");
            tArr = (T[]) ((ThreadSafeHeapNode[]) copyOf);
            this.a = tArr;
        }
        int i = this._size.value;
        this._size.setValue(i + 1);
        tArr[i] = t;
        t.setIndex(i);
        siftUpFrom(i);
    }

    @NotNull
    public final T removeAtImpl(int i) {
        boolean z = DebugKt.DEBUG;
        T[] tArr = this.a;
        Intrinsics.checkNotNull(tArr);
        this._size.setValue(this._size.value - 1);
        if (i < this._size.value) {
            swap(i, this._size.value);
            int i2 = (i - 1) / 2;
            if (i > 0) {
                T t = tArr[i];
                Intrinsics.checkNotNull(t);
                T t2 = tArr[i2];
                Intrinsics.checkNotNull(t2);
                if (((Comparable) t).compareTo(t2) < 0) {
                    swap(i, i2);
                    siftUpFrom(i2);
                }
            }
            while (true) {
                int i3 = (i * 2) + 1;
                if (i3 >= this._size.value) {
                    break;
                }
                T[] tArr2 = this.a;
                Intrinsics.checkNotNull(tArr2);
                int i4 = i3 + 1;
                if (i4 < this._size.value) {
                    T t3 = tArr2[i4];
                    Intrinsics.checkNotNull(t3);
                    T t4 = tArr2[i3];
                    Intrinsics.checkNotNull(t4);
                    if (((Comparable) t3).compareTo(t4) < 0) {
                        i3 = i4;
                    }
                }
                T t5 = tArr2[i];
                Intrinsics.checkNotNull(t5);
                T t6 = tArr2[i3];
                Intrinsics.checkNotNull(t6);
                if (((Comparable) t5).compareTo(t6) <= 0) {
                    break;
                }
                swap(i, i3);
                i = i3;
            }
        }
        T t7 = tArr[this._size.value];
        Intrinsics.checkNotNull(t7);
        boolean z2 = DebugKt.DEBUG;
        t7.setHeap(null);
        t7.setIndex(-1);
        tArr[this._size.value] = null;
        return t7;
    }

    public final void siftUpFrom(int i) {
        while (i > 0) {
            T[] tArr = this.a;
            Intrinsics.checkNotNull(tArr);
            int i2 = (i - 1) / 2;
            T t = tArr[i2];
            Intrinsics.checkNotNull(t);
            T t2 = tArr[i];
            Intrinsics.checkNotNull(t2);
            if (((Comparable) t).compareTo(t2) > 0) {
                swap(i, i2);
                i = i2;
            } else {
                return;
            }
        }
    }

    public final void swap(int i, int i2) {
        T[] tArr = this.a;
        Intrinsics.checkNotNull(tArr);
        T t = tArr[i2];
        Intrinsics.checkNotNull(t);
        T t2 = tArr[i];
        Intrinsics.checkNotNull(t2);
        tArr[i] = t;
        tArr[i2] = t2;
        t.setIndex(i);
        t2.setIndex(i2);
    }
}
