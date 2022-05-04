package com.bumptech.glide.provider;

import com.bumptech.glide.load.Encoder;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final class EncoderRegistry {
    public final ArrayList encoders = new ArrayList();

    /* loaded from: classes.dex */
    public static final class Entry<T> {
        public final Class<T> dataClass;
        public final Encoder<T> encoder;

        public Entry(Class<T> cls, Encoder<T> encoder) {
            this.dataClass = cls;
            this.encoder = encoder;
        }
    }
}
