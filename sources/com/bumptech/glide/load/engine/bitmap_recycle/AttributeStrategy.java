package com.bumptech.glide.load.engine.bitmap_recycle;

import android.graphics.Bitmap;
/* loaded from: classes.dex */
public final class AttributeStrategy implements LruPoolStrategy {

    /* loaded from: classes.dex */
    public static class Key implements Poolable {
        public final KeyPool pool;

        public final int hashCode() {
            return 0;
        }

        public final String toString() {
            return AttributeStrategy.getBitmapString(0, 0, null);
        }

        public final boolean equals(Object obj) {
            if (!(obj instanceof Key)) {
                return false;
            }
            ((Key) obj).getClass();
            return true;
        }

        @Override // com.bumptech.glide.load.engine.bitmap_recycle.Poolable
        public final void offer() {
            this.pool.offer(this);
        }

        public Key(KeyPool keyPool) {
            this.pool = keyPool;
        }
    }

    /* loaded from: classes.dex */
    public static class KeyPool extends BaseKeyPool<Key> {
        @Override // com.bumptech.glide.load.engine.bitmap_recycle.BaseKeyPool
        public final Key create() {
            return new Key(this);
        }
    }

    public static String getBitmapString(int i, int i2, Bitmap.Config config) {
        return "[" + i + "x" + i2 + "], " + config;
    }
}
