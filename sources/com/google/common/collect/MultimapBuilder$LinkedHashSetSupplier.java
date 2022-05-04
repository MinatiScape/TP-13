package com.google.common.collect;

import com.google.common.base.Supplier;
import java.io.Serializable;
import java.util.Set;
/* loaded from: classes.dex */
public final class MultimapBuilder$LinkedHashSetSupplier<V> implements Supplier<Set<V>>, Serializable {
    private final int expectedValuesPerKey;

    public MultimapBuilder$LinkedHashSetSupplier(int expectedValuesPerKey) {
        CollectPreconditions.checkNonnegative(expectedValuesPerKey, "expectedValuesPerKey");
        this.expectedValuesPerKey = expectedValuesPerKey;
    }

    @Override // com.google.common.base.Supplier
    public Object get() {
        return new CompactLinkedHashSet(this.expectedValuesPerKey);
    }
}
