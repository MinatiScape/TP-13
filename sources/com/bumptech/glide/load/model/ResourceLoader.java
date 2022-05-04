package com.bumptech.glide.load.model;

import android.content.res.AssetFileDescriptor;
import android.content.res.Resources;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.util.Log;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.model.ModelLoader;
import java.io.InputStream;
/* loaded from: classes.dex */
public final class ResourceLoader<Data> implements ModelLoader<Integer, Data> {
    public final Resources resources;
    public final ModelLoader<Uri, Data> uriLoader;

    /* loaded from: classes.dex */
    public static final class AssetFileDescriptorFactory implements ModelLoaderFactory<Integer, AssetFileDescriptor> {
        public final Resources resources;

        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public final ModelLoader<Integer, AssetFileDescriptor> build(MultiModelLoaderFactory multiModelLoaderFactory) {
            return new ResourceLoader(this.resources, multiModelLoaderFactory.build(Uri.class, AssetFileDescriptor.class));
        }

        public AssetFileDescriptorFactory(Resources resources) {
            this.resources = resources;
        }
    }

    /* loaded from: classes.dex */
    public static class FileDescriptorFactory implements ModelLoaderFactory<Integer, ParcelFileDescriptor> {
        public final Resources resources;

        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public final ModelLoader<Integer, ParcelFileDescriptor> build(MultiModelLoaderFactory multiModelLoaderFactory) {
            return new ResourceLoader(this.resources, multiModelLoaderFactory.build(Uri.class, ParcelFileDescriptor.class));
        }

        public FileDescriptorFactory(Resources resources) {
            this.resources = resources;
        }
    }

    /* loaded from: classes.dex */
    public static class StreamFactory implements ModelLoaderFactory<Integer, InputStream> {
        public final Resources resources;

        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public final ModelLoader<Integer, InputStream> build(MultiModelLoaderFactory multiModelLoaderFactory) {
            return new ResourceLoader(this.resources, multiModelLoaderFactory.build(Uri.class, InputStream.class));
        }

        public StreamFactory(Resources resources) {
            this.resources = resources;
        }
    }

    /* loaded from: classes.dex */
    public static class UriFactory implements ModelLoaderFactory<Integer, Uri> {
        public final Resources resources;

        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public final ModelLoader<Integer, Uri> build(MultiModelLoaderFactory multiModelLoaderFactory) {
            return new ResourceLoader(this.resources, UnitModelLoader.INSTANCE);
        }

        public UriFactory(Resources resources) {
            this.resources = resources;
        }
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final ModelLoader.LoadData buildLoadData(Integer num, int i, int i2, Options options) {
        Uri uri;
        Integer num2 = num;
        try {
            uri = Uri.parse("android.resource://" + this.resources.getResourcePackageName(num2.intValue()) + '/' + this.resources.getResourceTypeName(num2.intValue()) + '/' + this.resources.getResourceEntryName(num2.intValue()));
        } catch (Resources.NotFoundException e) {
            if (Log.isLoggable("ResourceLoader", 5)) {
                Log.w("ResourceLoader", "Received invalid resource id: " + num2, e);
            }
            uri = null;
        }
        if (uri == null) {
            return null;
        }
        return this.uriLoader.buildLoadData(uri, i, i2, options);
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final /* bridge */ /* synthetic */ boolean handles(Integer num) {
        return true;
    }

    public ResourceLoader(Resources resources, ModelLoader<Uri, Data> modelLoader) {
        this.resources = resources;
        this.uriLoader = modelLoader;
    }
}
