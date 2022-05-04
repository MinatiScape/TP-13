package com.android.systemui.unfold.updates.screen;

import com.android.systemui.statusbar.policy.CallbackController;
/* loaded from: classes.dex */
public interface ScreenStatusProvider extends CallbackController<ScreenListener> {

    /* loaded from: classes.dex */
    public interface ScreenListener {
        void onScreenTurnedOn();
    }
}
