package com.google.common.io;

import androidx.fragment.R$id$$ExternalSyntheticOutline0;
import com.android.systemui.shared.system.QuickStepContract;
import com.google.common.base.Preconditions;
import com.google.common.math.IntMath;
import java.io.IOException;
import java.math.RoundingMode;
import java.util.Arrays;
import java.util.Objects;
/* loaded from: classes.dex */
public abstract class BaseEncoding {
    public static final BaseEncoding BASE64_URL = new Base64Encoding("base64Url()", "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_", '=');

    /* loaded from: classes.dex */
    public static final class Alphabet {
        public final int bitsPerChar;
        public final int bytesPerChunk;
        public final char[] chars;
        public final int charsPerChunk;
        public final byte[] decodabet;
        public final int mask;
        public final String name;
        public final boolean[] validPadding;

        public Alphabet(String name, char[] chars) {
            Objects.requireNonNull(name);
            this.name = name;
            Objects.requireNonNull(chars);
            this.chars = chars;
            try {
                int log2 = IntMath.log2(chars.length, RoundingMode.UNNECESSARY);
                this.bitsPerChar = log2;
                int min = Math.min(8, Integer.lowestOneBit(log2));
                try {
                    this.charsPerChunk = 8 / min;
                    this.bytesPerChunk = log2 / min;
                    this.mask = chars.length - 1;
                    byte[] bArr = new byte[128];
                    Arrays.fill(bArr, (byte) -1);
                    for (int i = 0; i < chars.length; i++) {
                        char c = chars[i];
                        Preconditions.checkArgument(c < 128, "Non-ASCII character: %s", c);
                        Preconditions.checkArgument(bArr[c] == -1, "Duplicate character: %s", c);
                        bArr[c] = (byte) i;
                    }
                    this.decodabet = bArr;
                    boolean[] zArr = new boolean[this.charsPerChunk];
                    for (int i2 = 0; i2 < this.bytesPerChunk; i2++) {
                        zArr[IntMath.divide(i2 * 8, this.bitsPerChar, RoundingMode.CEILING)] = true;
                    }
                    this.validPadding = zArr;
                } catch (ArithmeticException e) {
                    String str = new String(chars);
                    throw new IllegalArgumentException(str.length() != 0 ? "Illegal alphabet ".concat(str) : new String("Illegal alphabet "), e);
                }
            } catch (ArithmeticException e2) {
                throw new IllegalArgumentException(R$id$$ExternalSyntheticOutline0.m(35, "Illegal alphabet length ", chars.length), e2);
            }
        }

        public boolean equals(Object other) {
            if (other instanceof Alphabet) {
                return Arrays.equals(this.chars, ((Alphabet) other).chars);
            }
            return false;
        }

        public int hashCode() {
            return Arrays.hashCode(this.chars);
        }

        public String toString() {
            return this.name;
        }
    }

    /* loaded from: classes.dex */
    public static final class Base16Encoding extends StandardBaseEncoding {
        public final char[] encoding = new char[QuickStepContract.SYSUI_STATE_STATUS_BAR_KEYGUARD_SHOWING_OCCLUDED];

        public Base16Encoding(Alphabet alphabet) {
            super(alphabet, null);
            Preconditions.checkArgument(alphabet.chars.length == 16);
            for (int i = 0; i < 256; i++) {
                char[] cArr = this.encoding;
                char[] cArr2 = alphabet.chars;
                cArr[i] = cArr2[i >>> 4];
                cArr[i | 256] = cArr2[i & 15];
            }
        }

        @Override // com.google.common.io.BaseEncoding.StandardBaseEncoding, com.google.common.io.BaseEncoding
        public void encodeTo(Appendable target, byte[] bytes, int off, int len) throws IOException {
            Preconditions.checkPositionIndexes(off, off + len, bytes.length);
            for (int i = 0; i < len; i++) {
                int i2 = bytes[off + i] & 255;
                target.append(this.encoding[i2]);
                target.append(this.encoding[i2 | 256]);
            }
        }

        @Override // com.google.common.io.BaseEncoding.StandardBaseEncoding
        public BaseEncoding newInstance(Alphabet alphabet, Character paddingChar) {
            return new Base16Encoding(alphabet);
        }
    }

    /* loaded from: classes.dex */
    public static class StandardBaseEncoding extends BaseEncoding {
        public final Alphabet alphabet;
        public final Character paddingChar;

        /* JADX WARN: Code restructure failed: missing block: B:10:0x001d, code lost:
            if ((r2 < r5.length && r5[r2] != -1) == false) goto L11;
         */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public StandardBaseEncoding(com.google.common.io.BaseEncoding.Alphabet r5, java.lang.Character r6) {
            /*
                r4 = this;
                r4.<init>()
                java.util.Objects.requireNonNull(r5)
                r4.alphabet = r5
                r0 = 0
                r1 = 1
                if (r6 == 0) goto L1f
                char r2 = r6.charValue()
                byte[] r5 = r5.decodabet
                int r3 = r5.length
                if (r2 >= r3) goto L1c
                r5 = r5[r2]
                r2 = -1
                if (r5 == r2) goto L1c
                r5 = r1
                goto L1d
            L1c:
                r5 = r0
            L1d:
                if (r5 != 0) goto L20
            L1f:
                r0 = r1
            L20:
                java.lang.String r5 = "Padding character %s was already in alphabet"
                com.google.common.base.Preconditions.checkArgument(r0, r5, r6)
                r4.paddingChar = r6
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: com.google.common.io.BaseEncoding.StandardBaseEncoding.<init>(com.google.common.io.BaseEncoding$Alphabet, java.lang.Character):void");
        }

        public void encodeChunkTo(Appendable target, byte[] bytes, int off, int len) throws IOException {
            Preconditions.checkPositionIndexes(off, off + len, bytes.length);
            int i = 0;
            Preconditions.checkArgument(len <= this.alphabet.bytesPerChunk);
            long j = 0;
            for (int i2 = 0; i2 < len; i2++) {
                j = (j | (bytes[off + i2] & 255)) << 8;
            }
            int i3 = ((len + 1) * 8) - this.alphabet.bitsPerChar;
            while (i < len * 8) {
                Alphabet alphabet = this.alphabet;
                target.append(alphabet.chars[((int) (j >>> (i3 - i))) & alphabet.mask]);
                i += this.alphabet.bitsPerChar;
            }
            if (this.paddingChar != null) {
                while (i < this.alphabet.bytesPerChunk * 8) {
                    target.append(this.paddingChar.charValue());
                    i += this.alphabet.bitsPerChar;
                }
            }
        }

        @Override // com.google.common.io.BaseEncoding
        public void encodeTo(Appendable target, byte[] bytes, int off, int len) throws IOException {
            Preconditions.checkPositionIndexes(off, off + len, bytes.length);
            int i = 0;
            while (i < len) {
                encodeChunkTo(target, bytes, off + i, Math.min(this.alphabet.bytesPerChunk, len - i));
                i += this.alphabet.bytesPerChunk;
            }
        }

        public boolean equals(Object other) {
            if (!(other instanceof StandardBaseEncoding)) {
                return false;
            }
            StandardBaseEncoding standardBaseEncoding = (StandardBaseEncoding) other;
            return this.alphabet.equals(standardBaseEncoding.alphabet) && com.google.common.base.Objects.equal(this.paddingChar, standardBaseEncoding.paddingChar);
        }

        public int hashCode() {
            return Arrays.hashCode(new Object[]{this.paddingChar}) ^ this.alphabet.hashCode();
        }

        public BaseEncoding newInstance(Alphabet alphabet, Character paddingChar) {
            return new StandardBaseEncoding(alphabet, null);
        }

        public String toString() {
            StringBuilder sb = new StringBuilder("BaseEncoding.");
            sb.append(this.alphabet.name);
            if (8 % this.alphabet.bitsPerChar != 0) {
                if (this.paddingChar == null) {
                    sb.append(".omitPadding()");
                } else {
                    sb.append(".withPadChar('");
                    sb.append(this.paddingChar);
                    sb.append("')");
                }
            }
            return sb.toString();
        }
    }

    static {
        new Base64Encoding("base64()", "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", '=');
        new StandardBaseEncoding(new Alphabet("base32()", "ABCDEFGHIJKLMNOPQRSTUVWXYZ234567".toCharArray()), '=');
        new StandardBaseEncoding(new Alphabet("base32Hex()", "0123456789ABCDEFGHIJKLMNOPQRSTUV".toCharArray()), '=');
        new Base16Encoding(new Alphabet("base16()", "0123456789ABCDEF".toCharArray()));
    }

    public abstract void encodeTo(Appendable target, byte[] bytes, int off, int len) throws IOException;

    /* loaded from: classes.dex */
    public static final class Base64Encoding extends StandardBaseEncoding {
        /* JADX WARN: Illegal instructions before constructor call */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public Base64Encoding(java.lang.String r2, java.lang.String r3, java.lang.Character r4) {
            /*
                r1 = this;
                com.google.common.io.BaseEncoding$Alphabet r0 = new com.google.common.io.BaseEncoding$Alphabet
                char[] r3 = r3.toCharArray()
                r0.<init>(r2, r3)
                r1.<init>(r0, r4)
                char[] r1 = r0.chars
                int r1 = r1.length
                r2 = 64
                if (r1 != r2) goto L15
                r1 = 1
                goto L16
            L15:
                r1 = 0
            L16:
                com.google.common.base.Preconditions.checkArgument(r1)
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: com.google.common.io.BaseEncoding.Base64Encoding.<init>(java.lang.String, java.lang.String, java.lang.Character):void");
        }

        @Override // com.google.common.io.BaseEncoding.StandardBaseEncoding, com.google.common.io.BaseEncoding
        public void encodeTo(Appendable target, byte[] bytes, int off, int len) throws IOException {
            int i = off + len;
            Preconditions.checkPositionIndexes(off, i, bytes.length);
            while (len >= 3) {
                int i2 = off + 1;
                int i3 = i2 + 1;
                int i4 = ((bytes[off] & 255) << 16) | ((bytes[i2] & 255) << 8);
                off = i3 + 1;
                int i5 = i4 | (bytes[i3] & 255);
                target.append(this.alphabet.chars[i5 >>> 18]);
                target.append(this.alphabet.chars[(i5 >>> 12) & 63]);
                target.append(this.alphabet.chars[(i5 >>> 6) & 63]);
                target.append(this.alphabet.chars[i5 & 63]);
                len -= 3;
            }
            if (off < i) {
                encodeChunkTo(target, bytes, off, i - off);
            }
        }

        @Override // com.google.common.io.BaseEncoding.StandardBaseEncoding
        public BaseEncoding newInstance(Alphabet alphabet, Character paddingChar) {
            return new Base64Encoding(alphabet, null);
        }

        public Base64Encoding(Alphabet alphabet, Character paddingChar) {
            super(alphabet, paddingChar);
            Preconditions.checkArgument(alphabet.chars.length == 64);
        }
    }
}
