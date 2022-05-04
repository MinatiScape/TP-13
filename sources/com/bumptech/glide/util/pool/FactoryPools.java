package com.bumptech.glide.util.pool;

import android.util.Log;
import androidx.core.util.Pools$Pool;
import androidx.core.util.Pools$SimplePool;
import com.bumptech.glide.util.pool.StateVerifier;
/* loaded from: classes.dex */
public final class FactoryPools {
    public static final Resetter<Object> EMPTY_RESETTER = new Resetter<Object>() { // from class: com.bumptech.glide.util.pool.FactoryPools.1
        @Override // com.bumptech.glide.util.pool.FactoryPools.Resetter
        public void reset(Object object) {
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

        public FactoryPool(Pools$Pool<T> pool, Factory<T> factory, Resetter<T> resetter) {
            this.pool = pool;
            this.factory = factory;
            this.resetter = resetter;
        }

        @Override // androidx.core.util.Pools$Pool
        public T acquire() {
            T acquire = this.pool.acquire();
            if (acquire == null) {
                acquire = this.factory.create();
                if (Log.isLoggable("FactoryPools", 2)) {
                    String valueOf = String.valueOf(acquire.getClass());
                    StringBuilder sb = new StringBuilder(valueOf.length() + 12);
                    sb.append("Created new ");
                    sb.append(valueOf);
                    Log.v("FactoryPools", sb.toString());
                }
            }
            if (acquire instanceof Poolable) {
                ((StateVerifier.DefaultStateVerifier) ((Poolable) acquire).getVerifier()).isReleased = false;
            }
            return acquire;
        }

        @Override // androidx.core.util.Pools$Pool
        public boolean release(T instance) {
            if (instance instanceof Poolable) {
                ((StateVerifier.DefaultStateVerifier) ((Poolable) instance).getVerifier()).isReleased = true;
            }
            this.resetter.reset(instance);
            return this.pool.release(instance);
        }
    }

    /* loaded from: classes.dex */
    public interface Poolable {
        StateVerifier getVerifier();
    }

    /* loaded from: classes.dex */
    public interface Resetter<T> {
        void reset(T object);
    }

    public static <T extends Poolable> Pools$Pool<T> simple(int size, Factory<T> factory) {
        return new FactoryPool(new Pools$SimplePool(size), factory, EMPTY_RESETTER);
    }
}
