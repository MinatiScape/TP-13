package com.bumptech.glide.load.engine.bitmap_recycle;
/* loaded from: classes.dex */
public interface ArrayPool {
    void clearMemory();

    <T> T get(int size, Class<T> arrayClass);

    <T> T getExact(int size, Class<T> arrayClass);

    <T> void put(T array);

    void trimMemory(int level);
}
