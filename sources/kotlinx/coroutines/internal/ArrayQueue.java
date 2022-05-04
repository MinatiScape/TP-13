package kotlinx.coroutines.internal;

import org.jetbrains.annotations.NotNull;
/* compiled from: ArrayQueue.kt */
/* loaded from: classes.dex */
public final class ArrayQueue<T> {
    @NotNull
    public Object[] elements = new Object[16];
    public int head;
    public int tail;
}
