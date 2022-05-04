package kotlinx.coroutines.android;

import android.support.annotation.Keep;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Objects;
import kotlin.Lazy;
import kotlin.LazyKt__LazyKt;
import kotlin.coroutines.AbstractCoroutineContextElement;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.PropertyReference1Impl;
import kotlin.jvm.internal.Reflection;
import kotlin.reflect.KProperty;
import kotlinx.coroutines.CoroutineExceptionHandler;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
@Keep
/* loaded from: classes.dex */
public final class AndroidExceptionPreHandler extends AbstractCoroutineContextElement implements CoroutineExceptionHandler, Function0<Method> {
    public static final /* synthetic */ KProperty[] $$delegatedProperties;
    private final Lazy preHandler$delegate = LazyKt__LazyKt.lazy(this);

    static {
        PropertyReference1Impl propertyReference1Impl = new PropertyReference1Impl(Reflection.getOrCreateKotlinClass(AndroidExceptionPreHandler.class), "preHandler", "getPreHandler()Ljava/lang/reflect/Method;");
        Objects.requireNonNull(Reflection.factory);
        $$delegatedProperties = new KProperty[]{propertyReference1Impl};
    }

    public AndroidExceptionPreHandler() {
        super(CoroutineExceptionHandler.Key.$$INSTANCE);
    }

    private final Method getPreHandler() {
        Lazy lazy = this.preHandler$delegate;
        KProperty kProperty = $$delegatedProperties[0];
        return (Method) lazy.getValue();
    }

    @Override // kotlinx.coroutines.CoroutineExceptionHandler
    public void handleException(@NotNull CoroutineContext context, @NotNull Throwable exception) {
        Intrinsics.checkParameterIsNotNull(context, "context");
        Intrinsics.checkParameterIsNotNull(exception, "exception");
        Thread thread = Thread.currentThread();
        Intrinsics.checkExpressionValueIsNotNull(thread, "thread");
        thread.getUncaughtExceptionHandler().uncaughtException(thread, exception);
    }

    @Override // kotlin.jvm.functions.Function0
    @Nullable
    public Method invoke() {
        try {
            boolean z = false;
            Method it = Thread.class.getDeclaredMethod("getUncaughtExceptionPreHandler", new Class[0]);
            Intrinsics.checkExpressionValueIsNotNull(it, "it");
            if (Modifier.isPublic(it.getModifiers())) {
                if (Modifier.isStatic(it.getModifiers())) {
                    z = true;
                }
            }
            if (z) {
                return it;
            }
            return null;
        } catch (Throwable unused) {
            return null;
        }
    }
}
