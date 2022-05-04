package com.bumptech.glide.load.engine.cache;

import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.engine.Engine;
import com.bumptech.glide.load.engine.Resource;
import com.bumptech.glide.load.engine.cache.MemoryCache;
import com.bumptech.glide.util.LruCache;
import com.bumptech.glide.util.Util;
/* loaded from: classes.dex */
public class LruResourceCache extends LruCache<Key, Resource<?>> implements MemoryCache {
    public MemoryCache.ResourceRemovedListener listener;

    public LruResourceCache(long size) {
        super(size);
    }

    @Override // com.bumptech.glide.util.LruCache
    public int getSize(Resource<?> item) {
        Resource<?> resource = item;
        if (resource == null) {
            return 1;
        }
        return resource.getSize();
    }

    @Override // com.bumptech.glide.util.LruCache
    public void onItemEvicted(Key key, Resource<?> item) {
        Resource<?> resource = item;
        MemoryCache.ResourceRemovedListener resourceRemovedListener = this.listener;
        if (resourceRemovedListener != null && resource != null) {
            Util.assertMainThread();
            ((Engine) resourceRemovedListener).resourceRecycler.recycle(resource);
        }
    }
}
