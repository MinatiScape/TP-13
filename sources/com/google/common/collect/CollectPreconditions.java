package com.google.common.collect;

import androidx.viewpager2.widget.FakeDrag$$ExternalSyntheticOutline0;
import com.bumptech.glide.Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline0;
/* loaded from: classes.dex */
public final class CollectPreconditions {
    public static void checkEntryNotNull(Object key, Object value) {
        if (key == null) {
            String valueOf = String.valueOf(value);
            throw new NullPointerException(Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline0.m(valueOf.length() + 24, "null key in entry: null=", valueOf));
        } else if (value == null) {
            String valueOf2 = String.valueOf(key);
            throw new NullPointerException(FakeDrag$$ExternalSyntheticOutline0.m(valueOf2.length() + 26, "null value in entry: ", valueOf2, "=null"));
        }
    }

    public static int checkNonnegative(int value, String name) {
        if (value >= 0) {
            return value;
        }
        StringBuilder sb = new StringBuilder(name.length() + 40);
        sb.append(name);
        sb.append(" cannot be negative but was: ");
        sb.append(value);
        throw new IllegalArgumentException(sb.toString());
    }
}
