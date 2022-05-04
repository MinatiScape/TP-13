package com.google.common.base;
/* loaded from: classes.dex */
public final class Objects {
    public static boolean equal(Object a, Object b) {
        return a == b || (a != null && a.equals(b));
    }
}
