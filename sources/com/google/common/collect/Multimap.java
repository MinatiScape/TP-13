package com.google.common.collect;

import com.google.photos.base.BaseImageUrlUtil;
import java.util.Collection;
import java.util.Map;
/* loaded from: classes.dex */
public interface Multimap<K, V> {
    Map<K, Collection<V>> asMap();

    void clear();

    boolean put(BaseImageUrlUtil.OptionInfo key, String value);
}
