package com.bumptech.glide.load.engine.bitmap_recycle;
/* loaded from: classes.dex */
public interface ArrayPool {
    void clearMemory();

    <T> T get(int i, Class<T> cls);

    Object getExact();

    <T> void put(T t);

    void trimMemory(int i);
}
