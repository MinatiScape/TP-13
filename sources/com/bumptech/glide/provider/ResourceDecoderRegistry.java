package com.bumptech.glide.provider;

import com.bumptech.glide.load.ResourceDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes.dex */
public final class ResourceDecoderRegistry {
    public final ArrayList bucketPriorityList = new ArrayList();
    public final HashMap decoders = new HashMap();

    public final synchronized List<Entry<?, ?>> getOrAddEntryList(String str) {
        List<Entry<?, ?>> list;
        if (!this.bucketPriorityList.contains(str)) {
            this.bucketPriorityList.add(str);
        }
        list = (List) this.decoders.get(str);
        if (list == null) {
            list = new ArrayList<>();
            this.decoders.put(str, list);
        }
        return list;
    }

    public final synchronized ArrayList getResourceClasses(Class cls, Class cls2) {
        ArrayList arrayList;
        boolean z;
        arrayList = new ArrayList();
        Iterator it = this.bucketPriorityList.iterator();
        while (it.hasNext()) {
            List<Entry> list = (List) this.decoders.get((String) it.next());
            if (list != null) {
                for (Entry entry : list) {
                    if (!entry.dataClass.isAssignableFrom(cls) || !cls2.isAssignableFrom(entry.resourceClass)) {
                        z = false;
                    } else {
                        z = true;
                    }
                    if (z && !arrayList.contains(entry.resourceClass)) {
                        arrayList.add(entry.resourceClass);
                    }
                }
            }
        }
        return arrayList;
    }

    /* loaded from: classes.dex */
    public static class Entry<T, R> {
        public final Class<T> dataClass;
        public final ResourceDecoder<T, R> decoder;
        public final Class<R> resourceClass;

        public Entry(Class<T> cls, Class<R> cls2, ResourceDecoder<T, R> resourceDecoder) {
            this.dataClass = cls;
            this.resourceClass = cls2;
            this.decoder = resourceDecoder;
        }
    }
}
