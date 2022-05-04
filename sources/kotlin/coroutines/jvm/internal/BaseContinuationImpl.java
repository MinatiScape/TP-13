package kotlin.coroutines.jvm.internal;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ModuleNameRetriever;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: ContinuationImpl.kt */
/* loaded from: classes.dex */
public abstract class BaseContinuationImpl implements Continuation<Object>, CoroutineStackFrame, Serializable {
    @Nullable
    private final Continuation<Object> completion;

    @Nullable
    public abstract Object invokeSuspend(@NotNull Object obj);

    public void releaseIntercepted() {
    }

    @NotNull
    public Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> completion) {
        Intrinsics.checkNotNullParameter(completion, "completion");
        throw new UnsupportedOperationException("create(Any?;Continuation) has not been overridden");
    }

    @Override // kotlin.coroutines.jvm.internal.CoroutineStackFrame
    @Nullable
    public final CoroutineStackFrame getCallerFrame() {
        Continuation<Object> continuation = this.completion;
        if (continuation instanceof CoroutineStackFrame) {
            return (CoroutineStackFrame) continuation;
        }
        return null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0, types: [kotlin.coroutines.Continuation, java.lang.Object, kotlin.coroutines.Continuation<java.lang.Object>] */
    @Override // kotlin.coroutines.Continuation
    public final void resumeWith(@NotNull Object obj) {
        while (true) {
            BaseContinuationImpl baseContinuationImpl = this;
            ?? r0 = baseContinuationImpl.completion;
            Intrinsics.checkNotNull(r0);
            try {
                obj = baseContinuationImpl.invokeSuspend(obj);
                if (obj == CoroutineSingletons.COROUTINE_SUSPENDED) {
                    return;
                }
            } catch (Throwable th) {
                obj = ResultKt.createFailure(th);
            }
            baseContinuationImpl.releaseIntercepted();
            if (r0 instanceof BaseContinuationImpl) {
                this = r0;
            } else {
                r0.resumeWith(obj);
                return;
            }
        }
    }

    public BaseContinuationImpl(@Nullable Continuation<Object> continuation) {
        this.completion = continuation;
    }

    @Override // kotlin.coroutines.jvm.internal.CoroutineStackFrame
    @Nullable
    public final StackTraceElement getStackTraceElement() {
        int i;
        String str;
        Object obj;
        Object obj2;
        Object obj3;
        Integer num;
        int i2;
        DebugMetadata debugMetadata = (DebugMetadata) getClass().getAnnotation(DebugMetadata.class);
        String str2 = null;
        if (debugMetadata == null) {
            return null;
        }
        int v = debugMetadata.v();
        if (v <= 1) {
            int i3 = -1;
            try {
                Field declaredField = getClass().getDeclaredField("label");
                declaredField.setAccessible(true);
                Object obj4 = declaredField.get(this);
                if (obj4 instanceof Integer) {
                    num = (Integer) obj4;
                } else {
                    num = null;
                }
                if (num == null) {
                    i2 = 0;
                } else {
                    i2 = num.intValue();
                }
                i = i2 - 1;
            } catch (Exception unused) {
                i = -1;
            }
            if (i >= 0) {
                i3 = debugMetadata.l()[i];
            }
            ModuleNameRetriever.Cache cache = ModuleNameRetriever.cache;
            if (cache == null) {
                try {
                    ModuleNameRetriever.Cache cache2 = new ModuleNameRetriever.Cache(Class.class.getDeclaredMethod("getModule", new Class[0]), getClass().getClassLoader().loadClass("java.lang.Module").getDeclaredMethod("getDescriptor", new Class[0]), getClass().getClassLoader().loadClass("java.lang.module.ModuleDescriptor").getDeclaredMethod("name", new Class[0]));
                    ModuleNameRetriever.cache = cache2;
                    cache = cache2;
                } catch (Exception unused2) {
                    cache = ModuleNameRetriever.notOnJava9;
                    ModuleNameRetriever.cache = cache;
                }
            }
            if (cache != ModuleNameRetriever.notOnJava9) {
                Method method = cache.getModuleMethod;
                if (method == null) {
                    obj = null;
                } else {
                    obj = method.invoke(getClass(), new Object[0]);
                }
                if (obj != null) {
                    Method method2 = cache.getDescriptorMethod;
                    if (method2 == null) {
                        obj2 = null;
                    } else {
                        obj2 = method2.invoke(obj, new Object[0]);
                    }
                    if (obj2 != null) {
                        Method method3 = cache.nameMethod;
                        if (method3 == null) {
                            obj3 = null;
                        } else {
                            obj3 = method3.invoke(obj2, new Object[0]);
                        }
                        if (obj3 instanceof String) {
                            str2 = obj3;
                        }
                    }
                }
            }
            if (str2 == null) {
                str = debugMetadata.c();
            } else {
                str = ((Object) str2) + '/' + debugMetadata.c();
            }
            return new StackTraceElement(str, debugMetadata.m(), debugMetadata.f(), i3);
        }
        throw new IllegalStateException(("Debug metadata version mismatch. Expected: 1, got " + v + ". Please update the Kotlin standard library.").toString());
    }

    @NotNull
    public String toString() {
        Object stackTraceElement = getStackTraceElement();
        if (stackTraceElement == null) {
            stackTraceElement = getClass().getName();
        }
        return Intrinsics.stringPlus("Continuation at ", stackTraceElement);
    }

    @Nullable
    public final Continuation<Object> getCompletion() {
        return this.completion;
    }
}
