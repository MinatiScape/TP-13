package com.android.customization.model.grid;

import android.content.Context;
import com.android.wallpaper.util.PreviewUtils;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final class LauncherGridOptionsProvider {
    public final Context mContext;
    public ArrayList mOptions;
    public final PreviewUtils mPreviewUtils;

    public LauncherGridOptionsProvider(Context context, String str) {
        this.mPreviewUtils = new PreviewUtils(context, str);
        this.mContext = context;
    }
}
