package com.google.common.base;

import com.google.common.base.Splitter;
import java.util.Iterator;
import java.util.NoSuchElementException;
/* loaded from: classes.dex */
public abstract class AbstractIterator<T> implements Iterator<T> {
    public String next;
    public State state = State.NOT_READY;

    /* loaded from: classes.dex */
    public enum State {
        READY,
        NOT_READY,
        DONE,
        FAILED
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        boolean z;
        String str;
        int separatorStart;
        State state = this.state;
        State state2 = State.FAILED;
        if (state != state2) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            int ordinal = state.ordinal();
            if (ordinal == 0) {
                return true;
            }
            if (ordinal != 2) {
                State state3 = State.DONE;
                this.state = state2;
                Splitter.SplittingIterator splittingIterator = (Splitter.SplittingIterator) this;
                int i = splittingIterator.offset;
                while (true) {
                    int i2 = splittingIterator.offset;
                    if (i2 == -1) {
                        splittingIterator.state = state3;
                        str = null;
                        break;
                    }
                    separatorStart = splittingIterator.separatorStart(i2);
                    if (separatorStart == -1) {
                        separatorStart = splittingIterator.toSplit.length();
                        splittingIterator.offset = -1;
                    } else {
                        splittingIterator.offset = splittingIterator.separatorEnd(separatorStart);
                    }
                    int i3 = splittingIterator.offset;
                    if (i3 == i) {
                        int i4 = i3 + 1;
                        splittingIterator.offset = i4;
                        if (i4 > splittingIterator.toSplit.length()) {
                            splittingIterator.offset = -1;
                        }
                    } else {
                        while (i < separatorStart && splittingIterator.trimmer.matches(splittingIterator.toSplit.charAt(i))) {
                            i++;
                        }
                        while (separatorStart > i) {
                            int i5 = separatorStart - 1;
                            if (!splittingIterator.trimmer.matches(splittingIterator.toSplit.charAt(i5))) {
                                break;
                            }
                            separatorStart = i5;
                        }
                        if (!splittingIterator.omitEmptyStrings || i != separatorStart) {
                            break;
                        }
                        i = splittingIterator.offset;
                    }
                }
                int i6 = splittingIterator.limit;
                if (i6 == 1) {
                    separatorStart = splittingIterator.toSplit.length();
                    splittingIterator.offset = -1;
                    while (separatorStart > i) {
                        int i7 = separatorStart - 1;
                        if (!splittingIterator.trimmer.matches(splittingIterator.toSplit.charAt(i7))) {
                            break;
                        }
                        separatorStart = i7;
                    }
                } else {
                    splittingIterator.limit = i6 - 1;
                }
                str = splittingIterator.toSplit.subSequence(i, separatorStart).toString();
                this.next = str;
                if (this.state != state3) {
                    this.state = State.READY;
                    return true;
                }
            }
            return false;
        }
        throw new IllegalStateException();
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Iterator
    public final T next() {
        if (hasNext()) {
            this.state = State.NOT_READY;
            T t = (T) this.next;
            this.next = null;
            return t;
        }
        throw new NoSuchElementException();
    }
}
