package com.android.wallpaper.widget;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleRegistry;
import com.android.wallpaper.picker.CategoryFragment$$ExternalSyntheticLambda4;
import com.android.wallpaper.util.TimeUtils$TimeTicker;
import com.android.wallpaper.widget.LockScreenPreviewer;
import java.util.concurrent.ExecutorService;
/* loaded from: classes.dex */
public final /* synthetic */ class LockScreenPreviewer$$ExternalSyntheticLambda0 implements Runnable {
    public final /* synthetic */ int $r8$classId;
    public final /* synthetic */ LockScreenPreviewer f$0;

    public /* synthetic */ LockScreenPreviewer$$ExternalSyntheticLambda0(LockScreenPreviewer lockScreenPreviewer, int i) {
        this.$r8$classId = i;
        this.f$0 = lockScreenPreviewer;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v2, types: [com.android.wallpaper.util.TimeUtils$TimeTicker, android.content.BroadcastReceiver] */
    @Override // java.lang.Runnable
    public final void run() {
        TimeUtils$TimeTicker timeUtils$TimeTicker;
        switch (this.$r8$classId) {
            case 0:
                LockScreenPreviewer lockScreenPreviewer = this.f$0;
                Context context = lockScreenPreviewer.mContext;
                if (context != null && (timeUtils$TimeTicker = lockScreenPreviewer.mTicker) != null) {
                    context.unregisterReceiver(timeUtils$TimeTicker);
                    lockScreenPreviewer.mTicker = null;
                    return;
                }
                return;
            default:
                LockScreenPreviewer lockScreenPreviewer2 = this.f$0;
                if (lockScreenPreviewer2.mContext != null) {
                    if (((LifecycleRegistry) lockScreenPreviewer2.mLifecycle).mState.compareTo(Lifecycle.State.RESUMED) >= 0) {
                        Context context2 = lockScreenPreviewer2.mContext;
                        ?? timeUtils$TimeTicker2 = new BroadcastReceiver(new CategoryFragment$$ExternalSyntheticLambda4(lockScreenPreviewer2, 1)) { // from class: com.android.wallpaper.util.TimeUtils$TimeTicker
                            public TimeListener mListener;

                            /* loaded from: classes.dex */
                            public interface TimeListener {
                            }

                            {
                                this.mListener = r1;
                            }

                            @Override // android.content.BroadcastReceiver
                            public void onReceive(Context context3, Intent intent) {
                                TimeListener timeListener = this.mListener;
                                if (timeListener != null) {
                                    LockScreenPreviewer lockScreenPreviewer3 = ((CategoryFragment$$ExternalSyntheticLambda4) timeListener).f$0;
                                    ExecutorService executorService = LockScreenPreviewer.sExecutorService;
                                    lockScreenPreviewer3.updateDateTime();
                                }
                            }
                        };
                        context2.registerReceiver(timeUtils$TimeTicker2, new IntentFilter("android.intent.action.TIME_TICK"));
                        lockScreenPreviewer2.mTicker = timeUtils$TimeTicker2;
                        return;
                    }
                    return;
                }
                return;
        }
    }
}
