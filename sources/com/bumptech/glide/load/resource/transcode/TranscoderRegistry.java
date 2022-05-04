package com.bumptech.glide.load.resource.transcode;

import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public class TranscoderRegistry {
    public final List<Entry<?, ?>> transcoders = new ArrayList();

    /* loaded from: classes.dex */
    public static final class Entry<Z, R> {
        public final Class<Z> fromClass;
        public final Class<R> toClass;
        public final ResourceTranscoder<Z, R> transcoder;

        public Entry(Class<Z> fromClass, Class<R> toClass, ResourceTranscoder<Z, R> transcoder) {
            this.fromClass = fromClass;
            this.toClass = toClass;
            this.transcoder = transcoder;
        }

        public boolean handles(Class<?> fromClass, Class<?> toClass) {
            return this.fromClass.isAssignableFrom(fromClass) && toClass.isAssignableFrom(this.toClass);
        }
    }

    public synchronized <Z, R> List<Class<R>> getTranscodeClasses(Class<Z> resourceClass, Class<R> transcodeClass) {
        ArrayList arrayList = new ArrayList();
        if (transcodeClass.isAssignableFrom(resourceClass)) {
            arrayList.add(transcodeClass);
            return arrayList;
        }
        for (Entry<?, ?> entry : this.transcoders) {
            if (entry.handles(resourceClass, transcodeClass)) {
                arrayList.add(transcodeClass);
            }
        }
        return arrayList;
    }
}
