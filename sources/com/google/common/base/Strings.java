package com.google.common.base;

import androidx.recyclerview.R$attr$$ExternalSyntheticOutline0;
import com.adobe.xmp.XMPPathFactory$$ExternalSyntheticOutline0;
import java.util.logging.Level;
import java.util.logging.Logger;
/* loaded from: classes.dex */
public final class Strings {
    public static String lenientFormat(String template, Object... args) {
        int indexOf;
        String str;
        String valueOf = String.valueOf(template);
        int i = 0;
        for (int i2 = 0; i2 < args.length; i2++) {
            Object obj = args[i2];
            try {
                str = String.valueOf(obj);
            } catch (Exception e) {
                String name = obj.getClass().getName();
                String hexString = Integer.toHexString(System.identityHashCode(obj));
                StringBuilder sb = new StringBuilder(XMPPathFactory$$ExternalSyntheticOutline0.m(hexString, name.length() + 1));
                sb.append(name);
                sb.append('@');
                sb.append(hexString);
                String sb2 = sb.toString();
                Logger logger = Logger.getLogger("com.google.common.base.Strings");
                Level level = Level.WARNING;
                String valueOf2 = String.valueOf(sb2);
                logger.logp(level, "com.google.common.base.Strings", "lenientToString", valueOf2.length() != 0 ? "Exception during lenientFormat for ".concat(valueOf2) : new String("Exception during lenientFormat for "), (Throwable) e);
                String name2 = e.getClass().getName();
                StringBuilder m = R$attr$$ExternalSyntheticOutline0.m(name2.length() + XMPPathFactory$$ExternalSyntheticOutline0.m(sb2, 9), "<", sb2, " threw ", name2);
                m.append(">");
                str = m.toString();
            }
            args[i2] = str;
        }
        StringBuilder sb3 = new StringBuilder((args.length * 16) + valueOf.length());
        int i3 = 0;
        while (i < args.length && (indexOf = valueOf.indexOf("%s", i3)) != -1) {
            sb3.append((CharSequence) valueOf, i3, indexOf);
            i++;
            sb3.append(args[i]);
            i3 = indexOf + 2;
        }
        sb3.append((CharSequence) valueOf, i3, valueOf.length());
        if (i < args.length) {
            sb3.append(" [");
            int i4 = i + 1;
            sb3.append(args[i]);
            while (i4 < args.length) {
                sb3.append(", ");
                i4++;
                sb3.append(args[i4]);
            }
            sb3.append(']');
        }
        return sb3.toString();
    }

    public static boolean validSurrogatePairAt(CharSequence string, int index) {
        return index >= 0 && index <= string.length() + (-2) && Character.isHighSurrogate(string.charAt(index)) && Character.isLowSurrogate(string.charAt(index + 1));
    }
}
