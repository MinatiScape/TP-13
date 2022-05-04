package com.bumptech.glide.load.model;

import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.data.DataFetcher;
import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.signature.ObjectKey;
/* loaded from: classes.dex */
public final class UnitModelLoader<Model> implements ModelLoader<Model, Model> {
    public static final UnitModelLoader<?> INSTANCE = new UnitModelLoader<>();

    /* loaded from: classes.dex */
    public static class UnitFetcher<Model> implements DataFetcher<Model> {
        public final Model resource;

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final void cancel() {
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final void cleanup() {
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final Class<Model> getDataClass() {
            return (Class<Model>) this.resource.getClass();
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final void loadData(Priority priority, DataFetcher.DataCallback<? super Model> dataCallback) {
            dataCallback.onDataReady((Model) this.resource);
        }

        public UnitFetcher(Model model) {
            this.resource = model;
        }

        @Override // com.bumptech.glide.load.data.DataFetcher
        public final DataSource getDataSource() {
            return DataSource.LOCAL;
        }
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final boolean handles(Model model) {
        return true;
    }

    @Override // com.bumptech.glide.load.model.ModelLoader
    public final ModelLoader.LoadData<Model> buildLoadData(Model model, int i, int i2, Options options) {
        return new ModelLoader.LoadData<>(new ObjectKey(model), new UnitFetcher(model));
    }

    /* loaded from: classes.dex */
    public static class Factory<Model> implements ModelLoaderFactory<Model, Model> {
        public static final Factory<?> FACTORY = new Factory<>();

        @Override // com.bumptech.glide.load.model.ModelLoaderFactory
        public final ModelLoader<Model, Model> build(MultiModelLoaderFactory multiModelLoaderFactory) {
            return UnitModelLoader.INSTANCE;
        }
    }
}
