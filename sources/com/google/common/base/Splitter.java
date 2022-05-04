package com.google.common.base;

import com.google.common.base.CharMatcher;
import java.util.Iterator;
/* loaded from: classes.dex */
public final class Splitter {
    public final int limit;
    public final boolean omitEmptyStrings;
    public final Strategy strategy;
    public final CharMatcher trimmer;

    /* renamed from: com.google.common.base.Splitter$5  reason: invalid class name */
    /* loaded from: classes.dex */
    public final class AnonymousClass5 implements Iterable<String> {
        public final /* synthetic */ CharSequence val$sequence;

        public AnonymousClass5(final CharSequence val$sequence) {
            this.val$sequence = val$sequence;
        }

        @Override // java.lang.Iterable
        public final Iterator<String> iterator() {
            Splitter splitter = Splitter.this;
            return splitter.strategy.iterator(splitter, this.val$sequence);
        }

        public final String toString() {
            Joiner joiner = new Joiner(", ");
            StringBuilder sb = new StringBuilder();
            sb.append('[');
            joiner.appendTo(sb, iterator());
            sb.append(']');
            return sb.toString();
        }
    }

    /* loaded from: classes.dex */
    public interface Strategy {
        Iterator<String> iterator(Splitter splitter, CharSequence toSplit);
    }

    public Splitter(Strategy strategy, boolean omitEmptyStrings, CharMatcher trimmer, int limit) {
        this.strategy = strategy;
        this.omitEmptyStrings = omitEmptyStrings;
        this.trimmer = trimmer;
        this.limit = limit;
    }

    public static Splitter on(final String separator) {
        Preconditions.checkArgument(separator.length() != 0, "The separator may not be the empty string.");
        if (separator.length() == 1) {
            return on(separator.charAt(0));
        }
        return new Splitter(new Strategy() { // from class: com.google.common.base.Splitter.2
            @Override // com.google.common.base.Splitter.Strategy
            public final Iterator iterator(Splitter splitter, CharSequence toSplit) {
                return new SplittingIterator(splitter, toSplit) { // from class: com.google.common.base.Splitter.2.1
                    @Override // com.google.common.base.Splitter.SplittingIterator
                    public final int separatorEnd(int separatorPosition) {
                        return separator.length() + separatorPosition;
                    }

                    /* JADX WARN: Code restructure failed: missing block: B:8:0x0026, code lost:
                        r6 = r6 + 1;
                     */
                    @Override // com.google.common.base.Splitter.SplittingIterator
                    /*
                        Code decompiled incorrectly, please refer to instructions dump.
                        To view partially-correct add '--show-bad-code' argument
                    */
                    public final int separatorStart(int r6) {
                        /*
                            r5 = this;
                            com.google.common.base.Splitter$2 r0 = com.google.common.base.Splitter.AnonymousClass2.this
                            java.lang.String r0 = r1
                            int r0 = r0.length()
                            java.lang.CharSequence r1 = r5.toSplit
                            int r1 = r1.length()
                            int r1 = r1 - r0
                        Lf:
                            if (r6 > r1) goto L2d
                            r2 = 0
                        L12:
                            if (r2 >= r0) goto L2c
                            java.lang.CharSequence r3 = r5.toSplit
                            int r4 = r2 + r6
                            char r3 = r3.charAt(r4)
                            com.google.common.base.Splitter$2 r4 = com.google.common.base.Splitter.AnonymousClass2.this
                            java.lang.String r4 = r1
                            char r4 = r4.charAt(r2)
                            if (r3 == r4) goto L29
                            int r6 = r6 + 1
                            goto Lf
                        L29:
                            int r2 = r2 + 1
                            goto L12
                        L2c:
                            return r6
                        L2d:
                            r5 = -1
                            return r5
                        */
                        throw new UnsupportedOperationException("Method not decompiled: com.google.common.base.Splitter.AnonymousClass2.AnonymousClass1.separatorStart(int):int");
                    }
                };
            }
        });
    }

    /* loaded from: classes.dex */
    public static abstract class SplittingIterator extends AbstractIterator<String> {
        public int limit;
        public int offset = 0;
        public final boolean omitEmptyStrings;
        public final CharSequence toSplit;
        public final CharMatcher trimmer;

        public abstract int separatorEnd(int separatorPosition);

        public abstract int separatorStart(int start);

        public SplittingIterator(Splitter splitter, CharSequence toSplit) {
            this.trimmer = splitter.trimmer;
            this.omitEmptyStrings = splitter.omitEmptyStrings;
            this.limit = splitter.limit;
            this.toSplit = toSplit;
        }
    }

    public static Splitter on(char separator) {
        final CharMatcher.Is is = new CharMatcher.Is(separator);
        return new Splitter(new Strategy() { // from class: com.google.common.base.Splitter.1
            @Override // com.google.common.base.Splitter.Strategy
            public final Iterator iterator(Splitter splitter, final CharSequence toSplit) {
                return new SplittingIterator(splitter, toSplit) { // from class: com.google.common.base.Splitter.1.1
                    @Override // com.google.common.base.Splitter.SplittingIterator
                    public final int separatorEnd(int separatorPosition) {
                        return separatorPosition + 1;
                    }

                    @Override // com.google.common.base.Splitter.SplittingIterator
                    public final int separatorStart(int start) {
                        return is.indexIn(this.toSplit, start);
                    }
                };
            }
        });
    }

    public Splitter(Strategy strategy) {
        this(strategy, false, CharMatcher.None.INSTANCE, Integer.MAX_VALUE);
    }
}
