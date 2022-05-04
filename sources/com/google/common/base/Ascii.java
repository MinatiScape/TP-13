package com.google.common.base;
/* loaded from: classes.dex */
public final class Ascii {
    public static String toLowerCase(String string) {
        int length = string.length();
        int i = 0;
        while (i < length) {
            char charAt = string.charAt(i);
            if (charAt >= 'A' && charAt <= 'Z') {
                char[] charArray = string.toCharArray();
                while (i < length) {
                    char c = charArray[i];
                    if (c >= 'A' && c <= 'Z') {
                        charArray[i] = (char) (c ^ ' ');
                    }
                    i++;
                }
                return String.valueOf(charArray);
            }
            i++;
        }
        return string;
    }
}
