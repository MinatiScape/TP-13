package com.google.common.collect;

import com.google.common.primitives.Ints;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
/* loaded from: classes.dex */
public final class Lists {
    public static int computeArrayListCapacity(int arraySize) {
        CollectPreconditions.checkNonnegative(arraySize, "arraySize");
        return Ints.saturatedCast(arraySize + 5 + (arraySize / 10));
    }

    public static <E> ArrayList<E> newArrayList(Iterable<? extends E> elements) {
        elements.getClass();
        if (elements instanceof Collection) {
            return new ArrayList<>((Collection) elements);
        }
        Iterator<? extends E> it = elements.iterator();
        ArrayList<E> arrayList = new ArrayList<>();
        it.getClass();
        while (it.hasNext()) {
            arrayList.add(it.next());
        }
        return arrayList;
    }
}
