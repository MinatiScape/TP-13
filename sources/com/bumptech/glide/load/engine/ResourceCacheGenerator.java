package com.bumptech.glide.load.engine;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import com.bumptech.glide.Registry;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.Transformation;
import com.bumptech.glide.load.data.DataFetcher;
import com.bumptech.glide.load.engine.DataFetcherGenerator;
import com.bumptech.glide.load.engine.Engine;
import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.load.model.ModelLoaderRegistry;
import com.bumptech.glide.provider.ModelToResourceClassCache;
import com.bumptech.glide.util.MultiClassKey;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes.dex */
public final class ResourceCacheGenerator implements DataFetcherGenerator, DataFetcher.DataCallback<Object> {
    public File cacheFile;
    public final DataFetcherGenerator.FetcherReadyCallback cb;
    public ResourceCacheKey currentKey;
    public final DecodeHelper<?> helper;
    public volatile ModelLoader.LoadData<?> loadData;
    public int modelLoaderIndex;
    public List<ModelLoader<File, ?>> modelLoaders;
    public int resourceClassIndex = -1;
    public int sourceIdIndex;
    public Key sourceKey;

    @Override // com.bumptech.glide.load.engine.DataFetcherGenerator
    public final void cancel() {
        ModelLoader.LoadData<?> loadData = this.loadData;
        if (loadData != null) {
            loadData.fetcher.cancel();
        }
    }

    @Override // com.bumptech.glide.load.data.DataFetcher.DataCallback
    public final void onDataReady(Object obj) {
        this.cb.onDataFetcherReady(this.sourceKey, obj, this.loadData.fetcher, DataSource.RESOURCE_DISK_CACHE, this.currentKey);
    }

    @Override // com.bumptech.glide.load.data.DataFetcher.DataCallback
    public final void onLoadFailed(Exception exc) {
        this.cb.onDataFetcherFailed(this.currentKey, exc, this.loadData.fetcher, DataSource.RESOURCE_DISK_CACHE);
    }

    @Override // com.bumptech.glide.load.engine.DataFetcherGenerator
    public final boolean startNext() {
        List<Class<?>> orDefault;
        boolean z;
        boolean z2;
        boolean z3;
        ArrayList dataClasses;
        ArrayList cacheKeys = this.helper.getCacheKeys();
        if (cacheKeys.isEmpty()) {
            return false;
        }
        DecodeHelper<?> decodeHelper = this.helper;
        Registry registry = decodeHelper.glideContext.registry;
        Class<?> cls = decodeHelper.model.getClass();
        Class<?> cls2 = decodeHelper.resourceClass;
        Class<?> cls3 = decodeHelper.transcodeClass;
        ModelToResourceClassCache modelToResourceClassCache = registry.modelToResourceClassCache;
        MultiClassKey andSet = modelToResourceClassCache.resourceClassKeyRef.getAndSet(null);
        if (andSet == null) {
            andSet = new MultiClassKey(cls, cls2, cls3);
        } else {
            andSet.first = cls;
            andSet.second = cls2;
            andSet.third = cls3;
        }
        synchronized (modelToResourceClassCache.registeredResourceClassCache) {
            orDefault = modelToResourceClassCache.registeredResourceClassCache.getOrDefault(andSet, null);
        }
        modelToResourceClassCache.resourceClassKeyRef.set(andSet);
        ArrayList arrayList = orDefault;
        if (orDefault == null) {
            ArrayList arrayList2 = new ArrayList();
            ModelLoaderRegistry modelLoaderRegistry = registry.modelLoaderRegistry;
            synchronized (modelLoaderRegistry) {
                dataClasses = modelLoaderRegistry.multiModelLoaderFactory.getDataClasses(cls);
            }
            Iterator it = dataClasses.iterator();
            while (it.hasNext()) {
                Iterator it2 = registry.decoderRegistry.getResourceClasses((Class) it.next(), cls2).iterator();
                while (it2.hasNext()) {
                    Class cls4 = (Class) it2.next();
                    if (!registry.transcoderRegistry.getTranscodeClasses(cls4, cls3).isEmpty() && !arrayList2.contains(cls4)) {
                        arrayList2.add(cls4);
                    }
                }
            }
            ModelToResourceClassCache modelToResourceClassCache2 = registry.modelToResourceClassCache;
            List<Class<?>> unmodifiableList = Collections.unmodifiableList(arrayList2);
            synchronized (modelToResourceClassCache2.registeredResourceClassCache) {
                modelToResourceClassCache2.registeredResourceClassCache.put(new MultiClassKey(cls, cls2, cls3), unmodifiableList);
            }
            arrayList = arrayList2;
        }
        if (!arrayList.isEmpty()) {
            while (true) {
                List<ModelLoader<File, ?>> list = this.modelLoaders;
                if (list != null) {
                    if (this.modelLoaderIndex < list.size()) {
                        z = true;
                    } else {
                        z = false;
                    }
                    if (z) {
                        this.loadData = null;
                        boolean z4 = false;
                        while (!z4) {
                            if (this.modelLoaderIndex < this.modelLoaders.size()) {
                                z2 = true;
                            } else {
                                z2 = false;
                            }
                            if (!z2) {
                                break;
                            }
                            List<ModelLoader<File, ?>> list2 = this.modelLoaders;
                            int i = this.modelLoaderIndex;
                            this.modelLoaderIndex = i + 1;
                            File file = this.cacheFile;
                            DecodeHelper<?> decodeHelper2 = this.helper;
                            this.loadData = list2.get(i).buildLoadData(file, decodeHelper2.width, decodeHelper2.height, decodeHelper2.options);
                            if (this.loadData != null) {
                                if (this.helper.getLoadPath(this.loadData.fetcher.getDataClass()) != null) {
                                    z3 = true;
                                } else {
                                    z3 = false;
                                }
                                if (z3) {
                                    this.loadData.fetcher.loadData(this.helper.priority, this);
                                    z4 = true;
                                }
                            }
                        }
                        return z4;
                    }
                }
                int i2 = this.resourceClassIndex + 1;
                this.resourceClassIndex = i2;
                if (i2 >= arrayList.size()) {
                    int i3 = this.sourceIdIndex + 1;
                    this.sourceIdIndex = i3;
                    if (i3 >= cacheKeys.size()) {
                        return false;
                    }
                    this.resourceClassIndex = 0;
                }
                Key key = (Key) cacheKeys.get(this.sourceIdIndex);
                Class<?> cls5 = arrayList.get(this.resourceClassIndex);
                Transformation<Z> transformation = this.helper.getTransformation(cls5);
                DecodeHelper<?> decodeHelper3 = this.helper;
                this.currentKey = new ResourceCacheKey(decodeHelper3.glideContext.arrayPool, key, decodeHelper3.signature, decodeHelper3.width, decodeHelper3.height, transformation, cls5, decodeHelper3.options);
                File file2 = ((Engine.LazyDiskCacheProvider) decodeHelper3.diskCacheProvider).getDiskCache().get(this.currentKey);
                this.cacheFile = file2;
                if (file2 != null) {
                    this.sourceKey = key;
                    this.modelLoaders = this.helper.glideContext.registry.getModelLoaders(file2);
                    this.modelLoaderIndex = 0;
                }
            }
        } else if (File.class.equals(this.helper.transcodeClass)) {
            return false;
        } else {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Failed to find any load path from ");
            m.append(this.helper.model.getClass());
            m.append(" to ");
            m.append(this.helper.transcodeClass);
            throw new IllegalStateException(m.toString());
        }
    }

    public ResourceCacheGenerator(DecodeHelper<?> decodeHelper, DataFetcherGenerator.FetcherReadyCallback fetcherReadyCallback) {
        this.helper = decodeHelper;
        this.cb = fetcherReadyCallback;
    }
}
