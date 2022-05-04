package com.bumptech.glide.load.model.stream;

import android.content.Context;
import android.net.Uri;
import androidx.savedstate.R$id;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.data.mediastore.ThumbFetcher;
import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.load.model.ModelLoaderFactory;
import com.bumptech.glide.load.model.MultiModelLoaderFactory;
import com.bumptech.glide.load.resource.bitmap.VideoDecoder;
import com.bumptech.glide.signature.ObjectKey;
import java.io.InputStream;
/* loaded from: classes.dex */
public final class MediaStoreVideoThumbLoader implements ModelLoader<Uri, InputStream> {
    public final Context context;

    /* loaded from: classes.dex */
    public static class Factory implements ModelLoaderFactory<Uri, InputStream> {
        public final Context context;

        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public final ModelLoader<Uri, InputStream> build(MultiModelLoaderFactory multiModelLoaderFactory) {
            return new MediaStoreVideoThumbLoader(this.context);
        }

        public Factory(Context context) {
            this.context = context;
        }
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final ModelLoader.LoadData<InputStream> buildLoadData(Uri uri, int i, int i2, Options options) {
        boolean z;
        Uri uri2 = uri;
        boolean z2 = true;
        if (i == Integer.MIN_VALUE || i2 == Integer.MIN_VALUE || i > 512 || i2 > 384) {
            z = false;
        } else {
            z = true;
        }
        if (z) {
            Long l = (Long) options.get(VideoDecoder.TARGET_FRAME);
            if (l == null || l.longValue() != -1) {
                z2 = false;
            }
            if (z2) {
                ObjectKey objectKey = new ObjectKey(uri2);
                Context context = this.context;
                return new ModelLoader.LoadData<>(objectKey, ThumbFetcher.build(context, uri2, new ThumbFetcher.VideoThumbnailQuery(context.getContentResolver())));
            }
        }
        return null;
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final boolean handles(Uri uri) {
        Uri uri2 = uri;
        if (!R$id.isMediaStoreUri(uri2) || !uri2.getPathSegments().contains("video")) {
            return false;
        }
        return true;
    }

    public MediaStoreVideoThumbLoader(Context context) {
        this.context = context.getApplicationContext();
    }
}
