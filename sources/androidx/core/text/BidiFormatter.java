package androidx.core.text;

import androidx.core.text.TextDirectionHeuristicsCompat;
/* loaded from: classes.dex */
public final class BidiFormatter {
    public static final BidiFormatter DEFAULT_LTR_INSTANCE;
    public static final BidiFormatter DEFAULT_RTL_INSTANCE;
    public static final TextDirectionHeuristicsCompat.TextDirectionHeuristicInternal DEFAULT_TEXT_DIRECTION_HEURISTIC;
    public static final String LRM_STRING = Character.toString(8206);
    public static final String RLM_STRING = Character.toString(8207);
    public final TextDirectionHeuristicCompat mDefaultTextDirectionHeuristicCompat;
    public final int mFlags;
    public final boolean mIsRtlContext;

    /* loaded from: classes.dex */
    public static class DirectionalityEstimator {
        public static final byte[] DIR_TYPE_CACHE = new byte[1792];
        public int charIndex;
        public char lastChar;
        public final int length;
        public final CharSequence text;

        static {
            for (int i = 0; i < 1792; i++) {
                DIR_TYPE_CACHE[i] = Character.getDirectionality(i);
            }
        }

        public final byte dirTypeBackward() {
            char charAt = this.text.charAt(this.charIndex - 1);
            this.lastChar = charAt;
            if (Character.isLowSurrogate(charAt)) {
                int codePointBefore = Character.codePointBefore(this.text, this.charIndex);
                this.charIndex -= Character.charCount(codePointBefore);
                return Character.getDirectionality(codePointBefore);
            }
            this.charIndex--;
            char c = this.lastChar;
            if (c < 1792) {
                return DIR_TYPE_CACHE[c];
            }
            return Character.getDirectionality(c);
        }

        public DirectionalityEstimator(String str) {
            this.text = str;
            this.length = str.length();
        }
    }

    static {
        TextDirectionHeuristicsCompat.TextDirectionHeuristicInternal textDirectionHeuristicInternal = TextDirectionHeuristicsCompat.FIRSTSTRONG_LTR;
        DEFAULT_TEXT_DIRECTION_HEURISTIC = textDirectionHeuristicInternal;
        DEFAULT_LTR_INSTANCE = new BidiFormatter(false, 2, textDirectionHeuristicInternal);
        DEFAULT_RTL_INSTANCE = new BidiFormatter(true, 2, textDirectionHeuristicInternal);
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x0070, code lost:
        if (r3 != 0) goto L27;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x0073, code lost:
        if (r4 == 0) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x0079, code lost:
        if (r0.charIndex <= 0) goto L58;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x007f, code lost:
        switch(r0.dirTypeBackward()) {
            case 14: goto L61;
            case 15: goto L61;
            case 16: goto L60;
            case 17: goto L60;
            case 18: goto L59;
            default: goto L65;
        };
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x0083, code lost:
        r5 = r5 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x0086, code lost:
        if (r3 != r5) goto L38;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x008a, code lost:
        if (r3 != r5) goto L38;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x008e, code lost:
        r5 = r5 - 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x0091, code lost:
        return r4;
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:?, code lost:
        return 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:?, code lost:
        return 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:71:?, code lost:
        return 0;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static int getEntryDir(java.lang.String r9) {
        /*
            androidx.core.text.BidiFormatter$DirectionalityEstimator r0 = new androidx.core.text.BidiFormatter$DirectionalityEstimator
            r0.<init>(r9)
            r9 = 0
            r0.charIndex = r9
            r1 = -1
            r2 = 1
            r3 = r9
            r4 = r3
            r5 = r4
        Ld:
            int r6 = r0.charIndex
            int r7 = r0.length
            if (r6 >= r7) goto L70
            if (r3 != 0) goto L70
            java.lang.CharSequence r7 = r0.text
            char r6 = r7.charAt(r6)
            r0.lastChar = r6
            boolean r6 = java.lang.Character.isHighSurrogate(r6)
            if (r6 == 0) goto L39
            java.lang.CharSequence r6 = r0.text
            int r7 = r0.charIndex
            int r6 = java.lang.Character.codePointAt(r6, r7)
            int r7 = r0.charIndex
            int r8 = java.lang.Character.charCount(r6)
            int r8 = r8 + r7
            r0.charIndex = r8
            byte r6 = java.lang.Character.getDirectionality(r6)
            goto L4d
        L39:
            int r6 = r0.charIndex
            int r6 = r6 + r2
            r0.charIndex = r6
            char r6 = r0.lastChar
            r7 = 1792(0x700, float:2.511E-42)
            if (r6 >= r7) goto L49
            byte[] r7 = androidx.core.text.BidiFormatter.DirectionalityEstimator.DIR_TYPE_CACHE
            r6 = r7[r6]
            goto L4d
        L49:
            byte r6 = java.lang.Character.getDirectionality(r6)
        L4d:
            if (r6 == 0) goto L6b
            if (r6 == r2) goto L68
            r7 = 2
            if (r6 == r7) goto L68
            r7 = 9
            if (r6 == r7) goto Ld
            switch(r6) {
                case 14: goto L64;
                case 15: goto L64;
                case 16: goto L60;
                case 17: goto L60;
                case 18: goto L5c;
                default: goto L5b;
            }
        L5b:
            goto L6e
        L5c:
            int r5 = r5 + (-1)
            r4 = r9
            goto Ld
        L60:
            int r5 = r5 + 1
            r4 = r2
            goto Ld
        L64:
            int r5 = r5 + 1
            r4 = r1
            goto Ld
        L68:
            if (r5 != 0) goto L6e
            goto L88
        L6b:
            if (r5 != 0) goto L6e
            goto L8c
        L6e:
            r3 = r5
            goto Ld
        L70:
            if (r3 != 0) goto L73
            goto L91
        L73:
            if (r4 == 0) goto L77
            r9 = r4
            goto L91
        L77:
            int r4 = r0.charIndex
            if (r4 <= 0) goto L91
            byte r4 = r0.dirTypeBackward()
            switch(r4) {
                case 14: goto L8a;
                case 15: goto L8a;
                case 16: goto L86;
                case 17: goto L86;
                case 18: goto L83;
                default: goto L82;
            }
        L82:
            goto L77
        L83:
            int r5 = r5 + 1
            goto L77
        L86:
            if (r3 != r5) goto L8e
        L88:
            r9 = r2
            goto L91
        L8a:
            if (r3 != r5) goto L8e
        L8c:
            r9 = r1
            goto L91
        L8e:
            int r5 = r5 + (-1)
            goto L77
        L91:
            return r9
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.core.text.BidiFormatter.getEntryDir(java.lang.String):int");
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x0041, code lost:
        return 1;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static int getExitDir(java.lang.String r6) {
        /*
            androidx.core.text.BidiFormatter$DirectionalityEstimator r0 = new androidx.core.text.BidiFormatter$DirectionalityEstimator
            r0.<init>(r6)
            int r6 = r0.length
            r0.charIndex = r6
            r6 = 0
            r1 = r6
        Lb:
            r2 = r1
        Lc:
            int r3 = r0.charIndex
            r4 = 1
            if (r3 <= 0) goto L41
            byte r3 = r0.dirTypeBackward()
            if (r3 == 0) goto L39
            if (r3 == r4) goto L32
            r5 = 2
            if (r3 == r5) goto L32
            r5 = 9
            if (r3 == r5) goto Lc
            switch(r3) {
                case 14: goto L2c;
                case 15: goto L2c;
                case 16: goto L29;
                case 17: goto L29;
                case 18: goto L26;
                default: goto L23;
            }
        L23:
            if (r1 != 0) goto Lc
            goto L3f
        L26:
            int r2 = r2 + 1
            goto Lc
        L29:
            if (r1 != r2) goto L2f
            goto L34
        L2c:
            if (r1 != r2) goto L2f
            goto L3b
        L2f:
            int r2 = r2 + (-1)
            goto Lc
        L32:
            if (r2 != 0) goto L36
        L34:
            r6 = r4
            goto L41
        L36:
            if (r1 != 0) goto Lc
            goto L3f
        L39:
            if (r2 != 0) goto L3d
        L3b:
            r6 = -1
            goto L41
        L3d:
            if (r1 != 0) goto Lc
        L3f:
            r1 = r2
            goto Lb
        L41:
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.core.text.BidiFormatter.getExitDir(java.lang.String):int");
    }

    public BidiFormatter(boolean z, int i, TextDirectionHeuristicsCompat.TextDirectionHeuristicInternal textDirectionHeuristicInternal) {
        this.mIsRtlContext = z;
        this.mFlags = i;
        this.mDefaultTextDirectionHeuristicCompat = textDirectionHeuristicInternal;
    }
}
