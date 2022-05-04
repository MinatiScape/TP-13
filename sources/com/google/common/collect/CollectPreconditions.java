package com.google.common.collect;

import com.adobe.xmp.impl.XMPNode$$ExternalSyntheticOutline0;
import com.google.common.base.Preconditions;
/* loaded from: classes.dex */
public final class CollectPreconditions {
    public static void checkEntryNotNull(Object key, Object value) {
        if (key == null) {
            String valueOf = String.valueOf(value);
            StringBuilder sb = new StringBuilder(valueOf.length() + 24);
            sb.append("null key in entry: null=");
            sb.append(valueOf);
            throw new NullPointerException(sb.toString());
        } else if (value == null) {
            String valueOf2 = String.valueOf(key);
            throw new NullPointerException(XMPNode$$ExternalSyntheticOutline0.m(valueOf2.length() + 26, "null value in entry: ", valueOf2, "=null"));
        }
    }

    public static void checkNonnegative(int value, String name) {
        if (value < 0) {
            StringBuilder sb = new StringBuilder(name.length() + 40);
            sb.append(name);
            sb.append(" cannot be negative but was: ");
            sb.append(value);
            throw new IllegalArgumentException(sb.toString());
        }
    }

    public static void checkRemove(boolean canRemove) {
        Preconditions.checkState(canRemove, "no calls to next() since the last call to remove()");
    }
}
