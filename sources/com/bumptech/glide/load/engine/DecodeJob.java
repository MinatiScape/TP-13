package com.bumptech.glide.load.engine;

import android.os.SystemClock;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.Log;
import androidx.appcompat.view.SupportMenuInflater$$ExternalSyntheticOutline0;
import androidx.collection.ArrayMap;
import androidx.collection.ContainerHelpers;
import androidx.core.util.Pools$Pool;
import com.bumptech.glide.GlideContext;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.Option;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.ResourceEncoder;
import com.bumptech.glide.load.data.DataFetcher;
import com.bumptech.glide.load.data.DataRewinder;
import com.bumptech.glide.load.data.DataRewinderRegistry;
import com.bumptech.glide.load.engine.ActiveResources;
import com.bumptech.glide.load.engine.DataFetcherGenerator;
import com.bumptech.glide.load.engine.Engine;
import com.bumptech.glide.load.engine.EngineJob;
import com.bumptech.glide.load.engine.EngineResource;
import com.bumptech.glide.load.engine.executor.GlideExecutor;
import com.bumptech.glide.load.resource.bitmap.Downsampler;
import com.bumptech.glide.util.LogTime;
import com.bumptech.glide.util.pool.FactoryPools;
import com.bumptech.glide.util.pool.StateVerifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
/* loaded from: classes.dex */
public final class DecodeJob<R> implements DataFetcherGenerator.FetcherReadyCallback, Runnable, Comparable<DecodeJob<?>>, FactoryPools.Poolable {
    public Callback<R> callback;
    public Key currentAttemptingKey;
    public Object currentData;
    public DataSource currentDataSource;
    public DataFetcher<?> currentFetcher;
    public volatile DataFetcherGenerator currentGenerator;
    public Key currentSourceKey;
    public Thread currentThread;
    public final DiskCacheProvider diskCacheProvider;
    public DiskCacheStrategy diskCacheStrategy;
    public GlideContext glideContext;
    public int height;
    public volatile boolean isCallbackNotified;
    public volatile boolean isCancelled;
    public boolean isLoadingFromAlternateCacheKey;
    public EngineKey loadKey;
    public Object model;
    public boolean onlyRetrieveFromCache;
    public Options options;
    public int order;
    public final Pools$Pool<DecodeJob<?>> pool;
    public Priority priority;
    public RunReason runReason;
    public Key signature;
    public Stage stage;
    public long startFetchTime;
    public int width;
    public final DecodeHelper<R> decodeHelper = new DecodeHelper<>();
    public final ArrayList throwables = new ArrayList();
    public final StateVerifier.DefaultStateVerifier stateVerifier = new StateVerifier.DefaultStateVerifier();
    public final DeferredEncodeManager<?> deferredEncodeManager = new DeferredEncodeManager<>();
    public final ReleaseManager releaseManager = new ReleaseManager();

    /* loaded from: classes.dex */
    public interface Callback<R> {
    }

    /* loaded from: classes.dex */
    public final class DecodeCallback<Z> {
        public final DataSource dataSource;

        public DecodeCallback(DataSource dataSource) {
            this.dataSource = dataSource;
        }
    }

    /* loaded from: classes.dex */
    public static class DeferredEncodeManager<Z> {
        public ResourceEncoder<Z> encoder;
        public Key key;
        public LockedResource<Z> toEncode;
    }

    /* loaded from: classes.dex */
    public interface DiskCacheProvider {
    }

    /* loaded from: classes.dex */
    public static class ReleaseManager {
        public boolean isEncodeComplete;
        public boolean isFailed;
        public boolean isReleased;

        public final boolean isComplete() {
            if ((this.isFailed || this.isEncodeComplete) && this.isReleased) {
                return true;
            }
            return false;
        }
    }

    /* loaded from: classes.dex */
    public enum RunReason {
        INITIALIZE,
        SWITCH_TO_SOURCE_SERVICE,
        DECODE_DATA
    }

    /* loaded from: classes.dex */
    public enum Stage {
        INITIALIZE,
        RESOURCE_CACHE,
        DATA_CACHE,
        SOURCE,
        ENCODE,
        FINISHED
    }

    public final <Data> Resource<R> decodeFromData(DataFetcher<?> dataFetcher, Data data, DataSource dataSource) throws GlideException {
        if (data == null) {
            return null;
        }
        try {
            int i = LogTime.$r8$clinit;
            long elapsedRealtimeNanos = SystemClock.elapsedRealtimeNanos();
            Resource<R> decodeFromFetcher = decodeFromFetcher(data, dataSource);
            if (Log.isLoggable("DecodeJob", 2)) {
                logWithTimeAndKey("Decoded result " + decodeFromFetcher, elapsedRealtimeNanos, null);
            }
            return decodeFromFetcher;
        } finally {
            dataFetcher.cleanup();
        }
    }

    @Override // java.lang.Comparable
    public final int compareTo(DecodeJob<?> decodeJob) {
        DecodeJob<?> decodeJob2 = decodeJob;
        int ordinal = this.priority.ordinal() - decodeJob2.priority.ordinal();
        if (ordinal == 0) {
            return this.order - decodeJob2.order;
        }
        return ordinal;
    }

    public final <Data> Resource<R> decodeFromFetcher(Data data, DataSource dataSource) throws GlideException {
        boolean z;
        DataRewinder build;
        LoadPath<Data, ?, R> loadPath = this.decodeHelper.getLoadPath(data.getClass());
        Options options = this.options;
        if (dataSource == DataSource.RESOURCE_DISK_CACHE || this.decodeHelper.isScaleOnlyOrNoTransform) {
            z = true;
        } else {
            z = false;
        }
        Option<Boolean> option = Downsampler.ALLOW_HARDWARE_CONFIG;
        Boolean bool = (Boolean) options.get(option);
        if (bool == null || (bool.booleanValue() && !z)) {
            options = new Options();
            options.values.putAll((ArrayMap) this.options.values);
            options.values.put(option, Boolean.valueOf(z));
        }
        Options options2 = options;
        DataRewinderRegistry dataRewinderRegistry = this.glideContext.registry.dataRewinderRegistry;
        synchronized (dataRewinderRegistry) {
            DataRewinder.Factory factory = (DataRewinder.Factory) dataRewinderRegistry.rewinders.get(data.getClass());
            if (factory == null) {
                Iterator it = dataRewinderRegistry.rewinders.values().iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    DataRewinder.Factory factory2 = (DataRewinder.Factory) it.next();
                    if (factory2.getDataClass().isAssignableFrom(data.getClass())) {
                        factory = factory2;
                        break;
                    }
                }
            }
            if (factory == null) {
                factory = DataRewinderRegistry.DEFAULT_FACTORY;
            }
            build = factory.build(data);
        }
        try {
            return loadPath.load(build, options2, this.width, this.height, new DecodeCallback(dataSource));
        } finally {
            build.cleanup();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void decodeFromRetrievedData() {
        Resource resource;
        boolean z;
        LockedResource lockedResource;
        Resource resource2;
        boolean isComplete;
        HashMap hashMap;
        if (Log.isLoggable("DecodeJob", 2)) {
            long j = this.startFetchTime;
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("data: ");
            m.append(this.currentData);
            m.append(", cache key: ");
            m.append(this.currentSourceKey);
            m.append(", fetcher: ");
            m.append(this.currentFetcher);
            logWithTimeAndKey("Retrieved data", j, m.toString());
        }
        try {
            resource = (Resource<R>) decodeFromData(this.currentFetcher, this.currentData, this.currentDataSource);
        } catch (GlideException e) {
            e.setLoggingDetails(this.currentAttemptingKey, this.currentDataSource, null);
            this.throwables.add(e);
            resource = (Resource<R>) null;
        }
        if (resource != null) {
            DataSource dataSource = this.currentDataSource;
            boolean z2 = this.isLoadingFromAlternateCacheKey;
            if (resource instanceof Initializable) {
                ((Initializable) resource).initialize();
            }
            boolean z3 = false;
            if (this.deferredEncodeManager.toEncode != null) {
                z = true;
            } else {
                z = false;
            }
            if (z) {
                lockedResource = (LockedResource) LockedResource.POOL.acquire();
                ContainerHelpers.checkNotNull(lockedResource);
                lockedResource.isRecycled = false;
                lockedResource.isLocked = true;
                lockedResource.toWrap = resource;
                resource2 = lockedResource;
            } else {
                lockedResource = null;
                resource2 = resource;
            }
            setNotifiedOrThrow();
            EngineJob engineJob = (EngineJob) this.callback;
            synchronized (engineJob) {
                engineJob.resource = resource2;
                engineJob.dataSource = dataSource;
                engineJob.isLoadedFromAlternateCacheKey = z2;
            }
            synchronized (engineJob) {
                engineJob.stateVerifier.throwIfRecycled();
                if (engineJob.isCancelled) {
                    engineJob.resource.recycle();
                    engineJob.release$1();
                } else if (engineJob.cbs.callbacksAndExecutors.isEmpty()) {
                    throw new IllegalStateException("Received a resource without any callbacks to notify");
                } else if (!engineJob.hasResource) {
                    EngineJob.EngineResourceFactory engineResourceFactory = engineJob.engineResourceFactory;
                    Resource<?> resource3 = engineJob.resource;
                    boolean z4 = engineJob.isCacheable;
                    Key key = engineJob.key;
                    EngineResource.ResourceListener resourceListener = engineJob.resourceListener;
                    engineResourceFactory.getClass();
                    engineJob.engineResource = new EngineResource<>(resource3, z4, true, key, resourceListener);
                    engineJob.hasResource = true;
                    EngineJob.ResourceCallbacksAndExecutors resourceCallbacksAndExecutors = engineJob.cbs;
                    resourceCallbacksAndExecutors.getClass();
                    ArrayList<EngineJob.ResourceCallbackAndExecutor> arrayList = new ArrayList(resourceCallbacksAndExecutors.callbacksAndExecutors);
                    engineJob.incrementPendingCallbacks(arrayList.size() + 1);
                    Key key2 = engineJob.key;
                    EngineResource<?> engineResource = engineJob.engineResource;
                    Engine engine = (Engine) engineJob.engineJobListener;
                    synchronized (engine) {
                        if (engineResource != null) {
                            if (engineResource.isMemoryCacheable) {
                                ActiveResources activeResources = engine.activeResources;
                                synchronized (activeResources) {
                                    ActiveResources.ResourceWeakReference put = activeResources.activeEngineResources.put(key2, new ActiveResources.ResourceWeakReference(key2, engineResource, activeResources.resourceReferenceQueue, activeResources.isActiveResourceRetentionAllowed));
                                    if (put != null) {
                                        put.resource = null;
                                        put.clear();
                                    }
                                }
                            }
                        }
                        Jobs jobs = engine.jobs;
                        jobs.getClass();
                        if (engineJob.onlyRetrieveFromCache) {
                            hashMap = jobs.onlyCacheJobs;
                        } else {
                            hashMap = jobs.jobs;
                        }
                        if (engineJob.equals(hashMap.get(key2))) {
                            hashMap.remove(key2);
                        }
                    }
                    for (EngineJob.ResourceCallbackAndExecutor resourceCallbackAndExecutor : arrayList) {
                        resourceCallbackAndExecutor.executor.execute(new EngineJob.CallResourceReady(resourceCallbackAndExecutor.cb));
                    }
                    engineJob.decrementPendingCallbacks();
                } else {
                    throw new IllegalStateException("Already have resource");
                }
            }
            this.stage = Stage.ENCODE;
            try {
                DeferredEncodeManager<?> deferredEncodeManager = this.deferredEncodeManager;
                if (deferredEncodeManager.toEncode != null) {
                    z3 = true;
                }
                if (z3) {
                    DiskCacheProvider diskCacheProvider = this.diskCacheProvider;
                    Options options = this.options;
                    deferredEncodeManager.getClass();
                    ((Engine.LazyDiskCacheProvider) diskCacheProvider).getDiskCache().put(deferredEncodeManager.key, new DataCacheWriter(deferredEncodeManager.encoder, deferredEncodeManager.toEncode, options));
                    deferredEncodeManager.toEncode.unlock();
                }
                ReleaseManager releaseManager = this.releaseManager;
                synchronized (releaseManager) {
                    releaseManager.isEncodeComplete = true;
                    isComplete = releaseManager.isComplete();
                }
                if (isComplete) {
                    releaseInternal();
                }
            } finally {
                if (lockedResource != null) {
                    lockedResource.unlock();
                }
            }
        } else {
            runGenerators();
        }
    }

    public final DataFetcherGenerator getNextGenerator() {
        int ordinal = this.stage.ordinal();
        if (ordinal == 1) {
            return new ResourceCacheGenerator(this.decodeHelper, this);
        }
        if (ordinal == 2) {
            DecodeHelper<R> decodeHelper = this.decodeHelper;
            return new DataCacheGenerator(decodeHelper.getCacheKeys(), decodeHelper, this);
        } else if (ordinal == 3) {
            return new SourceGenerator(this.decodeHelper, this);
        } else {
            if (ordinal == 5) {
                return null;
            }
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Unrecognized stage: ");
            m.append(this.stage);
            throw new IllegalStateException(m.toString());
        }
    }

    public final Stage getNextStage(Stage stage) {
        Stage stage2 = Stage.RESOURCE_CACHE;
        Stage stage3 = Stage.DATA_CACHE;
        Stage stage4 = Stage.FINISHED;
        int ordinal = stage.ordinal();
        if (ordinal != 0) {
            if (ordinal != 1) {
                if (ordinal != 2) {
                    if (ordinal == 3 || ordinal == 5) {
                        return stage4;
                    }
                    throw new IllegalArgumentException("Unrecognized stage: " + stage);
                } else if (this.onlyRetrieveFromCache) {
                    return stage4;
                } else {
                    return Stage.SOURCE;
                }
            } else if (this.diskCacheStrategy.decodeCachedData()) {
                return stage3;
            } else {
                return getNextStage(stage3);
            }
        } else if (this.diskCacheStrategy.decodeCachedResource()) {
            return stage2;
        } else {
            return getNextStage(stage2);
        }
    }

    public final void logWithTimeAndKey(String str, long j, String str2) {
        String str3;
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(" in ");
        sb.append(LogTime.getElapsedMillis(j));
        sb.append(", load key: ");
        sb.append(this.loadKey);
        if (str2 != null) {
            str3 = SupportMenuInflater$$ExternalSyntheticOutline0.m(", ", str2);
        } else {
            str3 = "";
        }
        sb.append(str3);
        sb.append(", thread: ");
        sb.append(Thread.currentThread().getName());
        Log.v("DecodeJob", sb.toString());
    }

    @Override // com.bumptech.glide.load.engine.DataFetcherGenerator.FetcherReadyCallback
    public final void onDataFetcherReady(Key key, Object obj, DataFetcher<?> dataFetcher, DataSource dataSource, Key key2) {
        GlideExecutor glideExecutor;
        this.currentSourceKey = key;
        this.currentData = obj;
        this.currentFetcher = dataFetcher;
        this.currentDataSource = dataSource;
        this.currentAttemptingKey = key2;
        boolean z = false;
        if (key != this.decodeHelper.getCacheKeys().get(0)) {
            z = true;
        }
        this.isLoadingFromAlternateCacheKey = z;
        if (Thread.currentThread() != this.currentThread) {
            this.runReason = RunReason.DECODE_DATA;
            EngineJob engineJob = (EngineJob) this.callback;
            if (engineJob.useUnlimitedSourceGeneratorPool) {
                glideExecutor = engineJob.sourceUnlimitedExecutor;
            } else if (engineJob.useAnimationPool) {
                glideExecutor = engineJob.animationExecutor;
            } else {
                glideExecutor = engineJob.sourceExecutor;
            }
            glideExecutor.execute(this);
            return;
        }
        decodeFromRetrievedData();
    }

    public final void releaseInternal() {
        ReleaseManager releaseManager = this.releaseManager;
        synchronized (releaseManager) {
            releaseManager.isEncodeComplete = false;
            releaseManager.isReleased = false;
            releaseManager.isFailed = false;
        }
        DeferredEncodeManager<?> deferredEncodeManager = this.deferredEncodeManager;
        deferredEncodeManager.key = null;
        deferredEncodeManager.encoder = null;
        deferredEncodeManager.toEncode = null;
        DecodeHelper<R> decodeHelper = this.decodeHelper;
        decodeHelper.glideContext = null;
        decodeHelper.model = null;
        decodeHelper.signature = null;
        decodeHelper.resourceClass = null;
        decodeHelper.transcodeClass = null;
        decodeHelper.options = null;
        decodeHelper.priority = null;
        decodeHelper.transformations = null;
        decodeHelper.diskCacheStrategy = null;
        decodeHelper.loadData.clear();
        decodeHelper.isLoadDataSet = false;
        decodeHelper.cacheKeys.clear();
        decodeHelper.isCacheKeysSet = false;
        this.isCallbackNotified = false;
        this.glideContext = null;
        this.signature = null;
        this.options = null;
        this.priority = null;
        this.loadKey = null;
        this.callback = null;
        this.stage = null;
        this.currentGenerator = null;
        this.currentThread = null;
        this.currentSourceKey = null;
        this.currentData = null;
        this.currentDataSource = null;
        this.currentFetcher = null;
        this.startFetchTime = 0L;
        this.isCancelled = false;
        this.model = null;
        this.throwables.clear();
        this.pool.release(this);
    }

    @Override // com.bumptech.glide.load.engine.DataFetcherGenerator.FetcherReadyCallback
    public final void reschedule() {
        GlideExecutor glideExecutor;
        this.runReason = RunReason.SWITCH_TO_SOURCE_SERVICE;
        EngineJob engineJob = (EngineJob) this.callback;
        if (engineJob.useUnlimitedSourceGeneratorPool) {
            glideExecutor = engineJob.sourceUnlimitedExecutor;
        } else if (engineJob.useAnimationPool) {
            glideExecutor = engineJob.animationExecutor;
        } else {
            glideExecutor = engineJob.sourceExecutor;
        }
        glideExecutor.execute(this);
    }

    @Override // java.lang.Runnable
    public final void run() {
        DataFetcher<?> dataFetcher = this.currentFetcher;
        try {
            try {
                if (this.isCancelled) {
                    notifyFailed();
                    if (dataFetcher != null) {
                        dataFetcher.cleanup();
                        return;
                    }
                    return;
                }
                runWrapped();
                if (dataFetcher != null) {
                    dataFetcher.cleanup();
                }
            } catch (CallbackException e) {
                throw e;
            }
        }
    }

    public final void runWrapped() {
        int ordinal = this.runReason.ordinal();
        if (ordinal == 0) {
            this.stage = getNextStage(Stage.INITIALIZE);
            this.currentGenerator = getNextGenerator();
            runGenerators();
        } else if (ordinal == 1) {
            runGenerators();
        } else if (ordinal == 2) {
            decodeFromRetrievedData();
        } else {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Unrecognized run reason: ");
            m.append(this.runReason);
            throw new IllegalStateException(m.toString());
        }
    }

    public final void setNotifiedOrThrow() {
        Throwable th;
        this.stateVerifier.throwIfRecycled();
        if (this.isCallbackNotified) {
            if (this.throwables.isEmpty()) {
                th = null;
            } else {
                ArrayList arrayList = this.throwables;
                th = (Throwable) arrayList.get(arrayList.size() - 1);
            }
            throw new IllegalStateException("Already notified", th);
        }
        this.isCallbackNotified = true;
    }

    public DecodeJob(DiskCacheProvider diskCacheProvider, FactoryPools.FactoryPool factoryPool) {
        this.diskCacheProvider = diskCacheProvider;
        this.pool = factoryPool;
    }

    public final void notifyFailed() {
        boolean isComplete;
        HashMap hashMap;
        setNotifiedOrThrow();
        GlideException glideException = new GlideException("Failed to load resource", new ArrayList(this.throwables));
        EngineJob engineJob = (EngineJob) this.callback;
        synchronized (engineJob) {
            engineJob.exception = glideException;
        }
        synchronized (engineJob) {
            engineJob.stateVerifier.throwIfRecycled();
            if (engineJob.isCancelled) {
                engineJob.release$1();
            } else if (engineJob.cbs.callbacksAndExecutors.isEmpty()) {
                throw new IllegalStateException("Received an exception without any callbacks to notify");
            } else if (!engineJob.hasLoadFailed) {
                engineJob.hasLoadFailed = true;
                Key key = engineJob.key;
                EngineJob.ResourceCallbacksAndExecutors resourceCallbacksAndExecutors = engineJob.cbs;
                resourceCallbacksAndExecutors.getClass();
                ArrayList<EngineJob.ResourceCallbackAndExecutor> arrayList = new ArrayList(resourceCallbacksAndExecutors.callbacksAndExecutors);
                engineJob.incrementPendingCallbacks(arrayList.size() + 1);
                Engine engine = (Engine) engineJob.engineJobListener;
                synchronized (engine) {
                    Jobs jobs = engine.jobs;
                    jobs.getClass();
                    if (engineJob.onlyRetrieveFromCache) {
                        hashMap = jobs.onlyCacheJobs;
                    } else {
                        hashMap = jobs.jobs;
                    }
                    if (engineJob.equals(hashMap.get(key))) {
                        hashMap.remove(key);
                    }
                }
                for (EngineJob.ResourceCallbackAndExecutor resourceCallbackAndExecutor : arrayList) {
                    resourceCallbackAndExecutor.executor.execute(new EngineJob.CallLoadFailed(resourceCallbackAndExecutor.cb));
                }
                engineJob.decrementPendingCallbacks();
            } else {
                throw new IllegalStateException("Already failed once");
            }
        }
        ReleaseManager releaseManager = this.releaseManager;
        synchronized (releaseManager) {
            releaseManager.isFailed = true;
            isComplete = releaseManager.isComplete();
        }
        if (isComplete) {
            releaseInternal();
        }
    }

    @Override // com.bumptech.glide.load.engine.DataFetcherGenerator.FetcherReadyCallback
    public final void onDataFetcherFailed(Key key, Exception exc, DataFetcher<?> dataFetcher, DataSource dataSource) {
        GlideExecutor glideExecutor;
        dataFetcher.cleanup();
        GlideException glideException = new GlideException("Fetching data failed", Collections.singletonList(exc));
        glideException.setLoggingDetails(key, dataSource, dataFetcher.getDataClass());
        this.throwables.add(glideException);
        if (Thread.currentThread() != this.currentThread) {
            this.runReason = RunReason.SWITCH_TO_SOURCE_SERVICE;
            EngineJob engineJob = (EngineJob) this.callback;
            if (engineJob.useUnlimitedSourceGeneratorPool) {
                glideExecutor = engineJob.sourceUnlimitedExecutor;
            } else if (engineJob.useAnimationPool) {
                glideExecutor = engineJob.animationExecutor;
            } else {
                glideExecutor = engineJob.sourceExecutor;
            }
            glideExecutor.execute(this);
            return;
        }
        runGenerators();
    }

    public final void runGenerators() {
        this.currentThread = Thread.currentThread();
        int i = LogTime.$r8$clinit;
        this.startFetchTime = SystemClock.elapsedRealtimeNanos();
        boolean z = false;
        while (!this.isCancelled && this.currentGenerator != null && !(z = this.currentGenerator.startNext())) {
            this.stage = getNextStage(this.stage);
            this.currentGenerator = getNextGenerator();
            if (this.stage == Stage.SOURCE) {
                reschedule();
                return;
            }
        }
        if ((this.stage == Stage.FINISHED || this.isCancelled) && !z) {
            notifyFailed();
        }
    }

    @Override // com.bumptech.glide.util.pool.FactoryPools.Poolable
    public final StateVerifier.DefaultStateVerifier getVerifier() {
        return this.stateVerifier;
    }
}
