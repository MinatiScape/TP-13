package com.bumptech.glide.load.model.stream;

import com.bumptech.glide.load.Option;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.data.HttpUrlFetcher;
import com.bumptech.glide.load.model.GlideUrl;
import com.bumptech.glide.load.model.ModelCache;
import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.load.model.ModelLoaderFactory;
import com.bumptech.glide.load.model.MultiModelLoaderFactory;
import java.io.InputStream;
import java.util.Objects;
/* loaded from: classes.dex */
public class HttpGlideUrlLoader implements ModelLoader<GlideUrl, InputStream> {
    public static final Option<Integer> TIMEOUT = Option.memory("com.bumptech.glide.load.model.stream.HttpGlideUrlLoader.Timeout", 2500);
    public final ModelCache<GlideUrl, GlideUrl> modelCache;

    /* loaded from: classes.dex */
    public static class Factory implements ModelLoaderFactory<GlideUrl, InputStream> {
        public final ModelCache<GlideUrl, GlideUrl> modelCache = new ModelCache<>(500);

        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public ModelLoader<GlideUrl, InputStream> build(MultiModelLoaderFactory multiFactory) {
            return new HttpGlideUrlLoader(this.modelCache);
        }
    }

    public HttpGlideUrlLoader(ModelCache<GlideUrl, GlideUrl> modelCache) {
        this.modelCache = modelCache;
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public ModelLoader.LoadData<InputStream> buildLoadData(GlideUrl model, int width, int height, Options options) {
        GlideUrl glideUrl = model;
        ModelCache<GlideUrl, GlideUrl> modelCache = this.modelCache;
        if (modelCache != null) {
            ModelCache.ModelKey<GlideUrl> modelKey = ModelCache.ModelKey.get(glideUrl, 0, 0);
            GlideUrl glideUrl2 = modelCache.cache.get(modelKey);
            modelKey.release();
            GlideUrl glideUrl3 = glideUrl2;
            if (glideUrl3 == null) {
                ModelCache<GlideUrl, GlideUrl> modelCache2 = this.modelCache;
                Objects.requireNonNull(modelCache2);
                modelCache2.cache.put(ModelCache.ModelKey.get(glideUrl, 0, 0), glideUrl);
            } else {
                glideUrl = glideUrl3;
            }
        }
        return new ModelLoader.LoadData<>(glideUrl, new HttpUrlFetcher(glideUrl, ((Integer) options.get(TIMEOUT)).intValue(), HttpUrlFetcher.DEFAULT_CONNECTION_FACTORY));
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public /* bridge */ /* synthetic */ boolean handles(GlideUrl model) {
        return true;
    }
}
