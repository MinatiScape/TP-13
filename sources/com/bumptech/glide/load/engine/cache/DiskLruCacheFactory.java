package com.bumptech.glide.load.engine.cache;

import com.bumptech.glide.load.engine.cache.DiskCache;
/* loaded from: classes.dex */
public class DiskLruCacheFactory implements DiskCache.Factory {
    public final CacheDirectoryGetter cacheDirectoryGetter;
    public final long diskCacheSize;

    /* loaded from: classes.dex */
    public interface CacheDirectoryGetter {
    }

    public DiskLruCacheFactory(CacheDirectoryGetter cacheDirectoryGetter, long diskCacheSize) {
        this.diskCacheSize = diskCacheSize;
        this.cacheDirectoryGetter = cacheDirectoryGetter;
    }
}
