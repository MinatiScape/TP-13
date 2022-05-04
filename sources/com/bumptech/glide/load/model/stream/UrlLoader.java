package com.bumptech.glide.load.model.stream;

import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.model.GlideUrl;
import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.load.model.ModelLoaderFactory;
import com.bumptech.glide.load.model.MultiModelLoaderFactory;
import java.io.InputStream;
import java.net.URL;
/* loaded from: classes.dex */
public class UrlLoader implements ModelLoader<URL, InputStream> {
    public final ModelLoader<GlideUrl, InputStream> glideUrlLoader;

    /* loaded from: classes.dex */
    public static class StreamFactory implements ModelLoaderFactory<URL, InputStream> {
        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public ModelLoader<URL, InputStream> build(MultiModelLoaderFactory multiFactory) {
            return new UrlLoader(multiFactory.build(GlideUrl.class, InputStream.class));
        }
    }

    public UrlLoader(ModelLoader<GlideUrl, InputStream> glideUrlLoader) {
        this.glideUrlLoader = glideUrlLoader;
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public ModelLoader.LoadData<InputStream> buildLoadData(URL model, int width, int height, Options options) {
        return this.glideUrlLoader.buildLoadData(new GlideUrl(model), width, height, options);
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public /* bridge */ /* synthetic */ boolean handles(URL model) {
        return true;
    }
}
