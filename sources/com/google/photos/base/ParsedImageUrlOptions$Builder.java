package com.google.photos.base;

import java.util.EnumMap;
/* loaded from: classes.dex */
public final class ParsedImageUrlOptions$Builder {
    public EnumMap existingOptionTokenInfoMap;
    public String existingOptionString = "";
    public EnumMap newOptionMap = new EnumMap(ImageUrlOptionsEnum.class);

    /* JADX WARN: Code restructure failed: missing block: B:18:0x0047, code lost:
        if (((com.google.photos.base.ParsedImageUrlOptions$OptionState) r1.get(r6)).signed != false) goto L23;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void setIsSigned(com.google.photos.base.ImageUrlOptionsEnum r6, boolean r7) {
        /*
            Method dump skipped, instructions count: 314
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.photos.base.ParsedImageUrlOptions$Builder.setIsSigned(com.google.photos.base.ImageUrlOptionsEnum, boolean):void");
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x0041, code lost:
        if (r9.isInfinite() == false) goto L18;
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x004f, code lost:
        if (((java.lang.Long) r8).longValue() >= 0) goto L18;
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x0059, code lost:
        if (((java.lang.Integer) r8).intValue() >= 0) goto L18;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void setOptionWithReadableError(com.google.photos.base.ImageUrlOptionsEnum r7, java.lang.Object r8, java.lang.String r9) {
        /*
            r6 = this;
            if (r8 == 0) goto L87
            com.google.photos.base.ImageUrlOptionType r9 = r7.getOptionType()
            int r9 = r9.ordinal()
            r0 = 1
            r1 = 0
            switch(r9) {
                case 0: goto L6e;
                case 1: goto L67;
                case 2: goto L5e;
                case 3: goto L52;
                case 4: goto L44;
                case 5: goto L34;
                case 6: goto L6e;
                default: goto Lf;
            }
        Lf:
            java.lang.RuntimeException r6 = new java.lang.RuntimeException
            com.google.photos.base.ImageUrlOptionType r7 = r7.getOptionType()
            java.lang.String r7 = java.lang.String.valueOf(r7)
            int r8 = r7.length()
            int r8 = r8 + 24
            java.lang.StringBuilder r9 = new java.lang.StringBuilder
            r9.<init>(r8)
            java.lang.String r8 = "Unexpected option type: "
            r9.append(r8)
            r9.append(r7)
            java.lang.String r7 = r9.toString()
            r6.<init>(r7)
            throw r6
        L34:
            r9 = r8
            java.lang.Float r9 = (java.lang.Float) r9
            boolean r2 = r9.isNaN()
            if (r2 != 0) goto L5c
            boolean r9 = r9.isInfinite()
            if (r9 != 0) goto L5c
            goto L6e
        L44:
            r9 = r8
            java.lang.Long r9 = (java.lang.Long) r9
            long r2 = r9.longValue()
            r4 = 0
            int r9 = (r2 > r4 ? 1 : (r2 == r4 ? 0 : -1))
            if (r9 < 0) goto L5c
            goto L6e
        L52:
            r9 = r8
            java.lang.Integer r9 = (java.lang.Integer) r9
            int r9 = r9.intValue()
            if (r9 < 0) goto L5c
            goto L6e
        L5c:
            r0 = r1
            goto L6e
        L5e:
            r9 = r8
            java.lang.String r9 = (java.lang.String) r9
            boolean r9 = r9.isEmpty()
            r0 = r0 ^ r9
            goto L6e
        L67:
            r9 = r8
            java.lang.Boolean r9 = (java.lang.Boolean) r9
            boolean r0 = r9.booleanValue()
        L6e:
            if (r0 != 0) goto L7c
            com.google.photos.base.ParsedImageUrlOptions$OptionState r8 = new com.google.photos.base.ParsedImageUrlOptions$OptionState
            r9 = 0
            r8.<init>(r9, r1)
            java.util.EnumMap r6 = r6.newOptionMap
            r6.put(r7, r8)
            goto L86
        L7c:
            com.google.photos.base.ParsedImageUrlOptions$OptionState r9 = new com.google.photos.base.ParsedImageUrlOptions$OptionState
            r9.<init>(r8, r1)
            java.util.EnumMap r6 = r6.newOptionMap
            r6.put(r7, r9)
        L86:
            return
        L87:
            java.lang.NullPointerException r6 = new java.lang.NullPointerException
            int r7 = r9.length()
            int r7 = r7 + 51
            java.lang.String r8 = "Cannot set an option to null. Did you mean clear"
            java.lang.String r0 = "()?"
            java.lang.String r7 = com.adobe.xmp.impl.XMPNode$$ExternalSyntheticOutline0.m(r7, r8, r9, r0)
            r6.<init>(r7)
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.photos.base.ParsedImageUrlOptions$Builder.setOptionWithReadableError(com.google.photos.base.ImageUrlOptionsEnum, java.lang.Object, java.lang.String):void");
    }

    public ParsedImageUrlOptions$Builder() {
        EnumMap enumMap = new EnumMap(ImageUrlOptionsEnum.class);
        this.existingOptionTokenInfoMap = enumMap;
    }
}
