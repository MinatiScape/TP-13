package com.bumptech.glide.load.model;

import androidx.core.util.Pools$Pool;
import com.bumptech.glide.Registry;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.model.ModelLoader;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;
/* loaded from: classes.dex */
public class MultiModelLoaderFactory {
    public static final Factory DEFAULT_FACTORY = new Factory();
    public static final ModelLoader<Object, Object> EMPTY_MODEL_LOADER = new EmptyModelLoader();
    public final Factory factory;
    public final Pools$Pool<List<Throwable>> throwableListPool;
    public final List<Entry<?, ?>> entries = new ArrayList();
    public final Set<Entry<?, ?>> alreadyUsedEntries = new HashSet();

    /* loaded from: classes.dex */
    public static class EmptyModelLoader implements ModelLoader<Object, Object> {
        @Override // com.bumptech.glide.load.model.ModelLoader
        public ModelLoader.LoadData<Object> buildLoadData(Object o, int width, int height, Options options) {
            return null;
        }

        @Override // com.bumptech.glide.load.model.ModelLoader
        public boolean handles(Object o) {
            return false;
        }
    }

    /* loaded from: classes.dex */
    public static class Entry<Model, Data> {
        public final Class<Data> dataClass;
        public final ModelLoaderFactory<? extends Model, ? extends Data> factory;
        public final Class<Model> modelClass;

        public Entry(Class<Model> modelClass, Class<Data> dataClass, ModelLoaderFactory<? extends Model, ? extends Data> factory) {
            this.modelClass = modelClass;
            this.dataClass = dataClass;
            this.factory = factory;
        }
    }

    /* loaded from: classes.dex */
    public static class Factory {
    }

    public MultiModelLoaderFactory(Pools$Pool<List<Throwable>> throwableListPool, Factory factory) {
        this.throwableListPool = throwableListPool;
        this.factory = factory;
    }

    public synchronized <Model> List<ModelLoader<Model, ?>> build(Class<Model> modelClass) {
        ArrayList arrayList;
        try {
            arrayList = new ArrayList();
            for (Entry<?, ?> entry : this.entries) {
                if (!this.alreadyUsedEntries.contains(entry) && entry.modelClass.isAssignableFrom(modelClass)) {
                    this.alreadyUsedEntries.add(entry);
                    ModelLoader<? extends Object, ? extends Object> build = entry.factory.build(this);
                    Objects.requireNonNull(build, "Argument must not be null");
                    arrayList.add(build);
                    this.alreadyUsedEntries.remove(entry);
                }
            }
        } catch (Throwable th) {
            this.alreadyUsedEntries.clear();
            throw th;
        }
        return arrayList;
    }

    public synchronized List<Class<?>> getDataClasses(Class<?> modelClass) {
        ArrayList arrayList;
        arrayList = new ArrayList();
        for (Entry<?, ?> entry : this.entries) {
            if (!arrayList.contains(entry.dataClass) && entry.modelClass.isAssignableFrom(modelClass)) {
                arrayList.add(entry.dataClass);
            }
        }
        return arrayList;
    }

    public synchronized <Model, Data> ModelLoader<Model, Data> build(Class<Model> modelClass, Class<Data> dataClass) {
        try {
            ArrayList arrayList = new ArrayList();
            boolean z = false;
            for (Entry<?, ?> entry : this.entries) {
                if (this.alreadyUsedEntries.contains(entry)) {
                    z = true;
                } else if (entry.modelClass.isAssignableFrom(modelClass) && entry.dataClass.isAssignableFrom(dataClass)) {
                    this.alreadyUsedEntries.add(entry);
                    arrayList.add(build(entry));
                    this.alreadyUsedEntries.remove(entry);
                }
            }
            if (arrayList.size() > 1) {
                Factory factory = this.factory;
                Pools$Pool<List<Throwable>> pools$Pool = this.throwableListPool;
                Objects.requireNonNull(factory);
                return new MultiModelLoader(arrayList, pools$Pool);
            } else if (arrayList.size() == 1) {
                return (ModelLoader) arrayList.get(0);
            } else if (z) {
                return (ModelLoader<Model, Data>) EMPTY_MODEL_LOADER;
            } else {
                throw new Registry.NoModelLoaderAvailableException(modelClass, dataClass);
            }
        } catch (Throwable th) {
            this.alreadyUsedEntries.clear();
            throw th;
        }
    }

    public final <Model, Data> ModelLoader<Model, Data> build(Entry<?, ?> entry) {
        ModelLoader<Model, Data> modelLoader = (ModelLoader<Model, Data>) entry.factory.build(this);
        Objects.requireNonNull(modelLoader, "Argument must not be null");
        return modelLoader;
    }
}
