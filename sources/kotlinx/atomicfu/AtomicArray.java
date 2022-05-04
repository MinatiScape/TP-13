package kotlinx.atomicfu;

import org.jetbrains.annotations.NotNull;
/* compiled from: AtomicFU.common.kt */
/* loaded from: classes.dex */
public final class AtomicArray<T> {
    @NotNull
    public final AtomicRef<T>[] array;

    public AtomicArray(int i) {
        AtomicRef<T>[] atomicRefArr = new AtomicRef[i];
        for (int i2 = 0; i2 < i; i2++) {
            atomicRefArr[i2] = AtomicFU.atomic(null);
        }
        this.array = atomicRefArr;
    }
}
