package com.google.protobuf;
/* loaded from: classes.dex */
public interface MapFieldSchema {
    MapFieldLite forMapData(Object obj);

    void forMapMetadata(Object obj);

    MapFieldLite forMutableMapData(Object obj);

    int getSerializedSize(int i, Object obj, Object obj2);

    boolean isImmutable(Object obj);

    MapFieldLite mergeFrom(Object obj, Object obj2);

    MapFieldLite newMapField();

    Object toImmutable(Object obj);
}
