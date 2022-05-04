package com.bumptech.glide;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes.dex */
public final class GlideExperiments {
    public final Map<Class<?>, Object> experiments;

    /* loaded from: classes.dex */
    public static final class Builder {
        public final HashMap experiments = new HashMap();
    }

    public GlideExperiments(Builder builder) {
        this.experiments = Collections.unmodifiableMap(new HashMap(builder.experiments));
    }
}
