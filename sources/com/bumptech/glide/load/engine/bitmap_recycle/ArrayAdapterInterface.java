package com.bumptech.glide.load.engine.bitmap_recycle;
/* loaded from: classes.dex */
public interface ArrayAdapterInterface<T> {
    int getArrayLength(T array);

    int getElementSizeInBytes();

    String getTag();

    T newArray(int length);
}
