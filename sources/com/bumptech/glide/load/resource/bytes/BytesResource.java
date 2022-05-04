package com.bumptech.glide.load.resource.bytes;

import androidx.collection.ContainerHelpers;
import com.bumptech.glide.load.engine.Resource;
/* loaded from: classes.dex */
public final class BytesResource implements Resource<byte[]> {
    public final byte[] bytes;

    @Override // com.bumptech.glide.load.engine.Resource
    public final void recycle() {
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public final int getSize() {
        return this.bytes.length;
    }

    public BytesResource(byte[] bArr) {
        ContainerHelpers.checkNotNull(bArr);
        this.bytes = bArr;
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public final byte[] get() {
        return this.bytes;
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public final Class<byte[]> getResourceClass() {
        return byte[].class;
    }
}
