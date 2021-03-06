package com.android.wallpaper.asset;

import android.graphics.drawable.Drawable;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.Log;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.data.DataFetcher;
import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.load.model.ModelLoaderFactory;
import com.bumptech.glide.load.model.MultiModelLoaderFactory;
import com.bumptech.glide.signature.ObjectKey;
/* loaded from: classes.dex */
public final class WallpaperModelLoader implements ModelLoader<WallpaperModel, Drawable> {

    /* loaded from: classes.dex */
    public static class WallpaperFetcher implements DataFetcher<Drawable> {
        public int mHeight;
        public WallpaperModel mWallpaperModel;
        public int mWidth;

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final void cancel() {
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final void cleanup() {
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final void loadData(Priority priority, DataFetcher.DataCallback<? super Drawable> dataCallback) {
            Drawable drawable;
            WallpaperModel wallpaperModel = this.mWallpaperModel;
            int i = this.mWidth;
            int i2 = this.mHeight;
            if (wallpaperModel.mWallpaperSource != 0) {
                StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Invalid wallpaper data source: ");
                m.append(wallpaperModel.mWallpaperSource);
                Log.e("WallpaperModel", m.toString());
                drawable = null;
            } else {
                drawable = wallpaperModel.mWallpaperManager.getBuiltInDrawable(i, i2, true, 0.5f, 0.5f);
            }
            dataCallback.onDataReady(drawable);
        }

        public WallpaperFetcher(WallpaperModel wallpaperModel, int i, int i2) {
            this.mWallpaperModel = wallpaperModel;
            this.mWidth = i;
            this.mHeight = i2;
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

    /* loaded from: classes.dex */
    public static class WallpaperModelLoaderFactory implements ModelLoaderFactory<WallpaperModel, Drawable> {
        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public final ModelLoader<WallpaperModel, Drawable> build(MultiModelLoaderFactory multiModelLoaderFactory) {
            return new WallpaperModelLoader();
        }
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final ModelLoader.LoadData<Drawable> buildLoadData(WallpaperModel wallpaperModel, int i, int i2, Options options) {
        WallpaperModel wallpaperModel2 = wallpaperModel;
        if (wallpaperModel2.mWallpaperSource != 0) {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Invalid wallpaper data source: ");
            m.append(wallpaperModel2.mWallpaperSource);
            Log.e("WallpaperModel", m.toString());
        }
        return new ModelLoader.LoadData<>(new ObjectKey(wallpaperModel2), new WallpaperFetcher(wallpaperModel2, i, i2));
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final /* bridge */ /* synthetic */ boolean handles(WallpaperModel wallpaperModel) {
        return true;
    }
}
