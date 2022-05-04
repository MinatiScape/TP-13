package com.bumptech.glide.load.data;

import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
/* loaded from: classes.dex */
public interface DataFetcher<T> {

    /* loaded from: classes.dex */
    public interface DataCallback<T> {
        void onDataReady(T data);

        void onLoadFailed(Exception e);
    }

    void cancel();

    void cleanup();

    Class<T> getDataClass();

    DataSource getDataSource();

    void loadData(Priority priority, DataCallback<? super T> callback);
}
