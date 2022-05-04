package com.bumptech.glide.load.engine.bitmap_recycle;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.Log;
import androidx.collection.ContainerHelpers;
import com.android.systemui.shared.system.QuickStepContract;
import java.util.HashMap;
import java.util.NavigableMap;
import java.util.TreeMap;
/* loaded from: classes.dex */
public final class LruArrayPool implements ArrayPool {
    public static final int MAX_OVER_SIZE_MULTIPLE = 8;
    public final HashMap adapters;
    public int currentSize;
    public final GroupedLinkedMap<Key, Object> groupedMap;
    public final KeyPool keyPool;
    public final int maxSize;
    public final HashMap sortedSizes;

    /* loaded from: classes.dex */
    public static final class Key implements Poolable {
        public Class<?> arrayClass;
        public final KeyPool pool;
        public int size;

        public final boolean equals(Object obj) {
            if (!(obj instanceof Key)) {
                return false;
            }
            Key key = (Key) obj;
            if (this.size == key.size && this.arrayClass == key.arrayClass) {
                return true;
            }
            return false;
        }

        public final int hashCode() {
            int i;
            int i2 = this.size * 31;
            Class<?> cls = this.arrayClass;
            if (cls != null) {
                i = cls.hashCode();
            } else {
                i = 0;
            }
            return i2 + i;
        }

        @Override // com.bumptech.glide.load.engine.bitmap_recycle.Poolable
        public final void offer() {
            this.pool.offer(this);
        }

        public final String toString() {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Key{size=");
            m.append(this.size);
            m.append("array=");
            m.append(this.arrayClass);
            m.append('}');
            return m.toString();
        }

        public Key(KeyPool keyPool) {
            this.pool = keyPool;
        }
    }

    /* loaded from: classes.dex */
    public static final class KeyPool extends BaseKeyPool<Key> {
        @Override // com.bumptech.glide.load.engine.bitmap_recycle.BaseKeyPool
        public final Key create() {
            return new Key(this);
        }
    }

    public LruArrayPool() {
        this.groupedMap = new GroupedLinkedMap<>();
        this.keyPool = new KeyPool();
        this.sortedSizes = new HashMap();
        this.adapters = new HashMap();
        this.maxSize = QuickStepContract.SYSUI_STATE_BACK_DISABLED;
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool
    public final synchronized void clearMemory() {
        evictToSize(0);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0023 A[Catch: all -> 0x0053, TryCatch #0 {, blocks: (B:3:0x0001, B:5:0x0013, B:7:0x0017, B:13:0x0023, B:18:0x002f, B:19:0x0040, B:20:0x004d), top: B:25:0x0001 }] */
    /* JADX WARN: Removed duplicated region for block: B:18:0x002f A[Catch: all -> 0x0053, TryCatch #0 {, blocks: (B:3:0x0001, B:5:0x0013, B:7:0x0017, B:13:0x0023, B:18:0x002f, B:19:0x0040, B:20:0x004d), top: B:25:0x0001 }] */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0040 A[Catch: all -> 0x0053, TryCatch #0 {, blocks: (B:3:0x0001, B:5:0x0013, B:7:0x0017, B:13:0x0023, B:18:0x002f, B:19:0x0040, B:20:0x004d), top: B:25:0x0001 }] */
    @Override // com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final synchronized <T> T get(int r6, java.lang.Class<T> r7) {
        /*
            r5 = this;
            monitor-enter(r5)
            java.util.NavigableMap r0 = r5.getSizesForAdapter(r7)     // Catch: java.lang.Throwable -> L53
            java.lang.Integer r1 = java.lang.Integer.valueOf(r6)     // Catch: java.lang.Throwable -> L53
            java.lang.Object r0 = r0.ceilingKey(r1)     // Catch: java.lang.Throwable -> L53
            java.lang.Integer r0 = (java.lang.Integer) r0     // Catch: java.lang.Throwable -> L53
            r1 = 1
            r2 = 0
            if (r0 == 0) goto L2c
            int r3 = r5.currentSize     // Catch: java.lang.Throwable -> L53
            if (r3 == 0) goto L20
            int r4 = r5.maxSize     // Catch: java.lang.Throwable -> L53
            int r4 = r4 / r3
            r3 = 2
            if (r4 < r3) goto L1e
            goto L20
        L1e:
            r3 = r2
            goto L21
        L20:
            r3 = r1
        L21:
            if (r3 != 0) goto L2d
            int r3 = r0.intValue()     // Catch: java.lang.Throwable -> L53
            int r4 = r6 * 8
            if (r3 > r4) goto L2c
            goto L2d
        L2c:
            r1 = r2
        L2d:
            if (r1 == 0) goto L40
            com.bumptech.glide.load.engine.bitmap_recycle.LruArrayPool$KeyPool r6 = r5.keyPool     // Catch: java.lang.Throwable -> L53
            int r0 = r0.intValue()     // Catch: java.lang.Throwable -> L53
            com.bumptech.glide.load.engine.bitmap_recycle.Poolable r6 = r6.get()     // Catch: java.lang.Throwable -> L53
            com.bumptech.glide.load.engine.bitmap_recycle.LruArrayPool$Key r6 = (com.bumptech.glide.load.engine.bitmap_recycle.LruArrayPool.Key) r6     // Catch: java.lang.Throwable -> L53
            r6.size = r0     // Catch: java.lang.Throwable -> L53
            r6.arrayClass = r7     // Catch: java.lang.Throwable -> L53
            goto L4d
        L40:
            com.bumptech.glide.load.engine.bitmap_recycle.LruArrayPool$KeyPool r0 = r5.keyPool     // Catch: java.lang.Throwable -> L53
            com.bumptech.glide.load.engine.bitmap_recycle.Poolable r0 = r0.get()     // Catch: java.lang.Throwable -> L53
            com.bumptech.glide.load.engine.bitmap_recycle.LruArrayPool$Key r0 = (com.bumptech.glide.load.engine.bitmap_recycle.LruArrayPool.Key) r0     // Catch: java.lang.Throwable -> L53
            r0.size = r6     // Catch: java.lang.Throwable -> L53
            r0.arrayClass = r7     // Catch: java.lang.Throwable -> L53
            r6 = r0
        L4d:
            java.lang.Object r6 = r5.getForKey(r6, r7)     // Catch: java.lang.Throwable -> L53
            monitor-exit(r5)
            return r6
        L53:
            r6 = move-exception
            monitor-exit(r5)
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bumptech.glide.load.engine.bitmap_recycle.LruArrayPool.get(int, java.lang.Class):java.lang.Object");
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool
    public final synchronized <T> void put(T t) {
        boolean z;
        Class<?> cls = t.getClass();
        ArrayAdapterInterface<T> adapterFromType = getAdapterFromType(cls);
        int arrayLength = adapterFromType.getArrayLength(t);
        int elementSizeInBytes = adapterFromType.getElementSizeInBytes() * arrayLength;
        int i = 1;
        if (elementSizeInBytes <= this.maxSize / 2) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            Key key = this.keyPool.get();
            key.size = arrayLength;
            key.arrayClass = cls;
            this.groupedMap.put(key, t);
            NavigableMap<Integer, Integer> sizesForAdapter = getSizesForAdapter(cls);
            Integer num = sizesForAdapter.get(Integer.valueOf(key.size));
            Integer valueOf = Integer.valueOf(key.size);
            if (num != null) {
                i = 1 + num.intValue();
            }
            sizesForAdapter.put(valueOf, Integer.valueOf(i));
            this.currentSize += elementSizeInBytes;
            evictToSize(this.maxSize);
        }
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool
    public final synchronized void trimMemory(int i) {
        try {
            if (i >= 40) {
                clearMemory();
            } else if (i >= 20 || i == 15) {
                evictToSize(this.maxSize / 2);
            }
        } catch (Throwable th) {
            throw th;
        }
    }

    public final void evictToSize(int i) {
        while (this.currentSize > i) {
            Object removeLast = this.groupedMap.removeLast();
            ContainerHelpers.checkNotNull(removeLast);
            ArrayAdapterInterface adapterFromType = getAdapterFromType(removeLast.getClass());
            this.currentSize -= adapterFromType.getElementSizeInBytes() * adapterFromType.getArrayLength(removeLast);
            decrementArrayOfSize(adapterFromType.getArrayLength(removeLast), removeLast.getClass());
            if (Log.isLoggable(adapterFromType.getTag(), 2)) {
                String tag = adapterFromType.getTag();
                StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("evicted: ");
                m.append(adapterFromType.getArrayLength(removeLast));
                Log.v(tag, m.toString());
            }
        }
    }

    public final <T> ArrayAdapterInterface<T> getAdapterFromType(Class<T> cls) {
        ArrayAdapterInterface<T> arrayAdapterInterface = (ArrayAdapterInterface) this.adapters.get(cls);
        if (arrayAdapterInterface == null) {
            if (cls.equals(int[].class)) {
                arrayAdapterInterface = new IntegerArrayAdapter();
            } else if (cls.equals(byte[].class)) {
                arrayAdapterInterface = new ByteArrayAdapter();
            } else {
                StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("No array pool found for: ");
                m.append(cls.getSimpleName());
                throw new IllegalArgumentException(m.toString());
            }
            this.adapters.put(cls, arrayAdapterInterface);
        }
        return arrayAdapterInterface;
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool
    public final synchronized Object getExact() {
        Key key;
        key = this.keyPool.get();
        key.size = 8;
        key.arrayClass = byte[].class;
        return getForKey(key, byte[].class);
    }

    public final NavigableMap<Integer, Integer> getSizesForAdapter(Class<?> cls) {
        NavigableMap<Integer, Integer> navigableMap = (NavigableMap) this.sortedSizes.get(cls);
        if (navigableMap != null) {
            return navigableMap;
        }
        TreeMap treeMap = new TreeMap();
        this.sortedSizes.put(cls, treeMap);
        return treeMap;
    }

    public final void decrementArrayOfSize(int i, Class<?> cls) {
        NavigableMap<Integer, Integer> sizesForAdapter = getSizesForAdapter(cls);
        Integer num = sizesForAdapter.get(Integer.valueOf(i));
        if (num == null) {
            throw new NullPointerException("Tried to decrement empty size, size: " + i + ", this: " + this);
        } else if (num.intValue() == 1) {
            sizesForAdapter.remove(Integer.valueOf(i));
        } else {
            sizesForAdapter.put(Integer.valueOf(i), Integer.valueOf(num.intValue() - 1));
        }
    }

    public final <T> T getForKey(Key key, Class<T> cls) {
        ArrayAdapterInterface<T> adapterFromType = getAdapterFromType(cls);
        T t = (T) this.groupedMap.get(key);
        if (t != null) {
            this.currentSize -= adapterFromType.getElementSizeInBytes() * adapterFromType.getArrayLength(t);
            decrementArrayOfSize(adapterFromType.getArrayLength(t), cls);
        }
        if (t != null) {
            return t;
        }
        if (Log.isLoggable(adapterFromType.getTag(), 2)) {
            String tag = adapterFromType.getTag();
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Allocated ");
            m.append(key.size);
            m.append(" bytes");
            Log.v(tag, m.toString());
        }
        return adapterFromType.newArray(key.size);
    }

    public LruArrayPool(int i) {
        this.groupedMap = new GroupedLinkedMap<>();
        this.keyPool = new KeyPool();
        this.sortedSizes = new HashMap();
        this.adapters = new HashMap();
        this.maxSize = i;
    }
}
