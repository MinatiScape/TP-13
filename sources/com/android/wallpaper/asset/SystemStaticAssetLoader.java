package com.android.wallpaper.asset;

import com.android.wallpaper.asset.ResourceAssetLoader;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.load.model.ModelLoaderFactory;
import com.bumptech.glide.load.model.MultiModelLoaderFactory;
import java.io.InputStream;
/* loaded from: classes.dex */
public final class SystemStaticAssetLoader implements ModelLoader<SystemStaticAsset, InputStream> {

    /* loaded from: classes.dex */
    public static class SystemStaticAssetLoaderFactory implements ModelLoaderFactory<SystemStaticAsset, InputStream> {
        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public final ModelLoader<SystemStaticAsset, InputStream> build(MultiModelLoaderFactory multiModelLoaderFactory) {
            return new SystemStaticAssetLoader();
        }
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final ModelLoader.LoadData<InputStream> buildLoadData(SystemStaticAsset systemStaticAsset, int i, int i2, Options options) {
        SystemStaticAsset systemStaticAsset2 = systemStaticAsset;
        return new ModelLoader.LoadData<>(systemStaticAsset2.getKey(), new ResourceAssetLoader.ResourceAssetFetcher(systemStaticAsset2));
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final /* bridge */ /* synthetic */ boolean handles(SystemStaticAsset systemStaticAsset) {
        return true;
    }
}
