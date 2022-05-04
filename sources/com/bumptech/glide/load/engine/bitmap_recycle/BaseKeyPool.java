package com.bumptech.glide.load.engine.bitmap_recycle;

import com.bumptech.glide.load.engine.bitmap_recycle.Poolable;
import com.bumptech.glide.util.Util;
import java.util.ArrayDeque;
/* loaded from: classes.dex */
public abstract class BaseKeyPool<T extends Poolable> {
    public final ArrayDeque keyPool = new ArrayDeque(20);

    public abstract T create();

    public final T get() {
        T t = (T) this.keyPool.poll();
        if (t == null) {
            return create();
        }
        return t;
    }

    public final void offer(T t) {
        if (this.keyPool.size() < 20) {
            this.keyPool.offer(t);
        }
    }

    public BaseKeyPool() {
        char[] cArr = Util.HEX_CHAR_ARRAY;
    }
}
