package com.bumptech.glide.load.model;

import android.content.res.AssetManager;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.data.DataFetcher;
import com.bumptech.glide.load.data.FileDescriptorAssetPathFetcher;
import com.bumptech.glide.load.data.StreamAssetPathFetcher;
import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.signature.ObjectKey;
import java.io.InputStream;
/* loaded from: classes.dex */
public final class AssetUriLoader<Data> implements ModelLoader<Uri, Data> {
    public final AssetManager assetManager;
    public final AssetFetcherFactory<Data> factory;

    /* loaded from: classes.dex */
    public interface AssetFetcherFactory<Data> {
        DataFetcher<Data> buildFetcher(AssetManager assetManager, String str);
    }

    /* loaded from: classes.dex */
    public static class FileDescriptorFactory implements ModelLoaderFactory<Uri, ParcelFileDescriptor>, AssetFetcherFactory<ParcelFileDescriptor> {
        public final AssetManager assetManager;

        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public final ModelLoader<Uri, ParcelFileDescriptor> build(MultiModelLoaderFactory multiModelLoaderFactory) {
            return new AssetUriLoader(this.assetManager, this);
        }

        @Override // com.bumptech.glide.load.model.AssetUriLoader.AssetFetcherFactory
        public final DataFetcher<ParcelFileDescriptor> buildFetcher(AssetManager assetManager, String str) {
            return new FileDescriptorAssetPathFetcher(assetManager, str);
        }

        public FileDescriptorFactory(AssetManager assetManager) {
            this.assetManager = assetManager;
        }
    }

    /* loaded from: classes.dex */
    public static class StreamFactory implements ModelLoaderFactory<Uri, InputStream>, AssetFetcherFactory<InputStream> {
        public final AssetManager assetManager;

        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public final ModelLoader<Uri, InputStream> build(MultiModelLoaderFactory multiModelLoaderFactory) {
            return new AssetUriLoader(this.assetManager, this);
        }

        @Override // com.bumptech.glide.load.model.AssetUriLoader.AssetFetcherFactory
        public final DataFetcher<InputStream> buildFetcher(AssetManager assetManager, String str) {
            return new StreamAssetPathFetcher(assetManager, str);
        }

        public StreamFactory(AssetManager assetManager) {
            this.assetManager = assetManager;
        }
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final ModelLoader.LoadData buildLoadData(Uri uri, int i, int i2, Options options) {
        Uri uri2 = uri;
        return new ModelLoader.LoadData(new ObjectKey(uri2), this.factory.buildFetcher(this.assetManager, uri2.toString().substring(22)));
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final boolean handles(Uri uri) {
        Uri uri2 = uri;
        if (!"file".equals(uri2.getScheme()) || uri2.getPathSegments().isEmpty() || !"android_asset".equals(uri2.getPathSegments().get(0))) {
            return false;
        }
        return true;
    }

    public AssetUriLoader(AssetManager assetManager, AssetFetcherFactory<Data> assetFetcherFactory) {
        this.assetManager = assetManager;
        this.factory = assetFetcherFactory;
    }
}
