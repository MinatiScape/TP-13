package com.android.customization.model.themedicon;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import com.android.customization.model.color.ColorCustomizationManager$$ExternalSyntheticLambda0;
import com.android.customization.model.themedicon.ThemedIconSwitchProvider;
import com.android.customization.picker.themedicon.ThemedIconSectionView;
import com.android.systemui.shared.R;
import com.android.systemui.shared.navigationbar.RegionSamplingHelper$$ExternalSyntheticLambda0;
import com.android.wallpaper.model.CustomizationSectionController;
import com.android.wallpaper.model.WorkspaceViewModel;
import com.android.wallpaper.picker.LivePreviewFragment$$ExternalSyntheticLambda7;
/* loaded from: classes.dex */
public final class ThemedIconSectionController implements CustomizationSectionController<ThemedIconSectionView> {
    public boolean mSavedThemedIconEnabled;
    public final ThemedIconSwitchProvider mThemedIconOptionsProvider;
    public ThemedIconSectionView mThemedIconSectionView;
    public final WorkspaceViewModel mWorkspaceViewModel;

    @Override // com.android.wallpaper.model.CustomizationSectionController
    public final boolean isAvailable(Context context) {
        boolean z;
        if (context != null) {
            if (this.mThemedIconOptionsProvider.mThemedIconUtils.mProviderInfo != null) {
                z = true;
            } else {
                z = false;
            }
            if (z) {
                return true;
            }
        }
        return false;
    }

    @Override // com.android.wallpaper.model.CustomizationSectionController
    public final void onSaveInstanceState(Bundle bundle) {
        ThemedIconSectionView themedIconSectionView = this.mThemedIconSectionView;
        if (themedIconSectionView != null) {
            bundle.putBoolean("SAVED_THEMED_ICON_ENABLED", themedIconSectionView.mSwitchView.isChecked());
        }
    }

    public ThemedIconSectionController(ThemedIconSwitchProvider themedIconSwitchProvider, WorkspaceViewModel workspaceViewModel, Bundle bundle) {
        this.mSavedThemedIconEnabled = false;
        this.mThemedIconOptionsProvider = themedIconSwitchProvider;
        this.mWorkspaceViewModel = workspaceViewModel;
        if (bundle != null) {
            this.mSavedThemedIconEnabled = bundle.getBoolean("SAVED_THEMED_ICON_ENABLED", false);
        }
    }

    @Override // com.android.wallpaper.model.CustomizationSectionController
    public final ThemedIconSectionView createView(Context context) {
        ThemedIconSectionView themedIconSectionView = (ThemedIconSectionView) LayoutInflater.from(context).inflate(R.layout.themed_icon_section_view, (ViewGroup) null);
        this.mThemedIconSectionView = themedIconSectionView;
        themedIconSectionView.mSectionViewListener = new LivePreviewFragment$$ExternalSyntheticLambda7(this);
        themedIconSectionView.mSwitchView.setChecked(this.mSavedThemedIconEnabled);
        final ThemedIconSwitchProvider themedIconSwitchProvider = this.mThemedIconOptionsProvider;
        final ThemedIconSectionController$$ExternalSyntheticLambda0 themedIconSectionController$$ExternalSyntheticLambda0 = new ThemedIconSectionController$$ExternalSyntheticLambda0(this);
        themedIconSwitchProvider.mExecutorService.submit(new Runnable() { // from class: com.android.customization.model.themedicon.ThemedIconSwitchProvider$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                ThemedIconSwitchProvider themedIconSwitchProvider2 = ThemedIconSwitchProvider.this;
                ThemedIconSwitchProvider.FetchThemedIconEnabledCallback fetchThemedIconEnabledCallback = themedIconSectionController$$ExternalSyntheticLambda0;
                ContentResolver contentResolver = themedIconSwitchProvider2.mContentResolver;
                ThemedIconUtils themedIconUtils = themedIconSwitchProvider2.mThemedIconUtils;
                themedIconUtils.getClass();
                Cursor query = contentResolver.query(new Uri.Builder().scheme("content").authority(themedIconUtils.mProviderInfo.authority).appendPath("icon_themed").build(), null, null, null, null);
                boolean z = true;
                if (query != null) {
                    try {
                        if (query.moveToNext()) {
                            if (query.getInt(query.getColumnIndex("boolean_value")) != 1) {
                                z = false;
                            }
                            if (themedIconSwitchProvider2.mCustomizationPreferences.getThemedIconEnabled() != z) {
                                themedIconSwitchProvider2.mCustomizationPreferences.setThemedIconEnabled(z);
                            }
                            if (fetchThemedIconEnabledCallback != null) {
                                new Handler(Looper.getMainLooper()).post(new ColorCustomizationManager$$ExternalSyntheticLambda0(fetchThemedIconEnabledCallback, z));
                            }
                            query.close();
                            return;
                        }
                    } catch (Throwable th) {
                        try {
                            query.close();
                        } catch (Throwable th2) {
                            th.addSuppressed(th2);
                        }
                        throw th;
                    }
                }
                if (query != null) {
                    query.close();
                }
                if (fetchThemedIconEnabledCallback != null) {
                    new Handler(Looper.getMainLooper()).post(new RegionSamplingHelper$$ExternalSyntheticLambda0(themedIconSwitchProvider2, fetchThemedIconEnabledCallback, 1));
                }
            }
        });
        return this.mThemedIconSectionView;
    }
}
