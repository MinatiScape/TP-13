package kotlin.jvm.internal;

import androidx.appcompat.view.SupportMenuInflater$$ExternalSyntheticOutline0;
import androidx.concurrent.futures.AbstractResolvableFuture$$ExternalSyntheticOutline0;
import com.android.systemui.shared.R;
import java.util.Arrays;
import kotlin.UninitializedPropertyAccessException;
/* loaded from: classes.dex */
public final class Intrinsics {
    public static final int[] SubsamplingScaleImageView = {R.attr.assetName, R.attr.panEnabled, R.attr.quickScaleEnabled, R.attr.src, R.attr.tileBackgroundColor, R.attr.zoomEnabled};

    public static boolean areEqual(Object obj, Object obj2) {
        if (obj != null) {
            return obj.equals(obj2);
        }
        if (obj2 == null) {
            return true;
        }
        return false;
    }

    public static void checkNotNull(Object obj) {
        if (obj == null) {
            NullPointerException nullPointerException = new NullPointerException();
            sanitizeStackTrace(nullPointerException, Intrinsics.class.getName());
            throw nullPointerException;
        }
    }

    public static void checkNotNullExpressionValue(Object obj, String str) {
        if (obj == null) {
            NullPointerException nullPointerException = new NullPointerException(SupportMenuInflater$$ExternalSyntheticOutline0.m(str, " must not be null"));
            sanitizeStackTrace(nullPointerException, Intrinsics.class.getName());
            throw nullPointerException;
        }
    }

    public static void checkNotNullParameter(Object obj, String str) {
        if (obj == null) {
            StackTraceElement stackTraceElement = Thread.currentThread().getStackTrace()[4];
            String className = stackTraceElement.getClassName();
            String methodName = stackTraceElement.getMethodName();
            NullPointerException nullPointerException = new NullPointerException("Parameter specified as non-null is null: method " + className + "." + methodName + ", parameter " + str);
            sanitizeStackTrace(nullPointerException, Intrinsics.class.getName());
            throw nullPointerException;
        }
    }

    public static String stringPlus(String str, Object obj) {
        return str + obj;
    }

    public static void throwUninitializedPropertyAccessException(String str) {
        UninitializedPropertyAccessException uninitializedPropertyAccessException = new UninitializedPropertyAccessException(AbstractResolvableFuture$$ExternalSyntheticOutline0.m("lateinit property ", str, " has not been initialized"));
        sanitizeStackTrace(uninitializedPropertyAccessException, Intrinsics.class.getName());
        throw uninitializedPropertyAccessException;
    }

    public static void sanitizeStackTrace(RuntimeException runtimeException, String str) {
        StackTraceElement[] stackTrace = runtimeException.getStackTrace();
        int length = stackTrace.length;
        int i = -1;
        for (int i2 = 0; i2 < length; i2++) {
            if (str.equals(stackTrace[i2].getClassName())) {
                i = i2;
            }
        }
        runtimeException.setStackTrace((StackTraceElement[]) Arrays.copyOfRange(stackTrace, i + 1, length));
    }
}
