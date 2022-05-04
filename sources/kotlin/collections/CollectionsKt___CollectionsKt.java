package kotlin.collections;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.ListIterator;
import java.util.NoSuchElementException;
import java.util.RandomAccess;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public class CollectionsKt___CollectionsKt extends CollectionsKt__ReversedViewsKt {
    @NotNull
    public static final <T> List<T> drop(@NotNull Iterable<? extends T> iterable, int i) {
        boolean z = false;
        if (i >= 0) {
            z = true;
        }
        if (!z) {
            throw new IllegalArgumentException(("Requested element count " + i + " is less than zero.").toString());
        } else if (i == 0) {
            return toList(iterable);
        } else {
            Collection collection = (Collection) iterable;
            int size = collection.size() - i;
            if (size <= 0) {
                return EmptyList.INSTANCE;
            }
            if (size == 1) {
                List list = (List) iterable;
                if (!list.isEmpty()) {
                    return CollectionsKt__CollectionsKt.listOf(list.get(list.size() - 1));
                }
                throw new NoSuchElementException("List is empty.");
            }
            ArrayList arrayList = new ArrayList(size);
            if (iterable instanceof RandomAccess) {
                int size2 = collection.size();
                while (i < size2) {
                    arrayList.add(((List) iterable).get(i));
                    i++;
                }
            } else {
                ListIterator listIterator = ((List) iterable).listIterator(i);
                while (listIterator.hasNext()) {
                    arrayList.add(listIterator.next());
                }
            }
            return arrayList;
        }
    }

    public static final <T> T first(@NotNull List<? extends T> first) {
        Intrinsics.checkNotNullParameter(first, "$this$first");
        if (!first.isEmpty()) {
            return first.get(0);
        }
        throw new NoSuchElementException("List is empty.");
    }

    @NotNull
    public static final <T> List<T> reversed(@NotNull Iterable<? extends T> reversed) {
        Intrinsics.checkNotNullParameter(reversed, "$this$reversed");
        if ((reversed instanceof Collection) && ((Collection) reversed).size() <= 1) {
            return toList(reversed);
        }
        List<T> mutableList = toMutableList(reversed);
        Collections.reverse(mutableList);
        return mutableList;
    }

    @NotNull
    public static final <T, C extends Collection<? super T>> C toCollection(@NotNull Iterable<? extends T> iterable, @NotNull C c) {
        for (T t : iterable) {
            c.add(t);
        }
        return c;
    }

    @NotNull
    public static final <T> List<T> toList(@NotNull Iterable<? extends T> toList) {
        Intrinsics.checkNotNullParameter(toList, "$this$toList");
        if (!(toList instanceof Collection)) {
            return CollectionsKt__CollectionsKt.optimizeReadOnlyList(toMutableList(toList));
        }
        Collection collection = (Collection) toList;
        int size = collection.size();
        if (size == 0) {
            return EmptyList.INSTANCE;
        }
        if (size != 1) {
            return toMutableList(collection);
        }
        return CollectionsKt__CollectionsKt.listOf(toList instanceof List ? ((List) toList).get(0) : toList.iterator().next());
    }

    @NotNull
    public static final <T> List<T> toMutableList(@NotNull Iterable<? extends T> iterable) {
        if (iterable instanceof Collection) {
            return toMutableList((Collection) iterable);
        }
        ArrayList arrayList = new ArrayList();
        toCollection(iterable, arrayList);
        return arrayList;
    }

    @NotNull
    public static final <T> List<T> toMutableList(@NotNull Collection<? extends T> toMutableList) {
        Intrinsics.checkNotNullParameter(toMutableList, "$this$toMutableList");
        return new ArrayList(toMutableList);
    }
}
