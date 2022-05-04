package com.bumptech.glide.load.engine;

import android.os.SystemClock;
import android.util.Log;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.Encoder;
import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.data.DataFetcher;
import com.bumptech.glide.load.engine.DataFetcherGenerator;
import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.util.LogTime;
import java.util.Collections;
import java.util.List;
/* loaded from: classes.dex */
public class SourceGenerator implements DataFetcherGenerator, DataFetcher.DataCallback<Object>, DataFetcherGenerator.FetcherReadyCallback {
    public final DataFetcherGenerator.FetcherReadyCallback cb;
    public Object dataToCache;
    public final DecodeHelper<?> helper;
    public volatile ModelLoader.LoadData<?> loadData;
    public int loadDataListIndex;
    public DataCacheKey originalKey;
    public DataCacheGenerator sourceCacheGenerator;

    public SourceGenerator(DecodeHelper<?> helper, DataFetcherGenerator.FetcherReadyCallback cb) {
        this.helper = helper;
        this.cb = cb;
    }

    @Override // com.bumptech.glide.load.engine.DataFetcherGenerator
    public void cancel() {
        ModelLoader.LoadData<?> loadData = this.loadData;
        if (loadData != null) {
            loadData.fetcher.cancel();
        }
    }

    @Override // com.bumptech.glide.load.engine.DataFetcherGenerator.FetcherReadyCallback
    public void onDataFetcherFailed(Key sourceKey, Exception e, DataFetcher<?> fetcher, DataSource dataSource) {
        this.cb.onDataFetcherFailed(sourceKey, e, fetcher, this.loadData.fetcher.getDataSource());
    }

    @Override // com.bumptech.glide.load.engine.DataFetcherGenerator.FetcherReadyCallback
    public void onDataFetcherReady(Key sourceKey, Object data, DataFetcher<?> fetcher, DataSource dataSource, Key attemptedKey) {
        this.cb.onDataFetcherReady(sourceKey, data, fetcher, this.loadData.fetcher.getDataSource(), sourceKey);
    }

    @Override // com.bumptech.glide.load.data.DataFetcher.DataCallback
    public void onDataReady(Object data) {
        DiskCacheStrategy diskCacheStrategy = this.helper.diskCacheStrategy;
        if (data == null || !diskCacheStrategy.isDataCacheable(this.loadData.fetcher.getDataSource())) {
            this.cb.onDataFetcherReady(this.loadData.sourceKey, data, this.loadData.fetcher, this.loadData.fetcher.getDataSource(), this.originalKey);
            return;
        }
        this.dataToCache = data;
        this.cb.reschedule();
    }

    @Override // com.bumptech.glide.load.data.DataFetcher.DataCallback
    public void onLoadFailed(Exception e) {
        this.cb.onDataFetcherFailed(this.originalKey, e, this.loadData.fetcher, this.loadData.fetcher.getDataSource());
    }

    @Override // com.bumptech.glide.load.engine.DataFetcherGenerator.FetcherReadyCallback
    public void reschedule() {
        throw new UnsupportedOperationException();
    }

    /* JADX WARN: Finally extract failed */
    @Override // com.bumptech.glide.load.engine.DataFetcherGenerator
    public boolean startNext() {
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
                decodeHelper.getDiskCache().put(this.originalKey, dataCacheWriter);
                if (Log.isLoggable("SourceGenerator", 2)) {
                    String valueOf = String.valueOf(this.originalKey);
                    String valueOf2 = String.valueOf(obj);
                    String valueOf3 = String.valueOf(sourceEncoder);
                    double elapsedMillis = LogTime.getElapsedMillis(elapsedRealtimeNanos);
                    StringBuilder sb = new StringBuilder(valueOf.length() + 95 + valueOf2.length() + valueOf3.length());
                    sb.append("Finished encoding source to cache, key: ");
                    sb.append(valueOf);
                    sb.append(", data: ");
                    sb.append(valueOf2);
                    sb.append(", encoder: ");
                    sb.append(valueOf3);
                    sb.append(", duration: ");
                    sb.append(elapsedMillis);
                    Log.v("SourceGenerator", sb.toString());
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
        boolean z = false;
        while (!z) {
            if (!(this.loadDataListIndex < this.helper.getLoadData().size())) {
                break;
            }
            List<ModelLoader.LoadData<?>> loadData = this.helper.getLoadData();
            int i2 = this.loadDataListIndex;
            this.loadDataListIndex = i2 + 1;
            this.loadData = loadData.get(i2);
            if (this.loadData != null && (this.helper.diskCacheStrategy.isDataCacheable(this.loadData.fetcher.getDataSource()) || this.helper.hasLoadPath(this.loadData.fetcher.getDataClass()))) {
                this.loadData.fetcher.loadData(this.helper.priority, this);
                z = true;
            }
        }
        return z;
    }
}
