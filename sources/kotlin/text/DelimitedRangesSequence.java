package kotlin.text;

import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.Objects;
import kotlin.Pair;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntRange;
import kotlin.ranges.RangesKt___RangesKt;
import kotlin.sequences.Sequence;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* loaded from: classes.dex */
public final class DelimitedRangesSequence implements Sequence<IntRange> {
    public final Function2<CharSequence, Integer, Pair<Integer, Integer>> getNextMatch;
    public final CharSequence input;
    public final int limit;
    public final int startIndex;

    /* JADX WARN: Multi-variable type inference failed */
    public DelimitedRangesSequence(@NotNull CharSequence input, int i, int i2, @NotNull Function2<? super CharSequence, ? super Integer, Pair<Integer, Integer>> function2) {
        Intrinsics.checkNotNullParameter(input, "input");
        this.input = input;
        this.startIndex = i;
        this.limit = i2;
        this.getNextMatch = function2;
    }

    @Override // kotlin.sequences.Sequence
    @NotNull
    public Iterator<IntRange> iterator() {
        return new Iterator<IntRange>() { // from class: kotlin.text.DelimitedRangesSequence$iterator$1
            public int counter;
            public int currentStartIndex;
            @Nullable
            public IntRange nextItem;
            public int nextSearchIndex;
            public int nextState = -1;

            {
                int coerceIn = RangesKt___RangesKt.coerceIn(DelimitedRangesSequence.this.startIndex, 0, DelimitedRangesSequence.this.input.length());
                this.currentStartIndex = coerceIn;
                this.nextSearchIndex = coerceIn;
            }

            /* JADX WARN: Code restructure failed: missing block: B:8:0x0019, code lost:
                if (r6 < r3) goto L9;
             */
            /*
                Code decompiled incorrectly, please refer to instructions dump.
                To view partially-correct add '--show-bad-code' argument
            */
            public final void calcNext() {
                /*
                    r7 = this;
                    int r0 = r7.nextSearchIndex
                    r1 = 0
                    if (r0 >= 0) goto Lc
                    r7.nextState = r1
                    r0 = 0
                    r7.nextItem = r0
                    goto L93
                Lc:
                    kotlin.text.DelimitedRangesSequence r2 = kotlin.text.DelimitedRangesSequence.this
                    int r3 = r2.limit
                    r4 = 1
                    r5 = -1
                    if (r3 <= 0) goto L1b
                    int r6 = r7.counter
                    int r6 = r6 + r4
                    r7.counter = r6
                    if (r6 >= r3) goto L23
                L1b:
                    java.lang.CharSequence r2 = r2.input
                    int r2 = r2.length()
                    if (r0 <= r2) goto L37
                L23:
                    int r0 = r7.currentStartIndex
                    kotlin.ranges.IntRange r1 = new kotlin.ranges.IntRange
                    kotlin.text.DelimitedRangesSequence r2 = kotlin.text.DelimitedRangesSequence.this
                    java.lang.CharSequence r2 = r2.input
                    int r2 = kotlin.text.StringsKt__StringsKt.getLastIndex(r2)
                    r1.<init>(r0, r2)
                    r7.nextItem = r1
                    r7.nextSearchIndex = r5
                    goto L91
                L37:
                    kotlin.text.DelimitedRangesSequence r0 = kotlin.text.DelimitedRangesSequence.this
                    kotlin.jvm.functions.Function2<java.lang.CharSequence, java.lang.Integer, kotlin.Pair<java.lang.Integer, java.lang.Integer>> r2 = r0.getNextMatch
                    java.lang.CharSequence r0 = r0.input
                    int r3 = r7.nextSearchIndex
                    java.lang.Integer r3 = java.lang.Integer.valueOf(r3)
                    java.lang.Object r0 = r2.invoke(r0, r3)
                    kotlin.Pair r0 = (kotlin.Pair) r0
                    if (r0 != 0) goto L5f
                    int r0 = r7.currentStartIndex
                    kotlin.ranges.IntRange r1 = new kotlin.ranges.IntRange
                    kotlin.text.DelimitedRangesSequence r2 = kotlin.text.DelimitedRangesSequence.this
                    java.lang.CharSequence r2 = r2.input
                    int r2 = kotlin.text.StringsKt__StringsKt.getLastIndex(r2)
                    r1.<init>(r0, r2)
                    r7.nextItem = r1
                    r7.nextSearchIndex = r5
                    goto L91
                L5f:
                    java.lang.Object r2 = r0.component1()
                    java.lang.Number r2 = (java.lang.Number) r2
                    int r2 = r2.intValue()
                    java.lang.Object r0 = r0.component2()
                    java.lang.Number r0 = (java.lang.Number) r0
                    int r0 = r0.intValue()
                    int r3 = r7.currentStartIndex
                    r5 = -2147483648(0xffffffff80000000, float:-0.0)
                    if (r2 > r5) goto L7e
                    kotlin.ranges.IntRange r3 = kotlin.ranges.IntRange.Companion
                    kotlin.ranges.IntRange r3 = kotlin.ranges.IntRange.EMPTY
                    goto L86
                L7e:
                    kotlin.ranges.IntRange r5 = new kotlin.ranges.IntRange
                    int r6 = r2 + (-1)
                    r5.<init>(r3, r6)
                    r3 = r5
                L86:
                    r7.nextItem = r3
                    int r2 = r2 + r0
                    r7.currentStartIndex = r2
                    if (r0 != 0) goto L8e
                    r1 = r4
                L8e:
                    int r2 = r2 + r1
                    r7.nextSearchIndex = r2
                L91:
                    r7.nextState = r4
                L93:
                    return
                */
                throw new UnsupportedOperationException("Method not decompiled: kotlin.text.DelimitedRangesSequence$iterator$1.calcNext():void");
            }

            @Override // java.util.Iterator
            public boolean hasNext() {
                if (this.nextState == -1) {
                    calcNext();
                }
                return this.nextState == 1;
            }

            @Override // java.util.Iterator
            public IntRange next() {
                if (this.nextState == -1) {
                    calcNext();
                }
                if (this.nextState != 0) {
                    IntRange intRange = this.nextItem;
                    Objects.requireNonNull(intRange, "null cannot be cast to non-null type kotlin.ranges.IntRange");
                    this.nextItem = null;
                    this.nextState = -1;
                    return intRange;
                }
                throw new NoSuchElementException();
            }

            @Override // java.util.Iterator
            public void remove() {
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            }
        };
    }
}
