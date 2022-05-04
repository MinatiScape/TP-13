package com.bumptech.glide.load.data;

import com.bumptech.glide.load.data.DataRewinder;
import java.util.HashMap;
/* loaded from: classes.dex */
public final class DataRewinderRegistry {
    public static final AnonymousClass1 DEFAULT_FACTORY = new DataRewinder.Factory<Object>() { // from class: com.bumptech.glide.load.data.DataRewinderRegistry.1
        @Override // com.bumptech.glide.load.data.DataRewinder.Factory
        public final DataRewinder<Object> build(Object obj) {
            return new DefaultRewinder(obj);
        }

        @Override // com.bumptech.glide.load.data.DataRewinder.Factory
        public final Class<Object> getDataClass() {
            throw new UnsupportedOperationException("Not implemented");
        }
    };
    public final HashMap rewinders = new HashMap();

    /* loaded from: classes.dex */
    public static final class DefaultRewinder implements DataRewinder<Object> {
        public final Object data;

        @Override // com.bumptech.glide.load.data.DataRewinder
        public final void cleanup() {
        }

        public DefaultRewinder(Object obj) {
            this.data = obj;
        }

        @Override // com.bumptech.glide.load.data.DataRewinder
        public final Object rewindAndGet() {
            return this.data;
        }
    }
}
