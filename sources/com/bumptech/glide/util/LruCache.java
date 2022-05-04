package com.bumptech.glide.util;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
/* loaded from: classes.dex */
public class LruCache<T, Y> {
    public final LinkedHashMap cache = new LinkedHashMap(100, 0.75f, true);
    public long currentSize;
    public final long initialMaxSize;
    public long maxSize;

    public final synchronized Y get(T t) {
        Y y;
        Entry entry = (Entry) this.cache.get(t);
        if (entry != null) {
            y = entry.value;
        } else {
            y = null;
        }
        return y;
    }

    public int getSize(Y y) {
        return 1;
    }

    public void onItemEvicted(T t, Y y) {
    }

    public final synchronized Y put(T t, Y y) {
        Entry entry;
        int size = getSize(y);
        long j = size;
        Y y2 = null;
        if (j >= this.maxSize) {
            onItemEvicted(t, y);
            return null;
        }
        if (y != null) {
            this.currentSize += j;
        }
        LinkedHashMap linkedHashMap = this.cache;
        if (y == null) {
            entry = null;
        } else {
            entry = new Entry(y, size);
        }
        Entry entry2 = (Entry) linkedHashMap.put(t, entry);
        if (entry2 != null) {
            this.currentSize -= entry2.size;
            if (!entry2.value.equals(y)) {
                onItemEvicted(t, entry2.value);
            }
        }
        trimToSize(this.maxSize);
        if (entry2 != null) {
            y2 = entry2.value;
        }
        return y2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final synchronized void trimToSize(long j) {
        while (this.currentSize > j) {
            Iterator it = this.cache.entrySet().iterator();
            Map.Entry entry = (Map.Entry) it.next();
            Entry entry2 = (Entry) entry.getValue();
            this.currentSize -= entry2.size;
            Object key = entry.getKey();
            it.remove();
            onItemEvicted(key, entry2.value);
        }
    }

    /* loaded from: classes.dex */
    public static final class Entry<Y> {
        public final int size;
        public final Y value;

        public Entry(Y y, int i) {
            this.value = y;
            this.size = i;
        }
    }

    public LruCache(long j) {
        this.initialMaxSize = j;
        this.maxSize = j;
    }
}
