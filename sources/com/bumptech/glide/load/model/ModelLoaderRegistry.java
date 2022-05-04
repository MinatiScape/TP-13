package com.bumptech.glide.load.model;

import com.bumptech.glide.util.pool.FactoryPools;
import java.util.HashMap;
import java.util.List;
/* loaded from: classes.dex */
public final class ModelLoaderRegistry {
    public final ModelLoaderCache cache = new ModelLoaderCache();
    public final MultiModelLoaderFactory multiModelLoaderFactory;

    /* loaded from: classes.dex */
    public static class ModelLoaderCache {
        public final HashMap cachedModelLoaders = new HashMap();

        /* loaded from: classes.dex */
        public static class Entry<Model> {
            public final List<ModelLoader<Model, ?>> loaders;

            public Entry(List<ModelLoader<Model, ?>> list) {
                this.loaders = list;
            }
        }

        public final <Model> void put(Class<Model> cls, List<ModelLoader<Model, ?>> list) {
            if (((Entry) this.cachedModelLoaders.put(cls, new Entry(list))) != null) {
                throw new IllegalStateException("Already cached loaders for model: " + cls);
            }
        }
    }

    public ModelLoaderRegistry(FactoryPools.FactoryPool factoryPool) {
        MultiModelLoaderFactory multiModelLoaderFactory = new MultiModelLoaderFactory(factoryPool, MultiModelLoaderFactory.DEFAULT_FACTORY);
        this.multiModelLoaderFactory = multiModelLoaderFactory;
    }
}
