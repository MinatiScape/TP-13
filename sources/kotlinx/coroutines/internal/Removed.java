package kotlinx.coroutines.internal;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import org.jetbrains.annotations.NotNull;
/* compiled from: LockFreeLinkedList.kt */
/* loaded from: classes.dex */
public final class Removed {
    @NotNull
    public final LockFreeLinkedListNode ref;

    @NotNull
    public final String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Removed[");
        m.append(this.ref);
        m.append(']');
        return m.toString();
    }

    public Removed(@NotNull LockFreeLinkedListNode lockFreeLinkedListNode) {
        this.ref = lockFreeLinkedListNode;
    }
}
