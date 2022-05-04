package kotlinx.coroutines;

import java.util.concurrent.CancellationException;
import org.jetbrains.annotations.NotNull;
/* compiled from: Job.kt */
/* loaded from: classes.dex */
public interface ParentJob extends Job {
    @NotNull
    CancellationException getChildJobCancellationCause();
}
