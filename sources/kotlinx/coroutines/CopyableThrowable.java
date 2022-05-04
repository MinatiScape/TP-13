package kotlinx.coroutines;

import java.lang.Throwable;
import kotlinx.coroutines.CopyableThrowable;
import org.jetbrains.annotations.Nullable;
/* compiled from: Debug.common.kt */
/* loaded from: classes.dex */
public interface CopyableThrowable<T extends Throwable & CopyableThrowable<T>> {
    @Nullable
    T createCopy();
}
