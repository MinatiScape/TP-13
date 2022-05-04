package com.bumptech.glide.load.engine.cache;

import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.engine.DataCacheWriter;
import java.io.File;
/* loaded from: classes.dex */
public interface DiskCache {

    /* loaded from: classes.dex */
    public interface Factory {
    }

    void clear();

    File get(Key key);

    void put(Key key, DataCacheWriter dataCacheWriter);
}
