package com.google.protobuf;

import java.util.Iterator;
import java.util.Map;
/* loaded from: classes.dex */
public final class MapFieldSchemaLite implements MapFieldSchema {
    @Override // com.google.protobuf.MapFieldSchema
    public final Object toImmutable(Object obj) {
        ((MapFieldLite) obj).makeImmutable();
        return obj;
    }

    @Override // com.google.protobuf.MapFieldSchema
    public final void forMapMetadata(Object obj) {
        ((MapEntryLite) obj).getClass();
    }

    @Override // com.google.protobuf.MapFieldSchema
    public final int getSerializedSize(int i, Object obj, Object obj2) {
        MapFieldLite mapFieldLite = (MapFieldLite) obj;
        MapEntryLite mapEntryLite = (MapEntryLite) obj2;
        if (mapFieldLite.isEmpty()) {
            return 0;
        }
        Iterator it = mapFieldLite.entrySet().iterator();
        if (!it.hasNext()) {
            return 0;
        }
        Map.Entry entry = (Map.Entry) it.next();
        entry.getKey();
        entry.getValue();
        mapEntryLite.getClass();
        CodedOutputStream.computeTagSize(i);
        throw null;
    }

    @Override // com.google.protobuf.MapFieldSchema
    public final boolean isImmutable(Object obj) {
        return !((MapFieldLite) obj).isMutable();
    }

    @Override // com.google.protobuf.MapFieldSchema
    public final MapFieldLite mergeFrom(Object obj, Object obj2) {
        MapFieldLite mapFieldLite = (MapFieldLite) obj;
        MapFieldLite mapFieldLite2 = (MapFieldLite) obj2;
        if (!mapFieldLite2.isEmpty()) {
            if (!mapFieldLite.isMutable()) {
                mapFieldLite = mapFieldLite.mutableCopy();
            }
            mapFieldLite.ensureMutable();
            if (!mapFieldLite2.isEmpty()) {
                mapFieldLite.putAll(mapFieldLite2);
            }
        }
        return mapFieldLite;
    }

    @Override // com.google.protobuf.MapFieldSchema
    public final MapFieldLite newMapField() {
        return MapFieldLite.EMPTY_MAP_FIELD.mutableCopy();
    }

    @Override // com.google.protobuf.MapFieldSchema
    public final MapFieldLite forMapData(Object obj) {
        return (MapFieldLite) obj;
    }

    @Override // com.google.protobuf.MapFieldSchema
    public final MapFieldLite forMutableMapData(Object obj) {
        return (MapFieldLite) obj;
    }
}
