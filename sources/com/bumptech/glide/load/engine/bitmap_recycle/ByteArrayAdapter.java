package com.bumptech.glide.load.engine.bitmap_recycle;
/* loaded from: classes.dex */
public final class ByteArrayAdapter implements ArrayAdapterInterface<byte[]> {
    @Override // com.bumptech.glide.load.engine.bitmap_recycle.ArrayAdapterInterface
    public final int getElementSizeInBytes() {
        return 1;
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.ArrayAdapterInterface
    public final String getTag() {
        return "ByteArrayPool";
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.ArrayAdapterInterface
    public final int getArrayLength(byte[] bArr) {
        return bArr.length;
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.ArrayAdapterInterface
    public final byte[] newArray(int i) {
        return new byte[i];
    }
}
