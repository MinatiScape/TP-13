package com.android.wallpaper.asset;

import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.data.DataFetcher;
import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.load.model.ModelLoaderFactory;
import com.bumptech.glide.load.model.MultiModelLoaderFactory;
import java.io.InputStream;
/* loaded from: classes.dex */
public final class ResourceAssetLoader implements ModelLoader<ResourceAsset, InputStream> {

    /* loaded from: classes.dex */
    public static class ResourceAssetFetcher implements DataFetcher<InputStream> {
        public ResourceAsset mResourceAsset;

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final void cancel() {
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final void cleanup() {
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final void loadData(Priority priority, DataFetcher.DataCallback<? super InputStream> dataCallback) {
            ResourceAsset resourceAsset = this.mResourceAsset;
            dataCallback.onDataReady(resourceAsset.mRes.openRawResource(resourceAsset.mResId));
        }

        public ResourceAssetFetcher(ResourceAsset resourceAsset) {
            this.mResourceAsset = resourceAsset;
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final Class<InputStream> getDataClass() {
            return InputStream.class;
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final DataSource getDataSource() {
            return DataSource.LOCAL;
        }
    }

    /* loaded from: classes.dex */
    public static class ResourceAssetLoaderFactory implements ModelLoaderFactory<ResourceAsset, InputStream> {
        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public final ModelLoader<ResourceAsset, InputStream> build(MultiModelLoaderFactory multiModelLoaderFactory) {
            return new ResourceAssetLoader();
        }
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final ModelLoader.LoadData<InputStream> buildLoadData(ResourceAsset resourceAsset, int i, int i2, Options options) {
        ResourceAsset resourceAsset2 = resourceAsset;
        return new ModelLoader.LoadData<>(resourceAsset2.getKey(), new ResourceAssetFetcher(resourceAsset2));
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final /* bridge */ /* synthetic */ boolean handles(ResourceAsset resourceAsset) {
        return true;
    }
}
