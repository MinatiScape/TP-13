package kotlin.io;

import java.io.Closeable;
import kotlin.ResultKt;
import org.jetbrains.annotations.Nullable;
/* loaded from: classes.dex */
public final class CloseableKt {
    public static final void closeFinally(@Nullable Closeable closeable, @Nullable Throwable th) {
        if (closeable != null) {
            if (th == null) {
                closeable.close();
                return;
            }
            try {
                closeable.close();
            } catch (Throwable th2) {
                ResultKt.addSuppressed(th, th2);
            }
        }
    }
}
