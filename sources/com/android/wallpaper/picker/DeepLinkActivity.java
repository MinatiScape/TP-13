package com.android.wallpaper.picker;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import androidx.cardview.R$style;
/* loaded from: classes.dex */
public class DeepLinkActivity extends Activity {
    @Override // android.app.Activity
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Intent deepLinkRedirectIntent = R$style.getInjector().getDeepLinkRedirectIntent(this, getIntent().getData());
        deepLinkRedirectIntent.putExtra("com.android.wallpaper.LAUNCH_SOURCE", "app_launched_deeplink");
        startActivity(deepLinkRedirectIntent);
        finish();
    }
}
