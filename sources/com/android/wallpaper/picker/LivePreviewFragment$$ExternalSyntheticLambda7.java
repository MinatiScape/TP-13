package com.android.wallpaper.picker;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.view.View;
import androidx.lifecycle.MutableLiveData;
import com.android.customization.model.themedicon.ThemedIconSectionController;
import com.android.customization.model.themedicon.ThemedIconSwitchProvider;
import com.android.wallpaper.picker.SectionView;
import com.android.wallpaper.util.FullScreenAnimation;
import com.android.wallpaper.widget.BottomActionBar;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class LivePreviewFragment$$ExternalSyntheticLambda7 implements SectionView.SectionViewListener, FullScreenAnimation.FullScreenStatusListener {
    public final /* synthetic */ Object f$0;

    public /* synthetic */ LivePreviewFragment$$ExternalSyntheticLambda7(Object obj) {
        this.f$0 = obj;
    }

    @Override // com.android.wallpaper.util.FullScreenAnimation.FullScreenStatusListener
    public final void onFullScreenStatusChange(boolean z) {
        LivePreviewFragment livePreviewFragment = (LivePreviewFragment) this.f$0;
        livePreviewFragment.mLockScreenPreviewer.setDateViewVisibility(!z);
        if (!z) {
            BottomActionBar bottomActionBar = ((PreviewFragment) livePreviewFragment).mBottomActionBar;
            ((View) bottomActionBar.mActionMap.get(BottomActionBar.BottomAction.EDIT)).sendAccessibilityEvent(8);
        }
    }

    @Override // com.android.wallpaper.picker.SectionView.SectionViewListener
    public final void onViewActivated(Context context, final boolean z) {
        ThemedIconSectionController themedIconSectionController = (ThemedIconSectionController) this.f$0;
        if (context == null) {
            themedIconSectionController.getClass();
            return;
        }
        final ThemedIconSwitchProvider themedIconSwitchProvider = themedIconSectionController.mThemedIconOptionsProvider;
        themedIconSwitchProvider.mExecutorService.submit(new Runnable() { // from class: com.android.customization.model.themedicon.ThemedIconSwitchProvider$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                ThemedIconSwitchProvider themedIconSwitchProvider2 = ThemedIconSwitchProvider.this;
                boolean z2 = z;
                themedIconSwitchProvider2.getClass();
                ContentValues contentValues = new ContentValues();
                contentValues.put("boolean_value", Boolean.valueOf(z2));
                ContentResolver contentResolver = themedIconSwitchProvider2.mContentResolver;
                ThemedIconUtils themedIconUtils = themedIconSwitchProvider2.mThemedIconUtils;
                themedIconUtils.getClass();
                if (contentResolver.update(new Uri.Builder().scheme("content").authority(themedIconUtils.mProviderInfo.authority).appendPath("icon_themed").build(), contentValues, null, null) == 1) {
                    themedIconSwitchProvider2.mCustomizationPreferences.setThemedIconEnabled(z2);
                }
            }
        });
        ((MutableLiveData) themedIconSectionController.mWorkspaceViewModel.updateWorkspace$delegate.getValue()).setValue(Boolean.valueOf(z));
    }
}
