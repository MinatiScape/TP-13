package com.google.common.base;

import com.adobe.xmp.impl.ParseRDF$$ExternalSyntheticOutline0;
import java.util.logging.Level;
import java.util.logging.Logger;
/* loaded from: classes.dex */
public final class Strings {
    public static String lenientFormat(String template, Object... args) {
        int indexOf;
        String str;
        String str2;
        int i = 0;
        for (int i2 = 0; i2 < args.length; i2++) {
            Object obj = args[i2];
            try {
                str = String.valueOf(obj);
            } catch (Exception e) {
                String name = obj.getClass().getName();
                String hexString = Integer.toHexString(System.identityHashCode(obj));
                StringBuilder sb = new StringBuilder(ParseRDF$$ExternalSyntheticOutline0.m(hexString, name.length() + 1));
                sb.append(name);
                sb.append('@');
                sb.append(hexString);
                String sb2 = sb.toString();
                Logger logger = Logger.getLogger("com.google.common.base.Strings");
                Level level = Level.WARNING;
                String valueOf = String.valueOf(sb2);
                if (valueOf.length() != 0) {
                    str2 = "Exception during lenientFormat for ".concat(valueOf);
                } else {
                    str2 = new String("Exception during lenientFormat for ");
                }
                logger.logp(level, "com.google.common.base.Strings", "lenientToString", str2, (Throwable) e);
                String name2 = e.getClass().getName();
                StringBuilder sb3 = new StringBuilder(name2.length() + ParseRDF$$ExternalSyntheticOutline0.m(sb2, 9));
                sb3.append("<");
                sb3.append(sb2);
                sb3.append(" threw ");
                sb3.append(name2);
                sb3.append(">");
                str = sb3.toString();
            }
            args[i2] = str;
        }
        StringBuilder sb4 = new StringBuilder((args.length * 16) + template.length());
        int i3 = 0;
        while (i < args.length && (indexOf = template.indexOf("%s", i3)) != -1) {
            sb4.append((CharSequence) template, i3, indexOf);
            sb4.append(args[i]);
            i3 = indexOf + 2;
            i++;
        }
        sb4.append((CharSequence) template, i3, template.length());
        if (i < args.length) {
            sb4.append(" [");
            sb4.append(args[i]);
            for (int i4 = i + 1; i4 < args.length; i4++) {
                sb4.append(", ");
                sb4.append(args[i4]);
            }
            sb4.append(']');
        }
        return sb4.toString();
    }

    public static boolean validSurrogatePairAt(CharSequence string, int index) {
        return index >= 0 && index <= string.length() + (-2) && Character.isHighSurrogate(string.charAt(index)) && Character.isLowSurrogate(string.charAt(index + 1));
    }
}
