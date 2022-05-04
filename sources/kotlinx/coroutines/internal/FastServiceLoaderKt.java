package kotlinx.coroutines.internal;

import kotlin.Result;
import kotlin.ResultKt;
/* compiled from: FastServiceLoader.kt */
/* loaded from: classes.dex */
public final class FastServiceLoaderKt {
    public static final boolean ANDROID_DETECTED;

    static {
        Object obj;
        try {
            obj = Class.forName("android.os.Build");
        } catch (Throwable th) {
            obj = ResultKt.createFailure(th);
        }
        ANDROID_DETECTED = !(obj instanceof Result.Failure);
    }
}
