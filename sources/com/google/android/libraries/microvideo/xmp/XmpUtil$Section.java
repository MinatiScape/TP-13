package com.google.android.libraries.microvideo.xmp;

import com.google.common.base.Preconditions;
/* loaded from: classes.dex */
public class XmpUtil$Section {
    public final byte[] data;
    public final int length;
    public final int offset;

    public XmpUtil$Section(byte[] data, int marker, int offset, int length) {
        boolean z = true;
        Preconditions.checkArgument(offset >= 0, "offset must be >= 0");
        Preconditions.checkArgument(length > 0, "length must be > 0");
        Preconditions.checkArgument(length > data.length ? false : z, "length exceeds data length");
        this.data = data;
        this.offset = offset;
        this.length = length;
    }
}
