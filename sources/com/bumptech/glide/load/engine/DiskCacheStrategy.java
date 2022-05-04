package com.bumptech.glide.load.engine;

import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.EncodeStrategy;
/* loaded from: classes.dex */
public abstract class DiskCacheStrategy {
    public static final AnonymousClass2 NONE = new DiskCacheStrategy() { // from class: com.bumptech.glide.load.engine.DiskCacheStrategy.2
        @Override // com.bumptech.glide.load.engine.DiskCacheStrategy
        public final boolean decodeCachedData() {
            return false;
        }

        @Override // com.bumptech.glide.load.engine.DiskCacheStrategy
        public final boolean decodeCachedResource() {
            return false;
        }

        @Override // com.bumptech.glide.load.engine.DiskCacheStrategy
        public final boolean isDataCacheable(DataSource dataSource) {
            return false;
        }

        @Override // com.bumptech.glide.load.engine.DiskCacheStrategy
        public final boolean isResourceCacheable(boolean z, DataSource dataSource, EncodeStrategy encodeStrategy) {
            return false;
        }
    };
    public static final AnonymousClass3 DATA = new DiskCacheStrategy() { // from class: com.bumptech.glide.load.engine.DiskCacheStrategy.3
        @Override // com.bumptech.glide.load.engine.DiskCacheStrategy
        public final boolean decodeCachedData() {
            return true;
        }

        @Override // com.bumptech.glide.load.engine.DiskCacheStrategy
        public final boolean decodeCachedResource() {
            return false;
        }

        @Override // com.bumptech.glide.load.engine.DiskCacheStrategy
        public final boolean isResourceCacheable(boolean z, DataSource dataSource, EncodeStrategy encodeStrategy) {
            return false;
        }

        @Override // com.bumptech.glide.load.engine.DiskCacheStrategy
        public final boolean isDataCacheable(DataSource dataSource) {
            if (dataSource == DataSource.DATA_DISK_CACHE || dataSource == DataSource.MEMORY_CACHE) {
                return false;
            }
            return true;
        }
    };
    public static final AnonymousClass5 AUTOMATIC = new DiskCacheStrategy() { // from class: com.bumptech.glide.load.engine.DiskCacheStrategy.5
        @Override // com.bumptech.glide.load.engine.DiskCacheStrategy
        public final boolean decodeCachedData() {
            return true;
        }

        @Override // com.bumptech.glide.load.engine.DiskCacheStrategy
        public final boolean decodeCachedResource() {
            return true;
        }

        @Override // com.bumptech.glide.load.engine.DiskCacheStrategy
        public final boolean isDataCacheable(DataSource dataSource) {
            if (dataSource == DataSource.REMOTE) {
                return true;
            }
            return false;
        }

        @Override // com.bumptech.glide.load.engine.DiskCacheStrategy
        public final boolean isResourceCacheable(boolean z, DataSource dataSource, EncodeStrategy encodeStrategy) {
            if (((!z || dataSource != DataSource.DATA_DISK_CACHE) && dataSource != DataSource.LOCAL) || encodeStrategy != EncodeStrategy.TRANSFORMED) {
                return false;
            }
            return true;
        }
    };

    public abstract boolean decodeCachedData();

    public abstract boolean decodeCachedResource();

    public abstract boolean isDataCacheable(DataSource dataSource);

    public abstract boolean isResourceCacheable(boolean z, DataSource dataSource, EncodeStrategy encodeStrategy);
}
