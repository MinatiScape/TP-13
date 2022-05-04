package com.google.protobuf;

import java.io.IOException;
import java.util.Arrays;
import java.util.Objects;
/* loaded from: classes.dex */
public class UnknownFieldSetLiteSchema extends UnknownFieldSchema<UnknownFieldSetLite, UnknownFieldSetLite> {
    @Override // com.google.protobuf.UnknownFieldSchema
    public void addVarint(UnknownFieldSetLite unknownFieldSetLite, int i, long j) {
        unknownFieldSetLite.storeField((i << 3) | 0, Long.valueOf(j));
    }

    @Override // com.google.protobuf.UnknownFieldSchema
    public UnknownFieldSetLite getFromMessage(Object obj) {
        return ((GeneratedMessageLite) obj).unknownFields;
    }

    @Override // com.google.protobuf.UnknownFieldSchema
    public int getSerializedSize(UnknownFieldSetLite unknownFieldSetLite) {
        return unknownFieldSetLite.getSerializedSize();
    }

    @Override // com.google.protobuf.UnknownFieldSchema
    public int getSerializedSizeAsMessageSet(UnknownFieldSetLite unknownFieldSetLite) {
        UnknownFieldSetLite unknownFieldSetLite2 = unknownFieldSetLite;
        int i = unknownFieldSetLite2.memoizedSerializedSize;
        if (i != -1) {
            return i;
        }
        int i2 = 0;
        for (int i3 = 0; i3 < unknownFieldSetLite2.count; i3++) {
            i2 += CodedOutputStream.computeBytesSize(3, (ByteString) unknownFieldSetLite2.objects[i3]) + CodedOutputStream.computeUInt32Size(2, unknownFieldSetLite2.tags[i3] >>> 3) + (CodedOutputStream.computeTagSize(1) * 2);
        }
        unknownFieldSetLite2.memoizedSerializedSize = i2;
        return i2;
    }

    @Override // com.google.protobuf.UnknownFieldSchema
    public void makeImmutable(Object obj) {
        ((GeneratedMessageLite) obj).unknownFields.isMutable = false;
    }

    @Override // com.google.protobuf.UnknownFieldSchema
    public UnknownFieldSetLite merge(UnknownFieldSetLite unknownFieldSetLite, UnknownFieldSetLite unknownFieldSetLite2) {
        UnknownFieldSetLite unknownFieldSetLite3 = unknownFieldSetLite;
        UnknownFieldSetLite unknownFieldSetLite4 = unknownFieldSetLite2;
        if (unknownFieldSetLite4.equals(UnknownFieldSetLite.DEFAULT_INSTANCE)) {
            return unknownFieldSetLite3;
        }
        int i = unknownFieldSetLite3.count + unknownFieldSetLite4.count;
        int[] copyOf = Arrays.copyOf(unknownFieldSetLite3.tags, i);
        System.arraycopy(unknownFieldSetLite4.tags, 0, copyOf, unknownFieldSetLite3.count, unknownFieldSetLite4.count);
        Object[] copyOf2 = Arrays.copyOf(unknownFieldSetLite3.objects, i);
        System.arraycopy(unknownFieldSetLite4.objects, 0, copyOf2, unknownFieldSetLite3.count, unknownFieldSetLite4.count);
        return new UnknownFieldSetLite(i, copyOf, copyOf2, true);
    }

    @Override // com.google.protobuf.UnknownFieldSchema
    public UnknownFieldSetLite newBuilder() {
        return UnknownFieldSetLite.newInstance();
    }

    @Override // com.google.protobuf.UnknownFieldSchema
    public void setToMessage(Object obj, UnknownFieldSetLite unknownFieldSetLite) {
        ((GeneratedMessageLite) obj).unknownFields = unknownFieldSetLite;
    }

    @Override // com.google.protobuf.UnknownFieldSchema
    public void writeAsMessageSetTo(UnknownFieldSetLite unknownFieldSetLite, Writer writer) throws IOException {
        UnknownFieldSetLite unknownFieldSetLite2 = unknownFieldSetLite;
        Objects.requireNonNull(unknownFieldSetLite2);
        Objects.requireNonNull(writer);
        for (int i = 0; i < unknownFieldSetLite2.count; i++) {
            ((CodedOutputStreamWriter) writer).writeMessageSetItem(unknownFieldSetLite2.tags[i] >>> 3, unknownFieldSetLite2.objects[i]);
        }
    }

    @Override // com.google.protobuf.UnknownFieldSchema
    public void writeTo(UnknownFieldSetLite unknownFieldSetLite, Writer writer) throws IOException {
        unknownFieldSetLite.writeTo(writer);
    }
}
