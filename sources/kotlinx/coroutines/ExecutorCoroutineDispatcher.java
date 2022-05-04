package kotlinx.coroutines;

import java.io.Closeable;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.CoroutineDispatcher;
/* compiled from: Executors.kt */
/* loaded from: classes.dex */
public abstract class ExecutorCoroutineDispatcher extends CoroutineDispatcher implements Closeable {
    static {
        CoroutineDispatcher.Key baseKey = CoroutineDispatcher.Key;
        ExecutorCoroutineDispatcher$Key$1 safeCast = ExecutorCoroutineDispatcher$Key$1.INSTANCE;
        Intrinsics.checkNotNullParameter(baseKey, "baseKey");
        Intrinsics.checkNotNullParameter(safeCast, "safeCast");
    }
}
