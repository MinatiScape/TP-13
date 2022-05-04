package com.android.customization.model.grid;

import android.content.Context;
import androidx.cardview.R$style;
import com.android.customization.model.CustomizationManager;
import com.android.customization.module.CustomizationInjector;
import com.android.customization.module.ThemesUserEventLogger;
import com.android.systemui.shared.R;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
/* loaded from: classes.dex */
public final class GridOptionsManager implements CustomizationManager<GridOption> {
    public static final ExecutorService sExecutorService = Executors.newSingleThreadExecutor();
    public static GridOptionsManager sGridOptionsManager;
    public final ThemesUserEventLogger mEventLogger;
    public final LauncherGridOptionsProvider mProvider;

    public static GridOptionsManager getInstance(Context context) {
        if (sGridOptionsManager == null) {
            Context applicationContext = context.getApplicationContext();
            sGridOptionsManager = new GridOptionsManager(new LauncherGridOptionsProvider(applicationContext, applicationContext.getString(R.string.grid_control_metadata_name)), ((CustomizationInjector) R$style.getInjector()).getUserEventLogger(applicationContext));
        }
        return sGridOptionsManager;
    }

    public GridOptionsManager(LauncherGridOptionsProvider launcherGridOptionsProvider, ThemesUserEventLogger themesUserEventLogger) {
        this.mProvider = launcherGridOptionsProvider;
        this.mEventLogger = themesUserEventLogger;
    }
}
