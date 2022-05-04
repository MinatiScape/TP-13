package com.bumptech.glide;

import androidx.collection.ArrayMap;
import com.bumptech.glide.Glide;
import com.bumptech.glide.GlideExperiments;
import com.bumptech.glide.load.engine.Engine;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import com.bumptech.glide.load.engine.bitmap_recycle.LruArrayPool;
import com.bumptech.glide.load.engine.cache.DiskCache;
import com.bumptech.glide.load.engine.cache.LruResourceCache;
import com.bumptech.glide.load.engine.cache.MemorySizeCalculator;
import com.bumptech.glide.load.engine.executor.GlideExecutor;
import com.bumptech.glide.manager.DefaultConnectivityMonitorFactory;
import com.bumptech.glide.manager.RequestManagerRetriever;
import com.bumptech.glide.request.RequestListener;
import com.bumptech.glide.request.RequestOptions;
import java.util.List;
/* loaded from: classes.dex */
public final class GlideBuilder {
    public GlideExecutor animationExecutor;
    public LruArrayPool arrayPool;
    public BitmapPool bitmapPool;
    public DefaultConnectivityMonitorFactory connectivityMonitorFactory;
    public List<RequestListener<Object>> defaultRequestListeners;
    public GlideExecutor diskCacheExecutor;
    public DiskCache.Factory diskCacheFactory;
    public Engine engine;
    public LruResourceCache memoryCache;
    public MemorySizeCalculator memorySizeCalculator;
    public RequestManagerRetriever.RequestManagerFactory requestManagerFactory;
    public GlideExecutor sourceExecutor;
    public final ArrayMap defaultTransitionOptions = new ArrayMap();
    public final GlideExperiments.Builder glideExperimentsBuilder = new GlideExperiments.Builder();
    public int logLevel = 4;
    public Glide.RequestOptionsFactory defaultRequestOptionsFactory = new Glide.RequestOptionsFactory() { // from class: com.bumptech.glide.GlideBuilder.1
        @Override // com.bumptech.glide.Glide.RequestOptionsFactory
        public final RequestOptions build() {
            return new RequestOptions();
        }
    };

    /* loaded from: classes.dex */
    public static final class EnableImageDecoderForBitmaps {
        public EnableImageDecoderForBitmaps() {
            throw null;
        }
    }

    /* loaded from: classes.dex */
    public static final class LogRequestOrigins {
        public LogRequestOrigins() {
            throw null;
        }
    }
}
