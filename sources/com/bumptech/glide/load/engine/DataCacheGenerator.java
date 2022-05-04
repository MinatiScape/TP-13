package com.bumptech.glide.load.engine;

import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.data.DataFetcher;
import com.bumptech.glide.load.engine.DataFetcherGenerator;
import com.bumptech.glide.load.engine.Engine;
import com.bumptech.glide.load.model.ModelLoader;
import java.io.File;
import java.util.List;
/* loaded from: classes.dex */
public final class DataCacheGenerator implements DataFetcherGenerator, DataFetcher.DataCallback<Object> {
    public File cacheFile;
    public final List<Key> cacheKeys;
    public final DataFetcherGenerator.FetcherReadyCallback cb;
    public final DecodeHelper<?> helper;
    public volatile ModelLoader.LoadData<?> loadData;
    public int modelLoaderIndex;
    public List<ModelLoader<File, ?>> modelLoaders;
    public int sourceIdIndex = -1;
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
        this.cb.onDataFetcherReady(this.sourceKey, obj, this.loadData.fetcher, DataSource.DATA_DISK_CACHE, this.sourceKey);
    }

    @Override // com.bumptech.glide.load.data.DataFetcher.DataCallback
    public final void onLoadFailed(Exception exc) {
        this.cb.onDataFetcherFailed(this.sourceKey, exc, this.loadData.fetcher, DataSource.DATA_DISK_CACHE);
    }

    @Override // com.bumptech.glide.load.engine.DataFetcherGenerator
    public final boolean startNext() {
        boolean z;
        boolean z2;
        boolean z3;
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
                        DecodeHelper<?> decodeHelper = this.helper;
                        this.loadData = list2.get(i).buildLoadData(file, decodeHelper.width, decodeHelper.height, decodeHelper.options);
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
            int i2 = this.sourceIdIndex + 1;
            this.sourceIdIndex = i2;
            if (i2 >= this.cacheKeys.size()) {
                return false;
            }
            Key key = this.cacheKeys.get(this.sourceIdIndex);
            DecodeHelper<?> decodeHelper2 = this.helper;
            File file2 = ((Engine.LazyDiskCacheProvider) decodeHelper2.diskCacheProvider).getDiskCache().get(new DataCacheKey(key, decodeHelper2.signature));
            this.cacheFile = file2;
            if (file2 != null) {
                this.sourceKey = key;
                this.modelLoaders = this.helper.glideContext.registry.getModelLoaders(file2);
                this.modelLoaderIndex = 0;
            }
        }
    }

    public DataCacheGenerator(List<Key> list, DecodeHelper<?> decodeHelper, DataFetcherGenerator.FetcherReadyCallback fetcherReadyCallback) {
        this.cacheKeys = list;
        this.helper = decodeHelper;
        this.cb = fetcherReadyCallback;
    }
}
