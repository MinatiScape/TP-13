package com.bumptech.glide.util;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
/* loaded from: classes.dex */
public class LruCache<T, Y> {
    public final Map<T, Y> cache = new LinkedHashMap(100, 0.75f, true);
    public long currentSize;
    public final long initialMaxSize;
    public long maxSize;

    public LruCache(long size) {
        this.initialMaxSize = size;
        this.maxSize = size;
    }

    public synchronized Y get(T key) {
        return this.cache.get(key);
    }

    public int getSize(Y item) {
        return 1;
    }

    public void onItemEvicted(T key, Y item) {
    }

    public synchronized Y put(T key, Y item) {
        long size = getSize(item);
        if (size >= this.maxSize) {
            onItemEvicted(key, item);
            return null;
        }
        if (item != null) {
            this.currentSize += size;
        }
        Y put = this.cache.put(key, item);
        if (put != null) {
            this.currentSize -= getSize(put);
            if (!put.equals(item)) {
                onItemEvicted(key, put);
            }
        }
        trimToSize(this.maxSize);
        return put;
    }

    public synchronized void trimToSize(long size) {
        while (this.currentSize > size) {
            Iterator<Map.Entry<T, Y>> it = this.cache.entrySet().iterator();
            Map.Entry<T, Y> next = it.next();
            Y value = next.getValue();
            this.currentSize -= getSize(value);
            T key = next.getKey();
            it.remove();
            onItemEvicted(key, value);
        }
    }
}
