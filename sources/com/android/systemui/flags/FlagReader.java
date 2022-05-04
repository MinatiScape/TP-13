package com.android.systemui.flags;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* loaded from: classes.dex */
public interface FlagReader {

    /* loaded from: classes.dex */
    public static final class DefaultImpls {
        public static void addListener(@NotNull FlagReader flagReader, @NotNull Listener listener) {
            Intrinsics.checkNotNullParameter(flagReader, "this");
            Intrinsics.checkNotNullParameter(listener, "listener");
        }

        public static boolean isEnabled(@NotNull FlagReader flagReader, int i, boolean z) {
            Intrinsics.checkNotNullParameter(flagReader, "this");
            return z;
        }

        public static boolean isEnabled(@NotNull FlagReader flagReader, @NotNull BooleanFlag flag) {
            Intrinsics.checkNotNullParameter(flagReader, "this");
            Intrinsics.checkNotNullParameter(flag, "flag");
            return flag.getDefault().booleanValue();
        }

        public static void removeListener(@NotNull FlagReader flagReader, @NotNull Listener listener) {
            Intrinsics.checkNotNullParameter(flagReader, "this");
            Intrinsics.checkNotNullParameter(listener, "listener");
        }
    }

    /* loaded from: classes.dex */
    public interface Listener {
        void onFlagChanged(int i);
    }

    void addListener(@NotNull Listener listener);

    boolean isEnabled(int i, boolean z);

    boolean isEnabled(@NotNull BooleanFlag booleanFlag);

    void removeListener(@NotNull Listener listener);
}
