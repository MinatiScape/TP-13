package com.google.common.collect;

import com.google.common.base.Supplier;
import java.io.Serializable;
import java.util.Set;
/* loaded from: classes.dex */
public abstract class MultimapBuilder<K0, V0> {

    /* renamed from: com.google.common.collect.MultimapBuilder$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public final class AnonymousClass1 extends MultimapBuilderWithKeys<Object> {
        public final /* synthetic */ int val$expectedKeys = 8;
    }

    /* loaded from: classes.dex */
    public static final class LinkedHashSetSupplier<V> implements Supplier<Set<V>>, Serializable {
        private final int expectedValuesPerKey;

        @Override // com.google.common.base.Supplier
        public final Object get() {
            return new CompactLinkedHashSet(this.expectedValuesPerKey);
        }

        public LinkedHashSetSupplier(int expectedValuesPerKey) {
            CollectPreconditions.checkNonnegative(expectedValuesPerKey, "expectedValuesPerKey");
            this.expectedValuesPerKey = expectedValuesPerKey;
        }
    }

    /* loaded from: classes.dex */
    public static abstract class MultimapBuilderWithKeys<K0> {
    }

    /* loaded from: classes.dex */
    public static abstract class SetMultimapBuilder<K0, V0> extends MultimapBuilder<K0, V0> {
    }
}
