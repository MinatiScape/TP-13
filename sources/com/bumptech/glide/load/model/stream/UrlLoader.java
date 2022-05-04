package com.bumptech.glide.load.model.stream;

import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.model.GlideUrl;
import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.load.model.ModelLoaderFactory;
import com.bumptech.glide.load.model.MultiModelLoaderFactory;
import java.io.InputStream;
import java.net.URL;
/* loaded from: classes.dex */
public final class UrlLoader implements ModelLoader<URL, InputStream> {
    public final ModelLoader<GlideUrl, InputStream> glideUrlLoader;

    /* loaded from: classes.dex */
    public static class StreamFactory implements ModelLoaderFactory<URL, InputStream> {
        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public final ModelLoader<URL, InputStream> build(MultiModelLoaderFactory multiModelLoaderFactory) {
            return new UrlLoader(multiModelLoaderFactory.build(GlideUrl.class, InputStream.class));
        }
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final ModelLoader.LoadData<InputStream> buildLoadData(URL url, int i, int i2, Options options) {
        return this.glideUrlLoader.buildLoadData(new GlideUrl(url), i, i2, options);
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final /* bridge */ /* synthetic */ boolean handles(URL url) {
        return true;
    }

    public UrlLoader(ModelLoader<GlideUrl, InputStream> modelLoader) {
        this.glideUrlLoader = modelLoader;
    }
}
