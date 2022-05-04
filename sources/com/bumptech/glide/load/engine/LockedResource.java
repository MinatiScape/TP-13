package com.bumptech.glide.load.engine;

import com.bumptech.glide.util.pool.FactoryPools;
import com.bumptech.glide.util.pool.StateVerifier;
/* loaded from: classes.dex */
public final class LockedResource<Z> implements Resource<Z>, FactoryPools.Poolable {
    public static final FactoryPools.FactoryPool POOL = FactoryPools.threadSafe(20, new FactoryPools.Factory<LockedResource<?>>() { // from class: com.bumptech.glide.load.engine.LockedResource.1
        @Override // com.bumptech.glide.util.pool.FactoryPools.Factory
        public final LockedResource<?> create() {
            return new LockedResource<>();
        }
    });
    public boolean isLocked;
    public boolean isRecycled;
    public final StateVerifier.DefaultStateVerifier stateVerifier = new StateVerifier.DefaultStateVerifier();
    public Resource<Z> toWrap;

    @Override // com.bumptech.glide.load.engine.Resource
    public final synchronized void recycle() {
        this.stateVerifier.throwIfRecycled();
        this.isRecycled = true;
        if (!this.isLocked) {
            this.toWrap.recycle();
            this.toWrap = null;
            POOL.release(this);
        }
    }

    public final synchronized void unlock() {
        this.stateVerifier.throwIfRecycled();
        if (this.isLocked) {
            this.isLocked = false;
            if (this.isRecycled) {
                recycle();
            }
        } else {
            throw new IllegalStateException("Already unlocked");
        }
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public final Z get() {
        return this.toWrap.get();
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public final Class<Z> getResourceClass() {
        return this.toWrap.getResourceClass();
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public final int getSize() {
        return this.toWrap.getSize();
    }

    @Override // com.bumptech.glide.util.pool.FactoryPools.Poolable
    public final StateVerifier.DefaultStateVerifier getVerifier() {
        return this.stateVerifier;
    }
}
