package com.android.wallpaper.widget;

import android.app.UiModeManager;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.widget.Switch;
import android.widget.Toast;
import androidx.viewpager.widget.ViewPager;
import com.android.customization.model.mode.DarkModeSectionController;
import com.android.systemui.shared.R;
import com.android.wallpaper.picker.SectionView;
import java.util.concurrent.ExecutorService;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class PreviewPager$$ExternalSyntheticLambda2 implements SectionView.SectionViewListener, ViewPager.PageTransformer {
    public final /* synthetic */ Object f$0;

    public /* synthetic */ PreviewPager$$ExternalSyntheticLambda2(Object obj) {
        this.f$0 = obj;
    }

    @Override // com.android.wallpaper.picker.SectionView.SectionViewListener
    public final void onViewActivated(final Context context, final boolean z) {
        final DarkModeSectionController darkModeSectionController = (DarkModeSectionController) this.f$0;
        if (context == null) {
            ExecutorService executorService = DarkModeSectionController.sExecutorService;
            darkModeSectionController.getClass();
        } else if (!((Switch) darkModeSectionController.mDarkModeSectionView.findViewById(R.id.dark_mode_toggle)).isEnabled()) {
            Context context2 = darkModeSectionController.mContext;
            Toast.makeText(context2, context2.getString(R.string.mode_disabled_msg), 0).show();
        } else {
            final UiModeManager uiModeManager = (UiModeManager) context.getSystemService(UiModeManager.class);
            new Handler(Looper.getMainLooper()).postDelayed(new Runnable() { // from class: com.android.customization.model.mode.DarkModeSectionController$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    DarkModeSectionController darkModeSectionController2 = DarkModeSectionController.this;
                    Context context3 = context;
                    UiModeManager uiModeManager2 = uiModeManager;
                    boolean z2 = z;
                    darkModeSectionController2.mDarkModeSectionView.announceForAccessibility(context3.getString(R.string.mode_changed));
                    uiModeManager2.setNightModeActivated(z2);
                }
            }, context.getResources().getInteger(17694720));
        }
    }
}
