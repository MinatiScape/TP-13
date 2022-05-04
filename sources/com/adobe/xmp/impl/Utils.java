package com.adobe.xmp.impl;
/* loaded from: classes.dex */
public class Utils {
    public static boolean[] xmlNameChars = new boolean[256];
    public static boolean[] xmlNameStartChars = new boolean[256];

    static {
        char c = 0;
        while (true) {
            boolean[] zArr = xmlNameChars;
            if (c < zArr.length) {
                boolean z = true;
                xmlNameStartChars[c] = ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == ':' || c == '_' || ((192 <= c && c <= 214) || (216 <= c && c <= 246));
                if (('a' > c || c > 'z') && (('A' > c || c > 'Z') && !(('0' <= c && c <= '9') || c == ':' || c == '_' || c == '-' || c == '.' || c == 183 || ((192 <= c && c <= 214) || (216 <= c && c <= 246))))) {
                    z = false;
                }
                zArr[c] = z;
                c = (char) (c + 1);
            } else {
                return;
            }
        }
    }

    public static boolean isControlChar(char c) {
        return ((c > 31 && c != 127) || c == '\t' || c == '\n' || c == '\r') ? false : true;
    }

    public static boolean isXMLNameNS(String name) {
        if (name.length() > 0) {
            char charAt = name.charAt(0);
            if (!(charAt > 255 || xmlNameStartChars[charAt]) || name.charAt(0) == ':') {
                return false;
            }
        }
        for (int i = 1; i < name.length(); i++) {
            char charAt2 = name.charAt(i);
            if (!(charAt2 > 255 || xmlNameChars[charAt2]) || name.charAt(i) == ':') {
                return false;
            }
        }
        return true;
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
        int indexOf = selector.indexOf(61);
        String substring = selector.substring(selector.charAt(1) == '?' ? 2 : 1, indexOf);
        int i = indexOf + 1;
        char charAt = selector.charAt(i);
        int i2 = i + 1;
        int length = selector.length() - 2;
        StringBuffer stringBuffer = new StringBuffer(length - indexOf);
        while (i2 < length) {
            stringBuffer.append(selector.charAt(i2));
            i2++;
            if (selector.charAt(i2) == charAt) {
                i2++;
            }
        }
        return new String[]{substring, stringBuffer.toString()};
    }
}
