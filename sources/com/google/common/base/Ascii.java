package com.google.common.base;
/* loaded from: classes.dex */
public final class Ascii {
    public static String toLowerCase(String string) {
        boolean z;
        boolean z2;
        int length = string.length();
        int i = 0;
        while (i < length) {
            char charAt = string.charAt(i);
            if (charAt < 'A' || charAt > 'Z') {
                z = false;
            } else {
                z = true;
            }
            if (z) {
                char[] charArray = string.toCharArray();
                while (i < length) {
                    char c = charArray[i];
                    if (c < 'A' || c > 'Z') {
                        z2 = false;
                    } else {
                        z2 = true;
                    }
                    if (z2) {
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
