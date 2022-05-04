package com.bumptech.glide.load.model;

import androidx.core.util.Pools$Pool;
import com.bumptech.glide.Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline0;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/* loaded from: classes.dex */
public class ModelLoaderRegistry {
    public final ModelLoaderCache cache = new ModelLoaderCache();
    public final MultiModelLoaderFactory multiModelLoaderFactory;

    /* loaded from: classes.dex */
    public static class ModelLoaderCache {
        public final Map<Class<?>, Entry<?>> cachedModelLoaders = new HashMap();

        /* loaded from: classes.dex */
        public static class Entry<Model> {
            public final List<ModelLoader<Model, ?>> loaders;

            public Entry(List<ModelLoader<Model, ?>> loaders) {
                this.loaders = loaders;
            }
        }

        public <Model> void put(Class<Model> modelClass, List<ModelLoader<Model, ?>> loaders) {
            if (this.cachedModelLoaders.put(modelClass, new Entry<>(loaders)) != null) {
                String valueOf = String.valueOf(modelClass);
                throw new IllegalStateException(Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline0.m(valueOf.length() + 34, "Already cached loaders for model: ", valueOf));
            }
        }
    }

    public ModelLoaderRegistry(Pools$Pool<List<Throwable>> throwableListPool) {
        MultiModelLoaderFactory multiModelLoaderFactory = new MultiModelLoaderFactory(throwableListPool, MultiModelLoaderFactory.DEFAULT_FACTORY);
        this.multiModelLoaderFactory = multiModelLoaderFactory;
    }
}
