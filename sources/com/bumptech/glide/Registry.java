package com.bumptech.glide;

import androidx.core.util.Pools$SynchronizedPool;
import com.bumptech.glide.load.ImageHeaderParser;
import com.bumptech.glide.load.ResourceDecoder;
import com.bumptech.glide.load.ResourceEncoder;
import com.bumptech.glide.load.data.DataRewinder;
import com.bumptech.glide.load.data.DataRewinderRegistry;
import com.bumptech.glide.load.model.ModelLoader;
import com.bumptech.glide.load.model.ModelLoaderFactory;
import com.bumptech.glide.load.model.ModelLoaderRegistry;
import com.bumptech.glide.load.model.MultiModelLoaderFactory;
import com.bumptech.glide.load.model.StreamEncoder;
import com.bumptech.glide.load.resource.transcode.ResourceTranscoder;
import com.bumptech.glide.load.resource.transcode.TranscoderRegistry;
import com.bumptech.glide.provider.EncoderRegistry;
import com.bumptech.glide.provider.LoadPathCache;
import com.bumptech.glide.provider.ModelToResourceClassCache;
import com.bumptech.glide.provider.ResourceDecoderRegistry;
import com.bumptech.glide.provider.ResourceEncoderRegistry;
import com.bumptech.glide.util.pool.FactoryPools;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes.dex */
public final class Registry {
    public final ModelLoaderRegistry modelLoaderRegistry;
    public final FactoryPools.FactoryPool throwableListPool;
    public final ModelToResourceClassCache modelToResourceClassCache = new ModelToResourceClassCache();
    public final LoadPathCache loadPathCache = new LoadPathCache();
    public final EncoderRegistry encoderRegistry = new EncoderRegistry();
    public final ResourceDecoderRegistry decoderRegistry = new ResourceDecoderRegistry();
    public final ResourceEncoderRegistry resourceEncoderRegistry = new ResourceEncoderRegistry();
    public final DataRewinderRegistry dataRewinderRegistry = new DataRewinderRegistry();
    public final TranscoderRegistry transcoderRegistry = new TranscoderRegistry();
    public final StreamEncoder imageHeaderParserRegistry = new StreamEncoder();

    /* loaded from: classes.dex */
    public static final class NoImageHeaderParserException extends MissingComponentException {
        public NoImageHeaderParserException() {
            super("Failed to find image header parser.");
        }
    }

    /* loaded from: classes.dex */
    public static class NoResultEncoderAvailableException extends MissingComponentException {
        public NoResultEncoderAvailableException(Class<?> cls) {
            super("Failed to find result encoder for resource class: " + cls + ", you may need to consider registering a new Encoder for the requested type or DiskCacheStrategy.DATA/DiskCacheStrategy.NONE if caching your transformed resource is unnecessary.");
        }
    }

    /* loaded from: classes.dex */
    public static class NoSourceEncoderAvailableException extends MissingComponentException {
        public NoSourceEncoderAvailableException(Class<?> cls) {
            super("Failed to find source encoder for data class: " + cls);
        }
    }

    public final void append(String str, Class cls, Class cls2, ResourceDecoder resourceDecoder) {
        ResourceDecoderRegistry resourceDecoderRegistry = this.decoderRegistry;
        synchronized (resourceDecoderRegistry) {
            resourceDecoderRegistry.getOrAddEntryList(str).add(new ResourceDecoderRegistry.Entry<>(cls, cls2, resourceDecoder));
        }
    }

    public final void register(DataRewinder.Factory factory) {
        DataRewinderRegistry dataRewinderRegistry = this.dataRewinderRegistry;
        synchronized (dataRewinderRegistry) {
            dataRewinderRegistry.rewinders.put(factory.getDataClass(), factory);
        }
    }

    public final List<ImageHeaderParser> getImageHeaderParsers() {
        List<ImageHeaderParser> list;
        StreamEncoder streamEncoder = this.imageHeaderParserRegistry;
        synchronized (streamEncoder) {
            list = (List) streamEncoder.byteArrayPool;
        }
        if (!list.isEmpty()) {
            return list;
        }
        throw new NoImageHeaderParserException();
    }

    public final <Model> List<ModelLoader<Model, ?>> getModelLoaders(Model model) {
        List<ModelLoader<Model, ?>> list;
        ModelLoaderRegistry modelLoaderRegistry = this.modelLoaderRegistry;
        modelLoaderRegistry.getClass();
        Class<?> cls = model.getClass();
        synchronized (modelLoaderRegistry) {
            ModelLoaderRegistry.ModelLoaderCache.Entry entry = (ModelLoaderRegistry.ModelLoaderCache.Entry) modelLoaderRegistry.cache.cachedModelLoaders.get(cls);
            if (entry == null) {
                list = null;
            } else {
                list = entry.loaders;
            }
            if (list == null) {
                list = Collections.unmodifiableList(modelLoaderRegistry.multiModelLoaderFactory.build(cls));
                modelLoaderRegistry.cache.put(cls, list);
            }
        }
        if (!list.isEmpty()) {
            int size = list.size();
            List<ModelLoader<Model, ?>> emptyList = Collections.emptyList();
            boolean z = true;
            for (int i = 0; i < size; i++) {
                ModelLoader<Model, ?> modelLoader = list.get(i);
                if (modelLoader.handles(model)) {
                    if (z) {
                        emptyList = new ArrayList<>(size - i);
                        z = false;
                    }
                    emptyList.add(modelLoader);
                }
            }
            if (!emptyList.isEmpty()) {
                return emptyList;
            }
            throw new NoModelLoaderAvailableException(model, list);
        }
        throw new NoModelLoaderAvailableException(model);
    }

    public Registry() {
        FactoryPools.FactoryPool factoryPool = new FactoryPools.FactoryPool(new Pools$SynchronizedPool(20), new FactoryPools.Factory<List<Object>>() { // from class: com.bumptech.glide.util.pool.FactoryPools.2
            @Override // com.bumptech.glide.util.pool.FactoryPools.Factory
            public final List<Object> create() {
                return new ArrayList();
            }
        }, new FactoryPools.Resetter<List<Object>>() { // from class: com.bumptech.glide.util.pool.FactoryPools.3
            @Override // com.bumptech.glide.util.pool.FactoryPools.Resetter
            public final void reset(List<Object> list) {
                list.clear();
            }
        });
        this.throwableListPool = factoryPool;
        this.modelLoaderRegistry = new ModelLoaderRegistry(factoryPool);
        List<String> asList = Arrays.asList("Gif", "Bitmap", "BitmapDrawable");
        ArrayList arrayList = new ArrayList(asList.size());
        arrayList.add("legacy_prepend_all");
        for (String str : asList) {
            arrayList.add(str);
        }
        arrayList.add("legacy_append");
        ResourceDecoderRegistry resourceDecoderRegistry = this.decoderRegistry;
        synchronized (resourceDecoderRegistry) {
            ArrayList arrayList2 = new ArrayList(resourceDecoderRegistry.bucketPriorityList);
            resourceDecoderRegistry.bucketPriorityList.clear();
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                resourceDecoderRegistry.bucketPriorityList.add((String) it.next());
            }
            Iterator it2 = arrayList2.iterator();
            while (it2.hasNext()) {
                String str2 = (String) it2.next();
                if (!arrayList.contains(str2)) {
                    resourceDecoderRegistry.bucketPriorityList.add(str2);
                }
            }
        }
    }

    /* loaded from: classes.dex */
    public static class NoModelLoaderAvailableException extends MissingComponentException {
        /* JADX WARN: Illegal instructions before constructor call */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public NoModelLoaderAvailableException(java.lang.Object r2) {
            /*
                r1 = this;
                java.lang.String r0 = "Failed to find any ModelLoaders registered for model class: "
                java.lang.StringBuilder r0 = android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m(r0)
                java.lang.Class r2 = r2.getClass()
                r0.append(r2)
                java.lang.String r2 = r0.toString()
                r1.<init>(r2)
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: com.bumptech.glide.Registry.NoModelLoaderAvailableException.<init>(java.lang.Object):void");
        }

        public <M> NoModelLoaderAvailableException(M m, List<ModelLoader<M, ?>> list) {
            super("Found ModelLoaders for model class: " + list + ", but none that handle this specific model instance: " + m);
        }

        public NoModelLoaderAvailableException(Class<?> cls, Class<?> cls2) {
            super("Failed to find any ModelLoaders for model: " + cls + " and data: " + cls2);
        }
    }

    public final void append(Class cls, ResourceEncoder resourceEncoder) {
        ResourceEncoderRegistry resourceEncoderRegistry = this.resourceEncoderRegistry;
        synchronized (resourceEncoderRegistry) {
            resourceEncoderRegistry.encoders.add(new ResourceEncoderRegistry.Entry(cls, resourceEncoder));
        }
    }

    public final void register(Class cls, Class cls2, ResourceTranscoder resourceTranscoder) {
        TranscoderRegistry transcoderRegistry = this.transcoderRegistry;
        synchronized (transcoderRegistry) {
            transcoderRegistry.transcoders.add(new TranscoderRegistry.Entry(cls, cls2, resourceTranscoder));
        }
    }

    public final void append(Class cls, Class cls2, ModelLoaderFactory modelLoaderFactory) {
        ModelLoaderRegistry modelLoaderRegistry = this.modelLoaderRegistry;
        synchronized (modelLoaderRegistry) {
            MultiModelLoaderFactory multiModelLoaderFactory = modelLoaderRegistry.multiModelLoaderFactory;
            synchronized (multiModelLoaderFactory) {
                MultiModelLoaderFactory.Entry entry = new MultiModelLoaderFactory.Entry(cls, cls2, modelLoaderFactory);
                ArrayList arrayList = multiModelLoaderFactory.entries;
                arrayList.add(arrayList.size(), entry);
            }
            modelLoaderRegistry.cache.cachedModelLoaders.clear();
        }
    }

    /* loaded from: classes.dex */
    public static class MissingComponentException extends RuntimeException {
        public MissingComponentException(String str) {
            super(str);
        }
    }
}
