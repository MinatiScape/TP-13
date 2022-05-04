package com.bumptech.glide.provider;

import com.bumptech.glide.load.ResourceDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/* loaded from: classes.dex */
public class ResourceDecoderRegistry {
    public final List<String> bucketPriorityList = new ArrayList();
    public final Map<String, List<Entry<?, ?>>> decoders = new HashMap();

    /* loaded from: classes.dex */
    public static class Entry<T, R> {
        public final Class<T> dataClass;
        public final ResourceDecoder<T, R> decoder;
        public final Class<R> resourceClass;

        public Entry(Class<T> dataClass, Class<R> resourceClass, ResourceDecoder<T, R> decoder) {
            this.dataClass = dataClass;
            this.resourceClass = resourceClass;
            this.decoder = decoder;
        }

        public boolean handles(Class<?> dataClass, Class<?> resourceClass) {
            return this.dataClass.isAssignableFrom(dataClass) && resourceClass.isAssignableFrom(this.resourceClass);
        }
    }

    public final synchronized List<Entry<?, ?>> getOrAddEntryList(String bucket) {
        List<Entry<?, ?>> list;
        if (!this.bucketPriorityList.contains(bucket)) {
            this.bucketPriorityList.add(bucket);
        }
        list = this.decoders.get(bucket);
        if (list == null) {
            list = new ArrayList<>();
            this.decoders.put(bucket, list);
        }
        return list;
    }

    public synchronized <T, R> List<Class<R>> getResourceClasses(Class<T> dataClass, Class<R> resourceClass) {
        ArrayList arrayList;
        arrayList = new ArrayList();
        for (String str : this.bucketPriorityList) {
            List<Entry<?, ?>> list = this.decoders.get(str);
            if (list != null) {
                for (Entry<?, ?> entry : list) {
                    if (entry.handles(dataClass, resourceClass) && !arrayList.contains(entry.resourceClass)) {
                        arrayList.add(entry.resourceClass);
                    }
                }
            }
        }
        return arrayList;
    }
}
