package com.bumptech.glide.load.engine.bitmap_recycle;

import android.util.Log;
import com.android.systemui.shared.system.QuickStepContract;
import java.util.HashMap;
import java.util.Map;
import java.util.NavigableMap;
import java.util.Objects;
import java.util.TreeMap;
/* loaded from: classes.dex */
public final class LruArrayPool implements ArrayPool {
    public static final int MAX_OVER_SIZE_MULTIPLE = 8;
    public final Map<Class<?>, ArrayAdapterInterface<?>> adapters;
    public int currentSize;
    public final GroupedLinkedMap<Key, Object> groupedMap;
    public final KeyPool keyPool;
    public final int maxSize;
    public final Map<Class<?>, NavigableMap<Integer, Integer>> sortedSizes;

    /* loaded from: classes.dex */
    public static final class Key implements Poolable {
        public Class<?> arrayClass;
        public final KeyPool pool;
        public int size;

        public Key(KeyPool pool) {
            this.pool = pool;
        }

        public boolean equals(Object o) {
            if (!(o instanceof Key)) {
                return false;
            }
            Key key = (Key) o;
            return this.size == key.size && this.arrayClass == key.arrayClass;
        }

        public int hashCode() {
            int i = this.size * 31;
            Class<?> cls = this.arrayClass;
            return i + (cls != null ? cls.hashCode() : 0);
        }

        @Override // com.bumptech.glide.load.engine.bitmap_recycle.Poolable
        public void offer() {
            this.pool.offer(this);
        }

        public String toString() {
            int i = this.size;
            String valueOf = String.valueOf(this.arrayClass);
            StringBuilder sb = new StringBuilder(valueOf.length() + 27);
            sb.append("Key{size=");
            sb.append(i);
            sb.append("array=");
            sb.append(valueOf);
            sb.append('}');
            return sb.toString();
        }
    }

    /* loaded from: classes.dex */
    public static final class KeyPool extends BaseKeyPool<Key> {
        @Override // com.bumptech.glide.load.engine.bitmap_recycle.BaseKeyPool
        public Key create() {
            return new Key(this);
        }

        public Key get(int size, Class<?> arrayClass) {
            Key key = get();
            key.size = size;
            key.arrayClass = arrayClass;
            return key;
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
    public synchronized void clearMemory() {
        evictToSize(0);
    }

    public final void decrementArrayOfSize(int size, Class<?> arrayClass) {
        NavigableMap<Integer, Integer> sizesForAdapter = getSizesForAdapter(arrayClass);
        Integer num = (Integer) sizesForAdapter.get(Integer.valueOf(size));
        if (num == null) {
            String valueOf = String.valueOf(this);
            StringBuilder sb = new StringBuilder(valueOf.length() + 56);
            sb.append("Tried to decrement empty size, size: ");
            sb.append(size);
            sb.append(", this: ");
            sb.append(valueOf);
            throw new NullPointerException(sb.toString());
        } else if (num.intValue() == 1) {
            sizesForAdapter.remove(Integer.valueOf(size));
        } else {
            sizesForAdapter.put(Integer.valueOf(size), Integer.valueOf(num.intValue() - 1));
        }
    }

    public final void evictToSize(int size) {
        while (this.currentSize > size) {
            Object removeLast = this.groupedMap.removeLast();
            Objects.requireNonNull(removeLast, "Argument must not be null");
            ArrayAdapterInterface adapterFromType = getAdapterFromType(removeLast.getClass());
            this.currentSize -= adapterFromType.getElementSizeInBytes() * adapterFromType.getArrayLength(removeLast);
            decrementArrayOfSize(adapterFromType.getArrayLength(removeLast), removeLast.getClass());
            if (Log.isLoggable(adapterFromType.getTag(), 2)) {
                String tag = adapterFromType.getTag();
                int arrayLength = adapterFromType.getArrayLength(removeLast);
                StringBuilder sb = new StringBuilder(20);
                sb.append("evicted: ");
                sb.append(arrayLength);
                Log.v(tag, sb.toString());
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0023 A[Catch: all -> 0x004d, TryCatch #0 {, blocks: (B:3:0x0001, B:5:0x0013, B:7:0x0017, B:13:0x0023, B:18:0x002f, B:19:0x003a, B:20:0x0047), top: B:25:0x0001 }] */
    /* JADX WARN: Removed duplicated region for block: B:18:0x002f A[Catch: all -> 0x004d, TryCatch #0 {, blocks: (B:3:0x0001, B:5:0x0013, B:7:0x0017, B:13:0x0023, B:18:0x002f, B:19:0x003a, B:20:0x0047), top: B:25:0x0001 }] */
    /* JADX WARN: Removed duplicated region for block: B:19:0x003a A[Catch: all -> 0x004d, TryCatch #0 {, blocks: (B:3:0x0001, B:5:0x0013, B:7:0x0017, B:13:0x0023, B:18:0x002f, B:19:0x003a, B:20:0x0047), top: B:25:0x0001 }] */
    @Override // com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public synchronized <T> T get(int r6, java.lang.Class<T> r7) {
        /*
            r5 = this;
            monitor-enter(r5)
            java.util.NavigableMap r0 = r5.getSizesForAdapter(r7)     // Catch: java.lang.Throwable -> L4d
            java.lang.Integer r1 = java.lang.Integer.valueOf(r6)     // Catch: java.lang.Throwable -> L4d
            java.lang.Object r0 = r0.ceilingKey(r1)     // Catch: java.lang.Throwable -> L4d
            java.lang.Integer r0 = (java.lang.Integer) r0     // Catch: java.lang.Throwable -> L4d
            r1 = 1
            r2 = 0
            if (r0 == 0) goto L2c
            int r3 = r5.currentSize     // Catch: java.lang.Throwable -> L4d
            if (r3 == 0) goto L20
            int r4 = r5.maxSize     // Catch: java.lang.Throwable -> L4d
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
            int r3 = r0.intValue()     // Catch: java.lang.Throwable -> L4d
            int r4 = r6 * 8
            if (r3 > r4) goto L2c
            goto L2d
        L2c:
            r1 = r2
        L2d:
            if (r1 == 0) goto L3a
            com.bumptech.glide.load.engine.bitmap_recycle.LruArrayPool$KeyPool r6 = r5.keyPool     // Catch: java.lang.Throwable -> L4d
            int r0 = r0.intValue()     // Catch: java.lang.Throwable -> L4d
            com.bumptech.glide.load.engine.bitmap_recycle.LruArrayPool$Key r6 = r6.get(r0, r7)     // Catch: java.lang.Throwable -> L4d
            goto L47
        L3a:
            com.bumptech.glide.load.engine.bitmap_recycle.LruArrayPool$KeyPool r0 = r5.keyPool     // Catch: java.lang.Throwable -> L4d
            com.bumptech.glide.load.engine.bitmap_recycle.Poolable r0 = r0.get()     // Catch: java.lang.Throwable -> L4d
            com.bumptech.glide.load.engine.bitmap_recycle.LruArrayPool$Key r0 = (com.bumptech.glide.load.engine.bitmap_recycle.LruArrayPool.Key) r0     // Catch: java.lang.Throwable -> L4d
            r0.size = r6     // Catch: java.lang.Throwable -> L4d
            r0.arrayClass = r7     // Catch: java.lang.Throwable -> L4d
            r6 = r0
        L47:
            java.lang.Object r6 = r5.getForKey(r6, r7)     // Catch: java.lang.Throwable -> L4d
            monitor-exit(r5)
            return r6
        L4d:
            r6 = move-exception
            monitor-exit(r5)
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bumptech.glide.load.engine.bitmap_recycle.LruArrayPool.get(int, java.lang.Class):java.lang.Object");
    }

    public final <T> ArrayAdapterInterface<T> getAdapterFromType(Class<T> arrayPoolClass) {
        ByteArrayAdapter byteArrayAdapter = (ArrayAdapterInterface<T>) this.adapters.get(arrayPoolClass);
        if (byteArrayAdapter == null) {
            if (arrayPoolClass.equals(int[].class)) {
                byteArrayAdapter = new IntegerArrayAdapter();
            } else if (arrayPoolClass.equals(byte[].class)) {
                byteArrayAdapter = new ByteArrayAdapter();
            } else {
                String simpleName = arrayPoolClass.getSimpleName();
                throw new IllegalArgumentException(simpleName.length() != 0 ? "No array pool found for: ".concat(simpleName) : new String("No array pool found for: "));
            }
            this.adapters.put(arrayPoolClass, byteArrayAdapter);
        }
        return byteArrayAdapter;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool
    public synchronized <T> T getExact(int size, Class<T> arrayClass) {
        Key key;
        key = this.keyPool.get();
        key.size = size;
        key.arrayClass = arrayClass;
        return (T) getForKey(key, arrayClass);
    }

    public final <T> T getForKey(Key key, Class<T> arrayClass) {
        ArrayAdapterInterface<T> adapterFromType = getAdapterFromType(arrayClass);
        T t = (T) this.groupedMap.get(key);
        if (t != null) {
            this.currentSize -= adapterFromType.getElementSizeInBytes() * adapterFromType.getArrayLength(t);
            decrementArrayOfSize(adapterFromType.getArrayLength(t), arrayClass);
        }
        if (t != null) {
            return t;
        }
        if (Log.isLoggable(adapterFromType.getTag(), 2)) {
            String tag = adapterFromType.getTag();
            int i = key.size;
            StringBuilder sb = new StringBuilder(27);
            sb.append("Allocated ");
            sb.append(i);
            sb.append(" bytes");
            Log.v(tag, sb.toString());
        }
        return adapterFromType.newArray(key.size);
    }

    public final NavigableMap<Integer, Integer> getSizesForAdapter(Class<?> arrayClass) {
        NavigableMap<Integer, Integer> navigableMap = this.sortedSizes.get(arrayClass);
        if (navigableMap != null) {
            return navigableMap;
        }
        TreeMap treeMap = new TreeMap();
        this.sortedSizes.put(arrayClass, treeMap);
        return treeMap;
    }

    @Override // com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool
    public synchronized <T> void put(T array) {
        Class<?> cls = array.getClass();
        ArrayAdapterInterface<T> adapterFromType = getAdapterFromType(cls);
        int arrayLength = adapterFromType.getArrayLength(array);
        int elementSizeInBytes = adapterFromType.getElementSizeInBytes() * arrayLength;
        int i = 1;
        if (elementSizeInBytes <= this.maxSize / 2) {
            Key key = this.keyPool.get(arrayLength, cls);
            this.groupedMap.put(key, array);
            NavigableMap<Integer, Integer> sizesForAdapter = getSizesForAdapter(cls);
            Integer num = (Integer) sizesForAdapter.get(Integer.valueOf(key.size));
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
    public synchronized void trimMemory(int level) {
        if (level >= 40) {
            synchronized (this) {
                evictToSize(0);
            }
        } else if (level >= 20 || level == 15) {
            evictToSize(this.maxSize / 2);
        }
    }

    public LruArrayPool(int maxSize) {
        this.groupedMap = new GroupedLinkedMap<>();
        this.keyPool = new KeyPool();
        this.sortedSizes = new HashMap();
        this.adapters = new HashMap();
        this.maxSize = maxSize;
    }
}
