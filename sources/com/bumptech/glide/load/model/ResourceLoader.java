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
public class ResourceLoader<Data> implements ModelLoader<Integer, Data> {
    public final Resources resources;
    public final ModelLoader<Uri, Data> uriLoader;

    /* loaded from: classes.dex */
    public static final class AssetFileDescriptorFactory implements ModelLoaderFactory<Integer, AssetFileDescriptor> {
        public final Resources resources;

        public AssetFileDescriptorFactory(Resources resources) {
            this.resources = resources;
        }

        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public ModelLoader<Integer, AssetFileDescriptor> build(MultiModelLoaderFactory multiFactory) {
            return new ResourceLoader(this.resources, multiFactory.build(Uri.class, AssetFileDescriptor.class));
        }
    }

    /* loaded from: classes.dex */
    public static class FileDescriptorFactory implements ModelLoaderFactory<Integer, ParcelFileDescriptor> {
        public final Resources resources;

        public FileDescriptorFactory(Resources resources) {
            this.resources = resources;
        }

        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public ModelLoader<Integer, ParcelFileDescriptor> build(MultiModelLoaderFactory multiFactory) {
            return new ResourceLoader(this.resources, multiFactory.build(Uri.class, ParcelFileDescriptor.class));
        }
    }

    /* loaded from: classes.dex */
    public static class StreamFactory implements ModelLoaderFactory<Integer, InputStream> {
        public final Resources resources;

        public StreamFactory(Resources resources) {
            this.resources = resources;
        }

        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public ModelLoader<Integer, InputStream> build(MultiModelLoaderFactory multiFactory) {
            return new ResourceLoader(this.resources, multiFactory.build(Uri.class, InputStream.class));
        }
    }

    /* loaded from: classes.dex */
    public static class UriFactory implements ModelLoaderFactory<Integer, Uri> {
        public final Resources resources;

        public UriFactory(Resources resources) {
            this.resources = resources;
        }

        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public ModelLoader<Integer, Uri> build(MultiModelLoaderFactory multiFactory) {
            return new ResourceLoader(this.resources, UnitModelLoader.INSTANCE);
        }
    }

    public ResourceLoader(Resources resources, ModelLoader<Uri, Data> uriLoader) {
        this.resources = resources;
        this.uriLoader = uriLoader;
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public ModelLoader.LoadData buildLoadData(Integer model, int width, int height, Options options) {
        Uri uri;
        Integer num = model;
        try {
            String resourcePackageName = this.resources.getResourcePackageName(num.intValue());
            String resourceTypeName = this.resources.getResourceTypeName(num.intValue());
            String resourceEntryName = this.resources.getResourceEntryName(num.intValue());
            StringBuilder sb = new StringBuilder(String.valueOf(resourcePackageName).length() + 21 + String.valueOf(resourceTypeName).length() + String.valueOf(resourceEntryName).length());
            sb.append("android.resource://");
            sb.append(resourcePackageName);
            sb.append('/');
            sb.append(resourceTypeName);
            sb.append('/');
            sb.append(resourceEntryName);
            uri = Uri.parse(sb.toString());
        } catch (Resources.NotFoundException e) {
            if (Log.isLoggable("ResourceLoader", 5)) {
                String valueOf = String.valueOf(num);
                StringBuilder sb2 = new StringBuilder(valueOf.length() + 30);
                sb2.append("Received invalid resource id: ");
                sb2.append(valueOf);
                Log.w("ResourceLoader", sb2.toString(), e);
            }
            uri = null;
        }
        if (uri == null) {
            return null;
        }
        return this.uriLoader.buildLoadData(uri, width, height, options);
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public /* bridge */ /* synthetic */ boolean handles(Integer model) {
        return true;
    }
}
