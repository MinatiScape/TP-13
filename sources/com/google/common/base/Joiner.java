package com.google.common.base;

import java.io.IOException;
import java.util.AbstractList;
import java.util.Iterator;
import java.util.Objects;
/* loaded from: classes.dex */
public class Joiner {
    public final String separator;

    public Joiner(String separator) {
        Objects.requireNonNull(separator);
        this.separator = separator;
    }

    public <A extends Appendable> A appendTo(A appendable, Iterator<?> parts) throws IOException {
        Objects.requireNonNull(appendable);
        if (parts.hasNext()) {
            Object next = parts.next();
            Objects.requireNonNull(next);
            appendable.append(next instanceof CharSequence ? (CharSequence) next : next.toString());
            while (parts.hasNext()) {
                appendable.append(this.separator);
                Object next2 = parts.next();
                Objects.requireNonNull(next2);
                appendable.append(next2 instanceof CharSequence ? (CharSequence) next2 : next2.toString());
            }
        }
        return appendable;
    }

    public final String join(Iterable<?> parts) {
        Iterator<?> it = parts.iterator();
        StringBuilder sb = new StringBuilder();
        try {
            appendTo(sb, it);
            return sb.toString();
        } catch (IOException e) {
            throw new AssertionError(e);
        }
    }

    public final String join(final Object first, final Object second, final Object... rest) {
        return join(new AbstractList<Object>() { // from class: com.google.common.base.Joiner.3
            @Override // java.util.AbstractList, java.util.List
            public Object get(int index) {
                if (index == 0) {
                    return first;
                }
                if (index != 1) {
                    return rest[index - 2];
                }
                return second;
            }

            @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
            public int size() {
                return rest.length + 2;
            }
        });
    }
}
