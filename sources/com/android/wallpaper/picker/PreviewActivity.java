package com.android.wallpaper.picker;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import androidx.cardview.R$style;
import androidx.fragment.app.BackStackRecord;
import androidx.fragment.app.FragmentManagerImpl;
import com.android.systemui.shared.R;
import com.android.wallpaper.model.ImageWallpaperInfo;
import com.android.wallpaper.model.InlinePreviewIntentFactory;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.picker.AppbarFragment;
import com.android.wallpaper.util.ActivityUtils;
/* loaded from: classes.dex */
public class PreviewActivity extends BasePreviewActivity implements AppbarFragment.AppbarFragmentHost {
    public static final /* synthetic */ int $r8$clinit = 0;

    /* loaded from: classes.dex */
    public static class PreviewActivityIntentFactory implements InlinePreviewIntentFactory {
        @Override // com.android.wallpaper.model.InlinePreviewIntentFactory
        public final Intent newIntent(Context context, WallpaperInfo wallpaperInfo) {
            int i = PreviewActivity.$r8$clinit;
            Intent intent = new Intent(context, PreviewActivity.class);
            intent.putExtra("com.android.wallpaper.picker.wallpaper_info", wallpaperInfo);
            return intent;
        }
    }

    @Override // com.android.wallpaper.picker.AppbarFragment.AppbarFragmentHost
    public final boolean isUpArrowSupported() {
        return !ActivityUtils.isSUWMode(getBaseContext());
    }

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, android.app.Activity
    public final void onActivityResult(int i, int i2, Intent intent) {
        Uri uri;
        super.onActivityResult(i, i2, intent);
        if (i == 0 && i2 == -1) {
            if (intent == null) {
                uri = null;
            } else {
                uri = intent.getData();
            }
            if (uri != null) {
                ImageWallpaperInfo imageWallpaperInfo = new ImageWallpaperInfo(uri);
                FragmentManagerImpl supportFragmentManager = getSupportFragmentManager();
                PreviewFragment previewFragment = R$style.getInjector().getPreviewFragment(this, imageWallpaperInfo, 1, true, false, false);
                supportFragmentManager.getClass();
                BackStackRecord backStackRecord = new BackStackRecord(supportFragmentManager);
                backStackRecord.replace(R.id.fragment_container, previewFragment);
                backStackRecord.commit();
            }
        }
    }

    @Override // com.android.wallpaper.picker.BasePreviewActivity, androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.activity_preview);
        getWindow().setDecorFitsSystemWindows(false);
        FragmentManagerImpl supportFragmentManager = getSupportFragmentManager();
        if (supportFragmentManager.findFragmentById(R.id.fragment_container) == null) {
            Intent intent = getIntent();
            boolean booleanExtra = intent.getBooleanExtra("com.android.wallpaper.picker.view_as_home", true);
            boolean booleanExtra2 = intent.getBooleanExtra("com.android.wallpaper.picker.testing_mode_enabled", false);
            PreviewFragment previewFragment = R$style.getInjector().getPreviewFragment(this, (WallpaperInfo) intent.getParcelableExtra("com.android.wallpaper.picker.wallpaper_info"), 1, booleanExtra, false, booleanExtra2);
            BackStackRecord backStackRecord = new BackStackRecord(supportFragmentManager);
            backStackRecord.doAddOp(R.id.fragment_container, previewFragment, null, 1);
            backStackRecord.commit();
        }
    }

    @Override // com.android.wallpaper.picker.AppbarFragment.AppbarFragmentHost
    public final void onUpArrowPressed() {
        onBackPressed();
    }
}
