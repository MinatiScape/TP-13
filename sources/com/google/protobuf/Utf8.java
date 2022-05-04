package com.google.protobuf;

import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
/* loaded from: classes.dex */
public final class Utf8 {
    public static final Processor processor;

    /* loaded from: classes.dex */
    public static abstract class Processor {
        public abstract String decodeUtf8(byte[] bArr, int i, int i2) throws InvalidProtocolBufferException;

        public abstract int encodeUtf8(CharSequence charSequence, byte[] bArr, int i, int i2);

        public abstract int partialIsValidUtf8(byte[] bArr, int i, int i2);
    }

    /* loaded from: classes.dex */
    public static final class SafeProcessor extends Processor {
        @Override // com.google.protobuf.Utf8.Processor
        public final String decodeUtf8(byte[] bArr, int i, int i2) throws InvalidProtocolBufferException {
            boolean z;
            boolean z2;
            boolean z3;
            boolean z4;
            boolean z5;
            if ((i | i2 | ((bArr.length - i) - i2)) >= 0) {
                int i3 = i + i2;
                char[] cArr = new char[i2];
                int i4 = 0;
                while (i < i3) {
                    byte b = bArr[i];
                    if (b >= 0) {
                        z5 = true;
                    } else {
                        z5 = false;
                    }
                    if (!z5) {
                        break;
                    }
                    i++;
                    cArr[i4] = (char) b;
                    i4++;
                }
                int i5 = i4;
                while (i < i3) {
                    int i6 = i + 1;
                    byte b2 = bArr[i];
                    if (b2 >= 0) {
                        z = true;
                    } else {
                        z = false;
                    }
                    if (z) {
                        int i7 = i5 + 1;
                        cArr[i5] = (char) b2;
                        i = i6;
                        while (true) {
                            i5 = i7;
                            if (i >= i3) {
                                break;
                            }
                            byte b3 = bArr[i];
                            if (b3 >= 0) {
                                z2 = true;
                            } else {
                                z2 = false;
                            }
                            if (!z2) {
                                break;
                            }
                            i++;
                            i7 = i5 + 1;
                            cArr[i5] = (char) b3;
                        }
                    } else {
                        if (b2 < -32) {
                            z3 = true;
                        } else {
                            z3 = false;
                        }
                        if (!z3) {
                            if (b2 < -16) {
                                z4 = true;
                            } else {
                                z4 = false;
                            }
                            if (z4) {
                                if (i6 < i3 - 1) {
                                    int i8 = i6 + 1;
                                    DecodeUtil.access$900(b2, bArr[i6], bArr[i8], cArr, i5);
                                    i = i8 + 1;
                                    i5++;
                                } else {
                                    throw InvalidProtocolBufferException.invalidUtf8();
                                }
                            } else if (i6 < i3 - 2) {
                                int i9 = i6 + 1;
                                byte b4 = bArr[i6];
                                int i10 = i9 + 1;
                                DecodeUtil.access$1000(b2, b4, bArr[i9], bArr[i10], cArr, i5);
                                i5 = i5 + 1 + 1;
                                i = i10 + 1;
                            } else {
                                throw InvalidProtocolBufferException.invalidUtf8();
                            }
                        } else if (i6 < i3) {
                            int i11 = i6 + 1;
                            byte b5 = bArr[i6];
                            int i12 = i5 + 1;
                            if (b2 < -62 || DecodeUtil.isNotTrailingByte(b5)) {
                                throw InvalidProtocolBufferException.invalidUtf8();
                            }
                            cArr[i5] = (char) (((b2 & 31) << 6) | (b5 & 63));
                            i = i11;
                            i5 = i12;
                        } else {
                            throw InvalidProtocolBufferException.invalidUtf8();
                        }
                    }
                }
                return new String(cArr, 0, i5);
            }
            throw new ArrayIndexOutOfBoundsException(String.format("buffer length=%d, index=%d, size=%d", Integer.valueOf(bArr.length), Integer.valueOf(i), Integer.valueOf(i2)));
        }

        @Override // com.google.protobuf.Utf8.Processor
        public final int partialIsValidUtf8(byte[] bArr, int i, int i2) {
            while (i < i2 && bArr[i] >= 0) {
                i++;
            }
            if (i < i2) {
                while (i < i2) {
                    int i3 = i + 1;
                    byte b = bArr[i];
                    if (b >= 0) {
                        i = i3;
                    } else if (b < -32) {
                        if (i3 >= i2) {
                            return b;
                        }
                        if (b >= -62) {
                            i = i3 + 1;
                            if (bArr[i3] > -65) {
                            }
                        }
                        return -1;
                    } else if (b < -16) {
                        if (i3 >= i2 - 1) {
                            return Utf8.access$1100(bArr, i3, i2);
                        }
                        int i4 = i3 + 1;
                        byte b2 = bArr[i3];
                        if (b2 <= -65 && ((b != -32 || b2 >= -96) && (b != -19 || b2 < -96))) {
                            i = i4 + 1;
                            if (bArr[i4] > -65) {
                            }
                        }
                        return -1;
                    } else if (i3 >= i2 - 2) {
                        return Utf8.access$1100(bArr, i3, i2);
                    } else {
                        int i5 = i3 + 1;
                        byte b3 = bArr[i3];
                        if (b3 <= -65) {
                            if ((((b3 + 112) + (b << 28)) >> 30) == 0) {
                                int i6 = i5 + 1;
                                if (bArr[i5] <= -65) {
                                    i = i6 + 1;
                                    if (bArr[i6] > -65) {
                                    }
                                }
                            }
                        }
                        return -1;
                    }
                }
            }
            return 0;
        }

        /* JADX WARN: Code restructure failed: missing block: B:12:0x001d, code lost:
            return r9 + r6;
         */
        @Override // com.google.protobuf.Utf8.Processor
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final int encodeUtf8(java.lang.CharSequence r7, byte[] r8, int r9, int r10) {
            /*
                Method dump skipped, instructions count: 253
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: com.google.protobuf.Utf8.SafeProcessor.encodeUtf8(java.lang.CharSequence, byte[], int, int):int");
        }
    }

    /* loaded from: classes.dex */
    public static class UnpairedSurrogateException extends IllegalArgumentException {
        public UnpairedSurrogateException(int i, int i2) {
            super("Unpaired surrogate at index " + i + " of " + i2);
        }
    }

    /* loaded from: classes.dex */
    public static final class UnsafeProcessor extends Processor {
        public static int unsafeIncompleteStateFor(byte[] bArr, int i, long j, int i2) {
            if (i2 == 0) {
                Processor processor = Utf8.processor;
                if (i > -12) {
                    return -1;
                }
                return i;
            } else if (i2 == 1) {
                return Utf8.incompleteStateFor(i, UnsafeUtil.getByte(bArr, j));
            } else {
                if (i2 == 2) {
                    return Utf8.incompleteStateFor(i, UnsafeUtil.getByte(bArr, j), UnsafeUtil.getByte(bArr, j + 1));
                }
                throw new AssertionError();
            }
        }

        @Override // com.google.protobuf.Utf8.Processor
        public final String decodeUtf8(byte[] bArr, int i, int i2) throws InvalidProtocolBufferException {
            boolean z;
            boolean z2;
            boolean z3;
            boolean z4;
            boolean z5;
            if ((i | i2 | ((bArr.length - i) - i2)) >= 0) {
                int i3 = i + i2;
                char[] cArr = new char[i2];
                int i4 = 0;
                while (i < i3) {
                    byte b = UnsafeUtil.getByte(bArr, i);
                    if (b >= 0) {
                        z5 = true;
                    } else {
                        z5 = false;
                    }
                    if (!z5) {
                        break;
                    }
                    i++;
                    cArr[i4] = (char) b;
                    i4++;
                }
                int i5 = i4;
                while (i < i3) {
                    int i6 = i + 1;
                    byte b2 = UnsafeUtil.getByte(bArr, i);
                    if (b2 >= 0) {
                        z = true;
                    } else {
                        z = false;
                    }
                    if (z) {
                        int i7 = i5 + 1;
                        cArr[i5] = (char) b2;
                        i = i6;
                        while (true) {
                            i5 = i7;
                            if (i >= i3) {
                                break;
                            }
                            byte b3 = UnsafeUtil.getByte(bArr, i);
                            if (b3 >= 0) {
                                z2 = true;
                            } else {
                                z2 = false;
                            }
                            if (!z2) {
                                break;
                            }
                            i++;
                            i7 = i5 + 1;
                            cArr[i5] = (char) b3;
                        }
                    } else {
                        if (b2 < -32) {
                            z3 = true;
                        } else {
                            z3 = false;
                        }
                        if (!z3) {
                            if (b2 < -16) {
                                z4 = true;
                            } else {
                                z4 = false;
                            }
                            if (z4) {
                                if (i6 < i3 - 1) {
                                    int i8 = i6 + 1;
                                    DecodeUtil.access$900(b2, UnsafeUtil.getByte(bArr, i6), UnsafeUtil.getByte(bArr, i8), cArr, i5);
                                    i = i8 + 1;
                                    i5++;
                                } else {
                                    throw InvalidProtocolBufferException.invalidUtf8();
                                }
                            } else if (i6 < i3 - 2) {
                                int i9 = i6 + 1;
                                int i10 = i9 + 1;
                                DecodeUtil.access$1000(b2, UnsafeUtil.getByte(bArr, i6), UnsafeUtil.getByte(bArr, i9), UnsafeUtil.getByte(bArr, i10), cArr, i5);
                                i5 = i5 + 1 + 1;
                                i = i10 + 1;
                            } else {
                                throw InvalidProtocolBufferException.invalidUtf8();
                            }
                        } else if (i6 < i3) {
                            int i11 = i6 + 1;
                            byte b4 = UnsafeUtil.getByte(bArr, i6);
                            int i12 = i5 + 1;
                            if (b2 < -62 || DecodeUtil.isNotTrailingByte(b4)) {
                                throw InvalidProtocolBufferException.invalidUtf8();
                            }
                            cArr[i5] = (char) (((b2 & 31) << 6) | (b4 & 63));
                            i = i11;
                            i5 = i12;
                        } else {
                            throw InvalidProtocolBufferException.invalidUtf8();
                        }
                    }
                }
                return new String(cArr, 0, i5);
            }
            throw new ArrayIndexOutOfBoundsException(String.format("buffer length=%d, index=%d, size=%d", Integer.valueOf(bArr.length), Integer.valueOf(i), Integer.valueOf(i2)));
        }

        @Override // com.google.protobuf.Utf8.Processor
        public final int encodeUtf8(CharSequence charSequence, byte[] bArr, int i, int i2) {
            long j;
            char c;
            int i3;
            long j2;
            char charAt;
            long j3 = i;
            long j4 = i2 + j3;
            int length = charSequence.length();
            if (length > i2 || bArr.length - i2 < i) {
                StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Failed writing ");
                m.append(charSequence.charAt(length - 1));
                m.append(" at index ");
                m.append(i + i2);
                throw new ArrayIndexOutOfBoundsException(m.toString());
            }
            int i4 = 0;
            while (true) {
                j = 1;
                c = 128;
                if (i4 >= length || (charAt = charSequence.charAt(i4)) >= 128) {
                    break;
                }
                UnsafeUtil.putByte(bArr, j3, (byte) charAt);
                i4++;
                j3 = 1 + j3;
            }
            if (i4 == length) {
                return (int) j3;
            }
            while (i4 < length) {
                char charAt2 = charSequence.charAt(i4);
                if (charAt2 >= c || j3 >= j4) {
                    if (charAt2 < 2048 && j3 <= j4 - 2) {
                        long j5 = j3 + j;
                        UnsafeUtil.putByte(bArr, j3, (byte) ((charAt2 >>> 6) | 960));
                        j2 = j5 + j;
                        UnsafeUtil.putByte(bArr, j5, (byte) ((charAt2 & '?') | 128));
                    } else if ((charAt2 < 55296 || 57343 < charAt2) && j3 <= j4 - 3) {
                        long j6 = j3 + j;
                        UnsafeUtil.putByte(bArr, j3, (byte) ((charAt2 >>> '\f') | 480));
                        long j7 = j + j6;
                        UnsafeUtil.putByte(bArr, j6, (byte) (((charAt2 >>> 6) & 63) | 128));
                        j2 = 1 + j7;
                        UnsafeUtil.putByte(bArr, j7, (byte) ((charAt2 & '?') | 128));
                        j = 1;
                    } else if (j3 <= j4 - 4) {
                        int i5 = i4 + 1;
                        if (i5 != length) {
                            char charAt3 = charSequence.charAt(i5);
                            if (Character.isSurrogatePair(charAt2, charAt3)) {
                                int codePoint = Character.toCodePoint(charAt2, charAt3);
                                long j8 = j3 + 1;
                                UnsafeUtil.putByte(bArr, j3, (byte) ((codePoint >>> 18) | 240));
                                long j9 = 1 + j8;
                                UnsafeUtil.putByte(bArr, j8, (byte) (((codePoint >>> 12) & 63) | 128));
                                long j10 = 1 + j9;
                                UnsafeUtil.putByte(bArr, j9, (byte) (((codePoint >>> 6) & 63) | 128));
                                j = 1;
                                UnsafeUtil.putByte(bArr, j10, (byte) ((codePoint & 63) | 128));
                                i4 = i5;
                                c = 128;
                                j3 = j10 + 1;
                            } else {
                                i4 = i5;
                            }
                        }
                        throw new UnpairedSurrogateException(i4 - 1, length);
                    } else if (55296 > charAt2 || charAt2 > 57343 || ((i3 = i4 + 1) != length && Character.isSurrogatePair(charAt2, charSequence.charAt(i3)))) {
                        throw new ArrayIndexOutOfBoundsException("Failed writing " + charAt2 + " at index " + j3);
                    } else {
                        throw new UnpairedSurrogateException(i4, length);
                    }
                    long j11 = j2;
                    c = 128;
                    j3 = j11;
                } else {
                    UnsafeUtil.putByte(bArr, j3, (byte) charAt2);
                    j3 += j;
                }
                i4++;
            }
            return (int) j3;
        }

        @Override // com.google.protobuf.Utf8.Processor
        public final int partialIsValidUtf8(byte[] bArr, int i, int i2) {
            int i3;
            long j;
            if ((i | i2 | (bArr.length - i2)) >= 0) {
                long j2 = i;
                int i4 = (int) (i2 - j2);
                if (i4 >= 16) {
                    long j3 = j2;
                    i3 = 0;
                    while (true) {
                        if (i3 >= i4) {
                            i3 = i4;
                            break;
                        }
                        long j4 = j3 + 1;
                        if (UnsafeUtil.getByte(bArr, j3) < 0) {
                            break;
                        }
                        i3++;
                        j3 = j4;
                    }
                } else {
                    i3 = 0;
                }
                int i5 = i4 - i3;
                long j5 = j2 + i3;
                while (true) {
                    byte b = 0;
                    while (true) {
                        if (i5 <= 0) {
                            break;
                        }
                        long j6 = j5 + 1;
                        b = UnsafeUtil.getByte(bArr, j5);
                        if (b < 0) {
                            j5 = j6;
                            break;
                        }
                        i5--;
                        j5 = j6;
                    }
                    if (i5 != 0) {
                        int i6 = i5 - 1;
                        if (b >= -32) {
                            if (b >= -16) {
                                if (i6 >= 3) {
                                    i5 = i6 - 3;
                                    long j7 = j5 + 1;
                                    byte b2 = UnsafeUtil.getByte(bArr, j5);
                                    if (b2 > -65 || (((b2 + 112) + (b << 28)) >> 30) != 0) {
                                        break;
                                    }
                                    long j8 = j7 + 1;
                                    if (UnsafeUtil.getByte(bArr, j7) > -65) {
                                        break;
                                    }
                                    j = j8 + 1;
                                    if (UnsafeUtil.getByte(bArr, j8) > -65) {
                                        break;
                                    }
                                    j5 = j;
                                } else {
                                    return unsafeIncompleteStateFor(bArr, b, j5, i6);
                                }
                            } else if (i6 >= 2) {
                                i5 = i6 - 2;
                                long j9 = j5 + 1;
                                byte b3 = UnsafeUtil.getByte(bArr, j5);
                                if (b3 > -65 || ((b == -32 && b3 < -96) || (b == -19 && b3 >= -96))) {
                                    break;
                                }
                                j5 = j9 + 1;
                                if (UnsafeUtil.getByte(bArr, j9) > -65) {
                                    break;
                                }
                            } else {
                                return unsafeIncompleteStateFor(bArr, b, j5, i6);
                            }
                        } else if (i6 != 0) {
                            i5 = i6 - 1;
                            if (b < -62) {
                                break;
                            }
                            j = j5 + 1;
                            if (UnsafeUtil.getByte(bArr, j5) > -65) {
                                break;
                            }
                            j5 = j;
                        } else {
                            return b;
                        }
                    } else {
                        return 0;
                    }
                }
                return -1;
            }
            throw new ArrayIndexOutOfBoundsException(String.format("Array length=%d, index=%d, limit=%d", Integer.valueOf(bArr.length), Integer.valueOf(i), Integer.valueOf(i2)));
        }
    }

    public static int incompleteStateFor(int i, int i2) {
        if (i > -12 || i2 > -65) {
            return -1;
        }
        return i ^ (i2 << 8);
    }

    public static int incompleteStateFor(int i, int i2, int i3) {
        if (i > -12 || i2 > -65 || i3 > -65) {
            return -1;
        }
        return (i ^ (i2 << 8)) ^ (i3 << 16);
    }

    /* loaded from: classes.dex */
    public static class DecodeUtil {
        public static boolean isNotTrailingByte(byte b) {
            return b > -65;
        }

        public static void access$1000(byte b, byte b2, byte b3, byte b4, char[] cArr, int i) throws InvalidProtocolBufferException {
            if (!isNotTrailingByte(b2)) {
                if ((((b2 + 112) + (b << 28)) >> 30) == 0 && !isNotTrailingByte(b3) && !isNotTrailingByte(b4)) {
                    int i2 = ((b & 7) << 18) | ((b2 & 63) << 12) | ((b3 & 63) << 6) | (b4 & 63);
                    cArr[i] = (char) ((i2 >>> 10) + 55232);
                    cArr[i + 1] = (char) ((i2 & 1023) + 56320);
                    return;
                }
            }
            throw InvalidProtocolBufferException.invalidUtf8();
        }

        public static void access$900(byte b, byte b2, byte b3, char[] cArr, int i) throws InvalidProtocolBufferException {
            if (isNotTrailingByte(b2) || ((b == -32 && b2 < -96) || ((b == -19 && b2 >= -96) || isNotTrailingByte(b3)))) {
                throw InvalidProtocolBufferException.invalidUtf8();
            }
            cArr[i] = (char) (((b & 15) << 12) | ((b2 & 63) << 6) | (b3 & 63));
        }
    }

    static {
        boolean z;
        Processor processor2;
        boolean z2 = true;
        if (!UnsafeUtil.HAS_UNSAFE_ARRAY_OPERATIONS || !UnsafeUtil.HAS_UNSAFE_BYTEBUFFER_OPERATIONS) {
            z = false;
        } else {
            z = true;
        }
        if (z) {
            if (Android.MEMORY_CLASS == null || Android.IS_ROBOLECTRIC) {
                z2 = false;
            }
            if (!z2) {
                processor2 = new UnsafeProcessor();
                processor = processor2;
            }
        }
        processor2 = new SafeProcessor();
        processor = processor2;
    }

    public static int access$1100(byte[] bArr, int i, int i2) {
        byte b = bArr[i - 1];
        int i3 = i2 - i;
        if (i3 == 0) {
            if (b > -12) {
                b = -1;
            }
            return b;
        } else if (i3 == 1) {
            return incompleteStateFor(b, bArr[i]);
        } else {
            if (i3 == 2) {
                return incompleteStateFor(b, bArr[i], bArr[i + 1]);
            }
            throw new AssertionError();
        }
    }

    public static int encodedLength(CharSequence charSequence) {
        int length = charSequence.length();
        int i = 0;
        int i2 = 0;
        while (i2 < length && charSequence.charAt(i2) < 128) {
            i2++;
        }
        int i3 = length;
        while (true) {
            if (i2 >= length) {
                break;
            }
            char charAt = charSequence.charAt(i2);
            if (charAt < 2048) {
                i3 += (127 - charAt) >>> 31;
                i2++;
            } else {
                int length2 = charSequence.length();
                while (i2 < length2) {
                    char charAt2 = charSequence.charAt(i2);
                    if (charAt2 < 2048) {
                        i += (127 - charAt2) >>> 31;
                    } else {
                        i += 2;
                        if (55296 <= charAt2 && charAt2 <= 57343) {
                            if (Character.codePointAt(charSequence, i2) >= 65536) {
                                i2++;
                            } else {
                                throw new UnpairedSurrogateException(i2, length2);
                            }
                        }
                    }
                    i2++;
                }
                i3 += i;
            }
        }
        if (i3 >= length) {
            return i3;
        }
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("UTF-8 length does not fit in int: ");
        m.append(i3 + 4294967296L);
        throw new IllegalArgumentException(m.toString());
    }
}
