package com.android.systemui.shared.system;

import android.app.Activity;
/* loaded from: classes.dex */
public class ActivityCompat {
    private final Activity mWrapped;

    public void registerRemoteAnimations(RemoteAnimationDefinitionCompat remoteAnimationDefinitionCompat) {
        this.mWrapped.registerRemoteAnimations(remoteAnimationDefinitionCompat.getWrapped());
    }

    public void unregisterRemoteAnimations() {
        this.mWrapped.unregisterRemoteAnimations();
    }

    public ActivityCompat(Activity activity) {
        this.mWrapped = activity;
    }
}
