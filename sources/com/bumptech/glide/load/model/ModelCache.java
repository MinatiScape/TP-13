package com.bumptech.glide.load.model;

import com.bumptech.glide.util.LruCache;
import com.bumptech.glide.util.Util;
import java.util.ArrayDeque;
/* loaded from: classes.dex */
public final class ModelCache<A, B> {
    public final AnonymousClass1 cache = new LruCache<ModelKey<Object>, Object>() { // from class: com.bumptech.glide.load.model.ModelCache.1
        @Override // com.bumptech.glide.util.LruCache
        public final void onItemEvicted(ModelKey<Object> modelKey, Object obj) {
            ModelKey<Object> modelKey2 = modelKey;
            modelKey2.getClass();
            ArrayDeque arrayDeque = ModelKey.KEY_QUEUE;
            synchronized (arrayDeque) {
                arrayDeque.offer(modelKey2);
            }
        }
    };

    /* loaded from: classes.dex */
    public static final class ModelKey<A> {
        public static final ArrayDeque KEY_QUEUE = new ArrayDeque(0);
        public int height;
        public A model;
        public int width;

        static {
            char[] cArr = Util.HEX_CHAR_ARRAY;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static ModelKey get(Object obj) {
            ModelKey modelKey;
            ArrayDeque arrayDeque = KEY_QUEUE;
            synchronized (arrayDeque) {
                modelKey = (ModelKey) arrayDeque.poll();
            }
            if (modelKey == null) {
                modelKey = new ModelKey();
            }
            modelKey.model = obj;
            modelKey.width = 0;
            modelKey.height = 0;
            return modelKey;
        }

        public final boolean equals(Object obj) {
            if (!(obj instanceof ModelKey)) {
                return false;
            }
            ModelKey modelKey = (ModelKey) obj;
            if (this.width == modelKey.width && this.height == modelKey.height && this.model.equals(modelKey.model)) {
                return true;
            }
            return false;
        }

        public final int hashCode() {
            return this.model.hashCode() + (((this.height * 31) + this.width) * 31);
        }

        private ModelKey() {
        }
    }

    public final Object get(Object obj) {
        ModelKey modelKey = ModelKey.get(obj);
        Object obj2 = get(modelKey);
        ArrayDeque arrayDeque = ModelKey.KEY_QUEUE;
        synchronized (arrayDeque) {
            arrayDeque.offer(modelKey);
        }
        return obj2;
    }

    public final void put(Object obj, Object obj2) {
        put(ModelKey.get(obj), obj2);
    }
}
