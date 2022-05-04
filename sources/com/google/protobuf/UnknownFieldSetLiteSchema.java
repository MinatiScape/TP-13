package com.google.protobuf;

import java.io.IOException;
import java.util.Arrays;
/* loaded from: classes.dex */
public final class UnknownFieldSetLiteSchema extends UnknownFieldSchema<UnknownFieldSetLite, UnknownFieldSetLite> {
    @Override // com.google.protobuf.UnknownFieldSchema
    public final void addVarint(UnknownFieldSetLite unknownFieldSetLite, int i, long j) {
        unknownFieldSetLite.storeField((i << 3) | 0, Long.valueOf(j));
    }

    @Override // com.google.protobuf.UnknownFieldSchema
    public final UnknownFieldSetLite getFromMessage(Object obj) {
        return ((GeneratedMessageLite) obj).unknownFields;
    }

    @Override // com.google.protobuf.UnknownFieldSchema
    public final int getSerializedSize(UnknownFieldSetLite unknownFieldSetLite) {
        return unknownFieldSetLite.getSerializedSize();
    }

    @Override // com.google.protobuf.UnknownFieldSchema
    public final int getSerializedSizeAsMessageSet(UnknownFieldSetLite unknownFieldSetLite) {
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
    public final void makeImmutable(Object obj) {
        ((GeneratedMessageLite) obj).unknownFields.isMutable = false;
    }

    @Override // com.google.protobuf.UnknownFieldSchema
    public final UnknownFieldSetLite merge(Object obj, Object obj2) {
        UnknownFieldSetLite unknownFieldSetLite = (UnknownFieldSetLite) obj;
        UnknownFieldSetLite unknownFieldSetLite2 = (UnknownFieldSetLite) obj2;
        if (unknownFieldSetLite2.equals(UnknownFieldSetLite.DEFAULT_INSTANCE)) {
            return unknownFieldSetLite;
        }
        int i = unknownFieldSetLite.count + unknownFieldSetLite2.count;
        int[] copyOf = Arrays.copyOf(unknownFieldSetLite.tags, i);
        System.arraycopy(unknownFieldSetLite2.tags, 0, copyOf, unknownFieldSetLite.count, unknownFieldSetLite2.count);
        Object[] copyOf2 = Arrays.copyOf(unknownFieldSetLite.objects, i);
        System.arraycopy(unknownFieldSetLite2.objects, 0, copyOf2, unknownFieldSetLite.count, unknownFieldSetLite2.count);
        return new UnknownFieldSetLite(i, copyOf, copyOf2, true);
    }

    @Override // com.google.protobuf.UnknownFieldSchema
    public final UnknownFieldSetLite newBuilder() {
        return new UnknownFieldSetLite();
    }

    @Override // com.google.protobuf.UnknownFieldSchema
    public final void setToMessage(Object obj, UnknownFieldSetLite unknownFieldSetLite) {
        ((GeneratedMessageLite) obj).unknownFields = unknownFieldSetLite;
    }

    @Override // com.google.protobuf.UnknownFieldSchema
    public final void writeAsMessageSetTo(Object obj, CodedOutputStreamWriter codedOutputStreamWriter) throws IOException {
        UnknownFieldSetLite unknownFieldSetLite = (UnknownFieldSetLite) obj;
        unknownFieldSetLite.getClass();
        codedOutputStreamWriter.getClass();
        for (int i = 0; i < unknownFieldSetLite.count; i++) {
            codedOutputStreamWriter.writeMessageSetItem(unknownFieldSetLite.tags[i] >>> 3, unknownFieldSetLite.objects[i]);
        }
    }

    @Override // com.google.protobuf.UnknownFieldSchema
    public final void writeTo(Object obj, CodedOutputStreamWriter codedOutputStreamWriter) throws IOException {
        ((UnknownFieldSetLite) obj).writeTo(codedOutputStreamWriter);
    }
}
