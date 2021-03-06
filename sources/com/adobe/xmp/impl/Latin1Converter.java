package com.adobe.xmp.impl;

import java.io.UnsupportedEncodingException;
/* loaded from: classes.dex */
public final class Latin1Converter {
    public static byte[] convertToUTF8(byte ch) {
        int i = ch & 255;
        if (i >= 128) {
            try {
                return (i == 129 || i == 141 || i == 143 || i == 144 || i == 157) ? new byte[]{32} : new String(new byte[]{ch}, "cp1252").getBytes("UTF-8");
            } catch (UnsupportedEncodingException unused) {
            }
        }
        return new byte[]{ch};
    }
}
