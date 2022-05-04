package com.google.common.base;

import com.adobe.xmp.impl.ParseRDF$$ExternalSyntheticOutline0;
import com.adobe.xmp.impl.XMPNode$$ExternalSyntheticOutline0;
/* loaded from: classes.dex */
public abstract class CharMatcher {

    /* loaded from: classes.dex */
    public static abstract class FastMatcher extends CharMatcher {
    }

    /* loaded from: classes.dex */
    public static final class Is extends FastMatcher {
        public final char match;

        @Override // com.google.common.base.CharMatcher
        public final boolean matches(char c) {
            if (c == this.match) {
                return true;
            }
            return false;
        }

        @Override // com.google.common.base.CharMatcher
        public final String toString() {
            char c = this.match;
            char[] cArr = {'\\', 'u', 0, 0, 0, 0};
            for (int i = 0; i < 4; i++) {
                cArr[5 - i] = "0123456789ABCDEF".charAt(c & 15);
                c = (char) (c >> 4);
            }
            String copyValueOf = String.copyValueOf(cArr);
            return XMPNode$$ExternalSyntheticOutline0.m(ParseRDF$$ExternalSyntheticOutline0.m(copyValueOf, 18), "CharMatcher.is('", copyValueOf, "')");
        }

        public Is(char match) {
            this.match = match;
        }
    }

    /* loaded from: classes.dex */
    public static final class None extends NamedFastMatcher {
        public static final None INSTANCE = new None();

        @Override // com.google.common.base.CharMatcher
        public final boolean matches(char c) {
            return false;
        }

        public None() {
            super("CharMatcher.none()");
        }

        @Override // com.google.common.base.CharMatcher
        public final int indexIn(CharSequence sequence, int start) {
            Preconditions.checkPositionIndex(start, sequence.length());
            return -1;
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
        public final boolean matches(char c) {
            if ("\u2002\u3000\r\u0085\u200a\u2005\u2000\u3000\u2029\u000b\u3000\u2008\u2003\u205f\u3000\u1680\t \u2006\u2001  \f\u2009\u3000\u2004\u3000\u3000\u2028\n \u3000".charAt((48906 * c) >>> SHIFT) == c) {
                return true;
            }
            return false;
        }
    }

    public abstract boolean matches(char c);

    /* loaded from: classes.dex */
    public static abstract class NamedFastMatcher extends FastMatcher {
        public final String description;

        public NamedFastMatcher(String description) {
            this.description = description;
        }

        @Override // com.google.common.base.CharMatcher
        public final String toString() {
            return this.description;
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

    public String toString() {
        return super.toString();
    }
}
