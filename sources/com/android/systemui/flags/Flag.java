package com.android.systemui.flags;

import android.os.Parcelable;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public interface Flag<T> extends Parcelable {

    /* loaded from: classes.dex */
    public static final class DefaultImpls {
        public static <T> int describeContents(@NotNull Flag<T> flag) {
            Intrinsics.checkNotNullParameter(flag, "this");
            return 0;
        }

        public static <T> boolean hasResourceOverride(@NotNull Flag<T> flag) {
            Intrinsics.checkNotNullParameter(flag, "this");
            return flag.getResourceOverride() != -1;
        }
    }

    @Override // android.os.Parcelable
    int describeContents();

    T getDefault();

    int getId();

    int getResourceOverride();

    boolean hasResourceOverride();
}
