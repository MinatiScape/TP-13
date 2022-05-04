package com.bumptech.glide.load.model;

import androidx.collection.ContainerHelpers;
import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.data.DataFetcher;
import java.util.Collections;
import java.util.List;
/* loaded from: classes.dex */
public interface ModelLoader<Model, Data> {

    /* loaded from: classes.dex */
    public static class LoadData<Data> {
        public final List<Key> alternateKeys;
        public final DataFetcher<Data> fetcher;
        public final Key sourceKey;

        public LoadData() {
            throw null;
        }

        public LoadData(Key key, DataFetcher<Data> dataFetcher) {
            List<Key> emptyList = Collections.emptyList();
            ContainerHelpers.checkNotNull(key);
            this.sourceKey = key;
            ContainerHelpers.checkNotNull(emptyList);
            this.alternateKeys = emptyList;
            ContainerHelpers.checkNotNull(dataFetcher);
            this.fetcher = dataFetcher;
        }
    }

    LoadData<Data> buildLoadData(Model model, int i, int i2, Options options);

    boolean handles(Model model);
}
