package com.google.android.gms.dynamic;

import android.os.IBinder;
import androidx.cardview.R$style$$ExternalSyntheticOutline0;
import com.google.android.gms.dynamic.IObjectWrapper;
import java.lang.reflect.Field;
/* compiled from: ObjectWrapper.java */
/* loaded from: classes.dex */
public final class zzn<T> extends IObjectWrapper.zza {
    private final T zza;

    public static zzn zza(Object obj) {
        return new zzn(obj);
    }

    public static <T> T zza(IObjectWrapper iObjectWrapper) {
        if (iObjectWrapper instanceof zzn) {
            return ((zzn) iObjectWrapper).zza;
        }
        IBinder asBinder = iObjectWrapper.asBinder();
        Field[] declaredFields = asBinder.getClass().getDeclaredFields();
        Field field = null;
        int i = 0;
        for (Field field2 : declaredFields) {
            if (!field2.isSynthetic()) {
                i++;
                field = field2;
            }
        }
        if (i != 1) {
            throw new IllegalArgumentException(R$style$$ExternalSyntheticOutline0.m(64, "Unexpected number of IObjectWrapper declared fields: ", declaredFields.length));
        } else if (!field.isAccessible()) {
            field.setAccessible(true);
            try {
                return (T) field.get(asBinder);
            } catch (IllegalAccessException e) {
                throw new IllegalArgumentException("Could not access the field in remoteBinder.", e);
            } catch (NullPointerException e2) {
                throw new IllegalArgumentException("Binder object is null.", e2);
            }
        } else {
            throw new IllegalArgumentException("IObjectWrapper declared field not private!");
        }
    }

    private zzn(T t) {
        this.zza = t;
    }
}
