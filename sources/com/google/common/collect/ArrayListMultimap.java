package com.google.common.collect;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;
/* loaded from: classes.dex */
public final class ArrayListMultimap<K, V> extends ArrayListMultimapGwtSerializationDependencies<K, V> {
    private static final long serialVersionUID = 0;
    public transient int expectedValuesPerKey = 3;

    private ArrayListMultimap() {
        super(new CompactHashMap(12));
        CollectPreconditions.checkNonnegative(3, "expectedValuesPerKey");
    }

    public static <K, V> ArrayListMultimap<K, V> create() {
        return new ArrayListMultimap<>();
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap
    public final Collection createCollection() {
        return new ArrayList(this.expectedValuesPerKey);
    }

    private void readObject(ObjectInputStream stream) throws IOException, ClassNotFoundException {
        stream.defaultReadObject();
        this.expectedValuesPerKey = 3;
        int readInt = stream.readInt();
        setMap(new CompactHashMap());
        for (int i = 0; i < readInt; i++) {
            Collection collection = get(stream.readObject());
            int readInt2 = stream.readInt();
            for (int i2 = 0; i2 < readInt2; i2++) {
                collection.add(stream.readObject());
            }
        }
    }

    private void writeObject(ObjectOutputStream stream) throws IOException {
        stream.defaultWriteObject();
        stream.writeInt(asMap().size());
        for (Map.Entry<K, Collection<V>> entry : asMap().entrySet()) {
            stream.writeObject(entry.getKey());
            stream.writeInt(entry.getValue().size());
            for (V v : entry.getValue()) {
                stream.writeObject(v);
            }
        }
    }
}
