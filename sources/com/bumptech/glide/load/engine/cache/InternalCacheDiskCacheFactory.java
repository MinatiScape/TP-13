package com.bumptech.glide.load.engine.cache;

import android.content.Context;
import com.bumptech.glide.load.engine.cache.DiskLruCacheFactory;
/* loaded from: classes.dex */
public final class InternalCacheDiskCacheFactory extends DiskLruCacheFactory {

    /* renamed from: com.bumptech.glide.load.engine.cache.InternalCacheDiskCacheFactory$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass1 implements DiskLruCacheFactory.CacheDirectoryGetter {
        public final /* synthetic */ Context val$context;
        public final /* synthetic */ String val$diskCacheName;

        public AnonymousClass1(final Context val$context, final String val$diskCacheName) {
            this.val$context = val$context;
            this.val$diskCacheName = val$diskCacheName;
        }
    }

    public InternalCacheDiskCacheFactory(Context context) {
        super(new AnonymousClass1(context, "image_manager_disk_cache"), 262144000L);
    }

    public InternalCacheDiskCacheFactory(Context context, long diskCacheSize) {
        super(new AnonymousClass1(context, "image_manager_disk_cache"), diskCacheSize);
    }
}
