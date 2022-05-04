package com.bumptech.glide.load.resource.transcode;

import java.util.ArrayList;
import java.util.Iterator;
/* loaded from: classes.dex */
public final class TranscoderRegistry {
    public final ArrayList transcoders = new ArrayList();

    public final synchronized ArrayList getTranscodeClasses(Class cls, Class cls2) {
        boolean z;
        ArrayList arrayList = new ArrayList();
        if (cls2.isAssignableFrom(cls)) {
            arrayList.add(cls2);
            return arrayList;
        }
        Iterator it = this.transcoders.iterator();
        while (it.hasNext()) {
            Entry entry = (Entry) it.next();
            if (!entry.fromClass.isAssignableFrom(cls) || !cls2.isAssignableFrom(entry.toClass)) {
                z = false;
            } else {
                z = true;
            }
            if (z) {
                arrayList.add(cls2);
            }
        }
        return arrayList;
    }

    /* loaded from: classes.dex */
    public static final class Entry<Z, R> {
        public final Class<Z> fromClass;
        public final Class<R> toClass;
        public final ResourceTranscoder<Z, R> transcoder;

        public Entry(Class<Z> cls, Class<R> cls2, ResourceTranscoder<Z, R> resourceTranscoder) {
            this.fromClass = cls;
            this.toClass = cls2;
            this.transcoder = resourceTranscoder;
        }
    }
}
