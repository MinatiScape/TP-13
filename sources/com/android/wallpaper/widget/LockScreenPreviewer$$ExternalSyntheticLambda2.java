package com.android.wallpaper.widget;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleRegistry;
import com.android.systemui.shared.rotation.RotationButtonController;
import com.android.wallpaper.model.WallpaperSectionController;
import com.android.wallpaper.util.WallpaperConnection;
import com.android.wallpaper.widget.LockScreenPreviewer;
import com.android.wallpaper.widget.LockScreenPreviewer$$ExternalSyntheticLambda0;
import java.util.concurrent.ExecutorService;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class LockScreenPreviewer$$ExternalSyntheticLambda2 implements Runnable {
    public final /* synthetic */ int $r8$classId;
    public final /* synthetic */ Object f$0;

    public /* synthetic */ LockScreenPreviewer$$ExternalSyntheticLambda2(Object obj, int i) {
        this.$r8$classId = i;
        this.f$0 = obj;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v0, types: [com.android.wallpaper.util.TimeUtils$TimeTicker, android.content.BroadcastReceiver] */
    @Override // java.lang.Runnable
    public final void run() {
        switch (this.$r8$classId) {
            case 0:
                LockScreenPreviewer lockScreenPreviewer = (LockScreenPreviewer) this.f$0;
                if (lockScreenPreviewer.mContext != null && ((LifecycleRegistry) lockScreenPreviewer.mLifecycle).mState.isAtLeast(Lifecycle.State.RESUMED)) {
                    Context context = lockScreenPreviewer.mContext;
                    ?? timeUtils$TimeTicker = new BroadcastReceiver(new LockScreenPreviewer$$ExternalSyntheticLambda0(lockScreenPreviewer)) { // from class: com.android.wallpaper.util.TimeUtils$TimeTicker
                        public TimeListener mListener;

                        /* loaded from: classes.dex */
                        public interface TimeListener {
                        }

                        @Override // android.content.BroadcastReceiver
                        public final void onReceive(Context context2, Intent intent) {
                            TimeListener timeListener = this.mListener;
                            if (timeListener != null) {
                                LockScreenPreviewer lockScreenPreviewer2 = ((LockScreenPreviewer$$ExternalSyntheticLambda0) timeListener).f$0;
                                ExecutorService executorService = LockScreenPreviewer.sExecutorService;
                                lockScreenPreviewer2.updateDateTime();
                            }
                        }

                        {
                            this.mListener = r1;
                        }
                    };
                    context.registerReceiver(timeUtils$TimeTicker, new IntentFilter("android.intent.action.TIME_TICK"));
                    lockScreenPreviewer.mTicker = timeUtils$TimeTicker;
                    return;
                }
                return;
            case 1:
                RotationButtonController.$r8$lambda$TN26GBhO0iajE6nDwh6BEL4qwA0((RotationButtonController) this.f$0);
                return;
            default:
                WallpaperSectionController wallpaperSectionController = (WallpaperSectionController) this.f$0;
                WallpaperConnection wallpaperConnection = wallpaperSectionController.mWallpaperConnection;
                if (wallpaperConnection != null && !wallpaperConnection.connect()) {
                    wallpaperSectionController.mWallpaperConnection = null;
                    return;
                }
                return;
        }
    }
}
