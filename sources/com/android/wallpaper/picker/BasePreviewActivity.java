package com.android.wallpaper.picker;

import android.os.Bundle;
import androidx.cardview.R$style;
import com.android.systemui.shared.R;
import com.google.android.apps.wallpaper.module.CompositeUserEventLogger;
/* loaded from: classes.dex */
public abstract class BasePreviewActivity extends BaseActivity {
    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        CompositeUserEventLogger userEventLogger = R$style.getInjector().getUserEventLogger(this);
        getWindow().setColorMode(1);
        setTheme(R.style.WallpaperTheme);
        getWindow().setFormat(-3);
        if (getIntent() != null && getIntent().getAction() != null) {
            userEventLogger.logAppLaunched(getIntent());
        }
    }
}
