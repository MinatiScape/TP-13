package com.bumptech.glide.load.engine.cache;

import android.content.Context;
import com.bumptech.glide.load.engine.cache.DiskLruCacheFactory;
/* loaded from: classes.dex */
public final class InternalCacheDiskCacheFactory extends DiskLruCacheFactory {

    /* renamed from: com.bumptech.glide.load.engine.cache.InternalCacheDiskCacheFactory$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public final class AnonymousClass1 implements DiskLruCacheFactory.CacheDirectoryGetter {
        public final /* synthetic */ Context val$context;
        public final /* synthetic */ String val$diskCacheName = "image_manager_disk_cache";

        public AnonymousClass1(Context context) {
            this.val$context = context;
        }
    }

    public InternalCacheDiskCacheFactory(Context context, long j) {
        super(new AnonymousClass1(context), j);
    }
}
