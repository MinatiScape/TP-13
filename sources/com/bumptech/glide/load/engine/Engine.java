package com.bumptech.glide.load.engine;

import android.os.Process;
import android.os.SystemClock;
import android.util.Log;
import androidx.appcompat.R$bool;
import com.bumptech.glide.GlideContext;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.engine.ActiveResources;
import com.bumptech.glide.load.engine.DecodeJob;
import com.bumptech.glide.load.engine.EngineResource;
import com.bumptech.glide.load.engine.cache.DiskCache;
import com.bumptech.glide.load.engine.cache.DiskLruCacheFactory;
import com.bumptech.glide.load.engine.cache.DiskLruCacheWrapper;
import com.bumptech.glide.load.engine.cache.InternalCacheDiskCacheFactory;
import com.bumptech.glide.load.engine.cache.LruResourceCache;
import com.bumptech.glide.load.engine.cache.MemoryCache;
import com.bumptech.glide.load.engine.executor.GlideExecutor;
import com.bumptech.glide.request.ResourceCallback;
import com.bumptech.glide.request.SingleRequest;
import com.bumptech.glide.util.CachedHashCodeArrayMap;
import com.bumptech.glide.util.Executors;
import com.bumptech.glide.util.LogTime;
import com.bumptech.glide.util.LruCache;
import com.bumptech.glide.util.pool.FactoryPools;
import java.io.File;
import java.util.concurrent.Executor;
import java.util.concurrent.ThreadFactory;
/* loaded from: classes.dex */
public final class Engine implements EngineJobListener, MemoryCache.ResourceRemovedListener, EngineResource.ResourceListener {
    public static final boolean VERBOSE_IS_LOGGABLE = Log.isLoggable("Engine", 2);
    public final ActiveResources activeResources;
    public final MemoryCache cache;
    public final DecodeJobFactory decodeJobFactory;
    public final LazyDiskCacheProvider diskCacheProvider;
    public final EngineJobFactory engineJobFactory;
    public final Jobs jobs;
    public final EngineKeyFactory keyFactory;
    public final ResourceRecycler resourceRecycler;

    /* loaded from: classes.dex */
    public static class EngineJobFactory {
        public final GlideExecutor animationExecutor;
        public final GlideExecutor diskCacheExecutor;
        public final EngineJobListener engineJobListener;
        public final FactoryPools.FactoryPool pool = FactoryPools.threadSafe(150, new FactoryPools.Factory<EngineJob<?>>() { // from class: com.bumptech.glide.load.engine.Engine.EngineJobFactory.1
            @Override // com.bumptech.glide.util.pool.FactoryPools.Factory
            public final EngineJob<?> create() {
                EngineJobFactory engineJobFactory = EngineJobFactory.this;
                return new EngineJob<>(engineJobFactory.diskCacheExecutor, engineJobFactory.sourceExecutor, engineJobFactory.sourceUnlimitedExecutor, engineJobFactory.animationExecutor, engineJobFactory.engineJobListener, engineJobFactory.resourceListener, engineJobFactory.pool, EngineJob.DEFAULT_FACTORY);
            }
        });
        public final EngineResource.ResourceListener resourceListener;
        public final GlideExecutor sourceExecutor;
        public final GlideExecutor sourceUnlimitedExecutor;

        public void shutdown() {
            Executors.shutdownAndAwaitTermination(this.diskCacheExecutor);
            Executors.shutdownAndAwaitTermination(this.sourceExecutor);
            Executors.shutdownAndAwaitTermination(this.sourceUnlimitedExecutor);
            Executors.shutdownAndAwaitTermination(this.animationExecutor);
        }

        public EngineJobFactory(GlideExecutor glideExecutor, GlideExecutor glideExecutor2, GlideExecutor glideExecutor3, GlideExecutor glideExecutor4, EngineJobListener engineJobListener, EngineResource.ResourceListener resourceListener) {
            this.diskCacheExecutor = glideExecutor;
            this.sourceExecutor = glideExecutor2;
            this.sourceUnlimitedExecutor = glideExecutor3;
            this.animationExecutor = glideExecutor4;
            this.engineJobListener = engineJobListener;
            this.resourceListener = resourceListener;
        }
    }

    /* loaded from: classes.dex */
    public static class LazyDiskCacheProvider implements DecodeJob.DiskCacheProvider {
        public volatile DiskCache diskCache;
        public final DiskCache.Factory factory;

        public synchronized void clearDiskCacheIfCreated() {
            if (this.diskCache != null) {
                this.diskCache.clear();
            }
        }

        public final DiskCache getDiskCache() {
            if (this.diskCache == null) {
                synchronized (this) {
                    if (this.diskCache == null) {
                        DiskLruCacheFactory diskLruCacheFactory = (DiskLruCacheFactory) this.factory;
                        InternalCacheDiskCacheFactory.AnonymousClass1 r1 = (InternalCacheDiskCacheFactory.AnonymousClass1) diskLruCacheFactory.cacheDirectoryGetter;
                        File cacheDir = r1.val$context.getCacheDir();
                        DiskLruCacheWrapper diskLruCacheWrapper = null;
                        if (cacheDir == null) {
                            cacheDir = null;
                        } else if (r1.val$diskCacheName != null) {
                            cacheDir = new File(cacheDir, r1.val$diskCacheName);
                        }
                        if (cacheDir != null && (cacheDir.isDirectory() || cacheDir.mkdirs())) {
                            diskLruCacheWrapper = new DiskLruCacheWrapper(cacheDir, diskLruCacheFactory.diskCacheSize);
                        }
                        this.diskCache = diskLruCacheWrapper;
                    }
                    if (this.diskCache == null) {
                        this.diskCache = new R$bool();
                    }
                }
            }
            return this.diskCache;
        }

        public LazyDiskCacheProvider(DiskCache.Factory factory) {
            this.factory = factory;
        }
    }

    /* loaded from: classes.dex */
    public class LoadStatus {
        public final ResourceCallback cb;
        public final EngineJob<?> engineJob;

        public LoadStatus(ResourceCallback resourceCallback, EngineJob<?> engineJob) {
            this.cb = resourceCallback;
            this.engineJob = engineJob;
        }
    }

    public Engine(MemoryCache memoryCache, DiskCache.Factory factory, GlideExecutor glideExecutor, GlideExecutor glideExecutor2, GlideExecutor glideExecutor3, GlideExecutor glideExecutor4, Jobs jobs, EngineKeyFactory engineKeyFactory, ActiveResources activeResources, EngineJobFactory engineJobFactory, DecodeJobFactory decodeJobFactory, ResourceRecycler resourceRecycler, boolean z) {
        ActiveResources activeResources2;
        EngineKeyFactory engineKeyFactory2;
        Jobs jobs2;
        EngineJobFactory engineJobFactory2;
        DecodeJobFactory decodeJobFactory2;
        ResourceRecycler resourceRecycler2;
        this.cache = memoryCache;
        LazyDiskCacheProvider lazyDiskCacheProvider = new LazyDiskCacheProvider(factory);
        this.diskCacheProvider = lazyDiskCacheProvider;
        if (activeResources == null) {
            activeResources2 = new ActiveResources(z, java.util.concurrent.Executors.newSingleThreadExecutor(new ThreadFactory() { // from class: com.bumptech.glide.load.engine.ActiveResources.1
                @Override // java.util.concurrent.ThreadFactory
                public final Thread newThread(final Runnable runnable) {
                    return new Thread(new Runnable() { // from class: com.bumptech.glide.load.engine.ActiveResources.1.1
                        @Override // java.lang.Runnable
                        public final void run() {
                            Process.setThreadPriority(10);
                            runnable.run();
                        }
                    }, "glide-active-resources");
                }
            }));
        } else {
            activeResources2 = activeResources;
        }
        this.activeResources = activeResources2;
        synchronized (this) {
            synchronized (activeResources2) {
                activeResources2.listener = this;
            }
        }
        if (engineKeyFactory == null) {
            engineKeyFactory2 = new EngineKeyFactory();
        } else {
            engineKeyFactory2 = engineKeyFactory;
        }
        this.keyFactory = engineKeyFactory2;
        if (jobs == null) {
            jobs2 = new Jobs();
        } else {
            jobs2 = jobs;
        }
        this.jobs = jobs2;
        if (engineJobFactory == null) {
            engineJobFactory2 = new EngineJobFactory(glideExecutor, glideExecutor2, glideExecutor3, glideExecutor4, this, this);
        } else {
            engineJobFactory2 = engineJobFactory;
        }
        this.engineJobFactory = engineJobFactory2;
        if (decodeJobFactory == null) {
            decodeJobFactory2 = new DecodeJobFactory(lazyDiskCacheProvider);
        } else {
            decodeJobFactory2 = decodeJobFactory;
        }
        this.decodeJobFactory = decodeJobFactory2;
        if (resourceRecycler == null) {
            resourceRecycler2 = new ResourceRecycler();
        } else {
            resourceRecycler2 = resourceRecycler;
        }
        this.resourceRecycler = resourceRecycler2;
        ((LruResourceCache) memoryCache).listener = this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final EngineResource<?> loadFromMemory(EngineKey engineKey, boolean z, long j) {
        EngineResource<?> engineResource;
        Resource resource;
        EngineResource<?> engineResource2;
        if (!z) {
            return null;
        }
        ActiveResources activeResources = this.activeResources;
        synchronized (activeResources) {
            ActiveResources.ResourceWeakReference resourceWeakReference = activeResources.activeEngineResources.get(engineKey);
            if (resourceWeakReference == null) {
                engineResource = null;
            } else {
                engineResource = resourceWeakReference.get();
                if (engineResource == null) {
                    activeResources.cleanupActiveReference(resourceWeakReference);
                }
            }
        }
        if (engineResource != null) {
            engineResource.acquire();
        }
        if (engineResource != null) {
            if (VERBOSE_IS_LOGGABLE) {
                logWithTimeAndKey("Loaded resource from active resources", j, engineKey);
            }
            return engineResource;
        }
        LruResourceCache lruResourceCache = (LruResourceCache) this.cache;
        synchronized (lruResourceCache) {
            LruCache.Entry entry = (LruCache.Entry) lruResourceCache.cache.remove(engineKey);
            if (entry == null) {
                resource = null;
            } else {
                lruResourceCache.currentSize -= entry.size;
                resource = entry.value;
            }
        }
        Resource resource2 = resource;
        if (resource2 == null) {
            engineResource2 = null;
        } else if (resource2 instanceof EngineResource) {
            engineResource2 = (EngineResource) resource2;
        } else {
            engineResource2 = new EngineResource<>(resource2, true, true, engineKey, this);
        }
        if (engineResource2 != null) {
            engineResource2.acquire();
            ActiveResources activeResources2 = this.activeResources;
            synchronized (activeResources2) {
                ActiveResources.ResourceWeakReference put = activeResources2.activeEngineResources.put(engineKey, new ActiveResources.ResourceWeakReference(engineKey, engineResource2, activeResources2.resourceReferenceQueue, activeResources2.isActiveResourceRetentionAllowed));
                if (put != null) {
                    put.resource = null;
                    put.clear();
                }
            }
        }
        if (engineResource2 == null) {
            return null;
        }
        if (VERBOSE_IS_LOGGABLE) {
            logWithTimeAndKey("Loaded resource from cache", j, engineKey);
        }
        return engineResource2;
    }

    /* loaded from: classes.dex */
    public static class DecodeJobFactory {
        public int creationOrder;
        public final DecodeJob.DiskCacheProvider diskCacheProvider;
        public final FactoryPools.FactoryPool pool = FactoryPools.threadSafe(150, new FactoryPools.Factory<DecodeJob<?>>() { // from class: com.bumptech.glide.load.engine.Engine.DecodeJobFactory.1
            @Override // com.bumptech.glide.util.pool.FactoryPools.Factory
            public final DecodeJob<?> create() {
                DecodeJobFactory decodeJobFactory = DecodeJobFactory.this;
                return new DecodeJob<>(decodeJobFactory.diskCacheProvider, decodeJobFactory.pool);
            }
        });

        public DecodeJobFactory(LazyDiskCacheProvider lazyDiskCacheProvider) {
            this.diskCacheProvider = lazyDiskCacheProvider;
        }
    }

    public static void logWithTimeAndKey(String str, long j, Key key) {
        Log.v("Engine", str + " in " + LogTime.getElapsedMillis(j) + "ms, key: " + key);
    }

    public static void release(Resource resource) {
        if (resource instanceof EngineResource) {
            ((EngineResource) resource).release$1();
            return;
        }
        throw new IllegalArgumentException("Cannot release anything but an EngineResource");
    }

    public final LoadStatus load(GlideContext glideContext, Object obj, Key key, int i, int i2, Class cls, Class cls2, Priority priority, DiskCacheStrategy diskCacheStrategy, CachedHashCodeArrayMap cachedHashCodeArrayMap, boolean z, boolean z2, Options options, boolean z3, boolean z4, boolean z5, boolean z6, ResourceCallback resourceCallback, Executor executor) {
        long j;
        if (VERBOSE_IS_LOGGABLE) {
            int i3 = LogTime.$r8$clinit;
            j = SystemClock.elapsedRealtimeNanos();
        } else {
            j = 0;
        }
        long j2 = j;
        this.keyFactory.getClass();
        EngineKey engineKey = new EngineKey(obj, key, i, i2, cachedHashCodeArrayMap, cls, cls2, options);
        synchronized (this) {
            try {
                EngineResource<?> loadFromMemory = loadFromMemory(engineKey, z3, j2);
                if (loadFromMemory == null) {
                    return waitForExistingOrStartNewJob(glideContext, obj, key, i, i2, cls, cls2, priority, diskCacheStrategy, cachedHashCodeArrayMap, z, z2, options, z3, z4, z5, z6, resourceCallback, executor, engineKey, j2);
                }
                ((SingleRequest) resourceCallback).onResourceReady((Resource<?>) loadFromMemory, DataSource.MEMORY_CACHE, false);
                return null;
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    @Override // com.bumptech.glide.load.engine.EngineResource.ResourceListener
    public final void onResourceReleased(Key key, EngineResource<?> engineResource) {
        ActiveResources activeResources = this.activeResources;
        synchronized (activeResources) {
            ActiveResources.ResourceWeakReference remove = activeResources.activeEngineResources.remove(key);
            if (remove != null) {
                remove.resource = null;
                remove.clear();
            }
        }
        if (engineResource.isMemoryCacheable) {
            ((LruResourceCache) this.cache).put(key, engineResource);
        } else {
            this.resourceRecycler.recycle(engineResource, false);
        }
    }

    public void shutdown() {
        this.engineJobFactory.shutdown();
        this.diskCacheProvider.clearDiskCacheIfCreated();
        this.activeResources.shutdown();
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x00e6 A[Catch: all -> 0x010e, TryCatch #0 {, blocks: (B:19:0x00d0, B:21:0x00dc, B:27:0x00e6, B:28:0x00e9, B:30:0x00ed, B:31:0x00f0, B:33:0x00f4, B:34:0x00f7, B:35:0x00f9), top: B:44:0x00d0 }] */
    /* JADX WARN: Removed duplicated region for block: B:28:0x00e9 A[Catch: all -> 0x010e, TryCatch #0 {, blocks: (B:19:0x00d0, B:21:0x00dc, B:27:0x00e6, B:28:0x00e9, B:30:0x00ed, B:31:0x00f0, B:33:0x00f4, B:34:0x00f7, B:35:0x00f9), top: B:44:0x00d0 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final com.bumptech.glide.load.engine.Engine.LoadStatus waitForExistingOrStartNewJob(com.bumptech.glide.GlideContext r17, java.lang.Object r18, com.bumptech.glide.load.Key r19, int r20, int r21, java.lang.Class r22, java.lang.Class r23, com.bumptech.glide.Priority r24, com.bumptech.glide.load.engine.DiskCacheStrategy r25, com.bumptech.glide.util.CachedHashCodeArrayMap r26, boolean r27, boolean r28, com.bumptech.glide.load.Options r29, boolean r30, boolean r31, boolean r32, boolean r33, com.bumptech.glide.request.ResourceCallback r34, java.util.concurrent.Executor r35, com.bumptech.glide.load.engine.EngineKey r36, long r37) {
        /*
            Method dump skipped, instructions count: 273
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bumptech.glide.load.engine.Engine.waitForExistingOrStartNewJob(com.bumptech.glide.GlideContext, java.lang.Object, com.bumptech.glide.load.Key, int, int, java.lang.Class, java.lang.Class, com.bumptech.glide.Priority, com.bumptech.glide.load.engine.DiskCacheStrategy, com.bumptech.glide.util.CachedHashCodeArrayMap, boolean, boolean, com.bumptech.glide.load.Options, boolean, boolean, boolean, boolean, com.bumptech.glide.request.ResourceCallback, java.util.concurrent.Executor, com.bumptech.glide.load.engine.EngineKey, long):com.bumptech.glide.load.engine.Engine$LoadStatus");
    }
}
