package com.bumptech.glide.load.engine.bitmap_recycle;
/* loaded from: classes.dex */
class SizeStrategy$KeyPool extends BaseKeyPool<SizeStrategy$Key> {
    /* JADX WARN: Type inference failed for: r0v0, types: [com.bumptech.glide.load.engine.bitmap_recycle.SizeStrategy$Key] */
    @Override // com.bumptech.glide.load.engine.bitmap_recycle.BaseKeyPool
    public final SizeStrategy$Key create() {
        return new Poolable(this) { // from class: com.bumptech.glide.load.engine.bitmap_recycle.SizeStrategy$Key
            public final SizeStrategy$KeyPool pool;

            public final int hashCode() {
                return 0;
            }

            public final String toString() {
                return "[0]";
            }

            public final boolean equals(Object obj) {
                if (!(obj instanceof SizeStrategy$Key)) {
                    return false;
                }
                ((SizeStrategy$Key) obj).getClass();
                return true;
            }

            @Override // com.bumptech.glide.load.engine.bitmap_recycle.Poolable
            public final void offer() {
                this.pool.offer(this);
            }

            {
                this.pool = this;
            }
        };
    }
}
