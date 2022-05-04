package com.bumptech.glide.load.model;

import com.bumptech.glide.util.LruCache;
import com.bumptech.glide.util.Util;
import java.util.ArrayDeque;
import java.util.Queue;
/* loaded from: classes.dex */
public class ModelCache<A, B> {
    public final LruCache<ModelKey<A>, B> cache;

    /* loaded from: classes.dex */
    public static final class ModelKey<A> {
        public static final Queue<ModelKey<?>> KEY_QUEUE = new ArrayDeque(0);
        public int height;
        public A model;
        public int width;

        static {
            char[] cArr = Util.HEX_CHAR_ARRAY;
        }

        private ModelKey() {
        }

        public static <A> ModelKey<A> get(A model, int width, int height) {
            ModelKey<A> modelKey;
            Queue<ModelKey<?>> queue = KEY_QUEUE;
            synchronized (queue) {
                modelKey = (ModelKey) ((ArrayDeque) queue).poll();
            }
            if (modelKey == null) {
                modelKey = new ModelKey<>();
            }
            modelKey.model = model;
            modelKey.width = width;
            modelKey.height = height;
            return modelKey;
        }

        public boolean equals(Object o) {
            if (!(o instanceof ModelKey)) {
                return false;
            }
            ModelKey modelKey = (ModelKey) o;
            return this.width == modelKey.width && this.height == modelKey.height && this.model.equals(modelKey.model);
        }

        public int hashCode() {
            return this.model.hashCode() + (((this.height * 31) + this.width) * 31);
        }

        public void release() {
            Queue<ModelKey<?>> queue = KEY_QUEUE;
            synchronized (queue) {
                ((ArrayDeque) queue).offer(this);
            }
        }
    }

    public ModelCache(long size) {
        this.cache = new LruCache<ModelKey<A>, B>(size) { // from class: com.bumptech.glide.load.model.ModelCache.1
            @Override // com.bumptech.glide.util.LruCache
            public void onItemEvicted(Object key, Object item) {
                ((ModelKey) key).release();
            }
        };
    }
}
