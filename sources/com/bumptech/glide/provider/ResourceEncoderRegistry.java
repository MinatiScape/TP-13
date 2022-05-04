package com.bumptech.glide.provider;

import com.bumptech.glide.load.ResourceEncoder;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final class ResourceEncoderRegistry {
    public final ArrayList encoders = new ArrayList();

    public final synchronized <Z> ResourceEncoder<Z> get(Class<Z> cls) {
        int size = this.encoders.size();
        for (int i = 0; i < size; i++) {
            Entry entry = (Entry) this.encoders.get(i);
            if (entry.resourceClass.isAssignableFrom(cls)) {
                return (ResourceEncoder<Z>) entry.encoder;
            }
        }
        return null;
    }

    /* loaded from: classes.dex */
    public static final class Entry<T> {
        public final ResourceEncoder<T> encoder;
        public final Class<T> resourceClass;

        public Entry(Class<T> cls, ResourceEncoder<T> resourceEncoder) {
            this.resourceClass = cls;
            this.encoder = resourceEncoder;
        }
    }
}
