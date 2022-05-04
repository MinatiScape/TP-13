package com.google.protobuf;

import com.google.protobuf.FieldSet;
import com.google.protobuf.Internal;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.RandomAccess;
import java.util.logging.Logger;
/* loaded from: classes.dex */
public final class SchemaUtil {
    public static final Class<?> GENERATED_MESSAGE_CLASS;
    public static final UnknownFieldSchema<?, ?> PROTO2_UNKNOWN_FIELD_SET_SCHEMA;
    public static final UnknownFieldSchema<?, ?> PROTO3_UNKNOWN_FIELD_SET_SCHEMA;
    public static final UnknownFieldSetLiteSchema UNKNOWN_FIELD_SET_LITE_SCHEMA;

    public static UnknownFieldSchema<?, ?> getUnknownFieldSetSchema(boolean z) {
        Class<?> cls;
        try {
            cls = Class.forName("com.google.protobuf.UnknownFieldSetSchema");
        } catch (Throwable unused) {
            cls = null;
        }
        if (cls == null) {
            return null;
        }
        try {
            return (UnknownFieldSchema) cls.getConstructor(Boolean.TYPE).newInstance(Boolean.valueOf(z));
        } catch (Throwable unused2) {
            return null;
        }
    }

    static {
        Class<?> cls;
        try {
            cls = Class.forName("com.google.protobuf.GeneratedMessageV3");
        } catch (Throwable unused) {
            cls = null;
        }
        GENERATED_MESSAGE_CLASS = cls;
        PROTO2_UNKNOWN_FIELD_SET_SCHEMA = getUnknownFieldSetSchema(false);
        PROTO3_UNKNOWN_FIELD_SET_SCHEMA = getUnknownFieldSetSchema(true);
        UNKNOWN_FIELD_SET_LITE_SCHEMA = new UnknownFieldSetLiteSchema();
    }

    public static int computeSizeMessage(int i, Object obj, Schema schema) {
        if (obj instanceof LazyFieldLite) {
            return CodedOutputStream.computeLazyFieldSizeNoTag((LazyFieldLite) obj) + CodedOutputStream.computeTagSize(i);
        }
        int computeTagSize = CodedOutputStream.computeTagSize(i);
        AbstractMessageLite abstractMessageLite = (AbstractMessageLite) ((MessageLite) obj);
        int memoizedSerializedSize = abstractMessageLite.getMemoizedSerializedSize();
        if (memoizedSerializedSize == -1) {
            memoizedSerializedSize = schema.getSerializedSize(abstractMessageLite);
            abstractMessageLite.setMemoizedSerializedSize(memoizedSerializedSize);
        }
        return CodedOutputStream.computeUInt32SizeNoTag(memoizedSerializedSize) + memoizedSerializedSize + computeTagSize;
    }

    public static <UT, UB> UB filterUnknownEnumList(int i, List<Integer> list, Internal.EnumVerifier enumVerifier, UB ub, UnknownFieldSchema<UT, UB> unknownFieldSchema) {
        if (enumVerifier == null) {
            return ub;
        }
        if (list instanceof RandomAccess) {
            int size = list.size();
            int i2 = 0;
            for (int i3 = 0; i3 < size; i3++) {
                int intValue = list.get(i3).intValue();
                if (enumVerifier.isInRange(intValue)) {
                    if (i3 != i2) {
                        list.set(i2, Integer.valueOf(intValue));
                    }
                    i2++;
                } else {
                    ub = (UB) storeUnknownEnum(i, intValue, ub, unknownFieldSchema);
                }
            }
            if (i2 != size) {
                list.subList(i2, size).clear();
            }
        } else {
            Iterator<Integer> it = list.iterator();
            while (it.hasNext()) {
                int intValue2 = it.next().intValue();
                if (!enumVerifier.isInRange(intValue2)) {
                    ub = (UB) storeUnknownEnum(i, intValue2, ub, unknownFieldSchema);
                    it.remove();
                }
            }
        }
        return ub;
    }

    public static boolean safeEquals(Object obj, Object obj2) {
        if (obj == obj2 || (obj != null && obj.equals(obj2))) {
            return true;
        }
        return false;
    }

    public static <UT, UB> UB storeUnknownEnum(int i, int i2, UB ub, UnknownFieldSchema<UT, UB> unknownFieldSchema) {
        if (ub == null) {
            ub = (UB) unknownFieldSchema.newBuilder();
        }
        unknownFieldSchema.addVarint(ub, i, i2);
        return ub;
    }

    public static void writeBoolList(int i, List list, CodedOutputStreamWriter codedOutputStreamWriter, boolean z) throws IOException {
        if (!(list == null || list.isEmpty())) {
            int i2 = 0;
            if (z) {
                codedOutputStreamWriter.output.writeTag(i, 2);
                int i3 = 0;
                for (int i4 = 0; i4 < list.size(); i4++) {
                    ((Boolean) list.get(i4)).booleanValue();
                    Logger logger = CodedOutputStream.logger;
                    i3++;
                }
                codedOutputStreamWriter.output.writeUInt32NoTag(i3);
                while (i2 < list.size()) {
                    codedOutputStreamWriter.output.write(((Boolean) list.get(i2)).booleanValue() ? (byte) 1 : (byte) 0);
                    i2++;
                }
                return;
            }
            codedOutputStreamWriter.getClass();
            while (i2 < list.size()) {
                codedOutputStreamWriter.output.writeBool(i, ((Boolean) list.get(i2)).booleanValue());
                i2++;
            }
        }
    }

    public static void writeBytesList(int i, List list, CodedOutputStreamWriter codedOutputStreamWriter) throws IOException {
        if (!(list == null || list.isEmpty())) {
            codedOutputStreamWriter.getClass();
            for (int i2 = 0; i2 < list.size(); i2++) {
                codedOutputStreamWriter.output.writeBytes(i, (ByteString) list.get(i2));
            }
        }
    }

    public static void writeDoubleList(int i, List list, CodedOutputStreamWriter codedOutputStreamWriter, boolean z) throws IOException {
        if (!(list == null || list.isEmpty())) {
            int i2 = 0;
            if (z) {
                codedOutputStreamWriter.output.writeTag(i, 2);
                int i3 = 0;
                for (int i4 = 0; i4 < list.size(); i4++) {
                    ((Double) list.get(i4)).doubleValue();
                    Logger logger = CodedOutputStream.logger;
                    i3 += 8;
                }
                codedOutputStreamWriter.output.writeUInt32NoTag(i3);
                while (i2 < list.size()) {
                    CodedOutputStream codedOutputStream = codedOutputStreamWriter.output;
                    double doubleValue = ((Double) list.get(i2)).doubleValue();
                    codedOutputStream.getClass();
                    codedOutputStream.writeFixed64NoTag(Double.doubleToRawLongBits(doubleValue));
                    i2++;
                }
                return;
            }
            codedOutputStreamWriter.getClass();
            while (i2 < list.size()) {
                CodedOutputStream codedOutputStream2 = codedOutputStreamWriter.output;
                double doubleValue2 = ((Double) list.get(i2)).doubleValue();
                codedOutputStream2.getClass();
                codedOutputStream2.writeFixed64(i, Double.doubleToRawLongBits(doubleValue2));
                i2++;
            }
        }
    }

    public static void writeEnumList(int i, List list, CodedOutputStreamWriter codedOutputStreamWriter, boolean z) throws IOException {
        if (!(list == null || list.isEmpty())) {
            int i2 = 0;
            if (z) {
                codedOutputStreamWriter.output.writeTag(i, 2);
                int i3 = 0;
                for (int i4 = 0; i4 < list.size(); i4++) {
                    i3 += CodedOutputStream.computeInt32SizeNoTag(((Integer) list.get(i4)).intValue());
                }
                codedOutputStreamWriter.output.writeUInt32NoTag(i3);
                while (i2 < list.size()) {
                    codedOutputStreamWriter.output.writeInt32NoTag(((Integer) list.get(i2)).intValue());
                    i2++;
                }
                return;
            }
            codedOutputStreamWriter.getClass();
            while (i2 < list.size()) {
                codedOutputStreamWriter.output.writeInt32(i, ((Integer) list.get(i2)).intValue());
                i2++;
            }
        }
    }

    public static void writeFixed32List(int i, List list, CodedOutputStreamWriter codedOutputStreamWriter, boolean z) throws IOException {
        if (!(list == null || list.isEmpty())) {
            int i2 = 0;
            if (z) {
                codedOutputStreamWriter.output.writeTag(i, 2);
                int i3 = 0;
                for (int i4 = 0; i4 < list.size(); i4++) {
                    ((Integer) list.get(i4)).intValue();
                    Logger logger = CodedOutputStream.logger;
                    i3 += 4;
                }
                codedOutputStreamWriter.output.writeUInt32NoTag(i3);
                while (i2 < list.size()) {
                    codedOutputStreamWriter.output.writeFixed32NoTag(((Integer) list.get(i2)).intValue());
                    i2++;
                }
                return;
            }
            codedOutputStreamWriter.getClass();
            while (i2 < list.size()) {
                codedOutputStreamWriter.output.writeFixed32(i, ((Integer) list.get(i2)).intValue());
                i2++;
            }
        }
    }

    public static void writeFixed64List(int i, List list, CodedOutputStreamWriter codedOutputStreamWriter, boolean z) throws IOException {
        if (!(list == null || list.isEmpty())) {
            int i2 = 0;
            if (z) {
                codedOutputStreamWriter.output.writeTag(i, 2);
                int i3 = 0;
                for (int i4 = 0; i4 < list.size(); i4++) {
                    ((Long) list.get(i4)).longValue();
                    Logger logger = CodedOutputStream.logger;
                    i3 += 8;
                }
                codedOutputStreamWriter.output.writeUInt32NoTag(i3);
                while (i2 < list.size()) {
                    codedOutputStreamWriter.output.writeFixed64NoTag(((Long) list.get(i2)).longValue());
                    i2++;
                }
                return;
            }
            codedOutputStreamWriter.getClass();
            while (i2 < list.size()) {
                codedOutputStreamWriter.output.writeFixed64(i, ((Long) list.get(i2)).longValue());
                i2++;
            }
        }
    }

    public static void writeFloatList(int i, List list, CodedOutputStreamWriter codedOutputStreamWriter, boolean z) throws IOException {
        if (!(list == null || list.isEmpty())) {
            int i2 = 0;
            if (z) {
                codedOutputStreamWriter.output.writeTag(i, 2);
                int i3 = 0;
                for (int i4 = 0; i4 < list.size(); i4++) {
                    ((Float) list.get(i4)).floatValue();
                    Logger logger = CodedOutputStream.logger;
                    i3 += 4;
                }
                codedOutputStreamWriter.output.writeUInt32NoTag(i3);
                while (i2 < list.size()) {
                    CodedOutputStream codedOutputStream = codedOutputStreamWriter.output;
                    float floatValue = ((Float) list.get(i2)).floatValue();
                    codedOutputStream.getClass();
                    codedOutputStream.writeFixed32NoTag(Float.floatToRawIntBits(floatValue));
                    i2++;
                }
                return;
            }
            codedOutputStreamWriter.getClass();
            while (i2 < list.size()) {
                CodedOutputStream codedOutputStream2 = codedOutputStreamWriter.output;
                float floatValue2 = ((Float) list.get(i2)).floatValue();
                codedOutputStream2.getClass();
                codedOutputStream2.writeFixed32(i, Float.floatToRawIntBits(floatValue2));
                i2++;
            }
        }
    }

    public static void writeGroupList(int i, List list, CodedOutputStreamWriter codedOutputStreamWriter, Schema schema) throws IOException {
        if (!(list == null || list.isEmpty())) {
            codedOutputStreamWriter.getClass();
            for (int i2 = 0; i2 < list.size(); i2++) {
                codedOutputStreamWriter.writeGroup(i, list.get(i2), schema);
            }
        }
    }

    public static void writeInt32List(int i, List list, CodedOutputStreamWriter codedOutputStreamWriter, boolean z) throws IOException {
        if (!(list == null || list.isEmpty())) {
            int i2 = 0;
            if (z) {
                codedOutputStreamWriter.output.writeTag(i, 2);
                int i3 = 0;
                for (int i4 = 0; i4 < list.size(); i4++) {
                    i3 += CodedOutputStream.computeInt32SizeNoTag(((Integer) list.get(i4)).intValue());
                }
                codedOutputStreamWriter.output.writeUInt32NoTag(i3);
                while (i2 < list.size()) {
                    codedOutputStreamWriter.output.writeInt32NoTag(((Integer) list.get(i2)).intValue());
                    i2++;
                }
                return;
            }
            codedOutputStreamWriter.getClass();
            while (i2 < list.size()) {
                codedOutputStreamWriter.output.writeInt32(i, ((Integer) list.get(i2)).intValue());
                i2++;
            }
        }
    }

    public static void writeInt64List(int i, List list, CodedOutputStreamWriter codedOutputStreamWriter, boolean z) throws IOException {
        if (!(list == null || list.isEmpty())) {
            int i2 = 0;
            if (z) {
                codedOutputStreamWriter.output.writeTag(i, 2);
                int i3 = 0;
                for (int i4 = 0; i4 < list.size(); i4++) {
                    i3 += CodedOutputStream.computeUInt64SizeNoTag(((Long) list.get(i4)).longValue());
                }
                codedOutputStreamWriter.output.writeUInt32NoTag(i3);
                while (i2 < list.size()) {
                    codedOutputStreamWriter.output.writeUInt64NoTag(((Long) list.get(i2)).longValue());
                    i2++;
                }
                return;
            }
            codedOutputStreamWriter.getClass();
            while (i2 < list.size()) {
                codedOutputStreamWriter.output.writeUInt64(i, ((Long) list.get(i2)).longValue());
                i2++;
            }
        }
    }

    public static void writeMessageList(int i, List list, CodedOutputStreamWriter codedOutputStreamWriter, Schema schema) throws IOException {
        if (!(list == null || list.isEmpty())) {
            codedOutputStreamWriter.getClass();
            for (int i2 = 0; i2 < list.size(); i2++) {
                codedOutputStreamWriter.output.writeMessage(i, (MessageLite) list.get(i2), schema);
            }
        }
    }

    public static void writeSFixed32List(int i, List list, CodedOutputStreamWriter codedOutputStreamWriter, boolean z) throws IOException {
        if (!(list == null || list.isEmpty())) {
            int i2 = 0;
            if (z) {
                codedOutputStreamWriter.output.writeTag(i, 2);
                int i3 = 0;
                for (int i4 = 0; i4 < list.size(); i4++) {
                    ((Integer) list.get(i4)).intValue();
                    Logger logger = CodedOutputStream.logger;
                    i3 += 4;
                }
                codedOutputStreamWriter.output.writeUInt32NoTag(i3);
                while (i2 < list.size()) {
                    codedOutputStreamWriter.output.writeFixed32NoTag(((Integer) list.get(i2)).intValue());
                    i2++;
                }
                return;
            }
            codedOutputStreamWriter.getClass();
            while (i2 < list.size()) {
                codedOutputStreamWriter.output.writeFixed32(i, ((Integer) list.get(i2)).intValue());
                i2++;
            }
        }
    }

    public static void writeSFixed64List(int i, List list, CodedOutputStreamWriter codedOutputStreamWriter, boolean z) throws IOException {
        if (!(list == null || list.isEmpty())) {
            int i2 = 0;
            if (z) {
                codedOutputStreamWriter.output.writeTag(i, 2);
                int i3 = 0;
                for (int i4 = 0; i4 < list.size(); i4++) {
                    ((Long) list.get(i4)).longValue();
                    Logger logger = CodedOutputStream.logger;
                    i3 += 8;
                }
                codedOutputStreamWriter.output.writeUInt32NoTag(i3);
                while (i2 < list.size()) {
                    codedOutputStreamWriter.output.writeFixed64NoTag(((Long) list.get(i2)).longValue());
                    i2++;
                }
                return;
            }
            codedOutputStreamWriter.getClass();
            while (i2 < list.size()) {
                codedOutputStreamWriter.output.writeFixed64(i, ((Long) list.get(i2)).longValue());
                i2++;
            }
        }
    }

    public static void writeSInt32List(int i, List list, CodedOutputStreamWriter codedOutputStreamWriter, boolean z) throws IOException {
        if (!(list == null || list.isEmpty())) {
            int i2 = 0;
            if (z) {
                codedOutputStreamWriter.output.writeTag(i, 2);
                int i3 = 0;
                for (int i4 = 0; i4 < list.size(); i4++) {
                    int intValue = ((Integer) list.get(i4)).intValue();
                    i3 += CodedOutputStream.computeUInt32SizeNoTag((intValue >> 31) ^ (intValue << 1));
                }
                codedOutputStreamWriter.output.writeUInt32NoTag(i3);
                while (i2 < list.size()) {
                    CodedOutputStream codedOutputStream = codedOutputStreamWriter.output;
                    int intValue2 = ((Integer) list.get(i2)).intValue();
                    codedOutputStream.writeUInt32NoTag((intValue2 >> 31) ^ (intValue2 << 1));
                    i2++;
                }
                return;
            }
            codedOutputStreamWriter.getClass();
            while (i2 < list.size()) {
                CodedOutputStream codedOutputStream2 = codedOutputStreamWriter.output;
                int intValue3 = ((Integer) list.get(i2)).intValue();
                codedOutputStream2.writeUInt32(i, (intValue3 >> 31) ^ (intValue3 << 1));
                i2++;
            }
        }
    }

    public static void writeSInt64List(int i, List list, CodedOutputStreamWriter codedOutputStreamWriter, boolean z) throws IOException {
        if (!(list == null || list.isEmpty())) {
            int i2 = 0;
            if (z) {
                codedOutputStreamWriter.output.writeTag(i, 2);
                int i3 = 0;
                for (int i4 = 0; i4 < list.size(); i4++) {
                    long longValue = ((Long) list.get(i4)).longValue();
                    i3 += CodedOutputStream.computeUInt64SizeNoTag((longValue >> 63) ^ (longValue << 1));
                }
                codedOutputStreamWriter.output.writeUInt32NoTag(i3);
                while (i2 < list.size()) {
                    CodedOutputStream codedOutputStream = codedOutputStreamWriter.output;
                    long longValue2 = ((Long) list.get(i2)).longValue();
                    codedOutputStream.writeUInt64NoTag((longValue2 >> 63) ^ (longValue2 << 1));
                    i2++;
                }
                return;
            }
            codedOutputStreamWriter.getClass();
            while (i2 < list.size()) {
                CodedOutputStream codedOutputStream2 = codedOutputStreamWriter.output;
                long longValue3 = ((Long) list.get(i2)).longValue();
                codedOutputStream2.writeUInt64(i, (longValue3 >> 63) ^ (longValue3 << 1));
                i2++;
            }
        }
    }

    public static void writeStringList(int i, List list, CodedOutputStreamWriter codedOutputStreamWriter) throws IOException {
        if (list != null && !list.isEmpty()) {
            codedOutputStreamWriter.getClass();
            int i2 = 0;
            if (list instanceof LazyStringList) {
                LazyStringList lazyStringList = (LazyStringList) list;
                while (i2 < list.size()) {
                    Object raw = lazyStringList.getRaw(i2);
                    if (raw instanceof String) {
                        codedOutputStreamWriter.output.writeString(i, (String) raw);
                    } else {
                        codedOutputStreamWriter.output.writeBytes(i, (ByteString) raw);
                    }
                    i2++;
                }
                return;
            }
            while (i2 < list.size()) {
                codedOutputStreamWriter.output.writeString(i, (String) list.get(i2));
                i2++;
            }
        }
    }

    public static void writeUInt32List(int i, List list, CodedOutputStreamWriter codedOutputStreamWriter, boolean z) throws IOException {
        if (!(list == null || list.isEmpty())) {
            int i2 = 0;
            if (z) {
                codedOutputStreamWriter.output.writeTag(i, 2);
                int i3 = 0;
                for (int i4 = 0; i4 < list.size(); i4++) {
                    i3 += CodedOutputStream.computeUInt32SizeNoTag(((Integer) list.get(i4)).intValue());
                }
                codedOutputStreamWriter.output.writeUInt32NoTag(i3);
                while (i2 < list.size()) {
                    codedOutputStreamWriter.output.writeUInt32NoTag(((Integer) list.get(i2)).intValue());
                    i2++;
                }
                return;
            }
            codedOutputStreamWriter.getClass();
            while (i2 < list.size()) {
                codedOutputStreamWriter.output.writeUInt32(i, ((Integer) list.get(i2)).intValue());
                i2++;
            }
        }
    }

    public static void writeUInt64List(int i, List list, CodedOutputStreamWriter codedOutputStreamWriter, boolean z) throws IOException {
        if (!(list == null || list.isEmpty())) {
            int i2 = 0;
            if (z) {
                codedOutputStreamWriter.output.writeTag(i, 2);
                int i3 = 0;
                for (int i4 = 0; i4 < list.size(); i4++) {
                    i3 += CodedOutputStream.computeUInt64SizeNoTag(((Long) list.get(i4)).longValue());
                }
                codedOutputStreamWriter.output.writeUInt32NoTag(i3);
                while (i2 < list.size()) {
                    codedOutputStreamWriter.output.writeUInt64NoTag(((Long) list.get(i2)).longValue());
                    i2++;
                }
                return;
            }
            codedOutputStreamWriter.getClass();
            while (i2 < list.size()) {
                codedOutputStreamWriter.output.writeUInt64(i, ((Long) list.get(i2)).longValue());
                i2++;
            }
        }
    }

    public static int computeSizeByteStringList(int i, List<ByteString> list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        int computeTagSize = CodedOutputStream.computeTagSize(i) * size;
        for (int i2 = 0; i2 < list.size(); i2++) {
            int size2 = list.get(i2).size();
            computeTagSize += CodedOutputStream.computeUInt32SizeNoTag(size2) + size2;
        }
        return computeTagSize;
    }

    public static int computeSizeEnumList(int i, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return (CodedOutputStream.computeTagSize(i) * size) + computeSizeEnumListNoTag(list);
    }

    public static int computeSizeEnumListNoTag(List<Integer> list) {
        int i;
        int size = list.size();
        int i2 = 0;
        if (size == 0) {
            return 0;
        }
        if (list instanceof IntArrayList) {
            IntArrayList intArrayList = (IntArrayList) list;
            i = 0;
            while (i2 < size) {
                intArrayList.ensureIndexInRange(i2);
                i += CodedOutputStream.computeInt32SizeNoTag(intArrayList.array[i2]);
                i2++;
            }
        } else {
            i = 0;
            while (i2 < size) {
                i += CodedOutputStream.computeInt32SizeNoTag(list.get(i2).intValue());
                i2++;
            }
        }
        return i;
    }

    public static int computeSizeFixed32List(int i, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return CodedOutputStream.computeFixed32Size(i) * size;
    }

    public static int computeSizeFixed32ListNoTag(List<?> list) {
        return list.size() * 4;
    }

    public static int computeSizeFixed64List(int i, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return CodedOutputStream.computeFixed64Size(i) * size;
    }

    public static int computeSizeFixed64ListNoTag(List<?> list) {
        return list.size() * 8;
    }

    public static int computeSizeInt32List(int i, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return (CodedOutputStream.computeTagSize(i) * size) + computeSizeInt32ListNoTag(list);
    }

    public static int computeSizeInt32ListNoTag(List<Integer> list) {
        int i;
        int size = list.size();
        int i2 = 0;
        if (size == 0) {
            return 0;
        }
        if (list instanceof IntArrayList) {
            IntArrayList intArrayList = (IntArrayList) list;
            i = 0;
            while (i2 < size) {
                intArrayList.ensureIndexInRange(i2);
                i += CodedOutputStream.computeInt32SizeNoTag(intArrayList.array[i2]);
                i2++;
            }
        } else {
            i = 0;
            while (i2 < size) {
                i += CodedOutputStream.computeInt32SizeNoTag(list.get(i2).intValue());
                i2++;
            }
        }
        return i;
    }

    public static int computeSizeInt64List(int i, List list) {
        if (list.size() == 0) {
            return 0;
        }
        return (CodedOutputStream.computeTagSize(i) * list.size()) + computeSizeInt64ListNoTag(list);
    }

    public static int computeSizeInt64ListNoTag(List<Long> list) {
        int i;
        int size = list.size();
        int i2 = 0;
        if (size == 0) {
            return 0;
        }
        if (list instanceof LongArrayList) {
            LongArrayList longArrayList = (LongArrayList) list;
            i = 0;
            while (i2 < size) {
                longArrayList.ensureIndexInRange(i2);
                i += CodedOutputStream.computeUInt64SizeNoTag(longArrayList.array[i2]);
                i2++;
            }
        } else {
            i = 0;
            while (i2 < size) {
                i += CodedOutputStream.computeUInt64SizeNoTag(list.get(i2).longValue());
                i2++;
            }
        }
        return i;
    }

    public static int computeSizeMessageList(int i, List<?> list, Schema schema) {
        int i2;
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        int computeTagSize = CodedOutputStream.computeTagSize(i) * size;
        for (int i3 = 0; i3 < size; i3++) {
            Object obj = list.get(i3);
            if (obj instanceof LazyFieldLite) {
                i2 = CodedOutputStream.computeLazyFieldSizeNoTag((LazyFieldLite) obj);
            } else {
                AbstractMessageLite abstractMessageLite = (AbstractMessageLite) ((MessageLite) obj);
                int memoizedSerializedSize = abstractMessageLite.getMemoizedSerializedSize();
                if (memoizedSerializedSize == -1) {
                    memoizedSerializedSize = schema.getSerializedSize(abstractMessageLite);
                    abstractMessageLite.setMemoizedSerializedSize(memoizedSerializedSize);
                }
                i2 = CodedOutputStream.computeUInt32SizeNoTag(memoizedSerializedSize) + memoizedSerializedSize;
            }
            computeTagSize += i2;
        }
        return computeTagSize;
    }

    public static int computeSizeSInt32List(int i, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return (CodedOutputStream.computeTagSize(i) * size) + computeSizeSInt32ListNoTag(list);
    }

    public static int computeSizeSInt32ListNoTag(List<Integer> list) {
        int i;
        int size = list.size();
        int i2 = 0;
        if (size == 0) {
            return 0;
        }
        if (list instanceof IntArrayList) {
            IntArrayList intArrayList = (IntArrayList) list;
            i = 0;
            while (i2 < size) {
                intArrayList.ensureIndexInRange(i2);
                int i3 = intArrayList.array[i2];
                i += CodedOutputStream.computeUInt32SizeNoTag((i3 >> 31) ^ (i3 << 1));
                i2++;
            }
        } else {
            i = 0;
            while (i2 < size) {
                int intValue = list.get(i2).intValue();
                i += CodedOutputStream.computeUInt32SizeNoTag((intValue >> 31) ^ (intValue << 1));
                i2++;
            }
        }
        return i;
    }

    public static int computeSizeSInt64List(int i, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return (CodedOutputStream.computeTagSize(i) * size) + computeSizeSInt64ListNoTag(list);
    }

    public static int computeSizeSInt64ListNoTag(List<Long> list) {
        int i;
        int size = list.size();
        int i2 = 0;
        if (size == 0) {
            return 0;
        }
        if (list instanceof LongArrayList) {
            LongArrayList longArrayList = (LongArrayList) list;
            i = 0;
            while (i2 < size) {
                longArrayList.ensureIndexInRange(i2);
                long j = longArrayList.array[i2];
                i += CodedOutputStream.computeUInt64SizeNoTag((j >> 63) ^ (j << 1));
                i2++;
            }
        } else {
            i = 0;
            while (i2 < size) {
                long longValue = list.get(i2).longValue();
                i += CodedOutputStream.computeUInt64SizeNoTag((longValue >> 63) ^ (longValue << 1));
                i2++;
            }
        }
        return i;
    }

    public static int computeSizeStringList(int i, List<?> list) {
        int i2;
        int i3;
        int size = list.size();
        int i4 = 0;
        if (size == 0) {
            return 0;
        }
        int computeTagSize = CodedOutputStream.computeTagSize(i) * size;
        if (list instanceof LazyStringList) {
            LazyStringList lazyStringList = (LazyStringList) list;
            while (i4 < size) {
                Object raw = lazyStringList.getRaw(i4);
                if (raw instanceof ByteString) {
                    int size2 = ((ByteString) raw).size();
                    i3 = CodedOutputStream.computeUInt32SizeNoTag(size2) + size2;
                } else {
                    i3 = CodedOutputStream.computeStringSizeNoTag((String) raw);
                }
                computeTagSize += i3;
                i4++;
            }
        } else {
            while (i4 < size) {
                Object obj = list.get(i4);
                if (obj instanceof ByteString) {
                    int size3 = ((ByteString) obj).size();
                    i2 = CodedOutputStream.computeUInt32SizeNoTag(size3) + size3;
                } else {
                    i2 = CodedOutputStream.computeStringSizeNoTag((String) obj);
                }
                computeTagSize += i2;
                i4++;
            }
        }
        return computeTagSize;
    }

    public static int computeSizeUInt32List(int i, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return (CodedOutputStream.computeTagSize(i) * size) + computeSizeUInt32ListNoTag(list);
    }

    public static int computeSizeUInt32ListNoTag(List<Integer> list) {
        int i;
        int size = list.size();
        int i2 = 0;
        if (size == 0) {
            return 0;
        }
        if (list instanceof IntArrayList) {
            IntArrayList intArrayList = (IntArrayList) list;
            i = 0;
            while (i2 < size) {
                intArrayList.ensureIndexInRange(i2);
                i += CodedOutputStream.computeUInt32SizeNoTag(intArrayList.array[i2]);
                i2++;
            }
        } else {
            i = 0;
            while (i2 < size) {
                i += CodedOutputStream.computeUInt32SizeNoTag(list.get(i2).intValue());
                i2++;
            }
        }
        return i;
    }

    public static int computeSizeUInt64List(int i, List list) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return (CodedOutputStream.computeTagSize(i) * size) + computeSizeUInt64ListNoTag(list);
    }

    public static int computeSizeUInt64ListNoTag(List<Long> list) {
        int i;
        int size = list.size();
        int i2 = 0;
        if (size == 0) {
            return 0;
        }
        if (list instanceof LongArrayList) {
            LongArrayList longArrayList = (LongArrayList) list;
            i = 0;
            while (i2 < size) {
                longArrayList.ensureIndexInRange(i2);
                i += CodedOutputStream.computeUInt64SizeNoTag(longArrayList.array[i2]);
                i2++;
            }
        } else {
            i = 0;
            while (i2 < size) {
                i += CodedOutputStream.computeUInt64SizeNoTag(list.get(i2).longValue());
                i2++;
            }
        }
        return i;
    }

    public static <T, FT extends FieldSet.FieldDescriptorLite<FT>> void mergeExtensions(ExtensionSchema<FT> extensionSchema, T t, T t2) {
        FieldSet<FT> extensions = extensionSchema.getExtensions(t2);
        if (!extensions.fields.isEmpty()) {
            FieldSet<FT> mutableExtensions = extensionSchema.getMutableExtensions(t);
            mutableExtensions.getClass();
            for (int i = 0; i < extensions.fields.getNumArrayEntries(); i++) {
                mutableExtensions.mergeFromField(extensions.fields.getArrayEntryAt(i));
            }
            for (Map.Entry<Object, Object> entry : extensions.fields.getOverflowEntries()) {
                mutableExtensions.mergeFromField(entry);
            }
        }
    }
}
