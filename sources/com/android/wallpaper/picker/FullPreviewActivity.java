package com.android.wallpaper.picker;

import android.content.Intent;
import android.os.Bundle;
import android.transition.Slide;
import androidx.cardview.R$style;
import androidx.fragment.app.BackStackRecord;
import androidx.fragment.app.FragmentManagerImpl;
import com.android.systemui.shared.R;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.picker.AppbarFragment;
import com.android.wallpaper.util.ActivityUtils;
/* loaded from: classes.dex */
public class FullPreviewActivity extends BasePreviewActivity implements AppbarFragment.AppbarFragmentHost {
    public static final /* synthetic */ int $r8$clinit = 0;

    @Override // com.android.wallpaper.picker.AppbarFragment.AppbarFragmentHost
    public final boolean isUpArrowSupported() {
        return !ActivityUtils.isSUWMode(getBaseContext());
    }

    @Override // com.android.wallpaper.picker.BasePreviewActivity, androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        getWindow().setAllowEnterTransitionOverlap(true);
        getWindow().requestFeature(13);
        getWindow().setExitTransition(new Slide());
        getWindow().setEnterTransition(new Slide());
        setContentView(R.layout.activity_fullscreen_preview);
        getWindow().setDecorFitsSystemWindows(false);
        FragmentManagerImpl supportFragmentManager = getSupportFragmentManager();
        if (supportFragmentManager.findFragmentById(R.id.fragment_container) == null) {
            Intent intent = getIntent();
            boolean booleanExtra = intent.getBooleanExtra("com.android.wallpaper.picker.view_as_home", true);
            boolean booleanExtra2 = intent.getBooleanExtra("com.android.wallpaper.picker.testing_mode_enabled", false);
            PreviewFragment previewFragment = R$style.getInjector().getPreviewFragment(this, (WallpaperInfo) intent.getParcelableExtra("com.android.wallpaper.picker.wallpaper_info"), 1, booleanExtra, true, booleanExtra2);
            BackStackRecord backStackRecord = new BackStackRecord(supportFragmentManager);
            backStackRecord.doAddOp(R.id.fragment_container, previewFragment, null, 1);
            backStackRecord.commit();
        }
    }

    @Override // com.android.wallpaper.picker.BaseActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    public final void onResume() {
        super.onResume();
        getWindow().getDecorView().setSystemUiVisibility(6);
    }

    @Override // com.android.wallpaper.picker.AppbarFragment.AppbarFragmentHost
    public final void onUpArrowPressed() {
        onBackPressed();
    }
}
