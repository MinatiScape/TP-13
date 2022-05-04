package com.bumptech.glide.util.pool;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.Log;
import androidx.core.util.Pools$Pool;
import androidx.core.util.Pools$SynchronizedPool;
import com.bumptech.glide.util.pool.StateVerifier;
/* loaded from: classes.dex */
public final class FactoryPools {
    public static final AnonymousClass1 EMPTY_RESETTER = new Resetter<Object>() { // from class: com.bumptech.glide.util.pool.FactoryPools.1
        @Override // com.bumptech.glide.util.pool.FactoryPools.Resetter
        public final void reset(Object obj) {
        }
    };

    /* loaded from: classes.dex */
    public interface Factory<T> {
        T create();
    }

    /* loaded from: classes.dex */
    public static final class FactoryPool<T> implements Pools$Pool<T> {
        public final Factory<T> factory;
        public final Pools$Pool<T> pool;
        public final Resetter<T> resetter;

        @Override // androidx.core.util.Pools$Pool
        public final T acquire() {
            T acquire = this.pool.acquire();
            if (acquire == null) {
                acquire = this.factory.create();
                if (Log.isLoggable("FactoryPools", 2)) {
                    StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Created new ");
                    m.append(acquire.getClass());
                    Log.v("FactoryPools", m.toString());
                }
            }
            if (acquire instanceof Poolable) {
                ((Poolable) acquire).getVerifier().isReleased = false;
            }
            return acquire;
        }

        @Override // androidx.core.util.Pools$Pool
        public final boolean release(T t) {
            if (t instanceof Poolable) {
                ((Poolable) t).getVerifier().isReleased = true;
            }
            this.resetter.reset(t);
            return this.pool.release(t);
        }

        public FactoryPool(Pools$SynchronizedPool pools$SynchronizedPool, Factory factory, Resetter resetter) {
            this.pool = pools$SynchronizedPool;
            this.factory = factory;
            this.resetter = resetter;
        }
    }

    /* loaded from: classes.dex */
    public interface Poolable {
        StateVerifier.DefaultStateVerifier getVerifier();
    }

    /* loaded from: classes.dex */
    public interface Resetter<T> {
        void reset(T t);
    }

    public static FactoryPool threadSafe(int i, Factory factory) {
        return new FactoryPool(new Pools$SynchronizedPool(i), factory, EMPTY_RESETTER);
    }
}
