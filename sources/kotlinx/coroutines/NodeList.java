package kotlinx.coroutines;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.internal.LockFreeLinkedListHead;
import kotlinx.coroutines.internal.LockFreeLinkedListNode;
import org.jetbrains.annotations.NotNull;
/* compiled from: JobSupport.kt */
/* loaded from: classes.dex */
public final class NodeList extends LockFreeLinkedListHead implements Incomplete {
    @Override // kotlinx.coroutines.Incomplete
    @NotNull
    public final NodeList getList() {
        return this;
    }

    @Override // kotlinx.coroutines.Incomplete
    public final boolean isActive() {
        return true;
    }

    @NotNull
    public final String getString(@NotNull String str) {
        StringBuilder sb = new StringBuilder();
        sb.append("List{");
        sb.append(str);
        sb.append("}[");
        boolean z = true;
        for (LockFreeLinkedListNode lockFreeLinkedListNode = (LockFreeLinkedListNode) getNext(); !Intrinsics.areEqual(lockFreeLinkedListNode, this); lockFreeLinkedListNode = lockFreeLinkedListNode.getNextNode()) {
            if (lockFreeLinkedListNode instanceof JobNode) {
                JobNode jobNode = (JobNode) lockFreeLinkedListNode;
                if (z) {
                    z = false;
                } else {
                    sb.append(", ");
                }
                sb.append(jobNode);
            }
        }
        sb.append("]");
        String sb2 = sb.toString();
        Intrinsics.checkNotNullExpressionValue(sb2, "StringBuilder().apply(builderAction).toString()");
        return sb2;
    }

    @Override // kotlinx.coroutines.internal.LockFreeLinkedListNode
    @NotNull
    public final String toString() {
        if (DebugKt.DEBUG) {
            return getString("Active");
        }
        return super.toString();
    }
}
