package com.bumptech.glide.load.engine;

import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.data.DataFetcher;
/* loaded from: classes.dex */
public interface DataFetcherGenerator {

    /* loaded from: classes.dex */
    public interface FetcherReadyCallback {
        void onDataFetcherFailed(Key attemptedKey, Exception e, DataFetcher<?> fetcher, DataSource dataSource);

        void onDataFetcherReady(Key sourceKey, Object data, DataFetcher<?> fetcher, DataSource dataSource, Key attemptedKey);

        void reschedule();
    }

    void cancel();

    boolean startNext();
}
