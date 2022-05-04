package kotlin.collections;

import java.util.AbstractCollection;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.ListIterator;
import java.util.NoSuchElementException;
import java.util.RandomAccess;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: _Collections.kt */
/* loaded from: classes.dex */
public class CollectionsKt___CollectionsKt extends CollectionsKt__ReversedViewsKt {
    @NotNull
    public static final List drop(@NotNull List list, int i) {
        boolean z;
        if (i >= 0) {
            z = true;
        } else {
            z = false;
        }
        if (!z) {
            throw new IllegalArgumentException(("Requested element count " + i + " is less than zero.").toString());
        } else if (i == 0) {
            return toList(list);
        } else {
            int size = list.size() - i;
            if (size <= 0) {
                return EmptyList.INSTANCE;
            }
            if (size != 1) {
                ArrayList arrayList = new ArrayList(size);
                if (list instanceof RandomAccess) {
                    int size2 = list.size();
                    while (i < size2) {
                        arrayList.add(list.get(i));
                        i++;
                    }
                } else {
                    ListIterator listIterator = list.listIterator(i);
                    while (listIterator.hasNext()) {
                        arrayList.add(listIterator.next());
                    }
                }
                return arrayList;
            } else if (!list.isEmpty()) {
                return ArraysUtilJVM.listOf(list.get(list.size() - 1));
            } else {
                throw new NoSuchElementException("List is empty.");
            }
        }
    }

    public static final <T> T first(@NotNull List<? extends T> list) {
        Intrinsics.checkNotNullParameter(list, "<this>");
        if (!list.isEmpty()) {
            return list.get(0);
        }
        throw new NoSuchElementException("List is empty.");
    }

    @NotNull
    public static final List reversed(@NotNull List list) {
        Intrinsics.checkNotNullParameter(list, "<this>");
        if (list.size() <= 1) {
            return toList(list);
        }
        ArrayList arrayList = new ArrayList(list);
        Collections.reverse(arrayList);
        return arrayList;
    }

    @NotNull
    public static final void toCollection(@NotNull Iterable iterable, @NotNull AbstractCollection abstractCollection) {
        Intrinsics.checkNotNullParameter(iterable, "<this>");
        for (Object obj : iterable) {
            abstractCollection.add(obj);
        }
    }

    @NotNull
    public static final <T> List<T> toList(@NotNull Iterable<? extends T> iterable) {
        ArrayList arrayList;
        Object obj;
        Intrinsics.checkNotNullParameter(iterable, "<this>");
        boolean z = iterable instanceof Collection;
        if (z) {
            Collection collection = (Collection) iterable;
            int size = collection.size();
            if (size == 0) {
                return EmptyList.INSTANCE;
            }
            if (size != 1) {
                return new ArrayList(collection);
            }
            if (iterable instanceof List) {
                obj = ((List) iterable).get(0);
            } else {
                obj = iterable.iterator().next();
            }
            return ArraysUtilJVM.listOf(obj);
        }
        if (z) {
            arrayList = new ArrayList((Collection) iterable);
        } else {
            arrayList = new ArrayList();
            toCollection(iterable, arrayList);
        }
        return ArraysUtilJVM.optimizeReadOnlyList(arrayList);
    }
}
