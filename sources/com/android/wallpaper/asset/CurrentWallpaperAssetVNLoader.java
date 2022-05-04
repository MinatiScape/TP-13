package com.android.wallpaper.asset;

import android.os.ParcelFileDescriptor;
import com.android.wallpaper.asset.CurrentWallpaperAssetVN;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.data.DataFetcher;
import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.load.model.ModelLoaderFactory;
import com.bumptech.glide.load.model.MultiModelLoaderFactory;
import java.io.InputStream;
/* loaded from: classes.dex */
public final class CurrentWallpaperAssetVNLoader implements ModelLoader<CurrentWallpaperAssetVN, InputStream> {

    /* loaded from: classes.dex */
    public static class CurrentWallpaperAssetVNDataFetcher implements DataFetcher<InputStream> {
        public CurrentWallpaperAssetVN mAsset;

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final void cancel() {
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final void cleanup() {
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final void loadData(Priority priority, DataFetcher.DataCallback<? super InputStream> dataCallback) {
            CurrentWallpaperAssetVN currentWallpaperAssetVN = this.mAsset;
            ParcelFileDescriptor wallpaperFile = currentWallpaperAssetVN.mWallpaperManagerCompat.getWallpaperFile(currentWallpaperAssetVN.mWallpaperManagerFlag);
            if (wallpaperFile == null) {
                dataCallback.onLoadFailed(new Exception("ParcelFileDescriptor for wallpaper is null, unable to open InputStream."));
            } else {
                dataCallback.onDataReady(new ParcelFileDescriptor.AutoCloseInputStream(wallpaperFile));
            }
        }

        public CurrentWallpaperAssetVNDataFetcher(CurrentWallpaperAssetVN currentWallpaperAssetVN) {
            this.mAsset = currentWallpaperAssetVN;
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
    public static class CurrentWallpaperAssetVNLoaderFactory implements ModelLoaderFactory<CurrentWallpaperAssetVN, InputStream> {
        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public final ModelLoader<CurrentWallpaperAssetVN, InputStream> build(MultiModelLoaderFactory multiModelLoaderFactory) {
            return new CurrentWallpaperAssetVNLoader();
        }
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final ModelLoader.LoadData<InputStream> buildLoadData(CurrentWallpaperAssetVN currentWallpaperAssetVN, int i, int i2, Options options) {
        CurrentWallpaperAssetVN currentWallpaperAssetVN2 = currentWallpaperAssetVN;
        return new ModelLoader.LoadData<>(new CurrentWallpaperAssetVN.CurrentWallpaperVNKey(currentWallpaperAssetVN2.mWallpaperManager, currentWallpaperAssetVN2.mWallpaperManagerFlag), new CurrentWallpaperAssetVNDataFetcher(currentWallpaperAssetVN2));
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final /* bridge */ /* synthetic */ boolean handles(CurrentWallpaperAssetVN currentWallpaperAssetVN) {
        return true;
    }
}
