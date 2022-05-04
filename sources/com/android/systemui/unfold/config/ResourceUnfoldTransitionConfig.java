package com.android.systemui.unfold.config;

import android.content.Context;
import android.os.SystemProperties;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
/* compiled from: ResourceUnfoldTransitionConfig.kt */
/* loaded from: classes.dex */
public final class ResourceUnfoldTransitionConfig implements UnfoldTransitionConfig {
    @NotNull
    private final Context context;

    public ResourceUnfoldTransitionConfig(@NotNull Context context) {
        Intrinsics.checkNotNullParameter(context, "context");
        this.context = context;
    }

    private final boolean isPropertyEnabled() {
        if (SystemProperties.getInt("persist.unfold.transition_enabled", 1) == 1) {
            return true;
        }
        return false;
    }

    private final boolean readIsEnabledResource() {
        return this.context.getResources().getBoolean(17891789);
    }

    private final boolean readIsHingeAngleEnabled() {
        return this.context.getResources().getBoolean(17891790);
    }

    @Override // com.android.systemui.unfold.config.UnfoldTransitionConfig
    public boolean isEnabled() {
        if (!readIsEnabledResource() || !isPropertyEnabled()) {
            return false;
        }
        return true;
    }

    @Override // com.android.systemui.unfold.config.UnfoldTransitionConfig
    public boolean isHingeAngleEnabled() {
        return readIsHingeAngleEnabled();
    }
}
