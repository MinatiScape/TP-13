package com.android.systemui.unfold.updates;

import com.android.systemui.statusbar.policy.CallbackController;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
/* loaded from: classes.dex */
public interface FoldStateProvider extends CallbackController<FoldUpdatesListener> {

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes.dex */
    public @interface FoldUpdate {
    }

    /* loaded from: classes.dex */
    public interface FoldUpdatesListener {
        void onFoldUpdate(int i);

        void onHingeAngleUpdate(float f);
    }

    boolean isFullyOpened();

    void start();

    void stop();
}
