package com.bumptech.glide.load.model;

import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.data.DataFetcher;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
/* loaded from: classes.dex */
public interface ModelLoader<Model, Data> {

    /* loaded from: classes.dex */
    public static class LoadData<Data> {
        public final List<Key> alternateKeys;
        public final DataFetcher<Data> fetcher;
        public final Key sourceKey;

        public LoadData(Key sourceKey, DataFetcher<Data> fetcher) {
            List<Key> emptyList = Collections.emptyList();
            Objects.requireNonNull(sourceKey, "Argument must not be null");
            this.sourceKey = sourceKey;
            Objects.requireNonNull(emptyList, "Argument must not be null");
            this.alternateKeys = emptyList;
            Objects.requireNonNull(fetcher, "Argument must not be null");
            this.fetcher = fetcher;
        }
    }

    LoadData<Data> buildLoadData(Model model, int width, int height, Options options);

    boolean handles(Model model);
}
