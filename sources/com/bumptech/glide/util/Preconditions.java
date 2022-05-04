package com.bumptech.glide.util;
/* loaded from: classes.dex */
public final class Preconditions {
    public static void checkArgument(boolean expression, String message) {
        if (!expression) {
            throw new IllegalArgumentException(message);
        }
    }
}
