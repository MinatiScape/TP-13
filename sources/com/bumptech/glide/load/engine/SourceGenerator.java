package com.bumptech.glide.load.engine;

import android.os.SystemClock;
import android.util.Log;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.Encoder;
import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.data.DataFetcher;
import com.bumptech.glide.load.engine.DataFetcherGenerator;
import com.bumptech.glide.load.engine.Engine;
import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.util.LogTime;
import java.util.ArrayList;
import java.util.Collections;
/* loaded from: classes.dex */
public final class SourceGenerator implements DataFetcherGenerator, DataFetcherGenerator.FetcherReadyCallback {
    public final DataFetcherGenerator.FetcherReadyCallback cb;
    public Object dataToCache;
    public final DecodeHelper<?> helper;
    public volatile ModelLoader.LoadData<?> loadData;
    public int loadDataListIndex;
    public DataCacheKey originalKey;
    public DataCacheGenerator sourceCacheGenerator;

    @Override // com.bumptech.glide.load.engine.DataFetcherGenerator
    public final void cancel() {
        ModelLoader.LoadData<?> loadData = this.loadData;
        if (loadData != null) {
            loadData.fetcher.cancel();
        }
    }

    @Override // com.bumptech.glide.load.engine.DataFetcherGenerator.FetcherReadyCallback
    public final void onDataFetcherFailed(Key key, Exception exc, DataFetcher<?> dataFetcher, DataSource dataSource) {
        this.cb.onDataFetcherFailed(key, exc, dataFetcher, this.loadData.fetcher.getDataSource());
    }

    @Override // com.bumptech.glide.load.engine.DataFetcherGenerator.FetcherReadyCallback
    public final void onDataFetcherReady(Key key, Object obj, DataFetcher<?> dataFetcher, DataSource dataSource, Key key2) {
        this.cb.onDataFetcherReady(key, obj, dataFetcher, this.loadData.fetcher.getDataSource(), key);
    }

    @Override // com.bumptech.glide.load.engine.DataFetcherGenerator.FetcherReadyCallback
    public final void reschedule() {
        throw new UnsupportedOperationException();
    }

    /* JADX WARN: Finally extract failed */
    @Override // com.bumptech.glide.load.engine.DataFetcherGenerator
    public final boolean startNext() {
        boolean z;
        boolean z2;
        Object obj = this.dataToCache;
        if (obj != null) {
            this.dataToCache = null;
            int i = LogTime.$r8$clinit;
            long elapsedRealtimeNanos = SystemClock.elapsedRealtimeNanos();
            try {
                Encoder<X> sourceEncoder = this.helper.getSourceEncoder(obj);
                DataCacheWriter dataCacheWriter = new DataCacheWriter(sourceEncoder, obj, this.helper.options);
                Key key = this.loadData.sourceKey;
                DecodeHelper<?> decodeHelper = this.helper;
                this.originalKey = new DataCacheKey(key, decodeHelper.signature);
                ((Engine.LazyDiskCacheProvider) decodeHelper.diskCacheProvider).getDiskCache().put(this.originalKey, dataCacheWriter);
                if (Log.isLoggable("SourceGenerator", 2)) {
                    Log.v("SourceGenerator", "Finished encoding source to cache, key: " + this.originalKey + ", data: " + obj + ", encoder: " + sourceEncoder + ", duration: " + LogTime.getElapsedMillis(elapsedRealtimeNanos));
                }
                this.loadData.fetcher.cleanup();
                this.sourceCacheGenerator = new DataCacheGenerator(Collections.singletonList(this.loadData.sourceKey), this.helper, this);
            } catch (Throwable th) {
                this.loadData.fetcher.cleanup();
                throw th;
            }
        }
        DataCacheGenerator dataCacheGenerator = this.sourceCacheGenerator;
        if (dataCacheGenerator != null && dataCacheGenerator.startNext()) {
            return true;
        }
        this.sourceCacheGenerator = null;
        this.loadData = null;
        boolean z3 = false;
        while (!z3) {
            if (this.loadDataListIndex < this.helper.getLoadData().size()) {
                z = true;
            } else {
                z = false;
            }
            if (!z) {
                break;
            }
            ArrayList loadData = this.helper.getLoadData();
            int i2 = this.loadDataListIndex;
            this.loadDataListIndex = i2 + 1;
            this.loadData = (ModelLoader.LoadData) loadData.get(i2);
            if (this.loadData != null) {
                if (!this.helper.diskCacheStrategy.isDataCacheable(this.loadData.fetcher.getDataSource())) {
                    if (this.helper.getLoadPath(this.loadData.fetcher.getDataClass()) != null) {
                        z2 = true;
                    } else {
                        z2 = false;
                    }
                    if (z2) {
                    }
                }
                final ModelLoader.LoadData<?> loadData2 = this.loadData;
                this.loadData.fetcher.loadData(this.helper.priority, new DataFetcher.DataCallback<Object>() { // from class: com.bumptech.glide.load.engine.SourceGenerator.1
                    @Override // com.bumptech.glide.load.data.DataFetcher.DataCallback
                    public final void onDataReady(Object obj2) {
                        boolean z4;
                        SourceGenerator sourceGenerator = SourceGenerator.this;
                        ModelLoader.LoadData<?> loadData3 = loadData2;
                        ModelLoader.LoadData<?> loadData4 = sourceGenerator.loadData;
                        if (loadData4 == null || loadData4 != loadData3) {
                            z4 = false;
                        } else {
                            z4 = true;
                        }
                        if (z4) {
                            SourceGenerator sourceGenerator2 = SourceGenerator.this;
                            ModelLoader.LoadData loadData5 = loadData2;
                            DiskCacheStrategy diskCacheStrategy = sourceGenerator2.helper.diskCacheStrategy;
                            if (obj2 == null || !diskCacheStrategy.isDataCacheable(loadData5.fetcher.getDataSource())) {
                                DataFetcherGenerator.FetcherReadyCallback fetcherReadyCallback = sourceGenerator2.cb;
                                Key key2 = loadData5.sourceKey;
                                DataFetcher<Data> dataFetcher = loadData5.fetcher;
                                fetcherReadyCallback.onDataFetcherReady(key2, obj2, dataFetcher, dataFetcher.getDataSource(), sourceGenerator2.originalKey);
                                return;
                            }
                            sourceGenerator2.dataToCache = obj2;
                            sourceGenerator2.cb.reschedule();
                        }
                    }

                    @Override // com.bumptech.glide.load.data.DataFetcher.DataCallback
                    public final void onLoadFailed(Exception exc) {
                        boolean z4;
                        SourceGenerator sourceGenerator = SourceGenerator.this;
                        ModelLoader.LoadData<?> loadData3 = loadData2;
                        ModelLoader.LoadData<?> loadData4 = sourceGenerator.loadData;
                        if (loadData4 == null || loadData4 != loadData3) {
                            z4 = false;
                        } else {
                            z4 = true;
                        }
                        if (z4) {
                            SourceGenerator sourceGenerator2 = SourceGenerator.this;
                            ModelLoader.LoadData loadData5 = loadData2;
                            DataFetcherGenerator.FetcherReadyCallback fetcherReadyCallback = sourceGenerator2.cb;
                            Key key2 = sourceGenerator2.originalKey;
                            DataFetcher<Data> dataFetcher = loadData5.fetcher;
                            fetcherReadyCallback.onDataFetcherFailed(key2, exc, dataFetcher, dataFetcher.getDataSource());
                        }
                    }
                });
                z3 = true;
            }
        }
        return z3;
    }

    public SourceGenerator(DecodeHelper<?> decodeHelper, DataFetcherGenerator.FetcherReadyCallback fetcherReadyCallback) {
        this.helper = decodeHelper;
        this.cb = fetcherReadyCallback;
    }
}
