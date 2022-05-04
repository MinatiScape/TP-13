package com.bumptech.glide.load.model;

import android.content.ContentResolver;
import android.content.res.AssetFileDescriptor;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.data.AssetFileDescriptorLocalUriFetcher;
import com.bumptech.glide.load.data.DataFetcher;
import com.bumptech.glide.load.data.FileDescriptorLocalUriFetcher;
import com.bumptech.glide.load.data.StreamLocalUriFetcher;
import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.signature.ObjectKey;
import java.io.InputStream;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
/* loaded from: classes.dex */
public final class UriLoader<Data> implements ModelLoader<Uri, Data> {
    public static final Set<String> SCHEMES = Collections.unmodifiableSet(new HashSet(Arrays.asList("file", "android.resource", "content")));
    public final LocalUriFetcherFactory<Data> factory;

    /* loaded from: classes.dex */
    public static final class AssetFileDescriptorFactory implements ModelLoaderFactory<Uri, AssetFileDescriptor>, LocalUriFetcherFactory<AssetFileDescriptor> {
        public final ContentResolver contentResolver;

        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public final ModelLoader<Uri, AssetFileDescriptor> build(MultiModelLoaderFactory multiModelLoaderFactory) {
            return new UriLoader(this);
        }

        @Override // com.bumptech.glide.load.model.UriLoader.LocalUriFetcherFactory
        public final DataFetcher<AssetFileDescriptor> build(Uri uri) {
            return new AssetFileDescriptorLocalUriFetcher(this.contentResolver, uri);
        }

        public AssetFileDescriptorFactory(ContentResolver contentResolver) {
            this.contentResolver = contentResolver;
        }
    }

    /* loaded from: classes.dex */
    public static class FileDescriptorFactory implements ModelLoaderFactory<Uri, ParcelFileDescriptor>, LocalUriFetcherFactory<ParcelFileDescriptor> {
        public final ContentResolver contentResolver;

        @Override // com.bumptech.glide.load.model.UriLoader.LocalUriFetcherFactory
        public final DataFetcher<ParcelFileDescriptor> build(Uri uri) {
            return new FileDescriptorLocalUriFetcher(this.contentResolver, uri);
        }

        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public final ModelLoader<Uri, ParcelFileDescriptor> build(MultiModelLoaderFactory multiModelLoaderFactory) {
            return new UriLoader(this);
        }

        public FileDescriptorFactory(ContentResolver contentResolver) {
            this.contentResolver = contentResolver;
        }
    }

    /* loaded from: classes.dex */
    public interface LocalUriFetcherFactory<Data> {
        DataFetcher<Data> build(Uri uri);
    }

    /* loaded from: classes.dex */
    public static class StreamFactory implements ModelLoaderFactory<Uri, InputStream>, LocalUriFetcherFactory<InputStream> {
        public final ContentResolver contentResolver;

        @Override // com.bumptech.glide.load.model.UriLoader.LocalUriFetcherFactory
        public final DataFetcher<InputStream> build(Uri uri) {
            return new StreamLocalUriFetcher(this.contentResolver, uri);
        }

        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public final ModelLoader<Uri, InputStream> build(MultiModelLoaderFactory multiModelLoaderFactory) {
            return new UriLoader(this);
        }

        public StreamFactory(ContentResolver contentResolver) {
            this.contentResolver = contentResolver;
        }
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final ModelLoader.LoadData buildLoadData(Uri uri, int i, int i2, Options options) {
        Uri uri2 = uri;
        return new ModelLoader.LoadData(new ObjectKey(uri2), this.factory.build(uri2));
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final boolean handles(Uri uri) {
        return SCHEMES.contains(uri.getScheme());
    }

    public UriLoader(LocalUriFetcherFactory<Data> localUriFetcherFactory) {
        this.factory = localUriFetcherFactory;
    }
}
