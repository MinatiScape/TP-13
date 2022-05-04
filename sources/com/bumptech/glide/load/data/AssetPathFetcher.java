package com.bumptech.glide.load.data;

import android.content.res.AssetManager;
import android.util.Log;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.data.DataFetcher;
import java.io.IOException;
/* loaded from: classes.dex */
public abstract class AssetPathFetcher<T> implements DataFetcher<T> {
    public final AssetManager assetManager;
    public final String assetPath;
    public T data;

    @Override // com.bumptech.glide.load.data.DataFetcher
    public final void cancel() {
    }

    public abstract void close(T t) throws IOException;

    public abstract T loadResource(AssetManager assetManager, String str) throws IOException;

    @Override // com.bumptech.glide.load.data.DataFetcher
    public final void cleanup() {
        T t = this.data;
        if (t != null) {
            try {
                close(t);
            } catch (IOException unused) {
            }
        }
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public final void loadData(Priority priority, DataFetcher.DataCallback<? super T> dataCallback) {
        try {
            T loadResource = loadResource(this.assetManager, this.assetPath);
            this.data = loadResource;
            dataCallback.onDataReady(loadResource);
        } catch (IOException e) {
            if (Log.isLoggable("AssetPathFetcher", 3)) {
                Log.d("AssetPathFetcher", "Failed to load data from asset manager", e);
            }
            dataCallback.onLoadFailed(e);
        }
    }

    public AssetPathFetcher(AssetManager assetManager, String str) {
        this.assetManager = assetManager;
        this.assetPath = str;
    }

    @Override // com.bumptech.glide.load.data.DataFetcher
    public final DataSource getDataSource() {
        return DataSource.LOCAL;
    }
}
