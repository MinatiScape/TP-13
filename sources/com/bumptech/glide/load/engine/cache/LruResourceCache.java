package com.bumptech.glide.load.engine.cache;

import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.engine.Engine;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.engine.cache.MemoryCache;
import com.bumptech.glide.util.LruCache;
/* loaded from: classes.dex */
public final class LruResourceCache extends LruCache<Key, Resource<?>> implements MemoryCache {
    public MemoryCache.ResourceRemovedListener listener;

    @Override // com.bumptech.glide.util.LruCache
    public final int getSize(Resource<?> resource) {
        Resource<?> resource2 = resource;
        if (resource2 == null) {
            return 1;
        }
        return resource2.getSize();
    }

    @Override // com.bumptech.glide.util.LruCache
    public final void onItemEvicted(Key key, Resource<?> resource) {
        Resource<?> resource2 = resource;
        MemoryCache.ResourceRemovedListener resourceRemovedListener = this.listener;
        if (resourceRemovedListener != null && resource2 != null) {
            ((Engine) resourceRemovedListener).resourceRecycler.recycle(resource2, true);
        }
    }

    public LruResourceCache(long j) {
        super(j);
    }
}
