package com.bumptech.glide.provider;

import androidx.collection.ArrayMap;
import androidx.collection.ContainerHelpers;
import com.bumptech.glide.load.engine.DecodePath;
import com.bumptech.glide.load.engine.LoadPath;
import com.bumptech.glide.util.MultiClassKey;
import java.util.Collections;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes.dex */
public final class LoadPathCache {
    public static final LoadPath<?, ?, ?> NO_PATHS_SIGNAL = new LoadPath<>(Object.class, Object.class, Object.class, Collections.singletonList(new DecodePath(Object.class, Object.class, Object.class, Collections.emptyList(), new ContainerHelpers(), null)), null);
    public final ArrayMap<MultiClassKey, LoadPath<?, ?, ?>> cache = new ArrayMap<>();
    public final AtomicReference<MultiClassKey> keyRef = new AtomicReference<>();
}
