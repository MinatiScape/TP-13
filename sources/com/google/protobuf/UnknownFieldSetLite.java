package com.google.protobuf;

import java.io.IOException;
import java.util.Arrays;
/* loaded from: classes.dex */
public final class UnknownFieldSetLite {
    public static final UnknownFieldSetLite DEFAULT_INSTANCE = new UnknownFieldSetLite(0, new int[0], new Object[0], false);
    public int count;
    public boolean isMutable;
    public int memoizedSerializedSize;
    public Object[] objects;
    public int[] tags;

    public UnknownFieldSetLite() {
        this(0, new int[8], new Object[8], true);
    }

    public final boolean equals(Object obj) {
        boolean z;
        boolean z2;
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof UnknownFieldSetLite)) {
            return false;
        }
        UnknownFieldSetLite unknownFieldSetLite = (UnknownFieldSetLite) obj;
        int i = this.count;
        if (i == unknownFieldSetLite.count) {
            int[] iArr = this.tags;
            int[] iArr2 = unknownFieldSetLite.tags;
            int i2 = 0;
            while (true) {
                if (i2 >= i) {
                    z = true;
                    break;
                } else if (iArr[i2] != iArr2[i2]) {
                    z = false;
                    break;
                } else {
                    i2++;
                }
            }
            if (z) {
                Object[] objArr = this.objects;
                Object[] objArr2 = unknownFieldSetLite.objects;
                int i3 = this.count;
                int i4 = 0;
                while (true) {
                    if (i4 >= i3) {
                        z2 = true;
                        break;
                    } else if (!objArr[i4].equals(objArr2[i4])) {
                        z2 = false;
                        break;
                    } else {
                        i4++;
                    }
                }
                if (z2) {
                    return true;
                }
            }
        }
        return false;
    }

    public UnknownFieldSetLite(int i, int[] iArr, Object[] objArr, boolean z) {
        this.memoizedSerializedSize = -1;
        this.count = i;
        this.tags = iArr;
        this.objects = objArr;
        this.isMutable = z;
    }

    public final int getSerializedSize() {
        int i;
        int i2 = this.memoizedSerializedSize;
        if (i2 != -1) {
            return i2;
        }
        int i3 = 0;
        for (int i4 = 0; i4 < this.count; i4++) {
            int i5 = this.tags[i4];
            int i6 = i5 >>> 3;
            int i7 = i5 & 7;
            if (i7 == 0) {
                i = CodedOutputStream.computeTagSize(i6) + CodedOutputStream.computeUInt64SizeNoTag(((Long) this.objects[i4]).longValue());
            } else if (i7 == 1) {
                ((Long) this.objects[i4]).longValue();
                i = CodedOutputStream.computeFixed64Size(i6);
            } else if (i7 == 2) {
                i = CodedOutputStream.computeBytesSize(i6, (ByteString) this.objects[i4]);
            } else if (i7 == 3) {
                i3 = ((UnknownFieldSetLite) this.objects[i4]).getSerializedSize() + (CodedOutputStream.computeTagSize(i6) * 2) + i3;
            } else if (i7 == 5) {
                ((Integer) this.objects[i4]).intValue();
                i = CodedOutputStream.computeFixed32Size(i6);
            } else {
                throw new IllegalStateException(InvalidProtocolBufferException.invalidWireType());
            }
            i3 = i + i3;
        }
        this.memoizedSerializedSize = i3;
        return i3;
    }

    public final int hashCode() {
        int i = this.count;
        int i2 = (527 + i) * 31;
        int[] iArr = this.tags;
        int i3 = 17;
        int i4 = 17;
        for (int i5 = 0; i5 < i; i5++) {
            i4 = (i4 * 31) + iArr[i5];
        }
        int i6 = (i2 + i4) * 31;
        Object[] objArr = this.objects;
        int i7 = this.count;
        for (int i8 = 0; i8 < i7; i8++) {
            i3 = (i3 * 31) + objArr[i8].hashCode();
        }
        return i6 + i3;
    }

    public final void storeField(int i, Object obj) {
        int i2;
        if (this.isMutable) {
            int i3 = this.count;
            int[] iArr = this.tags;
            if (i3 == iArr.length) {
                if (i3 < 4) {
                    i2 = 8;
                } else {
                    i2 = i3 >> 1;
                }
                int i4 = i3 + i2;
                this.tags = Arrays.copyOf(iArr, i4);
                this.objects = Arrays.copyOf(this.objects, i4);
            }
            int[] iArr2 = this.tags;
            int i5 = this.count;
            iArr2[i5] = i;
            this.objects[i5] = obj;
            this.count = i5 + 1;
            return;
        }
        throw new UnsupportedOperationException();
    }

    public final void writeTo(CodedOutputStreamWriter codedOutputStreamWriter) throws IOException {
        if (this.count != 0) {
            codedOutputStreamWriter.getClass();
            for (int i = 0; i < this.count; i++) {
                int i2 = this.tags[i];
                Object obj = this.objects[i];
                int i3 = i2 >>> 3;
                int i4 = i2 & 7;
                if (i4 == 0) {
                    codedOutputStreamWriter.output.writeUInt64(i3, ((Long) obj).longValue());
                } else if (i4 == 1) {
                    codedOutputStreamWriter.output.writeFixed64(i3, ((Long) obj).longValue());
                } else if (i4 == 2) {
                    codedOutputStreamWriter.writeBytes(i3, (ByteString) obj);
                } else if (i4 == 3) {
                    codedOutputStreamWriter.output.writeTag(i3, 3);
                    ((UnknownFieldSetLite) obj).writeTo(codedOutputStreamWriter);
                    codedOutputStreamWriter.output.writeTag(i3, 4);
                } else if (i4 == 5) {
                    codedOutputStreamWriter.output.writeFixed32(i3, ((Integer) obj).intValue());
                } else {
                    throw new RuntimeException(InvalidProtocolBufferException.invalidWireType());
                }
            }
        }
    }
}
