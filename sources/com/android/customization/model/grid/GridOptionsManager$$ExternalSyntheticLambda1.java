package com.android.customization.model.grid;

import android.content.ContentResolver;
import android.content.Context;
import android.content.res.Resources;
import android.database.Cursor;
import android.os.Handler;
import android.os.Looper;
import com.android.customization.model.CustomizationManager;
import com.android.systemui.shared.R;
import java.util.ArrayList;
import java.util.List;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class GridOptionsManager$$ExternalSyntheticLambda1 implements Runnable {
    public final /* synthetic */ GridOptionsManager f$0;
    public final /* synthetic */ boolean f$1 = true;
    public final /* synthetic */ CustomizationManager.OptionsFetchedListener f$2;

    public /* synthetic */ GridOptionsManager$$ExternalSyntheticLambda1(GridOptionsManager gridOptionsManager, CustomizationManager.OptionsFetchedListener optionsFetchedListener) {
        this.f$0 = gridOptionsManager;
        this.f$2 = optionsFetchedListener;
    }

    @Override // java.lang.Runnable
    public final void run() {
        boolean z;
        GridOptionsManager gridOptionsManager = this.f$0;
        boolean z2 = this.f$1;
        final CustomizationManager.OptionsFetchedListener optionsFetchedListener = this.f$2;
        LauncherGridOptionsProvider launcherGridOptionsProvider = gridOptionsManager.mProvider;
        char c = 1;
        char c2 = 0;
        if (launcherGridOptionsProvider.mPreviewUtils.mProviderInfo != null) {
            z = true;
        } else {
            z = false;
        }
        final ArrayList arrayList = null;
        if (z) {
            ArrayList arrayList2 = launcherGridOptionsProvider.mOptions;
            if (arrayList2 == null || z2) {
                ContentResolver contentResolver = launcherGridOptionsProvider.mContext.getContentResolver();
                String string = launcherGridOptionsProvider.mContext.getResources().getString(Resources.getSystem().getIdentifier("config_icon_mask", "string", "android"));
                try {
                    Cursor query = contentResolver.query(launcherGridOptionsProvider.mPreviewUtils.getUri("list_options"), null, null, null, null);
                    launcherGridOptionsProvider.mOptions = new ArrayList();
                    while (query.moveToNext()) {
                        String string2 = query.getString(query.getColumnIndex("name"));
                        int i = query.getInt(query.getColumnIndex("rows"));
                        int i2 = query.getInt(query.getColumnIndex("cols"));
                        int i3 = query.getInt(query.getColumnIndex("preview_count"));
                        boolean parseBoolean = Boolean.parseBoolean(query.getString(query.getColumnIndex("is_default")));
                        Context context = launcherGridOptionsProvider.mContext;
                        Object[] objArr = new Object[2];
                        objArr[c2] = Integer.valueOf(i2);
                        objArr[c] = Integer.valueOf(i);
                        launcherGridOptionsProvider.mOptions.add(new GridOption(context.getString(R.string.grid_title_pattern, objArr), string2, parseBoolean, i, i2, launcherGridOptionsProvider.mPreviewUtils.getUri("preview"), i3, string));
                        c = 1;
                        c2 = 0;
                    }
                    query.close();
                } catch (Exception unused) {
                    launcherGridOptionsProvider.mOptions = null;
                }
                arrayList = launcherGridOptionsProvider.mOptions;
            } else {
                arrayList = arrayList2;
            }
        }
        new Handler(Looper.getMainLooper()).post(new Runnable() { // from class: com.android.customization.model.grid.GridOptionsManager$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                CustomizationManager.OptionsFetchedListener optionsFetchedListener2 = CustomizationManager.OptionsFetchedListener.this;
                List list = arrayList;
                if (optionsFetchedListener2 == null) {
                    return;
                }
                if (list == null || list.isEmpty()) {
                    optionsFetchedListener2.onError(null);
                } else {
                    optionsFetchedListener2.onOptionsLoaded(list);
                }
            }
        });
    }
}
