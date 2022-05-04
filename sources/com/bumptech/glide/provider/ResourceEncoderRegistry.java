package com.bumptech.glide.provider;

import com.bumptech.glide.load.ResourceEncoder;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public class ResourceEncoderRegistry {
    public final List<Entry<?>> encoders = new ArrayList();

    /* loaded from: classes.dex */
    public static final class Entry<T> {
        public final ResourceEncoder<T> encoder;
        public final Class<T> resourceClass;

        public Entry(Class<T> resourceClass, ResourceEncoder<T> encoder) {
            this.resourceClass = resourceClass;
            this.encoder = encoder;
        }
    }

    public synchronized <Z> ResourceEncoder<Z> get(Class<Z> resourceClass) {
        int size = this.encoders.size();
        for (int i = 0; i < size; i++) {
            Entry<?> entry = this.encoders.get(i);
            if (entry.resourceClass.isAssignableFrom(resourceClass)) {
                return (ResourceEncoder<Z>) entry.encoder;
            }
        }
        return null;
    }
}
