package com.google.common.base;

import java.io.IOException;
import java.util.AbstractList;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes.dex */
public final class Joiner {
    public final String separator;

    /* renamed from: com.google.common.base.Joiner$3  reason: invalid class name */
    /* loaded from: classes.dex */
    public final class AnonymousClass3 extends AbstractList<Object> {
        public final /* synthetic */ Object val$first;
        public final /* synthetic */ Object[] val$rest;
        public final /* synthetic */ Object val$second;

        public AnonymousClass3(final Object[] val$rest, final String val$first, final Object val$second) {
            this.val$rest = val$rest;
            this.val$first = val$first;
            this.val$second = val$second;
        }

        @Override // java.util.AbstractList, java.util.List
        public final Object get(int index) {
            if (index == 0) {
                return this.val$first;
            }
            if (index != 1) {
                return this.val$rest[index - 2];
            }
            return this.val$second;
        }

        @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
        public final int size() {
            return this.val$rest.length + 2;
        }
    }

    public Joiner(String separator) {
        this.separator = separator;
    }

    public final void appendTo(StringBuilder builder, Iterator parts) {
        CharSequence charSequence;
        CharSequence charSequence2;
        try {
            if (parts.hasNext()) {
                Object next = parts.next();
                next.getClass();
                if (next instanceof CharSequence) {
                    charSequence = (CharSequence) next;
                } else {
                    charSequence = next.toString();
                }
                builder.append(charSequence);
                while (parts.hasNext()) {
                    builder.append((CharSequence) this.separator);
                    Object next2 = parts.next();
                    next2.getClass();
                    if (next2 instanceof CharSequence) {
                        charSequence2 = (CharSequence) next2;
                    } else {
                        charSequence2 = next2.toString();
                    }
                    builder.append(charSequence2);
                }
            }
        } catch (IOException e) {
            throw new AssertionError(e);
        }
    }

    public final String join(List parts) {
        Iterator it = parts.iterator();
        StringBuilder sb = new StringBuilder();
        appendTo(sb, it);
        return sb.toString();
    }
}
