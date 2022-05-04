package com.google.common.util.concurrent;

import com.adobe.xmp.impl.XMPNode$$ExternalSyntheticOutline0;
import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import com.google.common.collect.Lists;
import com.google.common.collect.Ordering;
import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
/* loaded from: classes.dex */
public final class FuturesGetChecked {
    public static final Ordering<Constructor<?>> WITH_STRING_PARAM_FIRST = Ordering.natural().onResultOf(new Function<Constructor<?>, Boolean>() { // from class: com.google.common.util.concurrent.FuturesGetChecked.1
        @Override // com.google.common.base.Function
        public final Boolean apply(Constructor<?> input) {
            return Boolean.valueOf(Arrays.asList(input.getParameterTypes()).contains(String.class));
        }
    }).reverse();

    /* loaded from: classes.dex */
    public interface GetCheckedTypeValidator {
        void validateClass(Class<? extends Exception> exceptionClass);
    }

    /* loaded from: classes.dex */
    public static class GetCheckedTypeValidatorHolder {
        public static final GetCheckedTypeValidator BEST_VALIDATOR;

        /* JADX WARN: Failed to restore enum class, 'enum' modifier removed */
        /* loaded from: classes.dex */
        public static final class ClassValueValidator extends Enum<ClassValueValidator> implements GetCheckedTypeValidator {
            public static final /* synthetic */ ClassValueValidator[] $VALUES;
            public static final ClassValueValidator INSTANCE;
            public static final AnonymousClass1 isValidClass = new ClassValue<Boolean>() { // from class: com.google.common.util.concurrent.FuturesGetChecked.GetCheckedTypeValidatorHolder.ClassValueValidator.1
            };

            static {
                ClassValueValidator classValueValidator = new ClassValueValidator();
                INSTANCE = classValueValidator;
                $VALUES = new ClassValueValidator[]{classValueValidator};
            }

            public static ClassValueValidator valueOf(String name) {
                return (ClassValueValidator) Enum.valueOf(ClassValueValidator.class, name);
            }

            public static ClassValueValidator[] values() {
                return (ClassValueValidator[]) $VALUES.clone();
            }

            @Override // com.google.common.util.concurrent.FuturesGetChecked.GetCheckedTypeValidator
            public final void validateClass(Class<? extends Exception> exceptionClass) {
                isValidClass.get(exceptionClass);
            }
        }

        /* JADX WARN: Failed to restore enum class, 'enum' modifier removed */
        /* loaded from: classes.dex */
        public static final class WeakSetValidator extends Enum<WeakSetValidator> implements GetCheckedTypeValidator {
            public static final /* synthetic */ WeakSetValidator[] $VALUES;
            public static final WeakSetValidator INSTANCE;
            public static final CopyOnWriteArraySet validClasses = new CopyOnWriteArraySet();

            static {
                WeakSetValidator weakSetValidator = new WeakSetValidator();
                INSTANCE = weakSetValidator;
                $VALUES = new WeakSetValidator[]{weakSetValidator};
            }

            public static WeakSetValidator valueOf(String name) {
                return (WeakSetValidator) Enum.valueOf(WeakSetValidator.class, name);
            }

            public static WeakSetValidator[] values() {
                return (WeakSetValidator[]) $VALUES.clone();
            }

            @Override // com.google.common.util.concurrent.FuturesGetChecked.GetCheckedTypeValidator
            public final void validateClass(Class<? extends Exception> exceptionClass) {
                Iterator it = validClasses.iterator();
                while (it.hasNext()) {
                    if (exceptionClass.equals(((WeakReference) it.next()).get())) {
                        return;
                    }
                }
                FuturesGetChecked.checkExceptionClassValidity(exceptionClass);
                CopyOnWriteArraySet copyOnWriteArraySet = validClasses;
                if (copyOnWriteArraySet.size() > 1000) {
                    copyOnWriteArraySet.clear();
                }
                copyOnWriteArraySet.add(new WeakReference(exceptionClass));
            }
        }

        /* JADX WARN: Multi-variable type inference failed */
        static {
            GetCheckedTypeValidator getCheckedTypeValidator;
            try {
                getCheckedTypeValidator = (GetCheckedTypeValidator) Class.forName(GetCheckedTypeValidatorHolder.class.getName().concat("$ClassValueValidator")).getEnumConstants()[0];
            } catch (Throwable unused) {
                getCheckedTypeValidator = FuturesGetChecked.weakSetValidator();
            }
            BEST_VALIDATOR = getCheckedTypeValidator;
        }
    }

    public static boolean isCheckedException(Class<? extends Exception> type) {
        return !RuntimeException.class.isAssignableFrom(type);
    }

    public static void checkExceptionClassValidity(Class<? extends Exception> exceptionClass) {
        boolean z;
        Preconditions.checkArgument(isCheckedException(exceptionClass), "Futures.getChecked exception type (%s) must not be a RuntimeException", exceptionClass);
        try {
            newWithCause(exceptionClass, new Exception());
            z = true;
        } catch (Exception unused) {
            z = false;
        }
        Preconditions.checkArgument(z, "Futures.getChecked exception type (%s) must be an accessible class with an accessible constructor whose parameters (if any) must be of type String and/or Throwable", exceptionClass);
    }

    public static <V, X extends Exception> V getChecked(GetCheckedTypeValidator validator, Future<V> future, Class<X> exceptionClass) throws Exception {
        validator.validateClass(exceptionClass);
        try {
            return future.get();
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            throw newWithCause(exceptionClass, e);
        } catch (ExecutionException e2) {
            Throwable cause = e2.getCause();
            if (cause instanceof Error) {
                throw new ExecutionError((Error) cause);
            } else if (cause instanceof RuntimeException) {
                throw new UncheckedExecutionException(cause);
            } else {
                throw newWithCause(exceptionClass, cause);
            }
        }
    }

    public static <X extends Exception> X newWithCause(Class<X> exceptionClass, Throwable cause) {
        Object obj;
        List asList = Arrays.asList(exceptionClass.getConstructors());
        Ordering<Constructor<?>> ordering = WITH_STRING_PARAM_FIRST;
        ordering.getClass();
        if (!(asList instanceof Collection)) {
            Iterator it = asList.iterator();
            ArrayList arrayList = new ArrayList();
            it.getClass();
            while (it.hasNext()) {
                arrayList.add(it.next());
            }
            asList = arrayList;
        }
        Object[] array = asList.toArray();
        Arrays.sort(array, ordering);
        for (Constructor constructor : Lists.newArrayList(Arrays.asList(array))) {
            Class<?>[] parameterTypes = constructor.getParameterTypes();
            Object[] objArr = new Object[parameterTypes.length];
            int i = 0;
            while (true) {
                obj = null;
                if (i < parameterTypes.length) {
                    Class<?> cls = parameterTypes[i];
                    if (!cls.equals(String.class)) {
                        if (!cls.equals(Throwable.class)) {
                            break;
                        }
                        objArr[i] = cause;
                    } else {
                        objArr[i] = cause.toString();
                    }
                    i++;
                } else {
                    try {
                        obj = constructor.newInstance(objArr);
                        break;
                    } catch (IllegalAccessException | IllegalArgumentException | InstantiationException | InvocationTargetException unused) {
                    }
                }
            }
            X x = (X) obj;
            if (x != null) {
                if (x.getCause() == null) {
                    x.initCause(cause);
                }
                return x;
            }
        }
        String valueOf = String.valueOf(exceptionClass);
        throw new IllegalArgumentException(XMPNode$$ExternalSyntheticOutline0.m(valueOf.length() + 82, "No appropriate constructor for exception of type ", valueOf, " in response to chained exception"), cause);
    }

    public static GetCheckedTypeValidator classValueValidator() {
        return GetCheckedTypeValidatorHolder.ClassValueValidator.INSTANCE;
    }

    public static GetCheckedTypeValidator weakSetValidator() {
        return GetCheckedTypeValidatorHolder.WeakSetValidator.INSTANCE;
    }
}
