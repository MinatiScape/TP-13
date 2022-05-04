package androidx.activity;

import android.content.IntentFilter;
import androidx.core.widget.ContentLoadingProgressBar;
import androidx.core.widget.ContentLoadingProgressBar$$ExternalSyntheticLambda0;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleRegistry;
import com.android.customization.model.mode.DarkModeSectionController;
import com.google.android.apps.wallpaper.module.ClearcutUserEventLogger;
import java.util.ArrayList;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class ComponentActivity$$ExternalSyntheticLambda2 implements Runnable {
    public final /* synthetic */ int $r8$classId;
    public final /* synthetic */ Object f$0;

    public /* synthetic */ ComponentActivity$$ExternalSyntheticLambda2(Object obj, int i) {
        this.$r8$classId = i;
        this.f$0 = obj;
    }

    @Override // java.lang.Runnable
    public final void run() {
        boolean z = false;
        switch (this.$r8$classId) {
            case 0:
                ((ComponentActivity) this.f$0).invalidateOptionsMenu();
                return;
            case 1:
                DarkModeSectionController darkModeSectionController = (DarkModeSectionController) this.f$0;
                if (darkModeSectionController.mContext != null && ((LifecycleRegistry) darkModeSectionController.mLifecycle).mState.isAtLeast(Lifecycle.State.STARTED)) {
                    darkModeSectionController.mContext.registerReceiver(darkModeSectionController.mBatterySaverStateReceiver, new IntentFilter("android.os.action.POWER_SAVE_MODE_CHANGED"));
                    return;
                }
                return;
            case 2:
                ContentLoadingProgressBar contentLoadingProgressBar = (ContentLoadingProgressBar) this.f$0;
                contentLoadingProgressBar.getClass();
                contentLoadingProgressBar.post(new ContentLoadingProgressBar$$ExternalSyntheticLambda0(contentLoadingProgressBar, 0));
                return;
            default:
                ClearcutUserEventLogger clearcutUserEventLogger = (ClearcutUserEventLogger) this.f$0;
                if (clearcutUserEventLogger.mPreferences.getWallpaperPresentationMode() == 2) {
                    z = true;
                }
                ArrayList dailyRotationsInLastWeek = clearcutUserEventLogger.mPreferences.getDailyRotationsInLastWeek();
                if (z && dailyRotationsInLastWeek != null) {
                    clearcutUserEventLogger.mCounters.getIntegerHistogram("DailyWallpaper.NumRotationsInLastWeek").incrementBase(dailyRotationsInLastWeek.size());
                    clearcutUserEventLogger.mCounters.logAllAsync();
                    return;
                }
                return;
        }
    }
}
