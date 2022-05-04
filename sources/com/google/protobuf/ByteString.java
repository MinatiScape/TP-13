package com.google.protobuf;

import java.io.IOException;
import java.io.Serializable;
import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.Iterator;
import java.util.NoSuchElementException;
/* loaded from: classes.dex */
public abstract class ByteString implements Iterable<Byte>, Serializable {
    public static final ByteString EMPTY = new LiteralByteString(Internal.EMPTY_BYTE_ARRAY);
    public static final ByteArrayCopier byteArrayCopier;
    private int hash = 0;

    /* renamed from: com.google.protobuf.ByteString$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public final class AnonymousClass1 extends AbstractByteIterator {
        public final int limit;
        public int position = 0;

        public AnonymousClass1() {
            this.limit = ByteString.this.size();
        }

        @Override // java.util.Iterator
        public final boolean hasNext() {
            if (this.position < this.limit) {
                return true;
            }
            return false;
        }
    }

    /* loaded from: classes.dex */
    public static abstract class AbstractByteIterator implements Iterator {
        @Override // java.util.Iterator
        public final Object next() {
            AnonymousClass1 r2 = (AnonymousClass1) this;
            int i = r2.position;
            if (i < r2.limit) {
                r2.position = i + 1;
                return Byte.valueOf(ByteString.this.internalByteAt(i));
            }
            throw new NoSuchElementException();
        }

        @Override // java.util.Iterator
        public final void remove() {
            throw new UnsupportedOperationException();
        }
    }

    /* loaded from: classes.dex */
    public static final class ArraysByteArrayCopier implements ByteArrayCopier {
        @Override // com.google.protobuf.ByteString.ByteArrayCopier
        public final byte[] copyFrom(byte[] bArr, int i, int i2) {
            return Arrays.copyOfRange(bArr, i, i2 + i);
        }
    }

    /* loaded from: classes.dex */
    public interface ByteArrayCopier {
        byte[] copyFrom(byte[] bArr, int i, int i2);
    }

    /* loaded from: classes.dex */
    public static abstract class LeafByteString extends ByteString {
    }

    /* loaded from: classes.dex */
    public static class LiteralByteString extends LeafByteString {
        private static final long serialVersionUID = 1;
        public final byte[] bytes;

        @Override // com.google.protobuf.ByteString
        public final boolean equals(Object obj) {
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof ByteString) || size() != ((ByteString) obj).size()) {
                return false;
            }
            if (size() == 0) {
                return true;
            }
            if (!(obj instanceof LiteralByteString)) {
                return obj.equals(this);
            }
            LiteralByteString literalByteString = (LiteralByteString) obj;
            int peekCachedHashCode = peekCachedHashCode();
            int peekCachedHashCode2 = literalByteString.peekCachedHashCode();
            if (peekCachedHashCode != 0 && peekCachedHashCode2 != 0 && peekCachedHashCode != peekCachedHashCode2) {
                return false;
            }
            int size = size();
            if (size > literalByteString.size()) {
                throw new IllegalArgumentException("Length too large: " + size + size());
            } else if (0 + size <= literalByteString.size()) {
                byte[] bArr = this.bytes;
                byte[] bArr2 = literalByteString.bytes;
                int offsetIntoBytes = getOffsetIntoBytes() + size;
                int offsetIntoBytes2 = getOffsetIntoBytes();
                int offsetIntoBytes3 = literalByteString.getOffsetIntoBytes() + 0;
                while (offsetIntoBytes2 < offsetIntoBytes) {
                    if (bArr[offsetIntoBytes2] != bArr2[offsetIntoBytes3]) {
                        return false;
                    }
                    offsetIntoBytes2++;
                    offsetIntoBytes3++;
                }
                return true;
            } else {
                throw new IllegalArgumentException("Ran off end of other: 0, " + size + ", " + literalByteString.size());
            }
        }

        public int getOffsetIntoBytes() {
            return 0;
        }

        @Override // com.google.protobuf.ByteString
        public byte byteAt(int i) {
            return this.bytes[i];
        }

        @Override // com.google.protobuf.ByteString
        public byte internalByteAt(int i) {
            return this.bytes[i];
        }

        @Override // com.google.protobuf.ByteString
        public final int partialHash(int i, int i2) {
            byte[] bArr = this.bytes;
            int offsetIntoBytes = getOffsetIntoBytes() + 0;
            Charset charset = Internal.UTF_8;
            for (int i3 = offsetIntoBytes; i3 < offsetIntoBytes + i2; i3++) {
                i = (i * 31) + bArr[i3];
            }
            return i;
        }

        @Override // com.google.protobuf.ByteString
        public int size() {
            return this.bytes.length;
        }

        @Override // com.google.protobuf.ByteString
        public final String toStringInternal(Charset charset) {
            return new String(this.bytes, getOffsetIntoBytes(), size(), charset);
        }

        @Override // com.google.protobuf.ByteString
        public final void writeTo(ByteOutput byteOutput) throws IOException {
            byteOutput.writeLazy(this.bytes, getOffsetIntoBytes(), size());
        }

        public LiteralByteString(byte[] bArr) {
            bArr.getClass();
            this.bytes = bArr;
        }

        @Override // com.google.protobuf.ByteString
        public final boolean isValidUtf8() {
            int offsetIntoBytes = getOffsetIntoBytes();
            if (Utf8.processor.partialIsValidUtf8(this.bytes, offsetIntoBytes, size() + offsetIntoBytes) == 0) {
                return true;
            }
            return false;
        }
    }

    /* loaded from: classes.dex */
    public static final class SystemByteArrayCopier implements ByteArrayCopier {
        @Override // com.google.protobuf.ByteString.ByteArrayCopier
        public final byte[] copyFrom(byte[] bArr, int i, int i2) {
            byte[] bArr2 = new byte[i2];
            System.arraycopy(bArr, i, bArr2, 0, i2);
            return bArr2;
        }
    }

    public abstract byte byteAt(int i);

    public abstract boolean equals(Object obj);

    public abstract byte internalByteAt(int i);

    public abstract boolean isValidUtf8();

    public abstract int partialHash(int i, int i2);

    public abstract int size();

    public final String toString() {
        return String.format("<ByteString@%s size=%d>", Integer.toHexString(System.identityHashCode(this)), Integer.valueOf(size()));
    }

    public abstract String toStringInternal(Charset charset);

    public abstract void writeTo(ByteOutput byteOutput) throws IOException;

    static {
        boolean z;
        ByteArrayCopier byteArrayCopier2;
        if (Android.MEMORY_CLASS == null || Android.IS_ROBOLECTRIC) {
            z = false;
        } else {
            z = true;
        }
        if (z) {
            byteArrayCopier2 = new SystemByteArrayCopier();
        } else {
            byteArrayCopier2 = new ArraysByteArrayCopier();
        }
        byteArrayCopier = byteArrayCopier2;
    }

    public static int checkRange(int i, int i2, int i3) {
        int i4 = i2 - i;
        if ((i | i2 | i4 | (i3 - i2)) >= 0) {
            return i4;
        }
        if (i < 0) {
            throw new IndexOutOfBoundsException("Beginning index: " + i + " < 0");
        } else if (i2 < i) {
            throw new IndexOutOfBoundsException("Beginning index larger than ending index: " + i + ", " + i2);
        } else {
            throw new IndexOutOfBoundsException("End index: " + i2 + " >= " + i3);
        }
    }

    public static ByteString copyFrom(byte[] bArr, int i, int i2) {
        checkRange(i, i + i2, bArr.length);
        return new LiteralByteString(byteArrayCopier.copyFrom(bArr, i, i2));
    }

    public final int hashCode() {
        int i = this.hash;
        if (i == 0) {
            int size = size();
            i = partialHash(size, size);
            if (i == 0) {
                i = 1;
            }
            this.hash = i;
        }
        return i;
    }

    @Override // java.lang.Iterable
    public final Iterator<Byte> iterator() {
        return new AnonymousClass1();
    }

    public final int peekCachedHashCode() {
        return this.hash;
    }
}
