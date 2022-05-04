package com.google.android.libraries.microvideo.xmp;

import com.google.common.base.Preconditions;
/* loaded from: classes.dex */
public final class XmpUtil$Section {
    public final byte[] data;
    public final int length;
    public final int offset;

    public XmpUtil$Section(byte[] bArr, int i) {
        boolean z;
        boolean z2 = true;
        if (i > 0) {
            z = true;
        } else {
            z = false;
        }
        Preconditions.checkArgument(z, "length must be > 0");
        Preconditions.checkArgument(i > bArr.length ? false : z2, "length exceeds data length");
        this.data = bArr;
        this.offset = 0;
        this.length = i;
    }
}
