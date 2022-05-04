package kotlinx.coroutines;

import org.jetbrains.annotations.NotNull;
/* compiled from: Job.kt */
/* loaded from: classes.dex */
public interface ChildJob extends Job {
    void parentCancelled(@NotNull JobSupport jobSupport);
}
