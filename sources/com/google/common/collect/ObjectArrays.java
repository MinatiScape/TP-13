package com.google.common.collect;

import androidx.fragment.R$id$$ExternalSyntheticOutline0;
import java.lang.reflect.Array;
import java.util.Iterator;
/* loaded from: classes.dex */
public final class ObjectArrays {
    public static Object checkElementNotNull(Object element, int index) {
        if (element != null) {
            return element;
        }
        throw new NullPointerException(R$id$$ExternalSyntheticOutline0.m(20, "at index ", index));
    }

    public static Object[] fillArray(Iterable<?> elements, Object[] array) {
        Iterator<?> it = elements.iterator();
        int i = 0;
        while (it.hasNext()) {
            i++;
            array[i] = it.next();
        }
        return array;
    }

    public static <T> T[] newArray(T[] reference, int length) {
        return (T[]) ((Object[]) Array.newInstance(reference.getClass().getComponentType(), length));
    }
}
