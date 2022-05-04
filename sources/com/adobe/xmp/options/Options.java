package com.adobe.xmp.options;

import androidx.viewpager2.widget.FakeDrag$$ExternalSyntheticOutline0;
import com.adobe.xmp.XMPException;
import com.adobe.xmp.XMPPathFactory$$ExternalSyntheticOutline0;
/* loaded from: classes.dex */
public abstract class Options {
    public int options;

    public Options() {
        this.options = 0;
    }

    public void assertConsistency(int options) throws XMPException {
    }

    public final void assertOptionsValid(int options) throws XMPException {
        int i = (~getValidOptions()) & options;
        if (i == 0) {
            assertConsistency(options);
        } else {
            String hexString = Integer.toHexString(i);
            throw new XMPException(FakeDrag$$ExternalSyntheticOutline0.m(XMPPathFactory$$ExternalSyntheticOutline0.m(hexString, 33), "The option bit(s) 0x", hexString, " are invalid!"), 103);
        }
    }

    public boolean equals(Object obj) {
        return this.options == ((Options) obj).options;
    }

    public boolean getOption(int optionBit) {
        return (this.options & optionBit) != 0;
    }

    public abstract int getValidOptions();

    public int hashCode() {
        return this.options;
    }

    public void setOption(int optionBits, boolean value) {
        int i;
        if (value) {
            i = optionBits | this.options;
        } else {
            i = (~optionBits) & this.options;
        }
        this.options = i;
    }

    public String toString() {
        String valueOf = String.valueOf(Integer.toHexString(this.options));
        return valueOf.length() != 0 ? "0x".concat(valueOf) : new String("0x");
    }

    public Options(int options) throws XMPException {
        this.options = 0;
        assertOptionsValid(options);
        assertOptionsValid(options);
        this.options = options;
    }
}
