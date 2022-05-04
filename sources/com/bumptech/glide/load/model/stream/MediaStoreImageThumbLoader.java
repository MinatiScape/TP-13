package com.bumptech.glide.load.model.stream;

import android.content.Context;
import android.net.Uri;
import androidx.savedstate.R$id;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.data.mediastore.ThumbFetcher;
import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.load.model.ModelLoaderFactory;
import com.bumptech.glide.load.model.MultiModelLoaderFactory;
import com.bumptech.glide.signature.ObjectKey;
import java.io.InputStream;
/* loaded from: classes.dex */
public final class MediaStoreImageThumbLoader implements ModelLoader<Uri, InputStream> {
    public final Context context;

    /* loaded from: classes.dex */
    public static class Factory implements ModelLoaderFactory<Uri, InputStream> {
        public final Context context;

        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public final ModelLoader<Uri, InputStream> build(MultiModelLoaderFactory multiModelLoaderFactory) {
            return new MediaStoreImageThumbLoader(this.context);
        }

        public Factory(Context context) {
            this.context = context;
        }
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final ModelLoader.LoadData<InputStream> buildLoadData(Uri uri, int i, int i2, Options options) {
        boolean z;
        Uri uri2 = uri;
        if (i == Integer.MIN_VALUE || i2 == Integer.MIN_VALUE || i > 512 || i2 > 384) {
            z = false;
        } else {
            z = true;
        }
        if (!z) {
            return null;
        }
        ObjectKey objectKey = new ObjectKey(uri2);
        Context context = this.context;
        return new ModelLoader.LoadData<>(objectKey, ThumbFetcher.build(context, uri2, new ThumbFetcher.ImageThumbnailQuery(context.getContentResolver())));
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final boolean handles(Uri uri) {
        Uri uri2 = uri;
        if (!R$id.isMediaStoreUri(uri2) || uri2.getPathSegments().contains("video")) {
            return false;
        }
        return true;
    }

    public MediaStoreImageThumbLoader(Context context) {
        this.context = context.getApplicationContext();
    }
}
