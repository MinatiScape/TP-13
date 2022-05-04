package com.adobe.xmp.impl;

import com.adobe.xmp.XMPException;
/* compiled from: ISO8601Converter.java */
/* loaded from: classes.dex */
public final class ParseState {
    public int pos = 0;
    public String str;

    public final char ch(int index) {
        if (index < this.str.length()) {
            return this.str.charAt(index);
        }
        return (char) 0;
    }

    public final int gatherInt(String errorMsg, int maxValue) throws XMPException {
        char ch = ch(this.pos);
        int i = 0;
        boolean z = false;
        while ('0' <= ch && ch <= '9') {
            i = (i * 10) + (ch - '0');
            int i2 = this.pos + 1;
            this.pos = i2;
            ch = ch(i2);
            z = true;
        }
        if (!z) {
            throw new XMPException(errorMsg, 5);
        } else if (i > maxValue) {
            return maxValue;
        } else {
            if (i < 0) {
                return 0;
            }
            return i;
        }
    }

    public final boolean hasNext() {
        if (this.pos < this.str.length()) {
            return true;
        }
        return false;
    }

    public final void skip() {
        this.pos++;
    }

    public ParseState(String str) {
        this.str = str;
    }

    public final char ch() {
        if (this.pos < this.str.length()) {
            return this.str.charAt(this.pos);
        }
        return (char) 0;
    }
}
