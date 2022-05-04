package com.adobe.xmp.impl;

import com.adobe.xmp.XMPException;
/* loaded from: classes.dex */
public class ParseState {
    public int pos = 0;
    public String str;

    public ParseState(String str) {
        this.str = str;
    }

    public char ch(int index) {
        if (index < this.str.length()) {
            return this.str.charAt(index);
        }
        return (char) 0;
    }

    public int gatherInt(String errorMsg, int maxValue) throws XMPException {
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

    public boolean hasNext() {
        return this.pos < this.str.length();
    }

    public void skip() {
        this.pos++;
    }

    public char ch() {
        if (this.pos < this.str.length()) {
            return this.str.charAt(this.pos);
        }
        return (char) 0;
    }
}
