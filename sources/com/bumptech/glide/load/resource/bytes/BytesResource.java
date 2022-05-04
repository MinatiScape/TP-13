package com.bumptech.glide.load.resource.bytes;

import com.bumptech.glide.load.engine.Resource;
import java.util.Objects;
/* loaded from: classes.dex */
public class BytesResource implements Resource<byte[]> {
    public final byte[] bytes;

    public BytesResource(byte[] bytes) {
        Objects.requireNonNull(bytes, "Argument must not be null");
        this.bytes = bytes;
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public byte[] get() {
        return this.bytes;
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public Class<byte[]> getResourceClass() {
        return byte[].class;
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public int getSize() {
        return this.bytes.length;
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public void recycle() {
    }
}
