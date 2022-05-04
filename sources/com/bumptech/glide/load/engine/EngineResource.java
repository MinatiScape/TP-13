package com.bumptech.glide.load.engine;

import androidx.collection.ContainerHelpers;
import com.bumptech.glide.load.Key;
/* loaded from: classes.dex */
public final class EngineResource<Z> implements Resource<Z> {
    public int acquired;
    public final boolean isMemoryCacheable;
    public final boolean isRecyclable;
    public boolean isRecycled;
    public final Key key;
    public final ResourceListener listener;
    public final Resource<Z> resource;

    /* loaded from: classes.dex */
    public interface ResourceListener {
        void onResourceReleased(Key key, EngineResource<?> engineResource);
    }

    public final synchronized void acquire() {
        if (!this.isRecycled) {
            this.acquired++;
        } else {
            throw new IllegalStateException("Cannot acquire a recycled resource");
        }
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public final synchronized void recycle() {
        if (this.acquired > 0) {
            throw new IllegalStateException("Cannot recycle a resource while it is still acquired");
        } else if (!this.isRecycled) {
            this.isRecycled = true;
            if (this.isRecyclable) {
                this.resource.recycle();
            }
        } else {
            throw new IllegalStateException("Cannot recycle a resource that has already been recycled");
        }
    }

    public final void release$1() {
        boolean z;
        synchronized (this) {
            int i = this.acquired;
            if (i > 0) {
                z = true;
                int i2 = i - 1;
                this.acquired = i2;
                if (i2 != 0) {
                    z = false;
                }
            } else {
                throw new IllegalStateException("Cannot release a recycled or not yet acquired resource");
            }
        }
        if (z) {
            this.listener.onResourceReleased(this.key, this);
        }
    }

    public final synchronized String toString() {
        return "EngineResource{isMemoryCacheable=" + this.isMemoryCacheable + ", listener=" + this.listener + ", key=" + this.key + ", acquired=" + this.acquired + ", isRecycled=" + this.isRecycled + ", resource=" + this.resource + '}';
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public final Z get() {
        return this.resource.get();
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public final Class<Z> getResourceClass() {
        return this.resource.getResourceClass();
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public final int getSize() {
        return this.resource.getSize();
    }

    public EngineResource(Resource<Z> resource, boolean z, boolean z2, Key key, ResourceListener resourceListener) {
        ContainerHelpers.checkNotNull(resource);
        this.resource = resource;
        this.isMemoryCacheable = z;
        this.isRecyclable = z2;
        this.key = key;
        ContainerHelpers.checkNotNull(resourceListener);
        this.listener = resourceListener;
    }
}
