package com.google.common.base;

import androidx.viewpager2.widget.FakeDrag$$ExternalSyntheticOutline0;
import com.adobe.xmp.XMPPathFactory$$ExternalSyntheticOutline0;
/* loaded from: classes.dex */
public abstract class CharMatcher {

    /* loaded from: classes.dex */
    public static abstract class FastMatcher extends CharMatcher {
    }

    /* loaded from: classes.dex */
    public static final class Is extends FastMatcher {
        public final char match;

        public Is(char match) {
            this.match = match;
        }

        @Override // com.google.common.base.CharMatcher
        public boolean matches(char c) {
            return c == this.match;
        }

        public String toString() {
            char c = this.match;
            char[] cArr = {'\\', 'u', 0, 0, 0, 0};
            for (int i = 0; i < 4; i++) {
                cArr[5 - i] = "0123456789ABCDEF".charAt(c & 15);
                c = (char) (c >> 4);
            }
            String copyValueOf = String.copyValueOf(cArr);
            return FakeDrag$$ExternalSyntheticOutline0.m(XMPPathFactory$$ExternalSyntheticOutline0.m(copyValueOf, 18), "CharMatcher.is('", copyValueOf, "')");
        }
    }

    /* loaded from: classes.dex */
    public static abstract class NamedFastMatcher extends FastMatcher {
        public final String description;

        public NamedFastMatcher(String description) {
            this.description = description;
        }

        public final String toString() {
            return this.description;
        }
    }

    /* loaded from: classes.dex */
    public static final class None extends NamedFastMatcher {
        public static final None INSTANCE = new None();

        public None() {
            super("CharMatcher.none()");
        }

        @Override // com.google.common.base.CharMatcher
        public int indexIn(CharSequence sequence, int start) {
            Preconditions.checkPositionIndex(start, sequence.length());
            return -1;
        }

        @Override // com.google.common.base.CharMatcher
        public boolean matches(char c) {
            return false;
        }
    }

    /* loaded from: classes.dex */
    public static final class Whitespace extends NamedFastMatcher {
        public static final int SHIFT = Integer.numberOfLeadingZeros(31);

        static {
            new Whitespace();
        }

        public Whitespace() {
            super("CharMatcher.whitespace()");
        }

        @Override // com.google.common.base.CharMatcher
        public boolean matches(char c) {
            return "\u2002\u3000\r\u0085\u200a\u2005\u2000\u3000\u2029\u000b\u3000\u2008\u2003\u205f\u3000\u1680\t \u2006\u2001  \f\u2009\u3000\u2004\u3000\u3000\u2028\n \u3000".charAt((48906 * c) >>> SHIFT) == c;
        }
    }

    public int indexIn(CharSequence sequence, int start) {
        int length = sequence.length();
        Preconditions.checkPositionIndex(start, length);
        while (start < length) {
            if (matches(sequence.charAt(start))) {
                return start;
            }
            start++;
        }
        return -1;
    }

    public abstract boolean matches(char c);
}
