package com.adobe.xmp.impl;
/* loaded from: classes.dex */
public final class Utils {
    public static boolean[] xmlNameChars = new boolean[256];
    public static boolean[] xmlNameStartChars = new boolean[256];

    public static boolean isControlChar(char c) {
        return ((c > 31 && c != 127) || c == '\t' || c == '\n' || c == '\r') ? false : true;
    }

    static {
        boolean z;
        char c = 0;
        while (true) {
            boolean[] zArr = xmlNameChars;
            if (c < zArr.length) {
                boolean[] zArr2 = xmlNameStartChars;
                boolean z2 = true;
                if (('a' > c || c > 'z') && (('A' > c || c > 'Z') && c != ':' && c != '_' && ((192 > c || c > 214) && (216 > c || c > 246)))) {
                    z = false;
                } else {
                    z = true;
                }
                zArr2[c] = z;
                if (('a' > c || c > 'z') && (('A' > c || c > 'Z') && !(('0' <= c && c <= '9') || c == ':' || c == '_' || c == '-' || c == '.' || c == 183 || ((192 <= c && c <= 214) || (216 <= c && c <= 246))))) {
                    z2 = false;
                }
                zArr[c] = z2;
                c = (char) (c + 1);
            } else {
                return;
            }
        }
    }

    public static String normalizeLangValue(String value) {
        if ("x-default".equals(value)) {
            return value;
        }
        StringBuffer stringBuffer = new StringBuffer();
        int i = 1;
        for (int i2 = 0; i2 < value.length(); i2++) {
            char charAt = value.charAt(i2);
            if (charAt != ' ') {
                if (charAt == '-' || charAt == '_') {
                    stringBuffer.append('-');
                    i++;
                } else if (i != 2) {
                    stringBuffer.append(Character.toLowerCase(value.charAt(i2)));
                } else {
                    stringBuffer.append(Character.toUpperCase(value.charAt(i2)));
                }
            }
        }
        return stringBuffer.toString();
    }

    public static String[] splitNameAndValue(String selector) {
        int i;
        int indexOf = selector.indexOf(61);
        if (selector.charAt(1) == '?') {
            i = 2;
        } else {
            i = 1;
        }
        String substring = selector.substring(i, indexOf);
        int i2 = indexOf + 1;
        char charAt = selector.charAt(i2);
        int i3 = i2 + 1;
        int length = selector.length() - 2;
        StringBuffer stringBuffer = new StringBuffer(length - indexOf);
        while (i3 < length) {
            stringBuffer.append(selector.charAt(i3));
            i3++;
            if (selector.charAt(i3) == charAt) {
                i3++;
            }
        }
        return new String[]{substring, stringBuffer.toString()};
    }

    public static boolean isXMLNameNS(String name) {
        boolean z;
        boolean z2;
        if (name.length() > 0) {
            char charAt = name.charAt(0);
            if (charAt > 255 || xmlNameStartChars[charAt]) {
                z2 = true;
            } else {
                z2 = false;
            }
            if (!z2 || name.charAt(0) == ':') {
                return false;
            }
        }
        for (int i = 1; i < name.length(); i++) {
            char charAt2 = name.charAt(i);
            if (charAt2 > 255 || xmlNameChars[charAt2]) {
                z = true;
            } else {
                z = false;
            }
            if (!z || name.charAt(i) == ':') {
                return false;
            }
        }
        return true;
    }
}
