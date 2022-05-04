package com.google.protobuf;

import androidx.appcompat.view.SupportMenuInflater$$ExternalSyntheticOutline0;
import com.google.protobuf.Utf8;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
/* loaded from: classes.dex */
public abstract class CodedOutputStream extends ByteOutput {
    public CodedOutputStreamWriter wrapper;
    public static final Logger logger = Logger.getLogger(CodedOutputStream.class.getName());
    public static final boolean HAS_UNSAFE_ARRAY_OPERATIONS = UnsafeUtil.HAS_UNSAFE_ARRAY_OPERATIONS;

    /* loaded from: classes.dex */
    public static class ArrayEncoder extends CodedOutputStream {
        public final byte[] buffer;
        public final int limit;
        public int position;

        public ArrayEncoder(byte[] bArr, int i) {
            super(0);
            int i2 = 0 + i;
            if ((0 | i | (bArr.length - i2)) >= 0) {
                this.buffer = bArr;
                this.position = 0;
                this.limit = i2;
                return;
            }
            throw new IllegalArgumentException(String.format("Array range is invalid. Buffer.length=%d, offset=%d, length=%d", Integer.valueOf(bArr.length), 0, Integer.valueOf(i)));
        }

        @Override // com.google.protobuf.CodedOutputStream
        public final void write(byte b) throws IOException {
            try {
                byte[] bArr = this.buffer;
                int i = this.position;
                this.position = i + 1;
                bArr[i] = b;
            } catch (IndexOutOfBoundsException e) {
                throw new OutOfSpaceException(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.position), Integer.valueOf(this.limit), 1), e);
            }
        }

        @Override // com.google.protobuf.CodedOutputStream
        public final void writeBool(int i, boolean z) throws IOException {
            writeTag(i, 0);
            write(z ? (byte) 1 : (byte) 0);
        }

        @Override // com.google.protobuf.CodedOutputStream
        public final void writeBytes(int i, ByteString byteString) throws IOException {
            writeTag(i, 2);
            writeBytesNoTag(byteString);
        }

        @Override // com.google.protobuf.CodedOutputStream
        public final void writeFixed32(int i, int i2) throws IOException {
            writeTag(i, 5);
            writeFixed32NoTag(i2);
        }

        @Override // com.google.protobuf.CodedOutputStream
        public final void writeFixed64(int i, long j) throws IOException {
            writeTag(i, 1);
            writeFixed64NoTag(j);
        }

        @Override // com.google.protobuf.CodedOutputStream
        public final void writeInt32(int i, int i2) throws IOException {
            writeTag(i, 0);
            writeInt32NoTag(i2);
        }

        @Override // com.google.protobuf.CodedOutputStream
        public final void writeMessage(int i, MessageLite messageLite, Schema schema) throws IOException {
            writeTag(i, 2);
            AbstractMessageLite abstractMessageLite = (AbstractMessageLite) messageLite;
            int memoizedSerializedSize = abstractMessageLite.getMemoizedSerializedSize();
            if (memoizedSerializedSize == -1) {
                memoizedSerializedSize = schema.getSerializedSize(abstractMessageLite);
                abstractMessageLite.setMemoizedSerializedSize(memoizedSerializedSize);
            }
            writeUInt32NoTag(memoizedSerializedSize);
            schema.writeTo(messageLite, this.wrapper);
        }

        @Override // com.google.protobuf.CodedOutputStream
        public final void writeMessageSetExtension(int i, MessageLite messageLite) throws IOException {
            writeTag(1, 3);
            writeUInt32(2, i);
            writeTag(3, 2);
            writeMessageNoTag(messageLite);
            writeTag(1, 4);
        }

        @Override // com.google.protobuf.CodedOutputStream
        public final void writeRawMessageSetExtension(int i, ByteString byteString) throws IOException {
            writeTag(1, 3);
            writeUInt32(2, i);
            writeBytes(3, byteString);
            writeTag(1, 4);
        }

        @Override // com.google.protobuf.CodedOutputStream
        public final void writeString(int i, String str) throws IOException {
            writeTag(i, 2);
            writeStringNoTag(str);
        }

        @Override // com.google.protobuf.CodedOutputStream
        public final void writeUInt32(int i, int i2) throws IOException {
            writeTag(i, 0);
            writeUInt32NoTag(i2);
        }

        @Override // com.google.protobuf.CodedOutputStream
        public final void writeUInt64(int i, long j) throws IOException {
            writeTag(i, 0);
            writeUInt64NoTag(j);
        }

        public final int spaceLeft() {
            return this.limit - this.position;
        }

        @Override // com.google.protobuf.CodedOutputStream
        public final void writeFixed32NoTag(int i) throws IOException {
            try {
                byte[] bArr = this.buffer;
                int i2 = this.position;
                int i3 = i2 + 1;
                bArr[i2] = (byte) (i & 255);
                int i4 = i3 + 1;
                bArr[i3] = (byte) ((i >> 8) & 255);
                int i5 = i4 + 1;
                bArr[i4] = (byte) ((i >> 16) & 255);
                this.position = i5 + 1;
                bArr[i5] = (byte) ((i >> 24) & 255);
            } catch (IndexOutOfBoundsException e) {
                throw new OutOfSpaceException(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.position), Integer.valueOf(this.limit), 1), e);
            }
        }

        @Override // com.google.protobuf.CodedOutputStream
        public final void writeFixed64NoTag(long j) throws IOException {
            try {
                byte[] bArr = this.buffer;
                int i = this.position;
                int i2 = i + 1;
                bArr[i] = (byte) (((int) j) & 255);
                int i3 = i2 + 1;
                bArr[i2] = (byte) (((int) (j >> 8)) & 255);
                int i4 = i3 + 1;
                bArr[i3] = (byte) (((int) (j >> 16)) & 255);
                int i5 = i4 + 1;
                bArr[i4] = (byte) (((int) (j >> 24)) & 255);
                int i6 = i5 + 1;
                bArr[i5] = (byte) (((int) (j >> 32)) & 255);
                int i7 = i6 + 1;
                bArr[i6] = (byte) (((int) (j >> 40)) & 255);
                int i8 = i7 + 1;
                bArr[i7] = (byte) (((int) (j >> 48)) & 255);
                this.position = i8 + 1;
                bArr[i8] = (byte) (((int) (j >> 56)) & 255);
            } catch (IndexOutOfBoundsException e) {
                throw new OutOfSpaceException(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.position), Integer.valueOf(this.limit), 1), e);
            }
        }

        @Override // com.google.protobuf.CodedOutputStream
        public final void writeInt32NoTag(int i) throws IOException {
            if (i >= 0) {
                writeUInt32NoTag(i);
            } else {
                writeUInt64NoTag(i);
            }
        }

        public final void writeStringNoTag(String str) throws IOException {
            int i = this.position;
            try {
                int computeUInt32SizeNoTag = CodedOutputStream.computeUInt32SizeNoTag(str.length() * 3);
                int computeUInt32SizeNoTag2 = CodedOutputStream.computeUInt32SizeNoTag(str.length());
                if (computeUInt32SizeNoTag2 == computeUInt32SizeNoTag) {
                    int i2 = i + computeUInt32SizeNoTag2;
                    this.position = i2;
                    int encodeUtf8 = Utf8.processor.encodeUtf8(str, this.buffer, i2, this.limit - i2);
                    this.position = i;
                    writeUInt32NoTag((encodeUtf8 - i) - computeUInt32SizeNoTag2);
                    this.position = encodeUtf8;
                } else {
                    writeUInt32NoTag(Utf8.encodedLength(str));
                    byte[] bArr = this.buffer;
                    int i3 = this.position;
                    this.position = Utf8.processor.encodeUtf8(str, bArr, i3, this.limit - i3);
                }
            } catch (Utf8.UnpairedSurrogateException e) {
                this.position = i;
                CodedOutputStream.logger.log(Level.WARNING, "Converting ill-formed UTF-16. Your Protocol Buffer will not round trip correctly!", (Throwable) e);
                byte[] bytes = str.getBytes(Internal.UTF_8);
                try {
                    writeUInt32NoTag(bytes.length);
                    write(bytes, 0, bytes.length);
                } catch (OutOfSpaceException e2) {
                    throw e2;
                } catch (IndexOutOfBoundsException e3) {
                    throw new OutOfSpaceException(e3);
                }
            } catch (IndexOutOfBoundsException e4) {
                throw new OutOfSpaceException(e4);
            }
        }

        @Override // com.google.protobuf.CodedOutputStream
        public final void writeTag(int i, int i2) throws IOException {
            writeUInt32NoTag((i << 3) | i2);
        }

        @Override // com.google.protobuf.CodedOutputStream
        public final void writeUInt32NoTag(int i) throws IOException {
            boolean z;
            if (CodedOutputStream.HAS_UNSAFE_ARRAY_OPERATIONS) {
                if (Android.MEMORY_CLASS == null || Android.IS_ROBOLECTRIC) {
                    z = false;
                } else {
                    z = true;
                }
                if (!z) {
                    int i2 = this.limit;
                    int i3 = this.position;
                    if (i2 - i3 >= 5) {
                        if ((i & (-128)) == 0) {
                            byte[] bArr = this.buffer;
                            this.position = i3 + 1;
                            UnsafeUtil.putByte(bArr, i3, (byte) i);
                            return;
                        }
                        byte[] bArr2 = this.buffer;
                        this.position = i3 + 1;
                        UnsafeUtil.putByte(bArr2, i3, (byte) (i | 128));
                        int i4 = i >>> 7;
                        if ((i4 & (-128)) == 0) {
                            byte[] bArr3 = this.buffer;
                            int i5 = this.position;
                            this.position = i5 + 1;
                            UnsafeUtil.putByte(bArr3, i5, (byte) i4);
                            return;
                        }
                        byte[] bArr4 = this.buffer;
                        int i6 = this.position;
                        this.position = i6 + 1;
                        UnsafeUtil.putByte(bArr4, i6, (byte) (i4 | 128));
                        int i7 = i4 >>> 7;
                        if ((i7 & (-128)) == 0) {
                            byte[] bArr5 = this.buffer;
                            int i8 = this.position;
                            this.position = i8 + 1;
                            UnsafeUtil.putByte(bArr5, i8, (byte) i7);
                            return;
                        }
                        byte[] bArr6 = this.buffer;
                        int i9 = this.position;
                        this.position = i9 + 1;
                        UnsafeUtil.putByte(bArr6, i9, (byte) (i7 | 128));
                        int i10 = i7 >>> 7;
                        if ((i10 & (-128)) == 0) {
                            byte[] bArr7 = this.buffer;
                            int i11 = this.position;
                            this.position = i11 + 1;
                            UnsafeUtil.putByte(bArr7, i11, (byte) i10);
                            return;
                        }
                        byte[] bArr8 = this.buffer;
                        int i12 = this.position;
                        this.position = i12 + 1;
                        UnsafeUtil.putByte(bArr8, i12, (byte) (i10 | 128));
                        byte[] bArr9 = this.buffer;
                        int i13 = this.position;
                        this.position = i13 + 1;
                        UnsafeUtil.putByte(bArr9, i13, (byte) (i10 >>> 7));
                        return;
                    }
                }
            }
            while ((i & (-128)) != 0) {
                try {
                    byte[] bArr10 = this.buffer;
                    int i14 = this.position;
                    this.position = i14 + 1;
                    bArr10[i14] = (byte) ((i & 127) | 128);
                    i >>>= 7;
                } catch (IndexOutOfBoundsException e) {
                    throw new OutOfSpaceException(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.position), Integer.valueOf(this.limit), 1), e);
                }
            }
            byte[] bArr11 = this.buffer;
            int i15 = this.position;
            this.position = i15 + 1;
            bArr11[i15] = (byte) i;
        }

        @Override // com.google.protobuf.CodedOutputStream
        public final void writeUInt64NoTag(long j) throws IOException {
            if (!CodedOutputStream.HAS_UNSAFE_ARRAY_OPERATIONS || this.limit - this.position < 10) {
                while ((j & (-128)) != 0) {
                    try {
                        byte[] bArr = this.buffer;
                        int i = this.position;
                        this.position = i + 1;
                        bArr[i] = (byte) ((((int) j) & 127) | 128);
                        j >>>= 7;
                    } catch (IndexOutOfBoundsException e) {
                        throw new OutOfSpaceException(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.position), Integer.valueOf(this.limit), 1), e);
                    }
                }
                byte[] bArr2 = this.buffer;
                int i2 = this.position;
                this.position = i2 + 1;
                bArr2[i2] = (byte) j;
                return;
            }
            while ((j & (-128)) != 0) {
                byte[] bArr3 = this.buffer;
                int i3 = this.position;
                this.position = i3 + 1;
                UnsafeUtil.putByte(bArr3, i3, (byte) ((((int) j) & 127) | 128));
                j >>>= 7;
            }
            byte[] bArr4 = this.buffer;
            int i4 = this.position;
            this.position = i4 + 1;
            UnsafeUtil.putByte(bArr4, i4, (byte) j);
        }

        public final void writeBytesNoTag(ByteString byteString) throws IOException {
            writeUInt32NoTag(byteString.size());
            byteString.writeTo(this);
        }

        public final void writeMessageNoTag(MessageLite messageLite) throws IOException {
            writeUInt32NoTag(messageLite.getSerializedSize());
            messageLite.writeTo(this);
        }

        public final void write(byte[] bArr, int i, int i2) throws IOException {
            try {
                System.arraycopy(bArr, i, this.buffer, this.position, i2);
                this.position += i2;
            } catch (IndexOutOfBoundsException e) {
                throw new OutOfSpaceException(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.position), Integer.valueOf(this.limit), Integer.valueOf(i2)), e);
            }
        }

        @Override // com.google.protobuf.ByteOutput
        public final void writeLazy(byte[] bArr, int i, int i2) throws IOException {
            write(bArr, i, i2);
        }
    }

    public CodedOutputStream() {
        throw null;
    }

    public static int computeUInt32SizeNoTag(int i) {
        if ((i & (-128)) == 0) {
            return 1;
        }
        if ((i & (-16384)) == 0) {
            return 2;
        }
        if (((-2097152) & i) == 0) {
            return 3;
        }
        return (i & (-268435456)) == 0 ? 4 : 5;
    }

    public static int computeUInt64SizeNoTag(long j) {
        int i;
        if (((-128) & j) == 0) {
            return 1;
        }
        if (j < 0) {
            return 10;
        }
        if (((-34359738368L) & j) != 0) {
            i = 6;
            j >>>= 28;
        } else {
            i = 2;
        }
        if (((-2097152) & j) != 0) {
            i += 2;
            j >>>= 14;
        }
        return (j & (-16384)) != 0 ? i + 1 : i;
    }

    public abstract void write(byte b) throws IOException;

    public abstract void writeBool(int i, boolean z) throws IOException;

    public abstract void writeBytes(int i, ByteString byteString) throws IOException;

    public abstract void writeFixed32(int i, int i2) throws IOException;

    public abstract void writeFixed32NoTag(int i) throws IOException;

    public abstract void writeFixed64(int i, long j) throws IOException;

    public abstract void writeFixed64NoTag(long j) throws IOException;

    public abstract void writeInt32(int i, int i2) throws IOException;

    public abstract void writeInt32NoTag(int i) throws IOException;

    public abstract void writeMessage(int i, MessageLite messageLite, Schema schema) throws IOException;

    public abstract void writeMessageSetExtension(int i, MessageLite messageLite) throws IOException;

    public abstract void writeRawMessageSetExtension(int i, ByteString byteString) throws IOException;

    public abstract void writeString(int i, String str) throws IOException;

    public abstract void writeTag(int i, int i2) throws IOException;

    public abstract void writeUInt32(int i, int i2) throws IOException;

    public abstract void writeUInt32NoTag(int i) throws IOException;

    public abstract void writeUInt64(int i, long j) throws IOException;

    public abstract void writeUInt64NoTag(long j) throws IOException;

    public static int computeInt32SizeNoTag(int i) {
        if (i >= 0) {
            return computeUInt32SizeNoTag(i);
        }
        return 10;
    }

    public static int computeLazyFieldSizeNoTag(LazyFieldLite lazyFieldLite) {
        int i;
        if (lazyFieldLite.memoizedBytes != null) {
            i = lazyFieldLite.memoizedBytes.size();
        } else if (lazyFieldLite.value != null) {
            i = lazyFieldLite.value.getSerializedSize();
        } else {
            i = 0;
        }
        return computeUInt32SizeNoTag(i) + i;
    }

    public static int computeTagSize(int i) {
        return computeUInt32SizeNoTag((i << 3) | 0);
    }

    public static int computeBytesSize(int i, ByteString byteString) {
        int computeTagSize = computeTagSize(i);
        int size = byteString.size();
        return computeUInt32SizeNoTag(size) + size + computeTagSize;
    }

    public static int computeFixed32Size(int i) {
        return computeTagSize(i) + 4;
    }

    public static int computeFixed64Size(int i) {
        return computeTagSize(i) + 8;
    }

    @Deprecated
    public static int computeGroupSize(int i, MessageLite messageLite, Schema schema) {
        int computeTagSize = computeTagSize(i) * 2;
        AbstractMessageLite abstractMessageLite = (AbstractMessageLite) messageLite;
        int memoizedSerializedSize = abstractMessageLite.getMemoizedSerializedSize();
        if (memoizedSerializedSize == -1) {
            memoizedSerializedSize = schema.getSerializedSize(abstractMessageLite);
            abstractMessageLite.setMemoizedSerializedSize(memoizedSerializedSize);
        }
        return memoizedSerializedSize + computeTagSize;
    }

    public static int computeStringSizeNoTag(String str) {
        int i;
        try {
            i = Utf8.encodedLength(str);
        } catch (Utf8.UnpairedSurrogateException unused) {
            i = str.getBytes(Internal.UTF_8).length;
        }
        return computeUInt32SizeNoTag(i) + i;
    }

    public static int computeUInt32Size(int i, int i2) {
        return computeUInt32SizeNoTag(i2) + computeTagSize(i);
    }

    /* loaded from: classes.dex */
    public static class OutOfSpaceException extends IOException {
        private static final long serialVersionUID = -6947486886997889499L;

        public OutOfSpaceException(String str) {
            super(SupportMenuInflater$$ExternalSyntheticOutline0.m("CodedOutputStream was writing to a flat byte array and ran out of space.: ", str));
        }

        public OutOfSpaceException(String str, IndexOutOfBoundsException indexOutOfBoundsException) {
            super(SupportMenuInflater$$ExternalSyntheticOutline0.m("CodedOutputStream was writing to a flat byte array and ran out of space.: ", str), indexOutOfBoundsException);
        }

        public OutOfSpaceException() {
            super("CodedOutputStream was writing to a flat byte array and ran out of space.");
        }

        public OutOfSpaceException(IndexOutOfBoundsException indexOutOfBoundsException) {
            super("CodedOutputStream was writing to a flat byte array and ran out of space.", indexOutOfBoundsException);
        }
    }

    public CodedOutputStream(int i) {
    }
}
