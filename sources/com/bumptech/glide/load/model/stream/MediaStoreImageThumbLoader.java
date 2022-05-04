package com.bumptech.glide.load.model.stream;

import android.content.Context;
import android.net.Uri;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.data.mediastore.MediaStoreUtil;
import com.bumptech.glide.load.data.mediastore.ThumbFetcher;
import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.load.model.ModelLoaderFactory;
import com.bumptech.glide.load.model.MultiModelLoaderFactory;
import com.bumptech.glide.signature.ObjectKey;
import java.io.InputStream;
/* loaded from: classes.dex */
public class MediaStoreImageThumbLoader implements ModelLoader<Uri, InputStream> {
    public final Context context;

    /* loaded from: classes.dex */
    public static class Factory implements ModelLoaderFactory<Uri, InputStream> {
        public final Context context;

        public Factory(Context context) {
            this.context = context;
        }

        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public ModelLoader<Uri, InputStream> build(MultiModelLoaderFactory multiFactory) {
            return new MediaStoreImageThumbLoader(this.context);
        }
    }

    public MediaStoreImageThumbLoader(Context context) {
        this.context = context.getApplicationContext();
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public ModelLoader.LoadData<InputStream> buildLoadData(Uri model, int width, int height, Options options) {
        Uri uri = model;
        if (!MediaStoreUtil.isThumbnailSize(width, height)) {
            return null;
        }
        ObjectKey objectKey = new ObjectKey(uri);
        Context context = this.context;
        return new ModelLoader.LoadData<>(objectKey, ThumbFetcher.build(context, uri, new ThumbFetcher.ImageThumbnailQuery(context.getContentResolver())));
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public boolean handles(Uri model) {
        Uri uri = model;
        return MediaStoreUtil.isMediaStoreUri(uri) && !uri.getPathSegments().contains("video");
    }
}
