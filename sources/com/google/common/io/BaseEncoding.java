package com.google.common.io;

import androidx.cardview.R$style$$ExternalSyntheticOutline0;
import com.android.systemui.shared.system.QuickStepContract;
import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import com.google.common.base.Strings;
import com.google.common.math.IntMath;
import java.io.IOException;
import java.math.RoundingMode;
import java.util.Arrays;
/* loaded from: classes.dex */
public abstract class BaseEncoding {
    public static final Base64Encoding BASE64_URL = new Base64Encoding("base64Url()", "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_", '=');

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

        public final boolean equals(Object other) {
            if (other instanceof Alphabet) {
                return Arrays.equals(this.chars, ((Alphabet) other).chars);
            }
            return false;
        }

        public final int hashCode() {
            return Arrays.hashCode(this.chars);
        }

        public Alphabet(String name, char[] chars) {
            String str;
            boolean z;
            boolean z2;
            this.name = name;
            chars.getClass();
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
                        if (c < 128) {
                            z = true;
                        } else {
                            z = false;
                        }
                        if (z) {
                            if (bArr[c] == -1) {
                                z2 = true;
                            } else {
                                z2 = false;
                            }
                            if (z2) {
                                bArr[c] = (byte) i;
                            } else {
                                throw new IllegalArgumentException(Strings.lenientFormat("Duplicate character: %s", Character.valueOf(c)));
                            }
                        } else {
                            throw new IllegalArgumentException(Strings.lenientFormat("Non-ASCII character: %s", Character.valueOf(c)));
                        }
                    }
                    this.decodabet = bArr;
                    boolean[] zArr = new boolean[this.charsPerChunk];
                    for (int i2 = 0; i2 < this.bytesPerChunk; i2++) {
                        zArr[IntMath.divide(i2 * 8, this.bitsPerChar, RoundingMode.CEILING)] = true;
                    }
                    this.validPadding = zArr;
                } catch (ArithmeticException e) {
                    String str2 = new String(chars);
                    if (str2.length() != 0) {
                        str = "Illegal alphabet ".concat(str2);
                    } else {
                        str = new String("Illegal alphabet ");
                    }
                    throw new IllegalArgumentException(str, e);
                }
            } catch (ArithmeticException e2) {
                throw new IllegalArgumentException(R$style$$ExternalSyntheticOutline0.m(35, "Illegal alphabet length ", chars.length), e2);
            }
        }

        public final String toString() {
            return this.name;
        }
    }

    /* loaded from: classes.dex */
    public static final class Base16Encoding extends StandardBaseEncoding {
        public final char[] encoding = new char[QuickStepContract.SYSUI_STATE_STATUS_BAR_KEYGUARD_SHOWING_OCCLUDED];

        public Base16Encoding(Alphabet alphabet) {
            super(alphabet, null);
            boolean z;
            if (alphabet.chars.length == 16) {
                z = true;
            } else {
                z = false;
            }
            Preconditions.checkArgument(z);
            for (int i = 0; i < 256; i++) {
                char[] cArr = this.encoding;
                char[] cArr2 = alphabet.chars;
                cArr[i] = cArr2[i >>> 4];
                cArr[i | 256] = cArr2[i & 15];
            }
        }

        @Override // com.google.common.io.BaseEncoding.StandardBaseEncoding, com.google.common.io.BaseEncoding
        public final void encodeTo(StringBuilder sb, byte[] bArr, int i) throws IOException {
            Preconditions.checkPositionIndexes(0, 0 + i, bArr.length);
            for (int i2 = 0; i2 < i; i2++) {
                int i3 = bArr[0 + i2] & 255;
                sb.append(this.encoding[i3]);
                sb.append(this.encoding[i3 | 256]);
            }
        }
    }

    /* loaded from: classes.dex */
    public static final class Base64Encoding extends StandardBaseEncoding {
        public Base64Encoding(String name, String alphabetChars, Character paddingChar) {
            this(new Alphabet(name, alphabetChars.toCharArray()), paddingChar);
        }

        @Override // com.google.common.io.BaseEncoding.StandardBaseEncoding, com.google.common.io.BaseEncoding
        public final void encodeTo(StringBuilder sb, byte[] bArr, int i) throws IOException {
            int i2 = 0;
            int i3 = 0 + i;
            Preconditions.checkPositionIndexes(0, i3, bArr.length);
            while (i >= 3) {
                int i4 = i2 + 1;
                int i5 = i4 + 1;
                int i6 = ((bArr[i2] & 255) << 16) | ((bArr[i4] & 255) << 8);
                int i7 = i6 | (bArr[i5] & 255);
                sb.append(this.alphabet.chars[i7 >>> 18]);
                sb.append(this.alphabet.chars[(i7 >>> 12) & 63]);
                sb.append(this.alphabet.chars[(i7 >>> 6) & 63]);
                sb.append(this.alphabet.chars[i7 & 63]);
                i -= 3;
                i2 = i5 + 1;
            }
            if (i2 < i3) {
                encodeChunkTo(sb, bArr, i2, i3 - i2);
            }
        }

        public Base64Encoding(Alphabet alphabet, Character paddingChar) {
            super(alphabet, paddingChar);
            Preconditions.checkArgument(alphabet.chars.length == 64);
        }

        public final BaseEncoding newInstance(Alphabet alphabet) {
            return new Base64Encoding(alphabet, null);
        }
    }

    /* loaded from: classes.dex */
    public static class StandardBaseEncoding extends BaseEncoding {
        public final Alphabet alphabet;
        public final Character paddingChar;

        public StandardBaseEncoding(String name, String alphabetChars, Character paddingChar) {
            this(new Alphabet(name, alphabetChars.toCharArray()), paddingChar);
        }

        @Override // com.google.common.io.BaseEncoding
        public void encodeTo(StringBuilder sb, byte[] bArr, int i) throws IOException {
            Preconditions.checkPositionIndexes(0, 0 + i, bArr.length);
            int i2 = 0;
            while (i2 < i) {
                encodeChunkTo(sb, bArr, 0 + i2, Math.min(this.alphabet.bytesPerChunk, i - i2));
                i2 += this.alphabet.bytesPerChunk;
            }
        }

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
                r5.getClass()
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

        public final void encodeChunkTo(StringBuilder target, byte[] bytes, int off, int len) throws IOException {
            boolean z;
            Preconditions.checkPositionIndexes(off, off + len, bytes.length);
            int i = 0;
            if (len <= this.alphabet.bytesPerChunk) {
                z = true;
            } else {
                z = false;
            }
            Preconditions.checkArgument(z);
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

        public final boolean equals(Object other) {
            if (!(other instanceof StandardBaseEncoding)) {
                return false;
            }
            StandardBaseEncoding standardBaseEncoding = (StandardBaseEncoding) other;
            if (!this.alphabet.equals(standardBaseEncoding.alphabet) || !Objects.equal(this.paddingChar, standardBaseEncoding.paddingChar)) {
                return false;
            }
            return true;
        }

        public final int hashCode() {
            return Arrays.hashCode(new Object[]{this.paddingChar}) ^ this.alphabet.hashCode();
        }

        public final String toString() {
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

    public abstract void encodeTo(StringBuilder sb, byte[] bArr, int i) throws IOException;

    static {
        new Base64Encoding("base64()", "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", '=');
        new StandardBaseEncoding("base32()", "ABCDEFGHIJKLMNOPQRSTUVWXYZ234567", '=');
        new StandardBaseEncoding("base32Hex()", "0123456789ABCDEFGHIJKLMNOPQRSTUV", '=');
        new Base16Encoding(new Alphabet("base16()", "0123456789ABCDEF".toCharArray()));
    }
}
