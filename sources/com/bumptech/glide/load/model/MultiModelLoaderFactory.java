package com.bumptech.glide.load.model;

import androidx.collection.ContainerHelpers;
import androidx.core.util.Pools$Pool;
import com.bumptech.glide.Registry;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.model.ModelLoader;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes.dex */
public final class MultiModelLoaderFactory {
    public static final Factory DEFAULT_FACTORY = new Factory();
    public static final EmptyModelLoader EMPTY_MODEL_LOADER = new EmptyModelLoader();
    public final HashSet alreadyUsedEntries;
    public final ArrayList entries;
    public final Factory factory;
    public final Pools$Pool<List<Throwable>> throwableListPool;

    /* loaded from: classes.dex */
    public static class EmptyModelLoader implements ModelLoader<Object, Object> {
        @Override // com.bumptech.glide.load.model.ModelLoader
        public final ModelLoader.LoadData<Object> buildLoadData(Object obj, int i, int i2, Options options) {
            return null;
        }

        @Override // com.bumptech.glide.load.model.ModelLoader
        public final boolean handles(Object obj) {
            return false;
        }
    }

    /* loaded from: classes.dex */
    public static class Factory {
    }

    public MultiModelLoaderFactory() {
        throw null;
    }

    public MultiModelLoaderFactory(Pools$Pool<List<Throwable>> pools$Pool, Factory factory) {
        this.entries = new ArrayList();
        this.alreadyUsedEntries = new HashSet();
        this.throwableListPool = pools$Pool;
        this.factory = factory;
    }

    public final synchronized ArrayList build(Class cls) {
        ArrayList arrayList;
        try {
            arrayList = new ArrayList();
            Iterator it = this.entries.iterator();
            while (it.hasNext()) {
                Entry entry = (Entry) it.next();
                if (!this.alreadyUsedEntries.contains(entry) && entry.modelClass.isAssignableFrom(cls)) {
                    this.alreadyUsedEntries.add(entry);
                    ModelLoader build = entry.factory.build(this);
                    ContainerHelpers.checkNotNull(build);
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

    public final synchronized ArrayList getDataClasses(Class cls) {
        ArrayList arrayList;
        arrayList = new ArrayList();
        Iterator it = this.entries.iterator();
        while (it.hasNext()) {
            Entry entry = (Entry) it.next();
            if (!arrayList.contains(entry.dataClass) && entry.modelClass.isAssignableFrom(cls)) {
                arrayList.add(entry.dataClass);
            }
        }
        return arrayList;
    }

    /* loaded from: classes.dex */
    public static class Entry<Model, Data> {
        public final Class<Data> dataClass;
        public final ModelLoaderFactory<? extends Model, ? extends Data> factory;
        public final Class<Model> modelClass;

        public Entry(Class<Model> cls, Class<Data> cls2, ModelLoaderFactory<? extends Model, ? extends Data> modelLoaderFactory) {
            this.modelClass = cls;
            this.dataClass = cls2;
            this.factory = modelLoaderFactory;
        }
    }

    public final synchronized <Model, Data> ModelLoader<Model, Data> build(Class<Model> cls, Class<Data> cls2) {
        try {
            ArrayList arrayList = new ArrayList();
            Iterator it = this.entries.iterator();
            boolean z = false;
            while (it.hasNext()) {
                Entry<?, ?> entry = (Entry) it.next();
                if (this.alreadyUsedEntries.contains(entry)) {
                    z = true;
                } else {
                    if (entry.modelClass.isAssignableFrom(cls) && entry.dataClass.isAssignableFrom(cls2)) {
                        this.alreadyUsedEntries.add(entry);
                        arrayList.add(build(entry));
                        this.alreadyUsedEntries.remove(entry);
                    }
                }
            }
            if (arrayList.size() > 1) {
                Factory factory = this.factory;
                Pools$Pool<List<Throwable>> pools$Pool = this.throwableListPool;
                factory.getClass();
                return new MultiModelLoader(arrayList, pools$Pool);
            } else if (arrayList.size() == 1) {
                return (ModelLoader) arrayList.get(0);
            } else if (z) {
                return EMPTY_MODEL_LOADER;
            } else {
                throw new Registry.NoModelLoaderAvailableException((Class<?>) cls, (Class<?>) cls2);
            }
        } catch (Throwable th) {
            this.alreadyUsedEntries.clear();
            throw th;
        }
    }

    public final <Model, Data> ModelLoader<Model, Data> build(Entry<?, ?> entry) {
        ModelLoader<Model, Data> modelLoader = (ModelLoader<Model, Data>) entry.factory.build(this);
        ContainerHelpers.checkNotNull(modelLoader);
        return modelLoader;
    }
}
