package kotlin.collections;

import kotlin.jvm.internal.Intrinsics;
/* compiled from: _Arrays.kt */
/* loaded from: classes.dex */
public class ArraysKt___ArraysKt extends ArraysKt__ArraysKt {
    public static void copyInto$default(Object[] objArr, Object[] objArr2, int i, int i2, int i3, int i4) {
        if ((i4 & 2) != 0) {
            i = 0;
        }
        if ((i4 & 4) != 0) {
            i2 = 0;
        }
        if ((i4 & 8) != 0) {
            i3 = objArr.length;
        }
        Intrinsics.checkNotNullParameter(objArr, "<this>");
        System.arraycopy(objArr, i2, objArr2, i, i3 - i2);
    }
}
