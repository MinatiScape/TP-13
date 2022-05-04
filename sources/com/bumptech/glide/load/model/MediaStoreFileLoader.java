package com.bumptech.glide.load.model;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.text.TextUtils;
import androidx.savedstate.R$id;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.data.DataFetcher;
import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.signature.ObjectKey;
import java.io.File;
import java.io.FileNotFoundException;
/* loaded from: classes.dex */
public final class MediaStoreFileLoader implements ModelLoader<Uri, File> {
    public final Context context;

    /* loaded from: classes.dex */
    public static final class Factory implements ModelLoaderFactory<Uri, File> {
        public final Context context;

        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public final ModelLoader<Uri, File> build(MultiModelLoaderFactory multiModelLoaderFactory) {
            return new MediaStoreFileLoader(this.context);
        }

        public Factory(Context context) {
            this.context = context;
        }
    }

    /* loaded from: classes.dex */
    public static class FilePathFetcher implements DataFetcher<File> {
        public static final String[] PROJECTION = {"_data"};
        public final Context context;
        public final Uri uri;

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final void cancel() {
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final void cleanup() {
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final void loadData(Priority priority, DataFetcher.DataCallback<? super File> dataCallback) {
            Cursor query = this.context.getContentResolver().query(this.uri, PROJECTION, null, null, null);
            String str = null;
            if (query != null) {
                try {
                    if (query.moveToFirst()) {
                        str = query.getString(query.getColumnIndexOrThrow("_data"));
                    }
                } finally {
                    query.close();
                }
            }
            if (TextUtils.isEmpty(str)) {
                StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Failed to find file path for: ");
                m.append(this.uri);
                dataCallback.onLoadFailed(new FileNotFoundException(m.toString()));
                return;
            }
            dataCallback.onDataReady(new File(str));
        }

        public FilePathFetcher(Context context, Uri uri) {
            this.context = context;
            this.uri = uri;
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final Class<File> getDataClass() {
            return File.class;
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final DataSource getDataSource() {
            return DataSource.LOCAL;
        }
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final ModelLoader.LoadData<File> buildLoadData(Uri uri, int i, int i2, Options options) {
        Uri uri2 = uri;
        return new ModelLoader.LoadData<>(new ObjectKey(uri2), new FilePathFetcher(this.context, uri2));
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final boolean handles(Uri uri) {
        return R$id.isMediaStoreUri(uri);
    }

    public MediaStoreFileLoader(Context context) {
        this.context = context;
    }
}
