package kotlinx.coroutines;

import org.jetbrains.annotations.Nullable;
/* compiled from: JobSupport.kt */
/* loaded from: classes.dex */
public interface Incomplete {
    @Nullable
    NodeList getList();

    boolean isActive();
}
