package com.google.common.collect;

import java.util.List;
/* loaded from: classes.dex */
public interface ListMultimap<K, V> extends Multimap<K, V> {
    List<V> get(K key);
}
