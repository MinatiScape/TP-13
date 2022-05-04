package com.android.customization.model.mode;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.PowerManager;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import androidx.activity.ComponentActivity$$ExternalSyntheticLambda2;
import androidx.core.content.ContextCompat;
import androidx.fragment.app.FragmentActivity;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleObserver;
import androidx.lifecycle.OnLifecycleEvent;
import com.android.customization.picker.mode.DarkModeSectionView;
import com.android.systemui.shared.R;
import com.android.wallpaper.model.CustomizationSectionController;
import com.android.wallpaper.widget.LockScreenPreviewer$$ExternalSyntheticLambda1;
import com.android.wallpaper.widget.PreviewPager$$ExternalSyntheticLambda2;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
/* loaded from: classes.dex */
public class DarkModeSectionController implements CustomizationSectionController<DarkModeSectionView>, LifecycleObserver {
    public static final ExecutorService sExecutorService = Executors.newSingleThreadExecutor();
    public final BatterySaverStateReceiver mBatterySaverStateReceiver = new BatterySaverStateReceiver();
    public Context mContext;
    public DarkModeSectionView mDarkModeSectionView;
    public final Lifecycle mLifecycle;
    public final PowerManager mPowerManager;

    /* loaded from: classes.dex */
    public class BatterySaverStateReceiver extends BroadcastReceiver {
        public BatterySaverStateReceiver() {
        }

        @Override // android.content.BroadcastReceiver
        public final void onReceive(Context context, Intent intent) {
            DarkModeSectionController darkModeSectionController;
            DarkModeSectionView darkModeSectionView;
            if (TextUtils.equals(intent.getAction(), "android.os.action.POWER_SAVE_MODE_CHANGED") && (darkModeSectionView = (darkModeSectionController = DarkModeSectionController.this).mDarkModeSectionView) != null) {
                darkModeSectionView.setEnabled(!darkModeSectionController.mPowerManager.isPowerSaveMode());
            }
        }
    }

    @Override // com.android.wallpaper.model.CustomizationSectionController
    public final boolean isAvailable(Context context) {
        return context != null && ContextCompat.checkSelfPermission(context, "android.permission.MODIFY_DAY_NIGHT_MODE") == 0;
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_START)
    public void onStart() {
        sExecutorService.submit(new ComponentActivity$$ExternalSyntheticLambda2(this, 1));
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_STOP)
    public void onStop() {
        sExecutorService.submit(new LockScreenPreviewer$$ExternalSyntheticLambda1(this, 1));
    }

    @Override // com.android.wallpaper.model.CustomizationSectionController
    public final void release() {
        this.mLifecycle.removeObserver(this);
        this.mContext = null;
    }

    public DarkModeSectionController(FragmentActivity fragmentActivity, Lifecycle lifecycle) {
        this.mContext = fragmentActivity;
        this.mLifecycle = lifecycle;
        this.mPowerManager = (PowerManager) fragmentActivity.getSystemService(PowerManager.class);
        lifecycle.addObserver(this);
    }

    @Override // com.android.wallpaper.model.CustomizationSectionController
    public final DarkModeSectionView createView(Context context) {
        DarkModeSectionView darkModeSectionView = (DarkModeSectionView) LayoutInflater.from(context).inflate(R.layout.dark_mode_section_view, (ViewGroup) null);
        this.mDarkModeSectionView = darkModeSectionView;
        darkModeSectionView.mSectionViewListener = new PreviewPager$$ExternalSyntheticLambda2(this);
        this.mDarkModeSectionView.setEnabled(!((PowerManager) context.getSystemService(PowerManager.class)).isPowerSaveMode());
        return this.mDarkModeSectionView;
    }
}
