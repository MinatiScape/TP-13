package com.google.common.collect;

import java.util.Set;
/* loaded from: classes.dex */
public interface SetMultimap<K, V> extends Multimap<K, V> {
    Set<V> get(K key);
}
