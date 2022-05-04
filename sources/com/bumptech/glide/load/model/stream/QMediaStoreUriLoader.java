package com.bumptech.glide.load.model.stream;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Environment;
import android.os.ParcelFileDescriptor;
import android.provider.MediaStore;
import android.text.TextUtils;
import androidx.savedstate.R$id;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.data.DataFetcher;
import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.load.model.ModelLoaderFactory;
import com.bumptech.glide.load.model.MultiModelLoaderFactory;
import com.bumptech.glide.signature.ObjectKey;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.InputStream;
/* loaded from: classes.dex */
public final class QMediaStoreUriLoader<DataT> implements ModelLoader<Uri, DataT> {
    public final Context context;
    public final Class<DataT> dataClass;
    public final ModelLoader<File, DataT> fileDelegate;
    public final ModelLoader<Uri, DataT> uriDelegate;

    /* loaded from: classes.dex */
    public static abstract class Factory<DataT> implements ModelLoaderFactory<Uri, DataT> {
        public final Context context;
        public final Class<DataT> dataClass;

        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public final ModelLoader<Uri, DataT> build(MultiModelLoaderFactory multiModelLoaderFactory) {
            return new QMediaStoreUriLoader(this.context, multiModelLoaderFactory.build(File.class, this.dataClass), multiModelLoaderFactory.build(Uri.class, this.dataClass), this.dataClass);
        }

        public Factory(Context context, Class<DataT> cls) {
            this.context = context;
            this.dataClass = cls;
        }
    }

    /* loaded from: classes.dex */
    public static final class FileDescriptorFactory extends Factory<ParcelFileDescriptor> {
        public FileDescriptorFactory(Context context) {
            super(context, ParcelFileDescriptor.class);
        }
    }

    /* loaded from: classes.dex */
    public static final class InputStreamFactory extends Factory<InputStream> {
        public InputStreamFactory(Context context) {
            super(context, InputStream.class);
        }
    }

    /* loaded from: classes.dex */
    public static final class QMediaStoreUriFetcher<DataT> implements DataFetcher<DataT> {
        public static final String[] PROJECTION = {"_data"};
        public final Context context;
        public final Class<DataT> dataClass;
        public volatile DataFetcher<DataT> delegate;
        public final ModelLoader<File, DataT> fileDelegate;
        public final int height;
        public volatile boolean isCancelled;
        public final Options options;
        public final Uri uri;
        public final ModelLoader<Uri, DataT> uriDelegate;
        public final int width;

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final void cancel() {
            this.isCancelled = true;
            DataFetcher<DataT> dataFetcher = this.delegate;
            if (dataFetcher != null) {
                dataFetcher.cancel();
            }
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final void cleanup() {
            DataFetcher<DataT> dataFetcher = this.delegate;
            if (dataFetcher != null) {
                dataFetcher.cleanup();
            }
        }

        public QMediaStoreUriFetcher(Context context, ModelLoader<File, DataT> modelLoader, ModelLoader<Uri, DataT> modelLoader2, Uri uri, int i, int i2, Options options, Class<DataT> cls) {
            this.context = context.getApplicationContext();
            this.fileDelegate = modelLoader;
            this.uriDelegate = modelLoader2;
            this.uri = uri;
            this.width = i;
            this.height = i2;
            this.options = options;
            this.dataClass = cls;
        }

        public final DataFetcher<DataT> buildDelegateFetcher() throws FileNotFoundException {
            ModelLoader.LoadData<DataT> loadData;
            boolean z;
            Uri uri;
            Throwable th;
            Cursor cursor = null;
            if (Environment.isExternalStorageLegacy()) {
                ModelLoader<File, DataT> modelLoader = this.fileDelegate;
                Uri uri2 = this.uri;
                try {
                    Cursor query = this.context.getContentResolver().query(uri2, PROJECTION, null, null, null);
                    if (query != null) {
                        try {
                            if (query.moveToFirst()) {
                                String string = query.getString(query.getColumnIndexOrThrow("_data"));
                                if (!TextUtils.isEmpty(string)) {
                                    File file = new File(string);
                                    query.close();
                                    loadData = modelLoader.buildLoadData(file, this.width, this.height, this.options);
                                } else {
                                    throw new FileNotFoundException("File path was empty in media store for: " + uri2);
                                }
                            }
                        } catch (Throwable th2) {
                            th = th2;
                            cursor = query;
                            if (cursor != null) {
                                cursor.close();
                            }
                            throw th;
                        }
                    }
                    throw new FileNotFoundException("Failed to media store entry for: " + uri2);
                } catch (Throwable th3) {
                    th = th3;
                }
            } else {
                if (this.context.checkSelfPermission("android.permission.ACCESS_MEDIA_LOCATION") == 0) {
                    z = true;
                } else {
                    z = false;
                }
                if (z) {
                    uri = MediaStore.setRequireOriginal(this.uri);
                } else {
                    uri = this.uri;
                }
                loadData = this.uriDelegate.buildLoadData(uri, this.width, this.height, this.options);
            }
            if (loadData != null) {
                return loadData.fetcher;
            }
            return null;
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final void loadData(Priority priority, DataFetcher.DataCallback<? super DataT> dataCallback) {
            try {
                DataFetcher<DataT> buildDelegateFetcher = buildDelegateFetcher();
                if (buildDelegateFetcher == null) {
                    dataCallback.onLoadFailed(new IllegalArgumentException("Failed to build fetcher for: " + this.uri));
                    return;
                }
                this.delegate = buildDelegateFetcher;
                if (this.isCancelled) {
                    cancel();
                } else {
                    buildDelegateFetcher.loadData(priority, dataCallback);
                }
            } catch (FileNotFoundException e) {
                dataCallback.onLoadFailed(e);
            }
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final Class<DataT> getDataClass() {
            return this.dataClass;
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final DataSource getDataSource() {
            return DataSource.LOCAL;
        }
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final ModelLoader.LoadData buildLoadData(Uri uri, int i, int i2, Options options) {
        Uri uri2 = uri;
        return new ModelLoader.LoadData(new ObjectKey(uri2), new QMediaStoreUriFetcher(this.context, this.fileDelegate, this.uriDelegate, uri2, i, i2, options, this.dataClass));
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final boolean handles(Uri uri) {
        return R$id.isMediaStoreUri(uri);
    }

    public QMediaStoreUriLoader(Context context, ModelLoader<File, DataT> modelLoader, ModelLoader<Uri, DataT> modelLoader2, Class<DataT> cls) {
        this.context = context.getApplicationContext();
        this.fileDelegate = modelLoader;
        this.uriDelegate = modelLoader2;
        this.dataClass = cls;
    }
}
