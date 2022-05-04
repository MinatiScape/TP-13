package com.google.protobuf;

import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.google.protobuf.ArrayDecoders;
import com.google.protobuf.FieldSet;
import com.google.protobuf.Internal;
import com.google.protobuf.UnsafeUtil;
import java.io.IOException;
import java.lang.reflect.Field;
import java.security.AccessController;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import sun.misc.Unsafe;
/* loaded from: classes.dex */
public final class MessageSchema<T> implements Schema<T> {
    public static final int[] EMPTY_INT_ARRAY = new int[0];
    public static final Unsafe UNSAFE;
    public final int[] buffer;
    public final int checkInitializedCount;
    public final MessageLite defaultInstance;
    public final ExtensionSchema<?> extensionSchema;
    public final boolean hasExtensions;
    public final int[] intArray;
    public final ListFieldSchema listFieldSchema;
    public final boolean lite;
    public final MapFieldSchema mapFieldSchema;
    public final int maxFieldNumber;
    public final int minFieldNumber;
    public final NewInstanceSchema newInstanceSchema;
    public final Object[] objects;
    public final boolean proto3;
    public final int repeatedFieldOffsetStart;
    public final UnknownFieldSchema<?, ?> unknownFieldSchema;
    public final boolean useCachedSizeField;

    static {
        Unsafe unsafe;
        try {
            unsafe = (Unsafe) AccessController.doPrivileged(new UnsafeUtil.AnonymousClass1());
        } catch (Throwable unused) {
            unsafe = null;
        }
        UNSAFE = unsafe;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.google.protobuf.Schema
    public final boolean isInitialized(T t) {
        int i;
        boolean z;
        boolean z2;
        int i2 = -1;
        int i3 = 0;
        int i4 = 0;
        while (true) {
            boolean z3 = true;
            if (i3 >= this.checkInitializedCount) {
                return !this.hasExtensions || this.extensionSchema.getExtensions(t).isInitialized();
            }
            int i5 = this.intArray[i3];
            int i6 = this.buffer[i5];
            int typeAndOffsetAt = typeAndOffsetAt(i5);
            if (!this.proto3) {
                int i7 = this.buffer[i5 + 2];
                int i8 = i7 & 1048575;
                i = 1 << (i7 >>> 20);
                if (i8 != i2) {
                    i4 = UNSAFE.getInt(t, i8);
                    i2 = i8;
                }
            } else {
                i = 0;
            }
            if ((268435456 & typeAndOffsetAt) != 0) {
                z = true;
            } else {
                z = false;
            }
            if (z) {
                if (this.proto3) {
                    z2 = isFieldPresent(t, i5);
                } else if ((i4 & i) != 0) {
                    z2 = true;
                } else {
                    z2 = false;
                }
                if (!z2) {
                    return false;
                }
            }
            int i9 = (267386880 & typeAndOffsetAt) >>> 20;
            if (i9 == 9 || i9 == 17) {
                if (this.proto3) {
                    z3 = isFieldPresent(t, i5);
                } else if ((i4 & i) == 0) {
                    z3 = false;
                }
                if (z3 && !getMessageFieldSchema(i5).isInitialized(UnsafeUtil.getObject(t, typeAndOffsetAt & 1048575))) {
                    return false;
                }
            } else {
                if (i9 != 27) {
                    if (i9 == 60 || i9 == 68) {
                        if (isOneofPresent(t, i6, i5) && !getMessageFieldSchema(i5).isInitialized(UnsafeUtil.getObject(t, typeAndOffsetAt & 1048575))) {
                            return false;
                        }
                    } else if (i9 != 49) {
                        if (i9 == 50 && !this.mapFieldSchema.forMapData(UnsafeUtil.getObject(t, typeAndOffsetAt & 1048575)).isEmpty()) {
                            this.mapFieldSchema.forMapMetadata(getMapFieldDefaultEntry(i5));
                            throw null;
                        }
                    }
                }
                List list = (List) UnsafeUtil.getObject(t, typeAndOffsetAt & 1048575);
                if (!list.isEmpty()) {
                    Schema messageFieldSchema = getMessageFieldSchema(i5);
                    int i10 = 0;
                    while (true) {
                        if (i10 >= list.size()) {
                            break;
                        } else if (!messageFieldSchema.isInitialized(list.get(i10))) {
                            z3 = false;
                            break;
                        } else {
                            i10++;
                        }
                    }
                }
                if (!z3) {
                    return false;
                }
            }
            i3++;
        }
    }

    @Override // com.google.protobuf.Schema
    public final void mergeFrom(T t, T t2) {
        t2.getClass();
        for (int i = 0; i < this.buffer.length; i += 3) {
            int typeAndOffsetAt = typeAndOffsetAt(i);
            long j = 1048575 & typeAndOffsetAt;
            int i2 = this.buffer[i];
            switch ((typeAndOffsetAt & 267386880) >>> 20) {
                case 0:
                    if (isFieldPresent(t2, i)) {
                        UnsafeUtil.putDouble(t, j, UnsafeUtil.getDouble(t2, j));
                        setFieldPresent(t, i);
                        break;
                    } else {
                        break;
                    }
                case 1:
                    if (isFieldPresent(t2, i)) {
                        UnsafeUtil.MEMORY_ACCESSOR.unsafe.putFloat(t, j, UnsafeUtil.getFloat(t2, j));
                        setFieldPresent(t, i);
                        break;
                    } else {
                        break;
                    }
                case 2:
                    if (isFieldPresent(t2, i)) {
                        UnsafeUtil.putLong(t, j, UnsafeUtil.getLong(t2, j));
                        setFieldPresent(t, i);
                        break;
                    } else {
                        break;
                    }
                case 3:
                    if (isFieldPresent(t2, i)) {
                        UnsafeUtil.putLong(t, j, UnsafeUtil.getLong(t2, j));
                        setFieldPresent(t, i);
                        break;
                    } else {
                        break;
                    }
                case 4:
                    if (isFieldPresent(t2, i)) {
                        UnsafeUtil.putInt(t, j, UnsafeUtil.getInt(t2, j));
                        setFieldPresent(t, i);
                        break;
                    } else {
                        break;
                    }
                case 5:
                    if (isFieldPresent(t2, i)) {
                        UnsafeUtil.putLong(t, j, UnsafeUtil.getLong(t2, j));
                        setFieldPresent(t, i);
                        break;
                    } else {
                        break;
                    }
                case 6:
                    if (isFieldPresent(t2, i)) {
                        UnsafeUtil.putInt(t, j, UnsafeUtil.getInt(t2, j));
                        setFieldPresent(t, i);
                        break;
                    } else {
                        break;
                    }
                case 7:
                    if (isFieldPresent(t2, i)) {
                        UnsafeUtil.MEMORY_ACCESSOR.unsafe.putBoolean(t, j, UnsafeUtil.getBoolean(t2, j));
                        setFieldPresent(t, i);
                        break;
                    } else {
                        break;
                    }
                case 8:
                    if (isFieldPresent(t2, i)) {
                        UnsafeUtil.putObject(t, j, UnsafeUtil.getObject(t2, j));
                        setFieldPresent(t, i);
                        break;
                    } else {
                        break;
                    }
                case 9:
                    mergeMessage(t, t2, i);
                    break;
                case 10:
                    if (isFieldPresent(t2, i)) {
                        UnsafeUtil.putObject(t, j, UnsafeUtil.getObject(t2, j));
                        setFieldPresent(t, i);
                        break;
                    } else {
                        break;
                    }
                case 11:
                    if (isFieldPresent(t2, i)) {
                        UnsafeUtil.putInt(t, j, UnsafeUtil.getInt(t2, j));
                        setFieldPresent(t, i);
                        break;
                    } else {
                        break;
                    }
                case 12:
                    if (isFieldPresent(t2, i)) {
                        UnsafeUtil.putInt(t, j, UnsafeUtil.getInt(t2, j));
                        setFieldPresent(t, i);
                        break;
                    } else {
                        break;
                    }
                case 13:
                    if (isFieldPresent(t2, i)) {
                        UnsafeUtil.putInt(t, j, UnsafeUtil.getInt(t2, j));
                        setFieldPresent(t, i);
                        break;
                    } else {
                        break;
                    }
                case 14:
                    if (isFieldPresent(t2, i)) {
                        UnsafeUtil.putLong(t, j, UnsafeUtil.getLong(t2, j));
                        setFieldPresent(t, i);
                        break;
                    } else {
                        break;
                    }
                case 15:
                    if (isFieldPresent(t2, i)) {
                        UnsafeUtil.putInt(t, j, UnsafeUtil.getInt(t2, j));
                        setFieldPresent(t, i);
                        break;
                    } else {
                        break;
                    }
                case 16:
                    if (isFieldPresent(t2, i)) {
                        UnsafeUtil.putLong(t, j, UnsafeUtil.getLong(t2, j));
                        setFieldPresent(t, i);
                        break;
                    } else {
                        break;
                    }
                case 17:
                    mergeMessage(t, t2, i);
                    break;
                case 18:
                case 19:
                case 20:
                case 21:
                case 22:
                case 23:
                case 24:
                case 25:
                case 26:
                case 27:
                case 28:
                case 29:
                case 30:
                case 31:
                case 32:
                case 33:
                case 34:
                case 35:
                case 36:
                case 37:
                case 38:
                case 39:
                case 40:
                case 41:
                case 42:
                case 43:
                case 44:
                case 45:
                case 46:
                case 47:
                case 48:
                case 49:
                    this.listFieldSchema.mergeListsAt(t, t2, j);
                    break;
                case 50:
                    MapFieldSchema mapFieldSchema = this.mapFieldSchema;
                    Class<?> cls = SchemaUtil.GENERATED_MESSAGE_CLASS;
                    UnsafeUtil.putObject(t, j, mapFieldSchema.mergeFrom(UnsafeUtil.getObject(t, j), UnsafeUtil.getObject(t2, j)));
                    break;
                case 51:
                case 52:
                case 53:
                case 54:
                case 55:
                case 56:
                case 57:
                case 58:
                case 59:
                    if (isOneofPresent(t2, i2, i)) {
                        UnsafeUtil.putObject(t, j, UnsafeUtil.getObject(t2, j));
                        setOneofPresent(t, i2, i);
                        break;
                    } else {
                        break;
                    }
                case 60:
                    mergeOneofMessage(t, t2, i);
                    break;
                case 61:
                case 62:
                case 63:
                case 64:
                case 65:
                case 66:
                case 67:
                    if (isOneofPresent(t2, i2, i)) {
                        UnsafeUtil.putObject(t, j, UnsafeUtil.getObject(t2, j));
                        setOneofPresent(t, i2, i);
                        break;
                    } else {
                        break;
                    }
                case 68:
                    mergeOneofMessage(t, t2, i);
                    break;
            }
        }
        if (!this.proto3) {
            UnknownFieldSchema<?, ?> unknownFieldSchema = this.unknownFieldSchema;
            Class<?> cls2 = SchemaUtil.GENERATED_MESSAGE_CLASS;
            unknownFieldSchema.setToMessage(t, unknownFieldSchema.merge(unknownFieldSchema.getFromMessage(t), unknownFieldSchema.getFromMessage(t2)));
            if (this.hasExtensions) {
                SchemaUtil.mergeExtensions(this.extensionSchema, t, t2);
            }
        }
    }

    public static UnknownFieldSetLite getMutableUnknownFields(Object obj) {
        GeneratedMessageLite generatedMessageLite = (GeneratedMessageLite) obj;
        UnknownFieldSetLite unknownFieldSetLite = generatedMessageLite.unknownFields;
        if (unknownFieldSetLite != UnknownFieldSetLite.DEFAULT_INSTANCE) {
            return unknownFieldSetLite;
        }
        UnknownFieldSetLite unknownFieldSetLite2 = new UnknownFieldSetLite();
        generatedMessageLite.unknownFields = unknownFieldSetLite2;
        return unknownFieldSetLite2;
    }

    /* JADX WARN: Removed duplicated region for block: B:127:0x0296  */
    /* JADX WARN: Removed duplicated region for block: B:128:0x0299  */
    /* JADX WARN: Removed duplicated region for block: B:131:0x02b0  */
    /* JADX WARN: Removed duplicated region for block: B:132:0x02b3  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static com.google.protobuf.MessageSchema newSchema(com.google.protobuf.MessageInfo r35, com.google.protobuf.NewInstanceSchema r36, com.google.protobuf.ListFieldSchema r37, com.google.protobuf.UnknownFieldSchema r38, com.google.protobuf.ExtensionSchema r39, com.google.protobuf.MapFieldSchema r40) {
        /*
            Method dump skipped, instructions count: 1081
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.protobuf.MessageSchema.newSchema(com.google.protobuf.MessageInfo, com.google.protobuf.NewInstanceSchema, com.google.protobuf.ListFieldSchema, com.google.protobuf.UnknownFieldSchema, com.google.protobuf.ExtensionSchema, com.google.protobuf.MapFieldSchema):com.google.protobuf.MessageSchema");
    }

    public static void writeString(int i, Object obj, CodedOutputStreamWriter codedOutputStreamWriter) throws IOException {
        if (obj instanceof String) {
            codedOutputStreamWriter.output.writeString(i, (String) obj);
            return;
        }
        codedOutputStreamWriter.writeBytes(i, (ByteString) obj);
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:0x003f, code lost:
        if (com.google.protobuf.SchemaUtil.safeEquals(com.google.protobuf.UnsafeUtil.getObject(r10, r6), com.google.protobuf.UnsafeUtil.getObject(r11, r6)) != false) goto L89;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0071, code lost:
        if (com.google.protobuf.SchemaUtil.safeEquals(com.google.protobuf.UnsafeUtil.getObject(r10, r6), com.google.protobuf.UnsafeUtil.getObject(r11, r6)) != false) goto L89;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x0085, code lost:
        if (com.google.protobuf.UnsafeUtil.getLong(r10, r6) == com.google.protobuf.UnsafeUtil.getLong(r11, r6)) goto L89;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x0097, code lost:
        if (com.google.protobuf.UnsafeUtil.getInt(r10, r6) == com.google.protobuf.UnsafeUtil.getInt(r11, r6)) goto L89;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x00ab, code lost:
        if (com.google.protobuf.UnsafeUtil.getLong(r10, r6) == com.google.protobuf.UnsafeUtil.getLong(r11, r6)) goto L89;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x00bd, code lost:
        if (com.google.protobuf.UnsafeUtil.getInt(r10, r6) == com.google.protobuf.UnsafeUtil.getInt(r11, r6)) goto L89;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x00cf, code lost:
        if (com.google.protobuf.UnsafeUtil.getInt(r10, r6) == com.google.protobuf.UnsafeUtil.getInt(r11, r6)) goto L89;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x00e1, code lost:
        if (com.google.protobuf.UnsafeUtil.getInt(r10, r6) == com.google.protobuf.UnsafeUtil.getInt(r11, r6)) goto L89;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x00f7, code lost:
        if (com.google.protobuf.SchemaUtil.safeEquals(com.google.protobuf.UnsafeUtil.getObject(r10, r6), com.google.protobuf.UnsafeUtil.getObject(r11, r6)) != false) goto L89;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x010d, code lost:
        if (com.google.protobuf.SchemaUtil.safeEquals(com.google.protobuf.UnsafeUtil.getObject(r10, r6), com.google.protobuf.UnsafeUtil.getObject(r11, r6)) != false) goto L89;
     */
    /* JADX WARN: Code restructure failed: missing block: B:55:0x0123, code lost:
        if (com.google.protobuf.SchemaUtil.safeEquals(com.google.protobuf.UnsafeUtil.getObject(r10, r6), com.google.protobuf.UnsafeUtil.getObject(r11, r6)) != false) goto L89;
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x0135, code lost:
        if (com.google.protobuf.UnsafeUtil.getBoolean(r10, r6) == com.google.protobuf.UnsafeUtil.getBoolean(r11, r6)) goto L89;
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x0147, code lost:
        if (com.google.protobuf.UnsafeUtil.getInt(r10, r6) == com.google.protobuf.UnsafeUtil.getInt(r11, r6)) goto L89;
     */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x015b, code lost:
        if (com.google.protobuf.UnsafeUtil.getLong(r10, r6) == com.google.protobuf.UnsafeUtil.getLong(r11, r6)) goto L89;
     */
    /* JADX WARN: Code restructure failed: missing block: B:71:0x016d, code lost:
        if (com.google.protobuf.UnsafeUtil.getInt(r10, r6) == com.google.protobuf.UnsafeUtil.getInt(r11, r6)) goto L89;
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x0180, code lost:
        if (com.google.protobuf.UnsafeUtil.getLong(r10, r6) == com.google.protobuf.UnsafeUtil.getLong(r11, r6)) goto L89;
     */
    /* JADX WARN: Code restructure failed: missing block: B:79:0x0193, code lost:
        if (com.google.protobuf.UnsafeUtil.getLong(r10, r6) == com.google.protobuf.UnsafeUtil.getLong(r11, r6)) goto L89;
     */
    /* JADX WARN: Code restructure failed: missing block: B:83:0x01ac, code lost:
        if (java.lang.Float.floatToIntBits(com.google.protobuf.UnsafeUtil.getFloat(r10, r6)) == java.lang.Float.floatToIntBits(com.google.protobuf.UnsafeUtil.getFloat(r11, r6))) goto L89;
     */
    /* JADX WARN: Code restructure failed: missing block: B:87:0x01c7, code lost:
        if (java.lang.Double.doubleToLongBits(com.google.protobuf.UnsafeUtil.getDouble(r10, r6)) == java.lang.Double.doubleToLongBits(com.google.protobuf.UnsafeUtil.getDouble(r11, r6))) goto L89;
     */
    @Override // com.google.protobuf.Schema
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(T r10, T r11) {
        /*
            Method dump skipped, instructions count: 650
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.protobuf.MessageSchema.equals(java.lang.Object, java.lang.Object):boolean");
    }

    public final void filterMapUnknownEnumValues(Object obj, int i, Object obj2, UnknownFieldSchema unknownFieldSchema) {
        Internal.EnumVerifier enumFieldVerifier;
        int i2 = this.buffer[i];
        Object object = UnsafeUtil.getObject(obj, typeAndOffsetAt(i) & 1048575);
        if (!(object == null || (enumFieldVerifier = getEnumFieldVerifier(i)) == null)) {
            MapFieldLite forMutableMapData = this.mapFieldSchema.forMutableMapData(object);
            this.mapFieldSchema.forMapMetadata(getMapFieldDefaultEntry(i));
            for (Map.Entry entry : forMutableMapData.entrySet()) {
                if (!enumFieldVerifier.isInRange(((Integer) entry.getValue()).intValue())) {
                    if (obj2 == null) {
                        unknownFieldSchema.newBuilder();
                    }
                    entry.getKey();
                    entry.getValue();
                    throw null;
                }
            }
        }
    }

    public final Internal.EnumVerifier getEnumFieldVerifier(int i) {
        return (Internal.EnumVerifier) this.objects[((i / 3) * 2) + 1];
    }

    public final Object getMapFieldDefaultEntry(int i) {
        return this.objects[(i / 3) * 2];
    }

    public final Schema getMessageFieldSchema(int i) {
        int i2 = (i / 3) * 2;
        Object[] objArr = this.objects;
        Schema schema = (Schema) objArr[i2];
        if (schema != null) {
            return schema;
        }
        Schema<T> schemaFor = Protobuf.INSTANCE.schemaFor((Class) objArr[i2 + 1]);
        this.objects[i2] = schemaFor;
        return schemaFor;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    @Override // com.google.protobuf.Schema
    public final int getSerializedSize(T t) {
        int i;
        int i2;
        char c;
        int i3;
        int computeTagSize;
        int computeTagSize2;
        int computeTagSize3;
        int computeUInt64SizeNoTag;
        int computeTagSize4;
        int computeInt32SizeNoTag;
        int i4;
        int i5;
        int i6;
        int computeTagSize5;
        int computeTagSize6;
        int computeTagSize7;
        int computeUInt64SizeNoTag2;
        int computeTagSize8;
        int computeInt32SizeNoTag2;
        int i7;
        int i8;
        int computeTagSize9;
        int computeTagSize10;
        int computeTagSize11;
        int computeUInt64SizeNoTag3;
        int computeTagSize12;
        int computeInt32SizeNoTag3;
        int i9;
        int i10;
        int i11;
        int computeTagSize13;
        int computeTagSize14;
        int computeTagSize15;
        int computeUInt64SizeNoTag4;
        int computeTagSize16;
        int computeInt32SizeNoTag4;
        int i12 = 267386880;
        if (this.proto3) {
            Unsafe unsafe = UNSAFE;
            int i13 = 0;
            for (int i14 = 0; i14 < this.buffer.length; i14 += 3) {
                int typeAndOffsetAt = typeAndOffsetAt(i14);
                int i15 = (typeAndOffsetAt & 267386880) >>> 20;
                int i16 = this.buffer[i14];
                long j = typeAndOffsetAt & 1048575;
                if (i15 < FieldType.DOUBLE_LIST_PACKED.id() || i15 > FieldType.SINT64_LIST_PACKED.id()) {
                    i7 = 0;
                } else {
                    i7 = this.buffer[i14 + 2] & 1048575;
                }
                switch (i15) {
                    case 0:
                        if (isFieldPresent(t, i14)) {
                            computeTagSize9 = CodedOutputStream.computeTagSize(i16);
                            i8 = computeTagSize9 + 8;
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 1:
                        if (isFieldPresent(t, i14)) {
                            computeTagSize10 = CodedOutputStream.computeTagSize(i16);
                            i8 = computeTagSize10 + 4;
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 2:
                        if (isFieldPresent(t, i14)) {
                            long j2 = UnsafeUtil.getLong(t, j);
                            computeTagSize11 = CodedOutputStream.computeTagSize(i16);
                            computeUInt64SizeNoTag3 = CodedOutputStream.computeUInt64SizeNoTag(j2);
                            i8 = computeUInt64SizeNoTag3 + computeTagSize11;
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 3:
                        if (isFieldPresent(t, i14)) {
                            long j3 = UnsafeUtil.getLong(t, j);
                            computeTagSize11 = CodedOutputStream.computeTagSize(i16);
                            computeUInt64SizeNoTag3 = CodedOutputStream.computeUInt64SizeNoTag(j3);
                            i8 = computeUInt64SizeNoTag3 + computeTagSize11;
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 4:
                        if (isFieldPresent(t, i14)) {
                            int i17 = UnsafeUtil.getInt(t, j);
                            computeTagSize12 = CodedOutputStream.computeTagSize(i16);
                            computeInt32SizeNoTag3 = CodedOutputStream.computeInt32SizeNoTag(i17);
                            i8 = computeTagSize12 + computeInt32SizeNoTag3;
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 5:
                        if (isFieldPresent(t, i14)) {
                            i8 = CodedOutputStream.computeFixed64Size(i16);
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 6:
                        if (isFieldPresent(t, i14)) {
                            i8 = CodedOutputStream.computeFixed32Size(i16);
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 7:
                        if (isFieldPresent(t, i14)) {
                            i8 = CodedOutputStream.computeTagSize(i16) + 1;
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 8:
                        if (!isFieldPresent(t, i14)) {
                            break;
                        } else {
                            Object object = UnsafeUtil.getObject(t, j);
                            if (object instanceof ByteString) {
                                i8 = CodedOutputStream.computeBytesSize(i16, (ByteString) object);
                                i13 += i8;
                                break;
                            } else {
                                computeTagSize12 = CodedOutputStream.computeTagSize(i16);
                                computeInt32SizeNoTag3 = CodedOutputStream.computeStringSizeNoTag((String) object);
                                i8 = computeTagSize12 + computeInt32SizeNoTag3;
                                i13 += i8;
                            }
                        }
                    case 9:
                        if (isFieldPresent(t, i14)) {
                            i8 = SchemaUtil.computeSizeMessage(i16, UnsafeUtil.getObject(t, j), getMessageFieldSchema(i14));
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 10:
                        if (isFieldPresent(t, i14)) {
                            i8 = CodedOutputStream.computeBytesSize(i16, (ByteString) UnsafeUtil.getObject(t, j));
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 11:
                        if (isFieldPresent(t, i14)) {
                            i8 = CodedOutputStream.computeUInt32Size(i16, UnsafeUtil.getInt(t, j));
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 12:
                        if (isFieldPresent(t, i14)) {
                            int i18 = UnsafeUtil.getInt(t, j);
                            computeTagSize12 = CodedOutputStream.computeTagSize(i16);
                            computeInt32SizeNoTag3 = CodedOutputStream.computeInt32SizeNoTag(i18);
                            i8 = computeTagSize12 + computeInt32SizeNoTag3;
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 13:
                        if (isFieldPresent(t, i14)) {
                            computeTagSize10 = CodedOutputStream.computeTagSize(i16);
                            i8 = computeTagSize10 + 4;
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 14:
                        if (isFieldPresent(t, i14)) {
                            computeTagSize9 = CodedOutputStream.computeTagSize(i16);
                            i8 = computeTagSize9 + 8;
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 15:
                        if (isFieldPresent(t, i14)) {
                            int i19 = UnsafeUtil.getInt(t, j);
                            computeTagSize12 = CodedOutputStream.computeTagSize(i16);
                            computeInt32SizeNoTag3 = CodedOutputStream.computeUInt32SizeNoTag((i19 >> 31) ^ (i19 << 1));
                            i8 = computeTagSize12 + computeInt32SizeNoTag3;
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 16:
                        if (isFieldPresent(t, i14)) {
                            long j4 = UnsafeUtil.getLong(t, j);
                            computeTagSize11 = CodedOutputStream.computeTagSize(i16);
                            computeUInt64SizeNoTag3 = CodedOutputStream.computeUInt64SizeNoTag((j4 >> 63) ^ (j4 << 1));
                            i8 = computeUInt64SizeNoTag3 + computeTagSize11;
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 17:
                        if (isFieldPresent(t, i14)) {
                            i8 = CodedOutputStream.computeGroupSize(i16, (MessageLite) UnsafeUtil.getObject(t, j), getMessageFieldSchema(i14));
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 18:
                        i8 = SchemaUtil.computeSizeFixed64List(i16, listAt(t, j));
                        i13 += i8;
                        break;
                    case 19:
                        i8 = SchemaUtil.computeSizeFixed32List(i16, listAt(t, j));
                        i13 += i8;
                        break;
                    case 20:
                        i8 = SchemaUtil.computeSizeInt64List(i16, listAt(t, j));
                        i13 += i8;
                        break;
                    case 21:
                        i8 = SchemaUtil.computeSizeUInt64List(i16, listAt(t, j));
                        i13 += i8;
                        break;
                    case 22:
                        i8 = SchemaUtil.computeSizeInt32List(i16, listAt(t, j));
                        i13 += i8;
                        break;
                    case 23:
                        i8 = SchemaUtil.computeSizeFixed64List(i16, listAt(t, j));
                        i13 += i8;
                        break;
                    case 24:
                        i8 = SchemaUtil.computeSizeFixed32List(i16, listAt(t, j));
                        i13 += i8;
                        break;
                    case 25:
                        List<?> listAt = listAt(t, j);
                        Class<?> cls = SchemaUtil.GENERATED_MESSAGE_CLASS;
                        int size = listAt.size();
                        if (size != 0) {
                            i8 = (CodedOutputStream.computeTagSize(i16) + 1) * size;
                            i13 += i8;
                            break;
                        }
                        i8 = 0;
                        i13 += i8;
                    case 26:
                        i8 = SchemaUtil.computeSizeStringList(i16, listAt(t, j));
                        i13 += i8;
                        break;
                    case 27:
                        i8 = SchemaUtil.computeSizeMessageList(i16, listAt(t, j), getMessageFieldSchema(i14));
                        i13 += i8;
                        break;
                    case 28:
                        i8 = SchemaUtil.computeSizeByteStringList(i16, listAt(t, j));
                        i13 += i8;
                        break;
                    case 29:
                        i8 = SchemaUtil.computeSizeUInt32List(i16, listAt(t, j));
                        i13 += i8;
                        break;
                    case 30:
                        i8 = SchemaUtil.computeSizeEnumList(i16, listAt(t, j));
                        i13 += i8;
                        break;
                    case 31:
                        i8 = SchemaUtil.computeSizeFixed32List(i16, listAt(t, j));
                        i13 += i8;
                        break;
                    case 32:
                        i8 = SchemaUtil.computeSizeFixed64List(i16, listAt(t, j));
                        i13 += i8;
                        break;
                    case 33:
                        i8 = SchemaUtil.computeSizeSInt32List(i16, listAt(t, j));
                        i13 += i8;
                        break;
                    case 34:
                        i8 = SchemaUtil.computeSizeSInt64List(i16, listAt(t, j));
                        i13 += i8;
                        break;
                    case 35:
                        i11 = SchemaUtil.computeSizeFixed64ListNoTag((List) unsafe.getObject(t, j));
                        if (i11 <= 0) {
                            break;
                        } else {
                            if (this.useCachedSizeField) {
                                unsafe.putInt(t, i7, i11);
                            }
                            i10 = CodedOutputStream.computeTagSize(i16);
                            i9 = CodedOutputStream.computeUInt32SizeNoTag(i11);
                            i13 += i9 + i10 + i11;
                            break;
                        }
                    case 36:
                        i11 = SchemaUtil.computeSizeFixed32ListNoTag((List) unsafe.getObject(t, j));
                        if (i11 <= 0) {
                            break;
                        } else {
                            if (this.useCachedSizeField) {
                                unsafe.putInt(t, i7, i11);
                            }
                            i10 = CodedOutputStream.computeTagSize(i16);
                            i9 = CodedOutputStream.computeUInt32SizeNoTag(i11);
                            i13 += i9 + i10 + i11;
                            break;
                        }
                    case 37:
                        i11 = SchemaUtil.computeSizeInt64ListNoTag((List) unsafe.getObject(t, j));
                        if (i11 <= 0) {
                            break;
                        } else {
                            if (this.useCachedSizeField) {
                                unsafe.putInt(t, i7, i11);
                            }
                            i10 = CodedOutputStream.computeTagSize(i16);
                            i9 = CodedOutputStream.computeUInt32SizeNoTag(i11);
                            i13 += i9 + i10 + i11;
                            break;
                        }
                    case 38:
                        i11 = SchemaUtil.computeSizeUInt64ListNoTag((List) unsafe.getObject(t, j));
                        if (i11 <= 0) {
                            break;
                        } else {
                            if (this.useCachedSizeField) {
                                unsafe.putInt(t, i7, i11);
                            }
                            i10 = CodedOutputStream.computeTagSize(i16);
                            i9 = CodedOutputStream.computeUInt32SizeNoTag(i11);
                            i13 += i9 + i10 + i11;
                            break;
                        }
                    case 39:
                        i11 = SchemaUtil.computeSizeInt32ListNoTag((List) unsafe.getObject(t, j));
                        if (i11 <= 0) {
                            break;
                        } else {
                            if (this.useCachedSizeField) {
                                unsafe.putInt(t, i7, i11);
                            }
                            i10 = CodedOutputStream.computeTagSize(i16);
                            i9 = CodedOutputStream.computeUInt32SizeNoTag(i11);
                            i13 += i9 + i10 + i11;
                            break;
                        }
                    case 40:
                        i11 = SchemaUtil.computeSizeFixed64ListNoTag((List) unsafe.getObject(t, j));
                        if (i11 <= 0) {
                            break;
                        } else {
                            if (this.useCachedSizeField) {
                                unsafe.putInt(t, i7, i11);
                            }
                            i10 = CodedOutputStream.computeTagSize(i16);
                            i9 = CodedOutputStream.computeUInt32SizeNoTag(i11);
                            i13 += i9 + i10 + i11;
                            break;
                        }
                    case 41:
                        i11 = SchemaUtil.computeSizeFixed32ListNoTag((List) unsafe.getObject(t, j));
                        if (i11 <= 0) {
                            break;
                        } else {
                            if (this.useCachedSizeField) {
                                unsafe.putInt(t, i7, i11);
                            }
                            i10 = CodedOutputStream.computeTagSize(i16);
                            i9 = CodedOutputStream.computeUInt32SizeNoTag(i11);
                            i13 += i9 + i10 + i11;
                            break;
                        }
                    case 42:
                        Class<?> cls2 = SchemaUtil.GENERATED_MESSAGE_CLASS;
                        i11 = ((List) unsafe.getObject(t, j)).size();
                        if (i11 <= 0) {
                            break;
                        } else {
                            if (this.useCachedSizeField) {
                                unsafe.putInt(t, i7, i11);
                            }
                            i10 = CodedOutputStream.computeTagSize(i16);
                            i9 = CodedOutputStream.computeUInt32SizeNoTag(i11);
                            i13 += i9 + i10 + i11;
                            break;
                        }
                    case 43:
                        i11 = SchemaUtil.computeSizeUInt32ListNoTag((List) unsafe.getObject(t, j));
                        if (i11 <= 0) {
                            break;
                        } else {
                            if (this.useCachedSizeField) {
                                unsafe.putInt(t, i7, i11);
                            }
                            i10 = CodedOutputStream.computeTagSize(i16);
                            i9 = CodedOutputStream.computeUInt32SizeNoTag(i11);
                            i13 += i9 + i10 + i11;
                            break;
                        }
                    case 44:
                        i11 = SchemaUtil.computeSizeEnumListNoTag((List) unsafe.getObject(t, j));
                        if (i11 <= 0) {
                            break;
                        } else {
                            if (this.useCachedSizeField) {
                                unsafe.putInt(t, i7, i11);
                            }
                            i10 = CodedOutputStream.computeTagSize(i16);
                            i9 = CodedOutputStream.computeUInt32SizeNoTag(i11);
                            i13 += i9 + i10 + i11;
                            break;
                        }
                    case 45:
                        i11 = SchemaUtil.computeSizeFixed32ListNoTag((List) unsafe.getObject(t, j));
                        if (i11 <= 0) {
                            break;
                        } else {
                            if (this.useCachedSizeField) {
                                unsafe.putInt(t, i7, i11);
                            }
                            i10 = CodedOutputStream.computeTagSize(i16);
                            i9 = CodedOutputStream.computeUInt32SizeNoTag(i11);
                            i13 += i9 + i10 + i11;
                            break;
                        }
                    case 46:
                        i11 = SchemaUtil.computeSizeFixed64ListNoTag((List) unsafe.getObject(t, j));
                        if (i11 <= 0) {
                            break;
                        } else {
                            if (this.useCachedSizeField) {
                                unsafe.putInt(t, i7, i11);
                            }
                            i10 = CodedOutputStream.computeTagSize(i16);
                            i9 = CodedOutputStream.computeUInt32SizeNoTag(i11);
                            i13 += i9 + i10 + i11;
                            break;
                        }
                    case 47:
                        i11 = SchemaUtil.computeSizeSInt32ListNoTag((List) unsafe.getObject(t, j));
                        if (i11 <= 0) {
                            break;
                        } else {
                            if (this.useCachedSizeField) {
                                unsafe.putInt(t, i7, i11);
                            }
                            i10 = CodedOutputStream.computeTagSize(i16);
                            i9 = CodedOutputStream.computeUInt32SizeNoTag(i11);
                            i13 += i9 + i10 + i11;
                            break;
                        }
                    case 48:
                        i11 = SchemaUtil.computeSizeSInt64ListNoTag((List) unsafe.getObject(t, j));
                        if (i11 <= 0) {
                            break;
                        } else {
                            if (this.useCachedSizeField) {
                                unsafe.putInt(t, i7, i11);
                            }
                            i10 = CodedOutputStream.computeTagSize(i16);
                            i9 = CodedOutputStream.computeUInt32SizeNoTag(i11);
                            i13 += i9 + i10 + i11;
                            break;
                        }
                    case 49:
                        List<?> listAt2 = listAt(t, j);
                        Schema messageFieldSchema = getMessageFieldSchema(i14);
                        Class<?> cls3 = SchemaUtil.GENERATED_MESSAGE_CLASS;
                        int size2 = listAt2.size();
                        if (size2 != 0) {
                            int i20 = 0;
                            for (int i21 = 0; i21 < size2; i21++) {
                                i20 += CodedOutputStream.computeGroupSize(i16, (MessageLite) listAt2.get(i21), messageFieldSchema);
                            }
                            i8 = i20;
                            i13 += i8;
                            break;
                        }
                        i8 = 0;
                        i13 += i8;
                    case 50:
                        i8 = this.mapFieldSchema.getSerializedSize(i16, UnsafeUtil.getObject(t, j), getMapFieldDefaultEntry(i14));
                        i13 += i8;
                        break;
                    case 51:
                        if (isOneofPresent(t, i16, i14)) {
                            computeTagSize13 = CodedOutputStream.computeTagSize(i16);
                            i8 = computeTagSize13 + 8;
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 52:
                        if (isOneofPresent(t, i16, i14)) {
                            computeTagSize14 = CodedOutputStream.computeTagSize(i16);
                            i8 = computeTagSize14 + 4;
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 53:
                        if (isOneofPresent(t, i16, i14)) {
                            long oneofLongAt = oneofLongAt(t, j);
                            computeTagSize15 = CodedOutputStream.computeTagSize(i16);
                            computeUInt64SizeNoTag4 = CodedOutputStream.computeUInt64SizeNoTag(oneofLongAt);
                            i8 = computeUInt64SizeNoTag4 + computeTagSize15;
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 54:
                        if (isOneofPresent(t, i16, i14)) {
                            long oneofLongAt2 = oneofLongAt(t, j);
                            computeTagSize15 = CodedOutputStream.computeTagSize(i16);
                            computeUInt64SizeNoTag4 = CodedOutputStream.computeUInt64SizeNoTag(oneofLongAt2);
                            i8 = computeUInt64SizeNoTag4 + computeTagSize15;
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 55:
                        if (isOneofPresent(t, i16, i14)) {
                            int oneofIntAt = oneofIntAt(t, j);
                            computeTagSize16 = CodedOutputStream.computeTagSize(i16);
                            computeInt32SizeNoTag4 = CodedOutputStream.computeInt32SizeNoTag(oneofIntAt);
                            i8 = computeInt32SizeNoTag4 + computeTagSize16;
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 56:
                        if (isOneofPresent(t, i16, i14)) {
                            i8 = CodedOutputStream.computeFixed64Size(i16);
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 57:
                        if (isOneofPresent(t, i16, i14)) {
                            i8 = CodedOutputStream.computeFixed32Size(i16);
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 58:
                        if (isOneofPresent(t, i16, i14)) {
                            i8 = CodedOutputStream.computeTagSize(i16) + 1;
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 59:
                        if (!isOneofPresent(t, i16, i14)) {
                            break;
                        } else {
                            Object object2 = UnsafeUtil.getObject(t, j);
                            if (object2 instanceof ByteString) {
                                i8 = CodedOutputStream.computeBytesSize(i16, (ByteString) object2);
                                i13 += i8;
                                break;
                            } else {
                                computeTagSize16 = CodedOutputStream.computeTagSize(i16);
                                computeInt32SizeNoTag4 = CodedOutputStream.computeStringSizeNoTag((String) object2);
                                i8 = computeInt32SizeNoTag4 + computeTagSize16;
                                i13 += i8;
                            }
                        }
                    case 60:
                        if (isOneofPresent(t, i16, i14)) {
                            i8 = SchemaUtil.computeSizeMessage(i16, UnsafeUtil.getObject(t, j), getMessageFieldSchema(i14));
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 61:
                        if (isOneofPresent(t, i16, i14)) {
                            i8 = CodedOutputStream.computeBytesSize(i16, (ByteString) UnsafeUtil.getObject(t, j));
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 62:
                        if (isOneofPresent(t, i16, i14)) {
                            i8 = CodedOutputStream.computeUInt32Size(i16, oneofIntAt(t, j));
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 63:
                        if (isOneofPresent(t, i16, i14)) {
                            int oneofIntAt2 = oneofIntAt(t, j);
                            computeTagSize16 = CodedOutputStream.computeTagSize(i16);
                            computeInt32SizeNoTag4 = CodedOutputStream.computeInt32SizeNoTag(oneofIntAt2);
                            i8 = computeInt32SizeNoTag4 + computeTagSize16;
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 64:
                        if (isOneofPresent(t, i16, i14)) {
                            computeTagSize14 = CodedOutputStream.computeTagSize(i16);
                            i8 = computeTagSize14 + 4;
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 65:
                        if (isOneofPresent(t, i16, i14)) {
                            computeTagSize13 = CodedOutputStream.computeTagSize(i16);
                            i8 = computeTagSize13 + 8;
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 66:
                        if (isOneofPresent(t, i16, i14)) {
                            int oneofIntAt3 = oneofIntAt(t, j);
                            computeTagSize16 = CodedOutputStream.computeTagSize(i16);
                            computeInt32SizeNoTag4 = CodedOutputStream.computeUInt32SizeNoTag((oneofIntAt3 >> 31) ^ (oneofIntAt3 << 1));
                            i8 = computeInt32SizeNoTag4 + computeTagSize16;
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 67:
                        if (isOneofPresent(t, i16, i14)) {
                            long oneofLongAt3 = oneofLongAt(t, j);
                            computeTagSize15 = CodedOutputStream.computeTagSize(i16);
                            computeUInt64SizeNoTag4 = CodedOutputStream.computeUInt64SizeNoTag((oneofLongAt3 >> 63) ^ (oneofLongAt3 << 1));
                            i8 = computeUInt64SizeNoTag4 + computeTagSize15;
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                    case 68:
                        if (isOneofPresent(t, i16, i14)) {
                            i8 = CodedOutputStream.computeGroupSize(i16, (MessageLite) UnsafeUtil.getObject(t, j), getMessageFieldSchema(i14));
                            i13 += i8;
                            break;
                        } else {
                            break;
                        }
                }
            }
            UnknownFieldSchema<?, ?> unknownFieldSchema = this.unknownFieldSchema;
            return unknownFieldSchema.getSerializedSize(unknownFieldSchema.getFromMessage(t)) + i13;
        }
        Unsafe unsafe2 = UNSAFE;
        int i22 = -1;
        int i23 = 0;
        int i24 = 0;
        int i25 = 0;
        while (i23 < this.buffer.length) {
            int typeAndOffsetAt2 = typeAndOffsetAt(i23);
            int[] iArr = this.buffer;
            int i26 = iArr[i23];
            int i27 = (typeAndOffsetAt2 & i12) >>> 20;
            if (i27 <= 17) {
                i2 = iArr[i23 + 2];
                int i28 = i2 & 1048575;
                i = 1 << (i2 >>> 20);
                if (i28 != i22) {
                    i25 = unsafe2.getInt(t, i28);
                    i22 = i28;
                }
            } else {
                if (!this.useCachedSizeField || i27 < FieldType.DOUBLE_LIST_PACKED.id() || i27 > FieldType.SINT64_LIST_PACKED.id()) {
                    i2 = 0;
                } else {
                    i2 = this.buffer[i23 + 2] & 1048575;
                }
                i = 0;
            }
            long j5 = typeAndOffsetAt2 & 1048575;
            switch (i27) {
                case 0:
                    c = '?';
                    if ((i25 & i) != 0) {
                        computeTagSize = CodedOutputStream.computeTagSize(i26);
                        i3 = computeTagSize + 8;
                        i24 += i3;
                        break;
                    } else {
                        break;
                    }
                case 1:
                    c = '?';
                    if ((i25 & i) != 0) {
                        computeTagSize2 = CodedOutputStream.computeTagSize(i26);
                        i3 = computeTagSize2 + 4;
                        i24 += i3;
                        break;
                    } else {
                        break;
                    }
                case 2:
                    c = '?';
                    if ((i25 & i) != 0) {
                        long j6 = unsafe2.getLong(t, j5);
                        computeTagSize3 = CodedOutputStream.computeTagSize(i26);
                        computeUInt64SizeNoTag = CodedOutputStream.computeUInt64SizeNoTag(j6);
                        i3 = computeUInt64SizeNoTag + computeTagSize3;
                        i24 += i3;
                        break;
                    } else {
                        break;
                    }
                case 3:
                    c = '?';
                    if ((i25 & i) != 0) {
                        long j7 = unsafe2.getLong(t, j5);
                        computeTagSize3 = CodedOutputStream.computeTagSize(i26);
                        computeUInt64SizeNoTag = CodedOutputStream.computeUInt64SizeNoTag(j7);
                        i3 = computeUInt64SizeNoTag + computeTagSize3;
                        i24 += i3;
                        break;
                    } else {
                        break;
                    }
                case 4:
                    c = '?';
                    if ((i25 & i) != 0) {
                        int i29 = unsafe2.getInt(t, j5);
                        computeTagSize4 = CodedOutputStream.computeTagSize(i26);
                        computeInt32SizeNoTag = CodedOutputStream.computeInt32SizeNoTag(i29);
                        i3 = computeInt32SizeNoTag + computeTagSize4;
                        i24 += i3;
                        break;
                    } else {
                        break;
                    }
                case 5:
                    c = '?';
                    if ((i25 & i) != 0) {
                        i3 = CodedOutputStream.computeFixed64Size(i26);
                        i24 += i3;
                        break;
                    } else {
                        break;
                    }
                case 6:
                    c = '?';
                    if ((i25 & i) != 0) {
                        i3 = CodedOutputStream.computeFixed32Size(i26);
                        i24 += i3;
                        break;
                    } else {
                        break;
                    }
                case 7:
                    c = '?';
                    if ((i25 & i) != 0) {
                        i3 = CodedOutputStream.computeTagSize(i26) + 1;
                        i24 += i3;
                        break;
                    } else {
                        break;
                    }
                case 8:
                    c = '?';
                    if ((i25 & i) == 0) {
                        break;
                    } else {
                        Object object3 = unsafe2.getObject(t, j5);
                        if (object3 instanceof ByteString) {
                            i3 = CodedOutputStream.computeBytesSize(i26, (ByteString) object3);
                            i24 += i3;
                            break;
                        } else {
                            computeTagSize4 = CodedOutputStream.computeTagSize(i26);
                            computeInt32SizeNoTag = CodedOutputStream.computeStringSizeNoTag((String) object3);
                            i3 = computeInt32SizeNoTag + computeTagSize4;
                            i24 += i3;
                        }
                    }
                case 9:
                    c = '?';
                    if ((i25 & i) != 0) {
                        i3 = SchemaUtil.computeSizeMessage(i26, unsafe2.getObject(t, j5), getMessageFieldSchema(i23));
                        i24 += i3;
                        break;
                    } else {
                        break;
                    }
                case 10:
                    c = '?';
                    if ((i25 & i) != 0) {
                        i3 = CodedOutputStream.computeBytesSize(i26, (ByteString) unsafe2.getObject(t, j5));
                        i24 += i3;
                        break;
                    } else {
                        break;
                    }
                case 11:
                    c = '?';
                    if ((i25 & i) != 0) {
                        i3 = CodedOutputStream.computeUInt32Size(i26, unsafe2.getInt(t, j5));
                        i24 += i3;
                        break;
                    } else {
                        break;
                    }
                case 12:
                    c = '?';
                    if ((i25 & i) != 0) {
                        int i30 = unsafe2.getInt(t, j5);
                        computeTagSize4 = CodedOutputStream.computeTagSize(i26);
                        computeInt32SizeNoTag = CodedOutputStream.computeInt32SizeNoTag(i30);
                        i3 = computeInt32SizeNoTag + computeTagSize4;
                        i24 += i3;
                        break;
                    } else {
                        break;
                    }
                case 13:
                    c = '?';
                    if ((i25 & i) != 0) {
                        computeTagSize2 = CodedOutputStream.computeTagSize(i26);
                        i3 = computeTagSize2 + 4;
                        i24 += i3;
                        break;
                    } else {
                        break;
                    }
                case 14:
                    c = '?';
                    if ((i25 & i) != 0) {
                        computeTagSize = CodedOutputStream.computeTagSize(i26);
                        i3 = computeTagSize + 8;
                        i24 += i3;
                        break;
                    } else {
                        break;
                    }
                case 15:
                    c = '?';
                    if ((i25 & i) != 0) {
                        int i31 = unsafe2.getInt(t, j5);
                        computeTagSize4 = CodedOutputStream.computeTagSize(i26);
                        computeInt32SizeNoTag = CodedOutputStream.computeUInt32SizeNoTag((i31 >> 31) ^ (i31 << 1));
                        i3 = computeInt32SizeNoTag + computeTagSize4;
                        i24 += i3;
                        break;
                    } else {
                        break;
                    }
                case 16:
                    if ((i25 & i) != 0) {
                        long j8 = unsafe2.getLong(t, j5);
                        computeTagSize3 = CodedOutputStream.computeTagSize(i26);
                        c = '?';
                        computeUInt64SizeNoTag = CodedOutputStream.computeUInt64SizeNoTag((j8 >> 63) ^ (j8 << 1));
                        i3 = computeUInt64SizeNoTag + computeTagSize3;
                        i24 += i3;
                        break;
                    }
                    c = '?';
                    break;
                case 17:
                    if ((i25 & i) != 0) {
                        i3 = CodedOutputStream.computeGroupSize(i26, (MessageLite) unsafe2.getObject(t, j5), getMessageFieldSchema(i23));
                        c = '?';
                        i24 += i3;
                        break;
                    }
                    c = '?';
                    break;
                case 18:
                    i3 = SchemaUtil.computeSizeFixed64List(i26, (List) unsafe2.getObject(t, j5));
                    c = '?';
                    i24 += i3;
                    break;
                case 19:
                    i3 = SchemaUtil.computeSizeFixed32List(i26, (List) unsafe2.getObject(t, j5));
                    c = '?';
                    i24 += i3;
                    break;
                case 20:
                    i3 = SchemaUtil.computeSizeInt64List(i26, (List) unsafe2.getObject(t, j5));
                    c = '?';
                    i24 += i3;
                    break;
                case 21:
                    i3 = SchemaUtil.computeSizeUInt64List(i26, (List) unsafe2.getObject(t, j5));
                    c = '?';
                    i24 += i3;
                    break;
                case 22:
                    i3 = SchemaUtil.computeSizeInt32List(i26, (List) unsafe2.getObject(t, j5));
                    c = '?';
                    i24 += i3;
                    break;
                case 23:
                    i3 = SchemaUtil.computeSizeFixed64List(i26, (List) unsafe2.getObject(t, j5));
                    c = '?';
                    i24 += i3;
                    break;
                case 24:
                    i3 = SchemaUtil.computeSizeFixed32List(i26, (List) unsafe2.getObject(t, j5));
                    c = '?';
                    i24 += i3;
                    break;
                case 25:
                    Class<?> cls4 = SchemaUtil.GENERATED_MESSAGE_CLASS;
                    int size3 = ((List) unsafe2.getObject(t, j5)).size();
                    if (size3 != 0) {
                        i3 = (CodedOutputStream.computeTagSize(i26) + 1) * size3;
                        c = '?';
                        i24 += i3;
                        break;
                    }
                    i3 = 0;
                    c = '?';
                    i24 += i3;
                case 26:
                    i3 = SchemaUtil.computeSizeStringList(i26, (List) unsafe2.getObject(t, j5));
                    c = '?';
                    i24 += i3;
                    break;
                case 27:
                    i3 = SchemaUtil.computeSizeMessageList(i26, (List) unsafe2.getObject(t, j5), getMessageFieldSchema(i23));
                    c = '?';
                    i24 += i3;
                    break;
                case 28:
                    i3 = SchemaUtil.computeSizeByteStringList(i26, (List) unsafe2.getObject(t, j5));
                    c = '?';
                    i24 += i3;
                    break;
                case 29:
                    i3 = SchemaUtil.computeSizeUInt32List(i26, (List) unsafe2.getObject(t, j5));
                    c = '?';
                    i24 += i3;
                    break;
                case 30:
                    i3 = SchemaUtil.computeSizeEnumList(i26, (List) unsafe2.getObject(t, j5));
                    c = '?';
                    i24 += i3;
                    break;
                case 31:
                    i3 = SchemaUtil.computeSizeFixed32List(i26, (List) unsafe2.getObject(t, j5));
                    c = '?';
                    i24 += i3;
                    break;
                case 32:
                    i3 = SchemaUtil.computeSizeFixed64List(i26, (List) unsafe2.getObject(t, j5));
                    c = '?';
                    i24 += i3;
                    break;
                case 33:
                    i3 = SchemaUtil.computeSizeSInt32List(i26, (List) unsafe2.getObject(t, j5));
                    c = '?';
                    i24 += i3;
                    break;
                case 34:
                    i3 = SchemaUtil.computeSizeSInt64List(i26, (List) unsafe2.getObject(t, j5));
                    c = '?';
                    i24 += i3;
                    break;
                case 35:
                    i6 = SchemaUtil.computeSizeFixed64ListNoTag((List) unsafe2.getObject(t, j5));
                    if (i6 > 0) {
                        if (this.useCachedSizeField) {
                            unsafe2.putInt(t, i2, i6);
                        }
                        i5 = CodedOutputStream.computeTagSize(i26);
                        i4 = CodedOutputStream.computeUInt32SizeNoTag(i6);
                        i24 = i4 + i5 + i6 + i24;
                    }
                    c = '?';
                    break;
                case 36:
                    i6 = SchemaUtil.computeSizeFixed32ListNoTag((List) unsafe2.getObject(t, j5));
                    if (i6 > 0) {
                        if (this.useCachedSizeField) {
                            unsafe2.putInt(t, i2, i6);
                        }
                        i5 = CodedOutputStream.computeTagSize(i26);
                        i4 = CodedOutputStream.computeUInt32SizeNoTag(i6);
                        i24 = i4 + i5 + i6 + i24;
                    }
                    c = '?';
                    break;
                case 37:
                    i6 = SchemaUtil.computeSizeInt64ListNoTag((List) unsafe2.getObject(t, j5));
                    if (i6 > 0) {
                        if (this.useCachedSizeField) {
                            unsafe2.putInt(t, i2, i6);
                        }
                        i5 = CodedOutputStream.computeTagSize(i26);
                        i4 = CodedOutputStream.computeUInt32SizeNoTag(i6);
                        i24 = i4 + i5 + i6 + i24;
                    }
                    c = '?';
                    break;
                case 38:
                    i6 = SchemaUtil.computeSizeUInt64ListNoTag((List) unsafe2.getObject(t, j5));
                    if (i6 > 0) {
                        if (this.useCachedSizeField) {
                            unsafe2.putInt(t, i2, i6);
                        }
                        i5 = CodedOutputStream.computeTagSize(i26);
                        i4 = CodedOutputStream.computeUInt32SizeNoTag(i6);
                        i24 = i4 + i5 + i6 + i24;
                    }
                    c = '?';
                    break;
                case 39:
                    i6 = SchemaUtil.computeSizeInt32ListNoTag((List) unsafe2.getObject(t, j5));
                    if (i6 > 0) {
                        if (this.useCachedSizeField) {
                            unsafe2.putInt(t, i2, i6);
                        }
                        i5 = CodedOutputStream.computeTagSize(i26);
                        i4 = CodedOutputStream.computeUInt32SizeNoTag(i6);
                        i24 = i4 + i5 + i6 + i24;
                    }
                    c = '?';
                    break;
                case 40:
                    i6 = SchemaUtil.computeSizeFixed64ListNoTag((List) unsafe2.getObject(t, j5));
                    if (i6 > 0) {
                        if (this.useCachedSizeField) {
                            unsafe2.putInt(t, i2, i6);
                        }
                        i5 = CodedOutputStream.computeTagSize(i26);
                        i4 = CodedOutputStream.computeUInt32SizeNoTag(i6);
                        i24 = i4 + i5 + i6 + i24;
                    }
                    c = '?';
                    break;
                case 41:
                    i6 = SchemaUtil.computeSizeFixed32ListNoTag((List) unsafe2.getObject(t, j5));
                    if (i6 > 0) {
                        if (this.useCachedSizeField) {
                            unsafe2.putInt(t, i2, i6);
                        }
                        i5 = CodedOutputStream.computeTagSize(i26);
                        i4 = CodedOutputStream.computeUInt32SizeNoTag(i6);
                        i24 = i4 + i5 + i6 + i24;
                    }
                    c = '?';
                    break;
                case 42:
                    Class<?> cls5 = SchemaUtil.GENERATED_MESSAGE_CLASS;
                    i6 = ((List) unsafe2.getObject(t, j5)).size();
                    if (i6 > 0) {
                        if (this.useCachedSizeField) {
                            unsafe2.putInt(t, i2, i6);
                        }
                        i5 = CodedOutputStream.computeTagSize(i26);
                        i4 = CodedOutputStream.computeUInt32SizeNoTag(i6);
                        i24 = i4 + i5 + i6 + i24;
                    }
                    c = '?';
                    break;
                case 43:
                    i6 = SchemaUtil.computeSizeUInt32ListNoTag((List) unsafe2.getObject(t, j5));
                    if (i6 > 0) {
                        if (this.useCachedSizeField) {
                            unsafe2.putInt(t, i2, i6);
                        }
                        i5 = CodedOutputStream.computeTagSize(i26);
                        i4 = CodedOutputStream.computeUInt32SizeNoTag(i6);
                        i24 = i4 + i5 + i6 + i24;
                    }
                    c = '?';
                    break;
                case 44:
                    i6 = SchemaUtil.computeSizeEnumListNoTag((List) unsafe2.getObject(t, j5));
                    if (i6 > 0) {
                        if (this.useCachedSizeField) {
                            unsafe2.putInt(t, i2, i6);
                        }
                        i5 = CodedOutputStream.computeTagSize(i26);
                        i4 = CodedOutputStream.computeUInt32SizeNoTag(i6);
                        i24 = i4 + i5 + i6 + i24;
                    }
                    c = '?';
                    break;
                case 45:
                    i6 = SchemaUtil.computeSizeFixed32ListNoTag((List) unsafe2.getObject(t, j5));
                    if (i6 > 0) {
                        if (this.useCachedSizeField) {
                            unsafe2.putInt(t, i2, i6);
                        }
                        i5 = CodedOutputStream.computeTagSize(i26);
                        i4 = CodedOutputStream.computeUInt32SizeNoTag(i6);
                        i24 = i4 + i5 + i6 + i24;
                    }
                    c = '?';
                    break;
                case 46:
                    i6 = SchemaUtil.computeSizeFixed64ListNoTag((List) unsafe2.getObject(t, j5));
                    if (i6 > 0) {
                        if (this.useCachedSizeField) {
                            unsafe2.putInt(t, i2, i6);
                        }
                        i5 = CodedOutputStream.computeTagSize(i26);
                        i4 = CodedOutputStream.computeUInt32SizeNoTag(i6);
                        i24 = i4 + i5 + i6 + i24;
                    }
                    c = '?';
                    break;
                case 47:
                    i6 = SchemaUtil.computeSizeSInt32ListNoTag((List) unsafe2.getObject(t, j5));
                    if (i6 > 0) {
                        if (this.useCachedSizeField) {
                            unsafe2.putInt(t, i2, i6);
                        }
                        i5 = CodedOutputStream.computeTagSize(i26);
                        i4 = CodedOutputStream.computeUInt32SizeNoTag(i6);
                        i24 = i4 + i5 + i6 + i24;
                    }
                    c = '?';
                    break;
                case 48:
                    i6 = SchemaUtil.computeSizeSInt64ListNoTag((List) unsafe2.getObject(t, j5));
                    if (i6 > 0) {
                        if (this.useCachedSizeField) {
                            unsafe2.putInt(t, i2, i6);
                        }
                        i5 = CodedOutputStream.computeTagSize(i26);
                        i4 = CodedOutputStream.computeUInt32SizeNoTag(i6);
                        i24 = i4 + i5 + i6 + i24;
                    }
                    c = '?';
                    break;
                case 49:
                    List list = (List) unsafe2.getObject(t, j5);
                    Schema messageFieldSchema2 = getMessageFieldSchema(i23);
                    Class<?> cls6 = SchemaUtil.GENERATED_MESSAGE_CLASS;
                    int size4 = list.size();
                    if (size4 != 0) {
                        int i32 = 0;
                        for (int i33 = 0; i33 < size4; i33++) {
                            i32 += CodedOutputStream.computeGroupSize(i26, (MessageLite) list.get(i33), messageFieldSchema2);
                        }
                        i3 = i32;
                        c = '?';
                        i24 += i3;
                        break;
                    }
                    i3 = 0;
                    c = '?';
                    i24 += i3;
                case 50:
                    i3 = this.mapFieldSchema.getSerializedSize(i26, unsafe2.getObject(t, j5), getMapFieldDefaultEntry(i23));
                    c = '?';
                    i24 += i3;
                    break;
                case 51:
                    if (isOneofPresent(t, i26, i23)) {
                        computeTagSize5 = CodedOutputStream.computeTagSize(i26);
                        i3 = computeTagSize5 + 8;
                        c = '?';
                        i24 += i3;
                        break;
                    }
                    c = '?';
                    break;
                case 52:
                    if (isOneofPresent(t, i26, i23)) {
                        computeTagSize6 = CodedOutputStream.computeTagSize(i26);
                        i3 = computeTagSize6 + 4;
                        c = '?';
                        i24 += i3;
                        break;
                    }
                    c = '?';
                    break;
                case 53:
                    if (isOneofPresent(t, i26, i23)) {
                        long oneofLongAt4 = oneofLongAt(t, j5);
                        computeTagSize7 = CodedOutputStream.computeTagSize(i26);
                        computeUInt64SizeNoTag2 = CodedOutputStream.computeUInt64SizeNoTag(oneofLongAt4);
                        i3 = computeUInt64SizeNoTag2 + computeTagSize7;
                        c = '?';
                        i24 += i3;
                        break;
                    }
                    c = '?';
                    break;
                case 54:
                    if (isOneofPresent(t, i26, i23)) {
                        long oneofLongAt5 = oneofLongAt(t, j5);
                        computeTagSize7 = CodedOutputStream.computeTagSize(i26);
                        computeUInt64SizeNoTag2 = CodedOutputStream.computeUInt64SizeNoTag(oneofLongAt5);
                        i3 = computeUInt64SizeNoTag2 + computeTagSize7;
                        c = '?';
                        i24 += i3;
                        break;
                    }
                    c = '?';
                    break;
                case 55:
                    if (isOneofPresent(t, i26, i23)) {
                        int oneofIntAt4 = oneofIntAt(t, j5);
                        computeTagSize8 = CodedOutputStream.computeTagSize(i26);
                        computeInt32SizeNoTag2 = CodedOutputStream.computeInt32SizeNoTag(oneofIntAt4);
                        i3 = computeInt32SizeNoTag2 + computeTagSize8;
                        c = '?';
                        i24 += i3;
                        break;
                    }
                    c = '?';
                    break;
                case 56:
                    if (isOneofPresent(t, i26, i23)) {
                        i3 = CodedOutputStream.computeFixed64Size(i26);
                        c = '?';
                        i24 += i3;
                        break;
                    }
                    c = '?';
                    break;
                case 57:
                    if (isOneofPresent(t, i26, i23)) {
                        i3 = CodedOutputStream.computeFixed32Size(i26);
                        c = '?';
                        i24 += i3;
                        break;
                    }
                    c = '?';
                    break;
                case 58:
                    if (isOneofPresent(t, i26, i23)) {
                        i3 = CodedOutputStream.computeTagSize(i26) + 1;
                        c = '?';
                        i24 += i3;
                        break;
                    }
                    c = '?';
                    break;
                case 59:
                    if (isOneofPresent(t, i26, i23)) {
                        Object object4 = unsafe2.getObject(t, j5);
                        if (object4 instanceof ByteString) {
                            i3 = CodedOutputStream.computeBytesSize(i26, (ByteString) object4);
                        } else {
                            i3 = CodedOutputStream.computeStringSizeNoTag((String) object4) + CodedOutputStream.computeTagSize(i26);
                        }
                        c = '?';
                        i24 += i3;
                        break;
                    }
                    c = '?';
                    break;
                case 60:
                    if (isOneofPresent(t, i26, i23)) {
                        i3 = SchemaUtil.computeSizeMessage(i26, unsafe2.getObject(t, j5), getMessageFieldSchema(i23));
                        c = '?';
                        i24 += i3;
                        break;
                    }
                    c = '?';
                    break;
                case 61:
                    if (isOneofPresent(t, i26, i23)) {
                        i3 = CodedOutputStream.computeBytesSize(i26, (ByteString) unsafe2.getObject(t, j5));
                        c = '?';
                        i24 += i3;
                        break;
                    }
                    c = '?';
                    break;
                case 62:
                    if (isOneofPresent(t, i26, i23)) {
                        i3 = CodedOutputStream.computeUInt32Size(i26, oneofIntAt(t, j5));
                        c = '?';
                        i24 += i3;
                        break;
                    }
                    c = '?';
                    break;
                case 63:
                    if (isOneofPresent(t, i26, i23)) {
                        int oneofIntAt5 = oneofIntAt(t, j5);
                        computeTagSize8 = CodedOutputStream.computeTagSize(i26);
                        computeInt32SizeNoTag2 = CodedOutputStream.computeInt32SizeNoTag(oneofIntAt5);
                        i3 = computeInt32SizeNoTag2 + computeTagSize8;
                        c = '?';
                        i24 += i3;
                        break;
                    }
                    c = '?';
                    break;
                case 64:
                    if (isOneofPresent(t, i26, i23)) {
                        computeTagSize6 = CodedOutputStream.computeTagSize(i26);
                        i3 = computeTagSize6 + 4;
                        c = '?';
                        i24 += i3;
                        break;
                    }
                    c = '?';
                    break;
                case 65:
                    if (isOneofPresent(t, i26, i23)) {
                        computeTagSize5 = CodedOutputStream.computeTagSize(i26);
                        i3 = computeTagSize5 + 8;
                        c = '?';
                        i24 += i3;
                        break;
                    }
                    c = '?';
                    break;
                case 66:
                    if (isOneofPresent(t, i26, i23)) {
                        int oneofIntAt6 = oneofIntAt(t, j5);
                        computeTagSize8 = CodedOutputStream.computeTagSize(i26);
                        computeInt32SizeNoTag2 = CodedOutputStream.computeUInt32SizeNoTag((oneofIntAt6 >> 31) ^ (oneofIntAt6 << 1));
                        i3 = computeInt32SizeNoTag2 + computeTagSize8;
                        c = '?';
                        i24 += i3;
                        break;
                    }
                    c = '?';
                    break;
                case 67:
                    if (isOneofPresent(t, i26, i23)) {
                        long oneofLongAt6 = oneofLongAt(t, j5);
                        computeTagSize7 = CodedOutputStream.computeTagSize(i26);
                        computeUInt64SizeNoTag2 = CodedOutputStream.computeUInt64SizeNoTag((oneofLongAt6 >> 63) ^ (oneofLongAt6 << 1));
                        i3 = computeUInt64SizeNoTag2 + computeTagSize7;
                        c = '?';
                        i24 += i3;
                        break;
                    }
                    c = '?';
                    break;
                case 68:
                    if (isOneofPresent(t, i26, i23)) {
                        i3 = CodedOutputStream.computeGroupSize(i26, (MessageLite) unsafe2.getObject(t, j5), getMessageFieldSchema(i23));
                        c = '?';
                        i24 += i3;
                        break;
                    }
                    c = '?';
                    break;
                default:
                    c = '?';
                    break;
            }
            i23 += 3;
            i12 = 267386880;
        }
        UnknownFieldSchema<?, ?> unknownFieldSchema2 = this.unknownFieldSchema;
        int serializedSize = unknownFieldSchema2.getSerializedSize(unknownFieldSchema2.getFromMessage(t)) + i24;
        if (this.hasExtensions) {
            FieldSet<?> extensions = this.extensionSchema.getExtensions(t);
            int i34 = 0;
            for (int i35 = 0; i35 < extensions.fields.getNumArrayEntries(); i35++) {
                Map.Entry<Object, Object> arrayEntryAt = extensions.fields.getArrayEntryAt(i35);
                i34 = FieldSet.computeFieldSize((FieldSet.FieldDescriptorLite) arrayEntryAt.getKey(), arrayEntryAt.getValue()) + i34;
            }
            for (Map.Entry<Object, Object> entry : extensions.fields.getOverflowEntries()) {
                i34 = FieldSet.computeFieldSize((FieldSet.FieldDescriptorLite) entry.getKey(), entry.getValue()) + i34;
            }
            serializedSize += i34;
        }
        return serializedSize;
    }

    /* JADX WARN: Code restructure failed: missing block: B:39:0x00de, code lost:
        if (r3 != false) goto L81;
     */
    /* JADX WARN: Code restructure failed: missing block: B:79:0x01f3, code lost:
        if (r3 != false) goto L81;
     */
    /* JADX WARN: Code restructure failed: missing block: B:80:0x01f6, code lost:
        r8 = 1237;
     */
    /* JADX WARN: Code restructure failed: missing block: B:81:0x01f7, code lost:
        r3 = r8;
     */
    @Override // com.google.protobuf.Schema
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final int hashCode(T r11) {
        /*
            Method dump skipped, instructions count: 756
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.protobuf.MessageSchema.hashCode(java.lang.Object):int");
    }

    public final boolean isFieldPresent(T t, int i) {
        int i2;
        boolean equals;
        if (this.proto3) {
            int typeAndOffsetAt = typeAndOffsetAt(i);
            long j = typeAndOffsetAt & 1048575;
            switch ((typeAndOffsetAt & 267386880) >>> 20) {
                case 0:
                    if (UnsafeUtil.getDouble(t, j) != 0.0d) {
                        return true;
                    }
                    return false;
                case 1:
                    if (UnsafeUtil.getFloat(t, j) != HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                        return true;
                    }
                    return false;
                case 2:
                    if (UnsafeUtil.getLong(t, j) != 0) {
                        return true;
                    }
                    return false;
                case 3:
                    if (UnsafeUtil.getLong(t, j) != 0) {
                        return true;
                    }
                    return false;
                case 4:
                    if (UnsafeUtil.getInt(t, j) != 0) {
                        return true;
                    }
                    return false;
                case 5:
                    if (UnsafeUtil.getLong(t, j) != 0) {
                        return true;
                    }
                    return false;
                case 6:
                    if (UnsafeUtil.getInt(t, j) != 0) {
                        return true;
                    }
                    return false;
                case 7:
                    return UnsafeUtil.getBoolean(t, j);
                case 8:
                    Object object = UnsafeUtil.getObject(t, j);
                    if (object instanceof String) {
                        equals = ((String) object).isEmpty();
                        break;
                    } else if (object instanceof ByteString) {
                        equals = ByteString.EMPTY.equals(object);
                        break;
                    } else {
                        throw new IllegalArgumentException();
                    }
                case 9:
                    if (UnsafeUtil.getObject(t, j) != null) {
                        return true;
                    }
                    return false;
                case 10:
                    equals = ByteString.EMPTY.equals(UnsafeUtil.getObject(t, j));
                    break;
                case 11:
                    if (UnsafeUtil.getInt(t, j) != 0) {
                        return true;
                    }
                    return false;
                case 12:
                    if (UnsafeUtil.getInt(t, j) != 0) {
                        return true;
                    }
                    return false;
                case 13:
                    if (UnsafeUtil.getInt(t, j) != 0) {
                        return true;
                    }
                    return false;
                case 14:
                    if (UnsafeUtil.getLong(t, j) != 0) {
                        return true;
                    }
                    return false;
                case 15:
                    if (UnsafeUtil.getInt(t, j) != 0) {
                        return true;
                    }
                    return false;
                case 16:
                    if (UnsafeUtil.getLong(t, j) != 0) {
                        return true;
                    }
                    return false;
                case 17:
                    if (UnsafeUtil.getObject(t, j) != null) {
                        return true;
                    }
                    return false;
                default:
                    throw new IllegalArgumentException();
            }
            return !equals;
        }
        if ((UnsafeUtil.getInt(t, i2 & 1048575) & (1 << (this.buffer[i + 2] >>> 20))) != 0) {
            return true;
        }
        return false;
    }

    public final boolean isOneofPresent(T t, int i, int i2) {
        if (UnsafeUtil.getInt(t, this.buffer[i2 + 2] & 1048575) == i) {
            return true;
        }
        return false;
    }

    @Override // com.google.protobuf.Schema
    public final void makeImmutable(T t) {
        int i;
        int i2 = this.checkInitializedCount;
        while (true) {
            i = this.repeatedFieldOffsetStart;
            if (i2 >= i) {
                break;
            }
            long typeAndOffsetAt = typeAndOffsetAt(this.intArray[i2]) & 1048575;
            Object object = UnsafeUtil.getObject(t, typeAndOffsetAt);
            if (object != null) {
                UnsafeUtil.putObject(t, typeAndOffsetAt, this.mapFieldSchema.toImmutable(object));
            }
            i2++;
        }
        int length = this.intArray.length;
        while (i < length) {
            this.listFieldSchema.makeImmutableListAt(t, this.intArray[i]);
            i++;
        }
        this.unknownFieldSchema.makeImmutable(t);
        if (this.hasExtensions) {
            this.extensionSchema.makeImmutable(t);
        }
    }

    @Override // com.google.protobuf.Schema
    public final T newInstance() {
        return (T) this.newInstanceSchema.newInstance(this.defaultInstance);
    }

    public final void parseMapField(Object obj, byte[] bArr, int i, int i2, int i3, long j, ArrayDecoders.Registers registers) throws IOException {
        Unsafe unsafe = UNSAFE;
        Object mapFieldDefaultEntry = getMapFieldDefaultEntry(i3);
        Object object = unsafe.getObject(obj, j);
        if (this.mapFieldSchema.isImmutable(object)) {
            MapFieldLite newMapField = this.mapFieldSchema.newMapField();
            this.mapFieldSchema.mergeFrom(newMapField, object);
            unsafe.putObject(obj, j, newMapField);
            object = newMapField;
        }
        this.mapFieldSchema.forMapMetadata(mapFieldDefaultEntry);
        this.mapFieldSchema.forMutableMapData(object);
        int decodeVarint32 = ArrayDecoders.decodeVarint32(bArr, i, registers);
        int i4 = registers.int1;
        if (i4 < 0 || i4 > i2 - decodeVarint32) {
            throw InvalidProtocolBufferException.truncatedMessage();
        }
        throw null;
    }

    public final int parseOneofField(T t, byte[] bArr, int i, int i2, int i3, int i4, int i5, int i6, int i7, long j, int i8, ArrayDecoders.Registers registers) throws IOException {
        boolean z;
        boolean z2;
        Object obj;
        Object obj2;
        Unsafe unsafe = UNSAFE;
        long j2 = this.buffer[i8 + 2] & 1048575;
        switch (i7) {
            case 51:
                if (i5 == 1) {
                    unsafe.putObject(t, j, Double.valueOf(Double.longBitsToDouble(ArrayDecoders.decodeFixed64(bArr, i))));
                    int i9 = i + 8;
                    unsafe.putInt(t, j2, i4);
                    return i9;
                }
                break;
            case 52:
                if (i5 == 5) {
                    unsafe.putObject(t, j, Float.valueOf(Float.intBitsToFloat(ArrayDecoders.decodeFixed32(bArr, i))));
                    int i10 = i + 4;
                    unsafe.putInt(t, j2, i4);
                    return i10;
                }
                break;
            case 53:
            case 54:
                if (i5 == 0) {
                    int decodeVarint64 = ArrayDecoders.decodeVarint64(bArr, i, registers);
                    unsafe.putObject(t, j, Long.valueOf(registers.long1));
                    unsafe.putInt(t, j2, i4);
                    return decodeVarint64;
                }
                break;
            case 55:
            case 62:
                if (i5 == 0) {
                    int decodeVarint32 = ArrayDecoders.decodeVarint32(bArr, i, registers);
                    unsafe.putObject(t, j, Integer.valueOf(registers.int1));
                    unsafe.putInt(t, j2, i4);
                    return decodeVarint32;
                }
                break;
            case 56:
            case 65:
                if (i5 == 1) {
                    unsafe.putObject(t, j, Long.valueOf(ArrayDecoders.decodeFixed64(bArr, i)));
                    int i11 = i + 8;
                    unsafe.putInt(t, j2, i4);
                    return i11;
                }
                break;
            case 57:
            case 64:
                if (i5 == 5) {
                    unsafe.putObject(t, j, Integer.valueOf(ArrayDecoders.decodeFixed32(bArr, i)));
                    int i12 = i + 4;
                    unsafe.putInt(t, j2, i4);
                    return i12;
                }
                break;
            case 58:
                if (i5 == 0) {
                    int decodeVarint642 = ArrayDecoders.decodeVarint64(bArr, i, registers);
                    if (registers.long1 != 0) {
                        z = true;
                    } else {
                        z = false;
                    }
                    unsafe.putObject(t, j, Boolean.valueOf(z));
                    unsafe.putInt(t, j2, i4);
                    return decodeVarint642;
                }
                break;
            case 59:
                if (i5 == 2) {
                    int decodeVarint322 = ArrayDecoders.decodeVarint32(bArr, i, registers);
                    int i13 = registers.int1;
                    if (i13 == 0) {
                        unsafe.putObject(t, j, "");
                    } else {
                        if ((i6 & 536870912) != 0) {
                            if (Utf8.processor.partialIsValidUtf8(bArr, decodeVarint322, decodeVarint322 + i13) == 0) {
                                z2 = true;
                            } else {
                                z2 = false;
                            }
                            if (!z2) {
                                throw InvalidProtocolBufferException.invalidUtf8();
                            }
                        }
                        unsafe.putObject(t, j, new String(bArr, decodeVarint322, i13, Internal.UTF_8));
                        decodeVarint322 += i13;
                    }
                    unsafe.putInt(t, j2, i4);
                    return decodeVarint322;
                }
                break;
            case 60:
                if (i5 == 2) {
                    int decodeMessageField = ArrayDecoders.decodeMessageField(getMessageFieldSchema(i8), bArr, i, i2, registers);
                    if (unsafe.getInt(t, j2) == i4) {
                        obj = unsafe.getObject(t, j);
                    } else {
                        obj = null;
                    }
                    if (obj == null) {
                        unsafe.putObject(t, j, registers.object1);
                    } else {
                        unsafe.putObject(t, j, Internal.mergeMessage(obj, registers.object1));
                    }
                    unsafe.putInt(t, j2, i4);
                    return decodeMessageField;
                }
                break;
            case 61:
                if (i5 == 2) {
                    int decodeBytes = ArrayDecoders.decodeBytes(bArr, i, registers);
                    unsafe.putObject(t, j, registers.object1);
                    unsafe.putInt(t, j2, i4);
                    return decodeBytes;
                }
                break;
            case 63:
                if (i5 == 0) {
                    int decodeVarint323 = ArrayDecoders.decodeVarint32(bArr, i, registers);
                    int i14 = registers.int1;
                    Internal.EnumVerifier enumFieldVerifier = getEnumFieldVerifier(i8);
                    if (enumFieldVerifier == null || enumFieldVerifier.isInRange(i14)) {
                        unsafe.putObject(t, j, Integer.valueOf(i14));
                        unsafe.putInt(t, j2, i4);
                    } else {
                        getMutableUnknownFields(t).storeField(i3, Long.valueOf(i14));
                    }
                    return decodeVarint323;
                }
                break;
            case 66:
                if (i5 == 0) {
                    int decodeVarint324 = ArrayDecoders.decodeVarint32(bArr, i, registers);
                    unsafe.putObject(t, j, Integer.valueOf(CodedInputStream.decodeZigZag32(registers.int1)));
                    unsafe.putInt(t, j2, i4);
                    return decodeVarint324;
                }
                break;
            case 67:
                if (i5 == 0) {
                    int decodeVarint643 = ArrayDecoders.decodeVarint64(bArr, i, registers);
                    unsafe.putObject(t, j, Long.valueOf(CodedInputStream.decodeZigZag64(registers.long1)));
                    unsafe.putInt(t, j2, i4);
                    return decodeVarint643;
                }
                break;
            case 68:
                if (i5 == 3) {
                    int decodeGroupField = ArrayDecoders.decodeGroupField(getMessageFieldSchema(i8), bArr, i, i2, (i3 & (-8)) | 4, registers);
                    if (unsafe.getInt(t, j2) == i4) {
                        obj2 = unsafe.getObject(t, j);
                    } else {
                        obj2 = null;
                    }
                    if (obj2 == null) {
                        unsafe.putObject(t, j, registers.object1);
                    } else {
                        unsafe.putObject(t, j, Internal.mergeMessage(obj2, registers.object1));
                    }
                    unsafe.putInt(t, j2, i4);
                    return decodeGroupField;
                }
                break;
        }
        return i;
    }

    /* JADX WARN: Code restructure failed: missing block: B:164:0x04c8, code lost:
        if (r6 == (-1)) goto L166;
     */
    /* JADX WARN: Code restructure failed: missing block: B:165:0x04ca, code lost:
        r26.putInt(r13, r6, r7);
     */
    /* JADX WARN: Code restructure failed: missing block: B:166:0x04d0, code lost:
        r2 = r9.checkInitializedCount;
     */
    /* JADX WARN: Code restructure failed: missing block: B:168:0x04d4, code lost:
        if (r2 >= r9.repeatedFieldOffsetStart) goto L217;
     */
    /* JADX WARN: Code restructure failed: missing block: B:169:0x04d6, code lost:
        r9.filterMapUnknownEnumValues(r13, r9.intArray[r2], r3, r9.unknownFieldSchema);
        r2 = r2 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:170:0x04e2, code lost:
        if (r1 != 0) goto L175;
     */
    /* JADX WARN: Code restructure failed: missing block: B:172:0x04e6, code lost:
        if (r0 != r33) goto L173;
     */
    /* JADX WARN: Code restructure failed: missing block: B:174:0x04ed, code lost:
        throw com.google.protobuf.InvalidProtocolBufferException.parseFailure();
     */
    /* JADX WARN: Code restructure failed: missing block: B:176:0x04f0, code lost:
        if (r0 > r33) goto L179;
     */
    /* JADX WARN: Code restructure failed: missing block: B:177:0x04f2, code lost:
        if (r4 != r1) goto L179;
     */
    /* JADX WARN: Code restructure failed: missing block: B:178:0x04f4, code lost:
        return r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:180:0x04f9, code lost:
        throw com.google.protobuf.InvalidProtocolBufferException.parseFailure();
     */
    /* JADX WARN: Removed duplicated region for block: B:145:0x0440 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:149:0x0455  */
    /* JADX WARN: Removed duplicated region for block: B:159:0x049b  */
    /* JADX WARN: Removed duplicated region for block: B:196:0x0050 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:24:0x005b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final int parseProto2Message(T r30, byte[] r31, int r32, int r33, int r34, com.google.protobuf.ArrayDecoders.Registers r35) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 1314
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.protobuf.MessageSchema.parseProto2Message(java.lang.Object, byte[], int, int, int, com.google.protobuf.ArrayDecoders$Registers):int");
    }

    /* JADX WARN: Removed duplicated region for block: B:117:0x0247  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0174  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x01f0  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:115:0x0244 -> B:116:0x0245). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:63:0x0171 -> B:64:0x0172). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:92:0x01ed -> B:93:0x01ee). Please submit an issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final int parseRepeatedField(T r17, byte[] r18, int r19, int r20, int r21, int r22, int r23, int r24, long r25, int r27, long r28, com.google.protobuf.ArrayDecoders.Registers r30) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 1194
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.protobuf.MessageSchema.parseRepeatedField(java.lang.Object, byte[], int, int, int, int, int, int, long, int, long, com.google.protobuf.ArrayDecoders$Registers):int");
    }

    public final void setFieldPresent(T t, int i) {
        if (!this.proto3) {
            int i2 = this.buffer[i + 2];
            long j = i2 & 1048575;
            UnsafeUtil.putInt(t, j, UnsafeUtil.getInt(t, j) | (1 << (i2 >>> 20)));
        }
    }

    public final void setOneofPresent(T t, int i, int i2) {
        UnsafeUtil.putInt(t, this.buffer[i2 + 2] & 1048575, i);
    }

    public final int slowPositionForFieldNumber(int i, int i2) {
        int length = (this.buffer.length / 3) - 1;
        while (i2 <= length) {
            int i3 = (length + i2) >>> 1;
            int i4 = i3 * 3;
            int i5 = this.buffer[i4];
            if (i == i5) {
                return i4;
            }
            if (i < i5) {
                length = i3 - 1;
            } else {
                i2 = i3 + 1;
            }
        }
        return -1;
    }

    public final int typeAndOffsetAt(int i) {
        return this.buffer[i + 1];
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:100:0x039d  */
    /* JADX WARN: Removed duplicated region for block: B:101:0x03ae  */
    /* JADX WARN: Removed duplicated region for block: B:102:0x03bf  */
    /* JADX WARN: Removed duplicated region for block: B:103:0x03d0  */
    /* JADX WARN: Removed duplicated region for block: B:104:0x03e1  */
    /* JADX WARN: Removed duplicated region for block: B:105:0x03f2  */
    /* JADX WARN: Removed duplicated region for block: B:106:0x0403  */
    /* JADX WARN: Removed duplicated region for block: B:107:0x0414  */
    /* JADX WARN: Removed duplicated region for block: B:10:0x0027  */
    /* JADX WARN: Removed duplicated region for block: B:110:0x0429  */
    /* JADX WARN: Removed duplicated region for block: B:113:0x0440  */
    /* JADX WARN: Removed duplicated region for block: B:116:0x0458  */
    /* JADX WARN: Removed duplicated region for block: B:119:0x046b  */
    /* JADX WARN: Removed duplicated region for block: B:122:0x047e  */
    /* JADX WARN: Removed duplicated region for block: B:125:0x0491  */
    /* JADX WARN: Removed duplicated region for block: B:128:0x04a4  */
    /* JADX WARN: Removed duplicated region for block: B:131:0x04b7  */
    /* JADX WARN: Removed duplicated region for block: B:134:0x04d0  */
    /* JADX WARN: Removed duplicated region for block: B:137:0x04e1  */
    /* JADX WARN: Removed duplicated region for block: B:140:0x04f4  */
    /* JADX WARN: Removed duplicated region for block: B:143:0x0507  */
    /* JADX WARN: Removed duplicated region for block: B:146:0x0519  */
    /* JADX WARN: Removed duplicated region for block: B:149:0x052b  */
    /* JADX WARN: Removed duplicated region for block: B:152:0x053d  */
    /* JADX WARN: Removed duplicated region for block: B:155:0x054f  */
    /* JADX WARN: Removed duplicated region for block: B:158:0x0568  */
    /* JADX WARN: Removed duplicated region for block: B:163:0x0586  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x005c  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0071  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0088  */
    /* JADX WARN: Removed duplicated region for block: B:275:0x0580 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00a0  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00b3  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00c6  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00d9  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00ec  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00ff  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0118  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0129  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0142  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0155  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x0168  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x017b  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x018e  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x01a1  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x01c1  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x01e1  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x01ec  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x0201  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x0212  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x0223  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x0234  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0245  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x0256  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x0267  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x0278  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x0289  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x029a  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x02ab  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x02bc  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x02cd  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x02de  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x02ef  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x0300  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x0311  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x0322  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x0333  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x0344  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x0355  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x0366  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x037b  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x038c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void writeFieldsInAscendingOrderProto3(java.lang.Object r14, com.google.protobuf.CodedOutputStreamWriter r15) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 1586
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.protobuf.MessageSchema.writeFieldsInAscendingOrderProto3(java.lang.Object, com.google.protobuf.CodedOutputStreamWriter):void");
    }

    public final void writeMapHelper(CodedOutputStreamWriter codedOutputStreamWriter, int i, Object obj, int i2) throws IOException {
        if (obj != null) {
            this.mapFieldSchema.forMapMetadata(getMapFieldDefaultEntry(i2));
            MapFieldLite forMapData = this.mapFieldSchema.forMapData(obj);
            codedOutputStreamWriter.output.getClass();
            Iterator it = forMapData.entrySet().iterator();
            if (it.hasNext()) {
                Map.Entry entry = (Map.Entry) it.next();
                codedOutputStreamWriter.output.writeTag(i, 2);
                entry.getKey();
                entry.getValue();
                throw null;
            }
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:100:0x02ce  */
    /* JADX WARN: Removed duplicated region for block: B:101:0x02de  */
    /* JADX WARN: Removed duplicated region for block: B:102:0x02ee  */
    /* JADX WARN: Removed duplicated region for block: B:103:0x02fd  */
    /* JADX WARN: Removed duplicated region for block: B:104:0x030c  */
    /* JADX WARN: Removed duplicated region for block: B:105:0x031b  */
    /* JADX WARN: Removed duplicated region for block: B:106:0x032a  */
    /* JADX WARN: Removed duplicated region for block: B:107:0x0339  */
    /* JADX WARN: Removed duplicated region for block: B:109:0x034a  */
    /* JADX WARN: Removed duplicated region for block: B:110:0x0359  */
    /* JADX WARN: Removed duplicated region for block: B:111:0x036c  */
    /* JADX WARN: Removed duplicated region for block: B:112:0x037b  */
    /* JADX WARN: Removed duplicated region for block: B:113:0x038b  */
    /* JADX WARN: Removed duplicated region for block: B:114:0x039b  */
    /* JADX WARN: Removed duplicated region for block: B:115:0x03ab  */
    /* JADX WARN: Removed duplicated region for block: B:116:0x03bb  */
    /* JADX WARN: Removed duplicated region for block: B:117:0x03cb  */
    /* JADX WARN: Removed duplicated region for block: B:118:0x03db  */
    /* JADX WARN: Removed duplicated region for block: B:119:0x03eb  */
    /* JADX WARN: Removed duplicated region for block: B:120:0x03fb  */
    /* JADX WARN: Removed duplicated region for block: B:123:0x040c  */
    /* JADX WARN: Removed duplicated region for block: B:126:0x0422  */
    /* JADX WARN: Removed duplicated region for block: B:129:0x0436  */
    /* JADX WARN: Removed duplicated region for block: B:132:0x0445  */
    /* JADX WARN: Removed duplicated region for block: B:135:0x0454  */
    /* JADX WARN: Removed duplicated region for block: B:138:0x0463  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x003b  */
    /* JADX WARN: Removed duplicated region for block: B:141:0x0472  */
    /* JADX WARN: Removed duplicated region for block: B:144:0x0481  */
    /* JADX WARN: Removed duplicated region for block: B:147:0x0496  */
    /* JADX WARN: Removed duplicated region for block: B:150:0x04a3  */
    /* JADX WARN: Removed duplicated region for block: B:153:0x04b2  */
    /* JADX WARN: Removed duplicated region for block: B:156:0x04c0  */
    /* JADX WARN: Removed duplicated region for block: B:159:0x04ce  */
    /* JADX WARN: Removed duplicated region for block: B:162:0x04dc  */
    /* JADX WARN: Removed duplicated region for block: B:165:0x04ea  */
    /* JADX WARN: Removed duplicated region for block: B:168:0x04f8  */
    /* JADX WARN: Removed duplicated region for block: B:171:0x050d  */
    /* JADX WARN: Removed duplicated region for block: B:176:0x0527  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0093  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0096  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00a8  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00be  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00d3  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00e3  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00f3  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0103  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0113  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0124  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x013b  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x014a  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0161  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0172  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0183  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0194  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x01a5  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x01b6  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x01d4  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x01f2  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x01fb  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x020e  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x021e  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x022e  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x023e  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x024e  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x025e  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x026e  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x027e  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x028e  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x029e  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x02ae  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x02be  */
    @Override // com.google.protobuf.Schema
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void writeTo(java.lang.Object r21, com.google.protobuf.CodedOutputStreamWriter r22) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 1492
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.protobuf.MessageSchema.writeTo(java.lang.Object, com.google.protobuf.CodedOutputStreamWriter):void");
    }

    public MessageSchema(int[] iArr, Object[] objArr, int i, int i2, MessageLite messageLite, boolean z, int[] iArr2, int i3, int i4, NewInstanceSchema newInstanceSchema, ListFieldSchema listFieldSchema, UnknownFieldSchema unknownFieldSchema, ExtensionSchema extensionSchema, MapFieldSchema mapFieldSchema) {
        boolean z2;
        this.buffer = iArr;
        this.objects = objArr;
        this.minFieldNumber = i;
        this.maxFieldNumber = i2;
        this.lite = messageLite instanceof GeneratedMessageLite;
        this.proto3 = z;
        if (extensionSchema == null || !extensionSchema.hasExtensions(messageLite)) {
            z2 = false;
        } else {
            z2 = true;
        }
        this.hasExtensions = z2;
        this.useCachedSizeField = false;
        this.intArray = iArr2;
        this.checkInitializedCount = i3;
        this.repeatedFieldOffsetStart = i4;
        this.newInstanceSchema = newInstanceSchema;
        this.listFieldSchema = listFieldSchema;
        this.unknownFieldSchema = unknownFieldSchema;
        this.extensionSchema = extensionSchema;
        this.defaultInstance = messageLite;
        this.mapFieldSchema = mapFieldSchema;
    }

    public static List<?> listAt(Object obj, long j) {
        return (List) UnsafeUtil.getObject(obj, j);
    }

    public static <T> int oneofIntAt(T t, long j) {
        return ((Integer) UnsafeUtil.getObject(t, j)).intValue();
    }

    public static <T> long oneofLongAt(T t, long j) {
        return ((Long) UnsafeUtil.getObject(t, j)).longValue();
    }

    public static Field reflectField(Class<?> cls, String str) {
        Field[] declaredFields;
        try {
            return cls.getDeclaredField(str);
        } catch (NoSuchFieldException unused) {
            for (Field field : cls.getDeclaredFields()) {
                if (str.equals(field.getName())) {
                    return field;
                }
            }
            throw new RuntimeException("Field " + str + " for " + cls.getName() + " not found. Known fields are " + Arrays.toString(declaredFields));
        }
    }

    public final boolean arePresentForEquals(T t, T t2, int i) {
        if (isFieldPresent(t, i) == isFieldPresent(t2, i)) {
            return true;
        }
        return false;
    }

    public final void mergeMessage(T t, T t2, int i) {
        long typeAndOffsetAt = typeAndOffsetAt(i) & 1048575;
        if (isFieldPresent(t2, i)) {
            Object object = UnsafeUtil.getObject(t, typeAndOffsetAt);
            Object object2 = UnsafeUtil.getObject(t2, typeAndOffsetAt);
            if (object != null && object2 != null) {
                UnsafeUtil.putObject(t, typeAndOffsetAt, Internal.mergeMessage(object, object2));
                setFieldPresent(t, i);
            } else if (object2 != null) {
                UnsafeUtil.putObject(t, typeAndOffsetAt, object2);
                setFieldPresent(t, i);
            }
        }
    }

    public final void mergeOneofMessage(T t, T t2, int i) {
        int typeAndOffsetAt = typeAndOffsetAt(i);
        int i2 = this.buffer[i];
        long j = typeAndOffsetAt & 1048575;
        if (isOneofPresent(t2, i2, i)) {
            Object object = UnsafeUtil.getObject(t, j);
            Object object2 = UnsafeUtil.getObject(t2, j);
            if (object != null && object2 != null) {
                UnsafeUtil.putObject(t, j, Internal.mergeMessage(object, object2));
                setOneofPresent(t, i2, i);
            } else if (object2 != null) {
                UnsafeUtil.putObject(t, j, object2);
                setOneofPresent(t, i2, i);
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:103:0x0208, code lost:
        if (r0 != r15) goto L113;
     */
    /* JADX WARN: Code restructure failed: missing block: B:112:0x0254, code lost:
        if (r0 != r15) goto L113;
     */
    /* JADX WARN: Code restructure failed: missing block: B:113:0x0256, code lost:
        r2 = r17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:114:0x0259, code lost:
        r2 = r0;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:136:0x0051 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:26:0x005c  */
    /* JADX WARN: Type inference failed for: r3v19, types: [int] */
    @Override // com.google.protobuf.Schema
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void mergeFrom(T r28, byte[] r29, int r30, int r31, com.google.protobuf.ArrayDecoders.Registers r32) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 706
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.protobuf.MessageSchema.mergeFrom(java.lang.Object, byte[], int, int, com.google.protobuf.ArrayDecoders$Registers):void");
    }
}
