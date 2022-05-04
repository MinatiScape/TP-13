package com.android.wallpaper.picker;

import android.content.Intent;
import android.net.Uri;
import android.os.Binder;
import android.os.Bundle;
import android.util.Log;
import androidx.cardview.R$style;
import androidx.fragment.app.BackStackRecord;
import androidx.fragment.app.FragmentManagerImpl;
import com.android.systemui.shared.R;
import com.android.systemui.shared.system.QuickStepContract;
import com.android.wallpaper.model.ImageWallpaperInfo;
import com.android.wallpaper.module.LargeScreenMultiPanesChecker;
import com.android.wallpaper.module.UserEventLogger;
import com.android.wallpaper.picker.AppbarFragment;
import com.android.wallpaper.util.ActivityUtils;
import com.google.android.apps.wallpaper.module.CompositeUserEventLogger;
/* loaded from: classes.dex */
public class StandalonePreviewActivity extends BasePreviewActivity implements AppbarFragment.AppbarFragmentHost {
    public UserEventLogger mUserEventLogger;

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, android.app.Activity
    public final void onRequestPermissionsResult(int i, String[] strArr, int[] iArr) {
        boolean z = true;
        if (i == 1) {
            if (strArr.length <= 0 || !strArr[0].equals("android.permission.READ_EXTERNAL_STORAGE") || iArr.length <= 0 || iArr[0] != 0) {
                z = false;
            }
            this.mUserEventLogger.logStandalonePreviewStorageDialogApproved(z);
            if (!z) {
                finish();
            }
            loadPreviewFragment();
        }
    }

    public final void enableFullScreen() {
        getWindow().setDecorFitsSystemWindows(false);
        getWindow().setFlags(QuickStepContract.SYSUI_STATE_STATUS_BAR_KEYGUARD_SHOWING_OCCLUDED, QuickStepContract.SYSUI_STATE_STATUS_BAR_KEYGUARD_SHOWING_OCCLUDED);
    }

    @Override // com.android.wallpaper.picker.AppbarFragment.AppbarFragmentHost
    public final boolean isUpArrowSupported() {
        return getIntent().getBooleanExtra("up_arrow", false);
    }

    public final void loadPreviewFragment() {
        Intent intent = getIntent();
        boolean booleanExtra = intent.getBooleanExtra("com.android.wallpaper.picker.testing_mode_enabled", false);
        PreviewFragment previewFragment = R$style.getInjector().getPreviewFragment(this, new ImageWallpaperInfo(intent.getData()), 1, true, false, booleanExtra);
        FragmentManagerImpl supportFragmentManager = getSupportFragmentManager();
        supportFragmentManager.getClass();
        BackStackRecord backStackRecord = new BackStackRecord(supportFragmentManager);
        backStackRecord.doAddOp(R.id.fragment_container, previewFragment, null, 1);
        backStackRecord.commit();
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (getSupportFragmentManager().findFragmentById(R.id.fragment_container) == null) {
            loadPreviewFragment();
        }
    }

    @Override // com.android.wallpaper.picker.BasePreviewActivity, androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    public final void onCreate(Bundle bundle) {
        boolean z;
        boolean z2;
        Uri uri;
        super.onCreate(bundle);
        setContentView(R.layout.activity_preview);
        LargeScreenMultiPanesChecker largeScreenMultiPanesChecker = new LargeScreenMultiPanesChecker();
        boolean z3 = false;
        if (largeScreenMultiPanesChecker.isMultiPanesEnabled(this)) {
            Intent intent = getIntent();
            if (intent == null || !intent.getBooleanExtra("is_from_settings_homepage", false)) {
                z2 = false;
            } else {
                z2 = true;
            }
            if (z2 || ActivityUtils.isLaunchedFromSettingsRelated(intent)) {
                if (intent.hasExtra("android.intent.extra.STREAM")) {
                    uri = (Uri) intent.getParcelableExtra("android.intent.extra.STREAM");
                } else {
                    uri = null;
                }
                if (uri != null) {
                    intent.setData(uri);
                }
            } else {
                Uri data = intent.getData();
                if (data != null) {
                    grantUriPermission(getPackageName(), data, 1);
                }
                Intent multiPanesIntent = largeScreenMultiPanesChecker.getMultiPanesIntent(intent);
                multiPanesIntent.addFlags(268435456).putExtra("android.intent.extra.STREAM", intent.getData()).putExtra("up_arrow", true);
                ActivityUtils.startActivityForResultSafely(this, multiPanesIntent, 0);
                finish();
            }
        }
        enableFullScreen();
        CompositeUserEventLogger userEventLogger = R$style.getInjector().getUserEventLogger(getApplicationContext());
        this.mUserEventLogger = userEventLogger;
        userEventLogger.logStandalonePreviewLaunched();
        Uri data2 = getIntent().getData();
        if (data2 == null) {
            Log.e("StandalonePreview", "No URI passed in intent; exiting StandalonePreviewActivity");
            finish();
            return;
        }
        if (checkUriPermission(data2, Binder.getCallingPid(), Binder.getCallingUid(), 1) == 0) {
            z = true;
        } else {
            z = false;
        }
        this.mUserEventLogger.logStandalonePreviewImageUriHasReadPermission(z);
        if (!z) {
            if (getPackageManager().checkPermission("android.permission.READ_EXTERNAL_STORAGE", getPackageName()) == 0) {
                z3 = true;
            }
            if (!z3) {
                requestPermissions(new String[]{"android.permission.READ_EXTERNAL_STORAGE"}, 1);
            }
        }
    }

    @Override // com.android.wallpaper.picker.AppbarFragment.AppbarFragmentHost
    public final void onUpArrowPressed() {
        onBackPressed();
    }
}
