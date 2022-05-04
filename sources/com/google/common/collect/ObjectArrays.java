package com.google.common.collect;

import androidx.cardview.R$style$$ExternalSyntheticOutline0;
/* loaded from: classes.dex */
public final class ObjectArrays {
    public static void checkElementsNotNull(Object[] array, int length) {
        for (int i = 0; i < length; i++) {
            if (array[i] == null) {
                throw new NullPointerException(R$style$$ExternalSyntheticOutline0.m(20, "at index ", i));
            }
        }
    }
}
