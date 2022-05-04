package com.android.wallpaper.picker;

import android.app.Activity;
import android.content.ContentValues;
import android.view.View;
import com.android.customization.model.grid.GridOption;
import com.android.customization.model.grid.GridOptionsManager;
import com.android.customization.model.grid.LauncherGridOptionsProvider;
import com.android.customization.picker.grid.GridFragment;
import com.android.wallpaper.widget.BottomActionBar;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class AppbarFragment$$ExternalSyntheticLambda0 implements View.OnClickListener {
    public final /* synthetic */ int $r8$classId;
    public final /* synthetic */ Object f$0;

    public /* synthetic */ AppbarFragment$$ExternalSyntheticLambda0(Object obj, int i) {
        this.$r8$classId = i;
        this.f$0 = obj;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        switch (this.$r8$classId) {
            case 0:
                ((AppbarFragment) this.f$0).mHost.onUpArrowPressed();
                return;
            case 1:
                GridFragment gridFragment = (GridFragment) this.f$0;
                GridOption selectedOption = gridFragment.mGridOptionViewModel.getSelectedOption();
                BottomActionBar bottomActionBar = gridFragment.mBottomActionBar;
                bottomActionBar.getClass();
                bottomActionBar.disableActions(BottomActionBar.BottomAction.values());
                GridOptionsManager gridOptionsManager = gridFragment.mGridManager;
                GridFragment.AnonymousClass1 r5 = gridFragment.mApplyGridCallback;
                LauncherGridOptionsProvider launcherGridOptionsProvider = gridOptionsManager.mProvider;
                String str = selectedOption.name;
                launcherGridOptionsProvider.getClass();
                ContentValues contentValues = new ContentValues();
                contentValues.put("name", str);
                if (launcherGridOptionsProvider.mContext.getContentResolver().update(launcherGridOptionsProvider.mPreviewUtils.getUri("default_grid"), contentValues, null, null) == 1) {
                    gridOptionsManager.mEventLogger.logGridApplied(selectedOption);
                    r5.onSuccess();
                    return;
                }
                r5.onError();
                return;
            default:
                int i = BottomActionBar.$r8$clinit;
                ((Activity) this.f$0).onBackPressed();
                return;
        }
    }
}
