package com.bumptech.glide.load.engine;

import androidx.collection.ContainerHelpers;
import androidx.core.util.Pools$Pool;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.engine.DecodeJob;
import com.bumptech.glide.load.engine.EngineResource;
import com.bumptech.glide.load.engine.executor.GlideExecutor;
import com.bumptech.glide.request.ResourceCallback;
import com.bumptech.glide.request.SingleRequest;
import com.bumptech.glide.util.Executors;
import com.bumptech.glide.util.pool.FactoryPools;
import com.bumptech.glide.util.pool.StateVerifier;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicInteger;
/* loaded from: classes.dex */
public final class EngineJob<R> implements DecodeJob.Callback<R>, FactoryPools.Poolable {
    public static final EngineResourceFactory DEFAULT_FACTORY = new EngineResourceFactory();
    public final GlideExecutor animationExecutor;
    public final ResourceCallbacksAndExecutors cbs;
    public DataSource dataSource;
    public DecodeJob<R> decodeJob;
    public final GlideExecutor diskCacheExecutor;
    public final EngineJobListener engineJobListener;
    public EngineResource<?> engineResource;
    public final EngineResourceFactory engineResourceFactory;
    public GlideException exception;
    public boolean hasLoadFailed;
    public boolean hasResource;
    public boolean isCacheable;
    public volatile boolean isCancelled;
    public boolean isLoadedFromAlternateCacheKey;
    public Key key;
    public boolean onlyRetrieveFromCache;
    public final AtomicInteger pendingCallbacks;
    public final Pools$Pool<EngineJob<?>> pool;
    public Resource<?> resource;
    public final EngineResource.ResourceListener resourceListener;
    public final GlideExecutor sourceExecutor;
    public final GlideExecutor sourceUnlimitedExecutor;
    public final StateVerifier.DefaultStateVerifier stateVerifier;
    public boolean useAnimationPool;
    public boolean useUnlimitedSourceGeneratorPool;

    /* loaded from: classes.dex */
    public class CallLoadFailed implements Runnable {
        public final ResourceCallback cb;

        public CallLoadFailed(ResourceCallback resourceCallback) {
            this.cb = resourceCallback;
        }

        @Override // java.lang.Runnable
        public final void run() {
            SingleRequest singleRequest = (SingleRequest) this.cb;
            singleRequest.stateVerifier.throwIfRecycled();
            synchronized (singleRequest.requestLock) {
                synchronized (EngineJob.this) {
                    if (EngineJob.this.cbs.callbacksAndExecutors.contains(new ResourceCallbackAndExecutor(this.cb, Executors.DIRECT_EXECUTOR))) {
                        EngineJob engineJob = EngineJob.this;
                        ResourceCallback resourceCallback = this.cb;
                        engineJob.getClass();
                        ((SingleRequest) resourceCallback).onLoadFailed(engineJob.exception, 5);
                    }
                    EngineJob.this.decrementPendingCallbacks();
                }
            }
        }
    }

    /* loaded from: classes.dex */
    public class CallResourceReady implements Runnable {
        public final ResourceCallback cb;

        public CallResourceReady(ResourceCallback resourceCallback) {
            this.cb = resourceCallback;
        }

        @Override // java.lang.Runnable
        public final void run() {
            SingleRequest singleRequest = (SingleRequest) this.cb;
            singleRequest.stateVerifier.throwIfRecycled();
            synchronized (singleRequest.requestLock) {
                synchronized (EngineJob.this) {
                    if (EngineJob.this.cbs.callbacksAndExecutors.contains(new ResourceCallbackAndExecutor(this.cb, Executors.DIRECT_EXECUTOR))) {
                        EngineJob.this.engineResource.acquire();
                        EngineJob engineJob = EngineJob.this;
                        ResourceCallback resourceCallback = this.cb;
                        engineJob.getClass();
                        ((SingleRequest) resourceCallback).onResourceReady(engineJob.engineResource, engineJob.dataSource, engineJob.isLoadedFromAlternateCacheKey);
                        EngineJob.this.removeCallback(this.cb);
                    }
                    EngineJob.this.decrementPendingCallbacks();
                }
            }
        }
    }

    /* loaded from: classes.dex */
    public static class EngineResourceFactory {
    }

    /* loaded from: classes.dex */
    public static final class ResourceCallbackAndExecutor {
        public final ResourceCallback cb;
        public final Executor executor;

        public final boolean equals(Object obj) {
            if (obj instanceof ResourceCallbackAndExecutor) {
                return this.cb.equals(((ResourceCallbackAndExecutor) obj).cb);
            }
            return false;
        }

        public final int hashCode() {
            return this.cb.hashCode();
        }

        public ResourceCallbackAndExecutor(ResourceCallback resourceCallback, Executor executor) {
            this.cb = resourceCallback;
            this.executor = executor;
        }
    }

    /* loaded from: classes.dex */
    public static final class ResourceCallbacksAndExecutors implements Iterable<ResourceCallbackAndExecutor> {
        public final List<ResourceCallbackAndExecutor> callbacksAndExecutors;

        @Override // java.lang.Iterable
        public final Iterator<ResourceCallbackAndExecutor> iterator() {
            return this.callbacksAndExecutors.iterator();
        }

        public ResourceCallbacksAndExecutors(ArrayList arrayList) {
            this.callbacksAndExecutors = arrayList;
        }
    }

    public EngineJob() {
        throw null;
    }

    public EngineJob(GlideExecutor glideExecutor, GlideExecutor glideExecutor2, GlideExecutor glideExecutor3, GlideExecutor glideExecutor4, EngineJobListener engineJobListener, EngineResource.ResourceListener resourceListener, Pools$Pool<EngineJob<?>> pools$Pool, EngineResourceFactory engineResourceFactory) {
        this.cbs = new ResourceCallbacksAndExecutors(new ArrayList(2));
        this.stateVerifier = new StateVerifier.DefaultStateVerifier();
        this.pendingCallbacks = new AtomicInteger();
        this.diskCacheExecutor = glideExecutor;
        this.sourceExecutor = glideExecutor2;
        this.sourceUnlimitedExecutor = glideExecutor3;
        this.animationExecutor = glideExecutor4;
        this.engineJobListener = engineJobListener;
        this.resourceListener = resourceListener;
        this.pool = pools$Pool;
        this.engineResourceFactory = engineResourceFactory;
    }

    public final synchronized void addCallback(ResourceCallback resourceCallback, Executor executor) {
        this.stateVerifier.throwIfRecycled();
        this.cbs.callbacksAndExecutors.add(new ResourceCallbackAndExecutor(resourceCallback, executor));
        boolean z = true;
        if (this.hasResource) {
            incrementPendingCallbacks(1);
            executor.execute(new CallResourceReady(resourceCallback));
        } else if (this.hasLoadFailed) {
            incrementPendingCallbacks(1);
            executor.execute(new CallLoadFailed(resourceCallback));
        } else {
            if (this.isCancelled) {
                z = false;
            }
            ContainerHelpers.checkArgument(z, "Cannot add callbacks to a cancelled EngineJob");
        }
    }

    public final void decrementPendingCallbacks() {
        boolean z;
        EngineResource<?> engineResource;
        synchronized (this) {
            this.stateVerifier.throwIfRecycled();
            ContainerHelpers.checkArgument(isDone(), "Not yet complete!");
            int decrementAndGet = this.pendingCallbacks.decrementAndGet();
            if (decrementAndGet >= 0) {
                z = true;
            } else {
                z = false;
            }
            ContainerHelpers.checkArgument(z, "Can't decrement below 0");
            if (decrementAndGet == 0) {
                engineResource = this.engineResource;
                release$1();
            } else {
                engineResource = null;
            }
        }
        if (engineResource != null) {
            engineResource.release$1();
        }
    }

    public final synchronized void incrementPendingCallbacks(int i) {
        EngineResource<?> engineResource;
        ContainerHelpers.checkArgument(isDone(), "Not yet complete!");
        if (this.pendingCallbacks.getAndAdd(i) == 0 && (engineResource = this.engineResource) != null) {
            engineResource.acquire();
        }
    }

    public synchronized EngineJob<R> init(Key key, boolean z, boolean z2, boolean z3, boolean z4) {
        this.key = key;
        this.isCacheable = z;
        this.useUnlimitedSourceGeneratorPool = z2;
        this.useAnimationPool = z3;
        this.onlyRetrieveFromCache = z4;
        return this;
    }

    public final synchronized void release$1() {
        boolean isComplete;
        if (this.key != null) {
            this.cbs.callbacksAndExecutors.clear();
            this.key = null;
            this.engineResource = null;
            this.resource = null;
            this.hasLoadFailed = false;
            this.isCancelled = false;
            this.hasResource = false;
            this.isLoadedFromAlternateCacheKey = false;
            DecodeJob<R> decodeJob = this.decodeJob;
            DecodeJob.ReleaseManager releaseManager = decodeJob.releaseManager;
            synchronized (releaseManager) {
                releaseManager.isReleased = true;
                isComplete = releaseManager.isComplete();
            }
            if (isComplete) {
                decodeJob.releaseInternal();
            }
            this.decodeJob = null;
            this.exception = null;
            this.dataSource = null;
            this.pool.release(this);
        } else {
            throw new IllegalArgumentException();
        }
    }

    public final synchronized void removeCallback(ResourceCallback resourceCallback) {
        boolean z;
        this.stateVerifier.throwIfRecycled();
        this.cbs.callbacksAndExecutors.remove(new ResourceCallbackAndExecutor(resourceCallback, Executors.DIRECT_EXECUTOR));
        if (this.cbs.callbacksAndExecutors.isEmpty()) {
            cancel();
            if (!this.hasResource && !this.hasLoadFailed) {
                z = false;
                if (z && this.pendingCallbacks.get() == 0) {
                    release$1();
                }
            }
            z = true;
            if (z) {
                release$1();
            }
        }
    }

    public final boolean isDone() {
        if (this.hasLoadFailed || this.hasResource || this.isCancelled) {
            return true;
        }
        return false;
    }

    public final void cancel() {
        HashMap hashMap;
        if (!isDone()) {
            this.isCancelled = true;
            DecodeJob<R> decodeJob = this.decodeJob;
            decodeJob.isCancelled = true;
            DataFetcherGenerator dataFetcherGenerator = decodeJob.currentGenerator;
            if (dataFetcherGenerator != null) {
                dataFetcherGenerator.cancel();
            }
            EngineJobListener engineJobListener = this.engineJobListener;
            Key key = this.key;
            Engine engine = (Engine) engineJobListener;
            synchronized (engine) {
                Jobs jobs = engine.jobs;
                jobs.getClass();
                if (this.onlyRetrieveFromCache) {
                    hashMap = jobs.onlyCacheJobs;
                } else {
                    hashMap = jobs.jobs;
                }
                if (equals(hashMap.get(key))) {
                    hashMap.remove(key);
                }
            }
        }
    }

    @Override // com.bumptech.glide.util.pool.FactoryPools.Poolable
    public final StateVerifier.DefaultStateVerifier getVerifier() {
        return this.stateVerifier;
    }
}
