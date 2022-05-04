package com.android.wallpaper.widget;

import android.content.Context;
import androidx.core.widget.ContentLoadingProgressBar;
import com.android.customization.model.mode.DarkModeSectionController;
import com.android.wallpaper.util.TimeUtils$TimeTicker;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class LockScreenPreviewer$$ExternalSyntheticLambda1 implements Runnable {
    public final /* synthetic */ int $r8$classId;
    public final /* synthetic */ Object f$0;

    public /* synthetic */ LockScreenPreviewer$$ExternalSyntheticLambda1(Object obj, int i) {
        this.$r8$classId = i;
        this.f$0 = obj;
    }

    @Override // java.lang.Runnable
    public final void run() {
        TimeUtils$TimeTicker timeUtils$TimeTicker;
        DarkModeSectionController.BatterySaverStateReceiver batterySaverStateReceiver;
        switch (this.$r8$classId) {
            case 0:
                LockScreenPreviewer lockScreenPreviewer = (LockScreenPreviewer) this.f$0;
                Context context = lockScreenPreviewer.mContext;
                if (context != null && (timeUtils$TimeTicker = lockScreenPreviewer.mTicker) != null) {
                    context.unregisterReceiver(timeUtils$TimeTicker);
                    lockScreenPreviewer.mTicker = null;
                    return;
                }
                return;
            case 1:
                DarkModeSectionController darkModeSectionController = (DarkModeSectionController) this.f$0;
                Context context2 = darkModeSectionController.mContext;
                if (context2 != null && (batterySaverStateReceiver = darkModeSectionController.mBatterySaverStateReceiver) != null) {
                    context2.unregisterReceiver(batterySaverStateReceiver);
                    return;
                }
                return;
            default:
                ((ContentLoadingProgressBar) this.f$0).hide();
                return;
        }
    }
}
