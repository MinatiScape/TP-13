package com.android.systemui.flags;

import android.os.Parcelable;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: Flag.kt */
/* loaded from: classes.dex */
public interface ParcelableFlag<T> extends Flag<T>, Parcelable {

    /* compiled from: Flag.kt */
    /* loaded from: classes.dex */
    public static final class DefaultImpls {
        public static <T> int describeContents(@NotNull ParcelableFlag<T> parcelableFlag) {
            Intrinsics.checkNotNullParameter(parcelableFlag, "this");
            return 0;
        }
    }

    int describeContents();

    T getDefault();
}
