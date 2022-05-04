package com.google.protobuf;

import com.google.protobuf.FieldSet.FieldDescriptorLite;
import com.google.protobuf.GeneratedMessageLite;
import com.google.protobuf.Internal;
import com.google.protobuf.LazyField;
import com.google.protobuf.MessageLite;
import com.google.protobuf.SmallSortedMap;
import java.util.Iterator;
import java.util.Map;
import java.util.logging.Logger;
/* loaded from: classes.dex */
public final class FieldSet<FieldDescriptorType extends FieldDescriptorLite<FieldDescriptorType>> {
    public final SmallSortedMap.AnonymousClass1 fields;
    public boolean hasLazyField;
    public boolean isImmutable;

    /* loaded from: classes.dex */
    public interface FieldDescriptorLite<T extends FieldDescriptorLite<T>> extends Comparable<T> {
        WireFormat$JavaType getLiteJavaType();

        void getLiteType();

        void getNumber();

        GeneratedMessageLite.Builder internalMergeFrom(MessageLite.Builder builder, MessageLite messageLite);

        void isPacked();

        void isRepeated();
    }

    public FieldSet() {
        this.hasLazyField = false;
        int i = SmallSortedMap.$r8$clinit;
        this.fields = new SmallSortedMap.AnonymousClass1(16);
    }

    public final boolean isInitialized() {
        for (int i = 0; i < this.fields.getNumArrayEntries(); i++) {
            if (!isInitialized(this.fields.getArrayEntryAt(i))) {
                return false;
            }
        }
        for (Map.Entry<Object, Object> entry : this.fields.getOverflowEntries()) {
            if (!isInitialized(entry)) {
                return false;
            }
        }
        return true;
    }

    static {
        new FieldSet(0);
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0022, code lost:
        if ((r3 instanceof com.google.protobuf.Internal.EnumLite) == false) goto L16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x002b, code lost:
        if ((r3 instanceof byte[]) == false) goto L16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x002e, code lost:
        r0 = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:7:0x0019, code lost:
        if ((r3 instanceof com.google.protobuf.LazyField) == false) goto L16;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void verifyType(com.google.protobuf.WireFormat$FieldType r2, java.lang.Object r3) {
        /*
            java.nio.charset.Charset r0 = com.google.protobuf.Internal.UTF_8
            r3.getClass()
            com.google.protobuf.WireFormat$JavaType r2 = r2.getJavaType()
            int r2 = r2.ordinal()
            r0 = 1
            r1 = 0
            switch(r2) {
                case 0: goto L40;
                case 1: goto L3d;
                case 2: goto L3a;
                case 3: goto L37;
                case 4: goto L34;
                case 5: goto L31;
                case 6: goto L25;
                case 7: goto L1c;
                case 8: goto L13;
                default: goto L12;
            }
        L12:
            goto L42
        L13:
            boolean r2 = r3 instanceof com.google.protobuf.MessageLite
            if (r2 != 0) goto L2f
            boolean r2 = r3 instanceof com.google.protobuf.LazyField
            if (r2 == 0) goto L2e
            goto L2f
        L1c:
            boolean r2 = r3 instanceof java.lang.Integer
            if (r2 != 0) goto L2f
            boolean r2 = r3 instanceof com.google.protobuf.Internal.EnumLite
            if (r2 == 0) goto L2e
            goto L2f
        L25:
            boolean r2 = r3 instanceof com.google.protobuf.ByteString
            if (r2 != 0) goto L2f
            boolean r2 = r3 instanceof byte[]
            if (r2 == 0) goto L2e
            goto L2f
        L2e:
            r0 = r1
        L2f:
            r1 = r0
            goto L42
        L31:
            boolean r1 = r3 instanceof java.lang.String
            goto L42
        L34:
            boolean r1 = r3 instanceof java.lang.Boolean
            goto L42
        L37:
            boolean r1 = r3 instanceof java.lang.Double
            goto L42
        L3a:
            boolean r1 = r3 instanceof java.lang.Float
            goto L42
        L3d:
            boolean r1 = r3 instanceof java.lang.Long
            goto L42
        L40:
            boolean r1 = r3 instanceof java.lang.Integer
        L42:
            if (r1 == 0) goto L45
            return
        L45:
            java.lang.IllegalArgumentException r2 = new java.lang.IllegalArgumentException
            java.lang.String r3 = "Wrong object type used with protocol message reflection."
            r2.<init>(r3)
            throw r2
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.protobuf.FieldSet.verifyType(com.google.protobuf.WireFormat$FieldType, java.lang.Object):void");
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final FieldSet<FieldDescriptorType> clone() {
        FieldSet<FieldDescriptorType> fieldSet = (FieldSet<FieldDescriptorType>) new FieldSet();
        for (int i = 0; i < this.fields.getNumArrayEntries(); i++) {
            Map.Entry<Object, Object> arrayEntryAt = this.fields.getArrayEntryAt(i);
            fieldSet.setField((FieldDescriptorLite) arrayEntryAt.getKey(), arrayEntryAt.getValue());
        }
        for (Map.Entry<Object, Object> entry : this.fields.getOverflowEntries()) {
            fieldSet.setField((FieldDescriptorLite) entry.getKey(), entry.getValue());
        }
        fieldSet.hasLazyField = this.hasLazyField;
        return fieldSet;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof FieldSet)) {
            return false;
        }
        return this.fields.equals(((FieldSet) obj).fields);
    }

    public final Object getField(FieldDescriptorType fielddescriptortype) {
        Object obj = this.fields.get(fielddescriptortype);
        if (obj instanceof LazyField) {
            return ((LazyField) obj).getValue(null);
        }
        return obj;
    }

    public final int hashCode() {
        return this.fields.hashCode();
    }

    public final Iterator<Map.Entry<FieldDescriptorType, Object>> iterator() {
        if (this.hasLazyField) {
            return new LazyField.LazyIterator(((SmallSortedMap.EntrySet) this.fields.entrySet()).iterator());
        }
        return ((SmallSortedMap.EntrySet) this.fields.entrySet()).iterator();
    }

    public static int computeElementSize(WireFormat$FieldType wireFormat$FieldType, int i, Object obj) {
        int computeTagSize = CodedOutputStream.computeTagSize(i);
        if (wireFormat$FieldType == WireFormat$FieldType.GROUP) {
            computeTagSize *= 2;
        }
        return computeElementSizeNoTag(wireFormat$FieldType, obj) + computeTagSize;
    }

    public static int computeElementSizeNoTag(WireFormat$FieldType wireFormat$FieldType, Object obj) {
        switch (wireFormat$FieldType.ordinal()) {
            case 0:
                ((Double) obj).doubleValue();
                Logger logger = CodedOutputStream.logger;
                return 8;
            case 1:
                ((Float) obj).floatValue();
                Logger logger2 = CodedOutputStream.logger;
                return 4;
            case 2:
                return CodedOutputStream.computeUInt64SizeNoTag(((Long) obj).longValue());
            case 3:
                return CodedOutputStream.computeUInt64SizeNoTag(((Long) obj).longValue());
            case 4:
                return CodedOutputStream.computeInt32SizeNoTag(((Integer) obj).intValue());
            case 5:
                ((Long) obj).longValue();
                Logger logger3 = CodedOutputStream.logger;
                return 8;
            case 6:
                ((Integer) obj).intValue();
                Logger logger4 = CodedOutputStream.logger;
                return 4;
            case 7:
                ((Boolean) obj).booleanValue();
                Logger logger5 = CodedOutputStream.logger;
                return 1;
            case 8:
                if (!(obj instanceof ByteString)) {
                    return CodedOutputStream.computeStringSizeNoTag((String) obj);
                }
                Logger logger6 = CodedOutputStream.logger;
                int size = ((ByteString) obj).size();
                return CodedOutputStream.computeUInt32SizeNoTag(size) + size;
            case 9:
                Logger logger7 = CodedOutputStream.logger;
                return ((MessageLite) obj).getSerializedSize();
            case 10:
                if (obj instanceof LazyField) {
                    return CodedOutputStream.computeLazyFieldSizeNoTag((LazyField) obj);
                }
                Logger logger8 = CodedOutputStream.logger;
                int serializedSize = ((MessageLite) obj).getSerializedSize();
                return CodedOutputStream.computeUInt32SizeNoTag(serializedSize) + serializedSize;
            case 11:
                if (obj instanceof ByteString) {
                    Logger logger9 = CodedOutputStream.logger;
                    int size2 = ((ByteString) obj).size();
                    return CodedOutputStream.computeUInt32SizeNoTag(size2) + size2;
                }
                Logger logger10 = CodedOutputStream.logger;
                int length = ((byte[]) obj).length;
                return CodedOutputStream.computeUInt32SizeNoTag(length) + length;
            case 12:
                return CodedOutputStream.computeUInt32SizeNoTag(((Integer) obj).intValue());
            case 13:
                if (obj instanceof Internal.EnumLite) {
                    return CodedOutputStream.computeInt32SizeNoTag(((Internal.EnumLite) obj).getNumber());
                }
                return CodedOutputStream.computeInt32SizeNoTag(((Integer) obj).intValue());
            case 14:
                ((Integer) obj).intValue();
                Logger logger11 = CodedOutputStream.logger;
                return 4;
            case 15:
                ((Long) obj).longValue();
                Logger logger12 = CodedOutputStream.logger;
                return 8;
            case 16:
                int intValue = ((Integer) obj).intValue();
                return CodedOutputStream.computeUInt32SizeNoTag((intValue >> 31) ^ (intValue << 1));
            case 17:
                long longValue = ((Long) obj).longValue();
                return CodedOutputStream.computeUInt64SizeNoTag((longValue >> 63) ^ (longValue << 1));
            default:
                throw new RuntimeException("There is no way to get here, but the compiler thinks otherwise.");
        }
    }

    public static int computeFieldSize(FieldDescriptorLite<?> fieldDescriptorLite, Object obj) {
        fieldDescriptorLite.getLiteType();
        fieldDescriptorLite.getNumber();
        fieldDescriptorLite.isRepeated();
        return computeElementSize(null, 0, obj);
    }

    public static int getMessageSetSerializedSize(Map.Entry entry) {
        FieldDescriptorLite fieldDescriptorLite = (FieldDescriptorLite) entry.getKey();
        Object value = entry.getValue();
        if (fieldDescriptorLite.getLiteJavaType() != WireFormat$JavaType.MESSAGE) {
            return computeFieldSize(fieldDescriptorLite, value);
        }
        fieldDescriptorLite.isRepeated();
        fieldDescriptorLite.isPacked();
        if (value instanceof LazyField) {
            ((FieldDescriptorLite) entry.getKey()).getNumber();
            return CodedOutputStream.computeLazyFieldSizeNoTag((LazyField) value) + CodedOutputStream.computeTagSize(3) + CodedOutputStream.computeUInt32Size(2, 0) + (CodedOutputStream.computeTagSize(1) * 2);
        }
        ((FieldDescriptorLite) entry.getKey()).getNumber();
        int computeUInt32Size = CodedOutputStream.computeUInt32Size(2, 0) + (CodedOutputStream.computeTagSize(1) * 2);
        int computeTagSize = CodedOutputStream.computeTagSize(3);
        int serializedSize = ((MessageLite) value).getSerializedSize();
        return CodedOutputStream.computeUInt32SizeNoTag(serializedSize) + serializedSize + computeTagSize + computeUInt32Size;
    }

    public final void mergeFromField(Map.Entry<FieldDescriptorType, Object> entry) {
        FieldDescriptorType key = entry.getKey();
        byte[] value = entry.getValue();
        if (value instanceof LazyField) {
            value = ((LazyField) value).getValue(null);
        }
        key.isRepeated();
        if (key.getLiteJavaType() == WireFormat$JavaType.MESSAGE) {
            Object field = getField(key);
            if (field == null) {
                SmallSortedMap.AnonymousClass1 r4 = this.fields;
                if (value instanceof byte[]) {
                    byte[] bArr = (byte[]) value;
                    byte[] bArr2 = new byte[bArr.length];
                    System.arraycopy(bArr, 0, bArr2, 0, bArr.length);
                    value = bArr2;
                }
                r4.put((SmallSortedMap.AnonymousClass1) key, (FieldDescriptorType) value);
                return;
            }
            this.fields.put((SmallSortedMap.AnonymousClass1) key, (FieldDescriptorType) key.internalMergeFrom(((MessageLite) field).toBuilder$1(), (MessageLite) value).build());
            return;
        }
        SmallSortedMap.AnonymousClass1 r42 = this.fields;
        if (value instanceof byte[]) {
            byte[] bArr3 = (byte[]) value;
            byte[] bArr4 = new byte[bArr3.length];
            System.arraycopy(bArr3, 0, bArr4, 0, bArr3.length);
            value = bArr4;
        }
        r42.put((SmallSortedMap.AnonymousClass1) key, (FieldDescriptorType) value);
    }

    public final void setField(FieldDescriptorType fielddescriptortype, Object obj) {
        fielddescriptortype.isRepeated();
        fielddescriptortype.getLiteType();
        verifyType(null, obj);
        if (obj instanceof LazyField) {
            this.hasLazyField = true;
        }
        this.fields.put((SmallSortedMap.AnonymousClass1) fielddescriptortype, (FieldDescriptorType) obj);
    }

    public static boolean isInitialized(Map.Entry entry) {
        FieldDescriptorLite fieldDescriptorLite = (FieldDescriptorLite) entry.getKey();
        if (fieldDescriptorLite.getLiteJavaType() == WireFormat$JavaType.MESSAGE) {
            fieldDescriptorLite.isRepeated();
            Object value = entry.getValue();
            if (value instanceof MessageLite) {
                if (!((MessageLite) value).isInitialized()) {
                    return false;
                }
            } else if (value instanceof LazyField) {
                return true;
            } else {
                throw new IllegalArgumentException("Wrong object type used with protocol message reflection.");
            }
        }
        return true;
    }

    public FieldSet(int i) {
        this.hasLazyField = false;
        int i2 = SmallSortedMap.$r8$clinit;
        SmallSortedMap.AnonymousClass1 r0 = new SmallSortedMap.AnonymousClass1(0);
        this.fields = r0;
        if (!this.isImmutable) {
            r0.makeImmutable();
            this.isImmutable = true;
        }
    }
}
