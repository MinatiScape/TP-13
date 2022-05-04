package com.android.wallpaper.asset;

import android.graphics.drawable.Drawable;
import com.android.wallpaper.asset.LiveWallpaperThumbAsset;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.data.DataFetcher;
import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.load.model.ModelLoaderFactory;
import com.bumptech.glide.load.model.MultiModelLoaderFactory;
/* loaded from: classes.dex */
public final class LiveWallpaperThumbAssetLoader implements ModelLoader<LiveWallpaperThumbAsset, Drawable> {

    /* loaded from: classes.dex */
    public static class LiveWallpaperThumbAssetLoaderFactory implements ModelLoaderFactory<LiveWallpaperThumbAsset, Drawable> {
        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public final ModelLoader<LiveWallpaperThumbAsset, Drawable> build(MultiModelLoaderFactory multiModelLoaderFactory) {
            return new LiveWallpaperThumbAssetLoader();
        }
    }

    /* loaded from: classes.dex */
    public static class LiveWallpaperThumbFetcher implements DataFetcher<Drawable> {
        public LiveWallpaperThumbAsset mLiveWallpaperThumbAsset;

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final void cancel() {
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final void cleanup() {
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final void loadData(Priority priority, DataFetcher.DataCallback<? super Drawable> dataCallback) {
            dataCallback.onDataReady(this.mLiveWallpaperThumbAsset.getThumbnailDrawable());
        }

        public LiveWallpaperThumbFetcher(LiveWallpaperThumbAsset liveWallpaperThumbAsset) {
            this.mLiveWallpaperThumbAsset = liveWallpaperThumbAsset;
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final Class<Drawable> getDataClass() {
            return Drawable.class;
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final DataSource getDataSource() {
            return DataSource.LOCAL;
        }
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final ModelLoader.LoadData<Drawable> buildLoadData(LiveWallpaperThumbAsset liveWallpaperThumbAsset, int i, int i2, Options options) {
        LiveWallpaperThumbAsset liveWallpaperThumbAsset2 = liveWallpaperThumbAsset;
        return new ModelLoader.LoadData<>(new LiveWallpaperThumbAsset.LiveWallpaperThumbKey(liveWallpaperThumbAsset2.mInfo), new LiveWallpaperThumbFetcher(liveWallpaperThumbAsset2));
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final /* bridge */ /* synthetic */ boolean handles(LiveWallpaperThumbAsset liveWallpaperThumbAsset) {
        return true;
    }
}
