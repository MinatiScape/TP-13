package com.android.systemui.flags;

import android.content.ContentResolver;
import android.database.ContentObserver;
import android.provider.Settings;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
/* compiled from: FlagSettingsHelper.kt */
/* loaded from: classes.dex */
public final class FlagSettingsHelper {
    @NotNull
    private final ContentResolver contentResolver;

    public FlagSettingsHelper(@NotNull ContentResolver contentResolver) {
        Intrinsics.checkNotNullParameter(contentResolver, "contentResolver");
        this.contentResolver = contentResolver;
    }

    @Nullable
    public final String getString(@NotNull String key) {
        Intrinsics.checkNotNullParameter(key, "key");
        return Settings.Secure.getString(this.contentResolver, key);
    }

    public final void registerContentObserver(@NotNull String name, boolean z, @NotNull ContentObserver observer) {
        Intrinsics.checkNotNullParameter(name, "name");
        Intrinsics.checkNotNullParameter(observer, "observer");
        this.contentResolver.registerContentObserver(Settings.Secure.getUriFor(name), z, observer);
    }

    public final void unregisterContentObserver(@NotNull ContentObserver observer) {
        Intrinsics.checkNotNullParameter(observer, "observer");
        this.contentResolver.unregisterContentObserver(observer);
    }
}
