package com.bumptech.glide.load.engine.cache;

import com.bumptech.glide.load.engine.cache.DiskCache;
import com.bumptech.glide.load.engine.cache.InternalCacheDiskCacheFactory;
/* loaded from: classes.dex */
public class DiskLruCacheFactory implements DiskCache.Factory {
    public final CacheDirectoryGetter cacheDirectoryGetter;
    public final long diskCacheSize;

    /* loaded from: classes.dex */
    public interface CacheDirectoryGetter {
    }

    public DiskLruCacheFactory(InternalCacheDiskCacheFactory.AnonymousClass1 r1, long j) {
        this.diskCacheSize = j;
        this.cacheDirectoryGetter = r1;
    }
}
