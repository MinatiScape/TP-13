package kotlin.collections;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.NoSuchElementException;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public class ArraysKt___ArraysKt extends ArraysKt__ArraysKt {
    @NotNull
    public static final <T> List<T> asList(@NotNull T[] asList) {
        Intrinsics.checkNotNullParameter(asList, "$this$asList");
        List<T> asList2 = Arrays.asList(asList);
        Intrinsics.checkNotNullExpressionValue(asList2, "ArraysUtilJVM.asList(this)");
        return asList2;
    }

    public static Object[] copyInto$default(Object[] copyInto, Object[] objArr, int i, int i2, int i3, int i4) {
        if ((i4 & 2) != 0) {
            i = 0;
        }
        if ((i4 & 4) != 0) {
            i2 = 0;
        }
        if ((i4 & 8) != 0) {
            i3 = copyInto.length;
        }
        Intrinsics.checkNotNullParameter(copyInto, "$this$copyInto");
        System.arraycopy(copyInto, i2, objArr, i, i3 - i2);
        return objArr;
    }

    public static final char single(@NotNull char[] cArr) {
        int length = cArr.length;
        if (length == 0) {
            throw new NoSuchElementException("Array is empty.");
        } else if (length == 1) {
            return cArr[0];
        } else {
            throw new IllegalArgumentException("Array has more than one element.");
        }
    }

    @NotNull
    public static final List<Integer> toList(@NotNull int[] iArr) {
        int length = iArr.length;
        if (length == 0) {
            return EmptyList.INSTANCE;
        }
        if (length == 1) {
            return CollectionsKt__CollectionsKt.listOf(Integer.valueOf(iArr[0]));
        }
        ArrayList arrayList = new ArrayList(iArr.length);
        for (int i : iArr) {
            arrayList.add(Integer.valueOf(i));
        }
        return arrayList;
    }
}
