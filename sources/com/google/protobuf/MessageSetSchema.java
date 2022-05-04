package com.google.protobuf;

import com.google.protobuf.FieldSet;
import com.google.protobuf.LazyField;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
/* loaded from: classes.dex */
public final class MessageSetSchema<T> implements Schema<T> {
    public final MessageLite defaultInstance;
    public final ExtensionSchema<?> extensionSchema;
    public final boolean hasExtensions;
    public final UnknownFieldSchema<?, ?> unknownFieldSchema;

    @Override // com.google.protobuf.Schema
    public final void mergeFrom(T t, T t2) {
        UnknownFieldSchema<?, ?> unknownFieldSchema = this.unknownFieldSchema;
        Class<?> cls = SchemaUtil.GENERATED_MESSAGE_CLASS;
        unknownFieldSchema.setToMessage(t, unknownFieldSchema.merge(unknownFieldSchema.getFromMessage(t), unknownFieldSchema.getFromMessage(t2)));
        if (this.hasExtensions) {
            SchemaUtil.mergeExtensions(this.extensionSchema, t, t2);
        }
    }

    @Override // com.google.protobuf.Schema
    public final boolean equals(T t, T t2) {
        if (!this.unknownFieldSchema.getFromMessage(t).equals(this.unknownFieldSchema.getFromMessage(t2))) {
            return false;
        }
        if (this.hasExtensions) {
            return this.extensionSchema.getExtensions(t).equals(this.extensionSchema.getExtensions(t2));
        }
        return true;
    }

    @Override // com.google.protobuf.Schema
    public final int getSerializedSize(T t) {
        UnknownFieldSchema<?, ?> unknownFieldSchema = this.unknownFieldSchema;
        int serializedSizeAsMessageSet = unknownFieldSchema.getSerializedSizeAsMessageSet(unknownFieldSchema.getFromMessage(t)) + 0;
        if (!this.hasExtensions) {
            return serializedSizeAsMessageSet;
        }
        FieldSet<?> extensions = this.extensionSchema.getExtensions(t);
        int i = 0;
        for (int i2 = 0; i2 < extensions.fields.getNumArrayEntries(); i2++) {
            i += FieldSet.getMessageSetSerializedSize(extensions.fields.getArrayEntryAt(i2));
        }
        for (Map.Entry<Object, Object> entry : extensions.fields.getOverflowEntries()) {
            i += FieldSet.getMessageSetSerializedSize(entry);
        }
        return serializedSizeAsMessageSet + i;
    }

    @Override // com.google.protobuf.Schema
    public final int hashCode(T t) {
        int hashCode = this.unknownFieldSchema.getFromMessage(t).hashCode();
        if (this.hasExtensions) {
            return (hashCode * 53) + this.extensionSchema.getExtensions(t).hashCode();
        }
        return hashCode;
    }

    @Override // com.google.protobuf.Schema
    public final boolean isInitialized(T t) {
        return this.extensionSchema.getExtensions(t).isInitialized();
    }

    @Override // com.google.protobuf.Schema
    public final void makeImmutable(T t) {
        this.unknownFieldSchema.makeImmutable(t);
        this.extensionSchema.makeImmutable(t);
    }

    @Override // com.google.protobuf.Schema
    public final T newInstance() {
        return (T) this.defaultInstance.newBuilderForType$1().buildPartial();
    }

    @Override // com.google.protobuf.Schema
    public final void writeTo(Object obj, CodedOutputStreamWriter codedOutputStreamWriter) throws IOException {
        Iterator<Map.Entry<?, Object>> it = this.extensionSchema.getExtensions(obj).iterator();
        while (it.hasNext()) {
            Map.Entry<?, Object> next = it.next();
            FieldSet.FieldDescriptorLite fieldDescriptorLite = (FieldSet.FieldDescriptorLite) next.getKey();
            if (fieldDescriptorLite.getLiteJavaType() == WireFormat$JavaType.MESSAGE) {
                fieldDescriptorLite.isRepeated();
                fieldDescriptorLite.isPacked();
                if (next instanceof LazyField.LazyEntry) {
                    fieldDescriptorLite.getNumber();
                    codedOutputStreamWriter.writeMessageSetItem(0, ((LazyField.LazyEntry) next).entry.getValue().toByteString());
                } else {
                    fieldDescriptorLite.getNumber();
                    codedOutputStreamWriter.writeMessageSetItem(0, next.getValue());
                }
            } else {
                throw new IllegalStateException("Found invalid MessageSet item.");
            }
        }
        UnknownFieldSchema<?, ?> unknownFieldSchema = this.unknownFieldSchema;
        unknownFieldSchema.writeAsMessageSetTo(unknownFieldSchema.getFromMessage(obj), codedOutputStreamWriter);
    }

    public MessageSetSchema(UnknownFieldSchema<?, ?> unknownFieldSchema, ExtensionSchema<?> extensionSchema, MessageLite messageLite) {
        this.unknownFieldSchema = unknownFieldSchema;
        this.hasExtensions = extensionSchema.hasExtensions(messageLite);
        this.extensionSchema = extensionSchema;
        this.defaultInstance = messageLite;
    }

    /* JADX WARN: Removed duplicated region for block: B:35:0x008c  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x0091 A[EDGE_INSN: B:61:0x0091->B:36:0x0091 ?: BREAK  , SYNTHETIC] */
    @Override // com.google.protobuf.Schema
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void mergeFrom(T r10, byte[] r11, int r12, int r13, com.google.protobuf.ArrayDecoders.Registers r14) throws java.io.IOException {
        /*
            r9 = this;
            r0 = r10
            com.google.protobuf.GeneratedMessageLite r0 = (com.google.protobuf.GeneratedMessageLite) r0
            com.google.protobuf.UnknownFieldSetLite r1 = r0.unknownFields
            com.google.protobuf.UnknownFieldSetLite r2 = com.google.protobuf.UnknownFieldSetLite.DEFAULT_INSTANCE
            if (r1 != r2) goto L10
            com.google.protobuf.UnknownFieldSetLite r1 = new com.google.protobuf.UnknownFieldSetLite
            r1.<init>()
            r0.unknownFields = r1
        L10:
            com.google.protobuf.GeneratedMessageLite$ExtendableMessage r10 = (com.google.protobuf.GeneratedMessageLite.ExtendableMessage) r10
            com.google.protobuf.FieldSet<com.google.protobuf.GeneratedMessageLite$ExtensionDescriptor> r0 = r10.extensions
            boolean r2 = r0.isImmutable
            if (r2 == 0) goto L1e
            com.google.protobuf.FieldSet r0 = r0.clone()
            r10.extensions = r0
        L1e:
            r10 = 0
            r0 = r10
        L20:
            if (r12 >= r13) goto L9b
            int r4 = com.google.protobuf.ArrayDecoders.decodeVarint32(r11, r12, r14)
            int r2 = r14.int1
            r12 = 11
            r3 = 2
            if (r2 == r12) goto L50
            r12 = r2 & 7
            if (r12 != r3) goto L4b
            com.google.protobuf.ExtensionSchema<?> r12 = r9.extensionSchema
            com.google.protobuf.ExtensionRegistryLite r0 = r14.extensionRegistry
            com.google.protobuf.MessageLite r3 = r9.defaultInstance
            int r5 = r2 >>> 3
            com.google.protobuf.GeneratedMessageLite$GeneratedExtension r0 = r12.findExtensionByNumber(r0, r3, r5)
            if (r0 != 0) goto L48
            r3 = r11
            r5 = r13
            r6 = r1
            r7 = r14
            int r12 = com.google.protobuf.ArrayDecoders.decodeUnknownField(r2, r3, r4, r5, r6, r7)
            goto L20
        L48:
            com.google.protobuf.Protobuf r9 = com.google.protobuf.Protobuf.INSTANCE
            throw r10
        L4b:
            int r12 = com.google.protobuf.ArrayDecoders.skipField(r2, r11, r4, r13, r14)
            goto L20
        L50:
            r12 = 0
            r2 = r10
        L52:
            if (r4 >= r13) goto L91
            int r4 = com.google.protobuf.ArrayDecoders.decodeVarint32(r11, r4, r14)
            int r5 = r14.int1
            int r6 = r5 >>> 3
            r7 = r5 & 7
            if (r6 == r3) goto L74
            r8 = 3
            if (r6 == r8) goto L64
            goto L87
        L64:
            if (r0 != 0) goto L71
            if (r7 != r3) goto L87
            int r4 = com.google.protobuf.ArrayDecoders.decodeBytes(r11, r4, r14)
            java.lang.Object r2 = r14.object1
            com.google.protobuf.ByteString r2 = (com.google.protobuf.ByteString) r2
            goto L52
        L71:
            com.google.protobuf.Protobuf r9 = com.google.protobuf.Protobuf.INSTANCE
            throw r10
        L74:
            if (r7 != 0) goto L87
            int r4 = com.google.protobuf.ArrayDecoders.decodeVarint32(r11, r4, r14)
            int r12 = r14.int1
            com.google.protobuf.ExtensionSchema<?> r0 = r9.extensionSchema
            com.google.protobuf.ExtensionRegistryLite r5 = r14.extensionRegistry
            com.google.protobuf.MessageLite r6 = r9.defaultInstance
            com.google.protobuf.GeneratedMessageLite$GeneratedExtension r0 = r0.findExtensionByNumber(r5, r6, r12)
            goto L52
        L87:
            r6 = 12
            if (r5 != r6) goto L8c
            goto L91
        L8c:
            int r4 = com.google.protobuf.ArrayDecoders.skipField(r5, r11, r4, r13, r14)
            goto L52
        L91:
            if (r2 == 0) goto L99
            int r12 = r12 << 3
            r12 = r12 | r3
            r1.storeField(r12, r2)
        L99:
            r12 = r4
            goto L20
        L9b:
            if (r12 != r13) goto L9e
            return
        L9e:
            com.google.protobuf.InvalidProtocolBufferException r9 = com.google.protobuf.InvalidProtocolBufferException.parseFailure()
            throw r9
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.protobuf.MessageSetSchema.mergeFrom(java.lang.Object, byte[], int, int, com.google.protobuf.ArrayDecoders$Registers):void");
    }
}
