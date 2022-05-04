package kotlin.ranges;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: Ranges.kt */
/* loaded from: classes.dex */
public final class IntRange extends IntProgression {
    @NotNull
    public static final IntRange EMPTY = new IntRange(1, 0);

    public IntRange(int i, int i2) {
        super(i, i2, 1);
    }

    @Override // kotlin.ranges.IntProgression
    public final boolean equals(@Nullable Object obj) {
        if (obj instanceof IntRange) {
            if (!isEmpty() || !((IntRange) obj).isEmpty()) {
                IntRange intRange = (IntRange) obj;
                if (!(this.first == intRange.first && this.last == intRange.last)) {
                }
            }
            return true;
        }
        return false;
    }

    @Override // kotlin.ranges.IntProgression
    public final boolean isEmpty() {
        if (this.first > this.last) {
            return true;
        }
        return false;
    }

    @Override // kotlin.ranges.IntProgression
    @NotNull
    public final String toString() {
        return this.first + ".." + this.last;
    }

    @Override // kotlin.ranges.IntProgression
    public final int hashCode() {
        if (isEmpty()) {
            return -1;
        }
        return this.last + (this.first * 31);
    }
}
