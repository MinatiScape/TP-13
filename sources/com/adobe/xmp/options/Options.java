package com.adobe.xmp.options;

import com.adobe.xmp.XMPException;
import com.adobe.xmp.impl.ParseRDF$$ExternalSyntheticOutline0;
import com.adobe.xmp.impl.XMPNode$$ExternalSyntheticOutline0;
/* loaded from: classes.dex */
public abstract class Options {
    public int options;

    public Options() {
        this.options = 0;
    }

    public void assertConsistency(int options) throws XMPException {
    }

    public abstract int getValidOptions();

    public final boolean equals(Object obj) {
        if (this.options == ((Options) obj).options) {
            return true;
        }
        return false;
    }

    public final boolean getOption(int optionBit) {
        if ((this.options & optionBit) != 0) {
            return true;
        }
        return false;
    }

    public final void setOption(int optionBits, boolean value) {
        int i;
        if (value) {
            i = optionBits | this.options;
        } else {
            i = (~optionBits) & this.options;
        }
        this.options = i;
    }

    public final String toString() {
        String valueOf = String.valueOf(Integer.toHexString(this.options));
        if (valueOf.length() != 0) {
            return "0x".concat(valueOf);
        }
        return new String("0x");
    }

    public Options(int options) throws XMPException {
        this.options = 0;
        assertOptionsValid(options);
        assertOptionsValid(options);
        this.options = options;
    }

    public final void assertOptionsValid(int options) throws XMPException {
        int i = (~getValidOptions()) & options;
        if (i == 0) {
            assertConsistency(options);
        } else {
            String hexString = Integer.toHexString(i);
            throw new XMPException(XMPNode$$ExternalSyntheticOutline0.m(ParseRDF$$ExternalSyntheticOutline0.m(hexString, 33), "The option bit(s) 0x", hexString, " are invalid!"), 103);
        }
    }

    public final int hashCode() {
        return this.options;
    }
}
