package kotlinx.coroutines;

import org.jetbrains.annotations.NotNull;
/* compiled from: JobSupport.kt */
/* loaded from: classes.dex */
public final class InactiveNodeList implements Incomplete {
    @NotNull
    public final NodeList list;

    @Override // kotlinx.coroutines.Incomplete
    public final boolean isActive() {
        return false;
    }

    @NotNull
    public final String toString() {
        if (DebugKt.DEBUG) {
            return this.list.getString("New");
        }
        return super.toString();
    }

    public InactiveNodeList(@NotNull NodeList nodeList) {
        this.list = nodeList;
    }

    @Override // kotlinx.coroutines.Incomplete
    @NotNull
    public final NodeList getList() {
        return this.list;
    }
}
