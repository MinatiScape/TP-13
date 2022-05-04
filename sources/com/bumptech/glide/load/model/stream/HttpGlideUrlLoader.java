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
/* loaded from: classes.dex */
public final class HttpGlideUrlLoader implements ModelLoader<GlideUrl, InputStream> {
    public static final Option<Integer> TIMEOUT = Option.memory("com.bumptech.glide.load.model.stream.HttpGlideUrlLoader.Timeout", 2500);
    public final ModelCache<GlideUrl, GlideUrl> modelCache;

    /* loaded from: classes.dex */
    public static class Factory implements ModelLoaderFactory<GlideUrl, InputStream> {
        public final ModelCache<GlideUrl, GlideUrl> modelCache = new ModelCache<>();

        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public final ModelLoader<GlideUrl, InputStream> build(MultiModelLoaderFactory multiModelLoaderFactory) {
            return new HttpGlideUrlLoader(this.modelCache);
        }
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final ModelLoader.LoadData<InputStream> buildLoadData(GlideUrl glideUrl, int i, int i2, Options options) {
        GlideUrl glideUrl2 = glideUrl;
        ModelCache<GlideUrl, GlideUrl> modelCache = this.modelCache;
        if (modelCache != null) {
            GlideUrl glideUrl3 = (GlideUrl) modelCache.get(glideUrl2);
            if (glideUrl3 == null) {
                this.modelCache.put(glideUrl2, glideUrl2);
            } else {
                glideUrl2 = glideUrl3;
            }
        }
        return new ModelLoader.LoadData<>(glideUrl2, new HttpUrlFetcher(glideUrl2, ((Integer) options.get(TIMEOUT)).intValue(), HttpUrlFetcher.DEFAULT_CONNECTION_FACTORY));
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final /* bridge */ /* synthetic */ boolean handles(GlideUrl glideUrl) {
        return true;
    }

    public HttpGlideUrlLoader(ModelCache<GlideUrl, GlideUrl> modelCache) {
        this.modelCache = modelCache;
    }
}
