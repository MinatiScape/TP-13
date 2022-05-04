package com.bumptech.glide.load.engine.bitmap_recycle;

import android.graphics.Bitmap;
import android.support.v4.app.FragmentTabHost$SavedState$$ExternalSyntheticOutline0;
import com.bumptech.glide.gifdecoder.GifHeaderParser$$ExternalSyntheticOutline0;
/* loaded from: classes.dex */
public class AttributeStrategy implements LruPoolStrategy {

    /* loaded from: classes.dex */
    public static class Key implements Poolable {
        public Bitmap.Config config;
        public int height;
        public final KeyPool pool;
        public int width;

        public Key(KeyPool pool) {
            this.pool = pool;
        }

        public boolean equals(Object o) {
            if (!(o instanceof Key)) {
                return false;
            }
            Key key = (Key) o;
            return this.width == key.width && this.height == key.height && this.config == key.config;
        }

        public int hashCode() {
            int i = ((this.width * 31) + this.height) * 31;
            Bitmap.Config config = this.config;
            return i + (config != null ? config.hashCode() : 0);
        }

        @Override // com.bumptech.glide.load.engine.bitmap_recycle.Poolable
        public void offer() {
            this.pool.offer(this);
        }

        public String toString() {
            return AttributeStrategy.getBitmapString(this.width, this.height, this.config);
        }
    }

    /* loaded from: classes.dex */
    public static class KeyPool extends BaseKeyPool<Key> {
        @Override // com.bumptech.glide.load.engine.bitmap_recycle.BaseKeyPool
        public Key create() {
            return new Key(this);
        }
    }

    public static String getBitmapString(int width, int height, Bitmap.Config config) {
        String valueOf = String.valueOf(config);
        return FragmentTabHost$SavedState$$ExternalSyntheticOutline0.m(GifHeaderParser$$ExternalSyntheticOutline0.m(valueOf.length() + 27, "[", width, "x", height), "], ", valueOf);
    }
}
