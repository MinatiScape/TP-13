package com.android.customization.model.color;

import android.content.ContentValues;
import com.android.customization.model.CustomizationManager;
import com.android.customization.model.themedicon.ThemedIconSectionController$$ExternalSyntheticLambda0;
import com.android.customization.model.themedicon.ThemedIconSwitchProvider;
import java.util.Objects;
/* loaded from: classes.dex */
public final /* synthetic */ class ColorCustomizationManager$$ExternalSyntheticLambda0 implements Runnable {
    public final /* synthetic */ int $r8$classId = 2;
    public final /* synthetic */ boolean f$0;
    public final /* synthetic */ Object f$1;

    public /* synthetic */ ColorCustomizationManager$$ExternalSyntheticLambda0(ThemedIconSwitchProvider.FetchThemedIconEnabledCallback fetchThemedIconEnabledCallback, boolean z) {
        this.f$1 = fetchThemedIconEnabledCallback;
        this.f$0 = z;
    }

    public /* synthetic */ ColorCustomizationManager$$ExternalSyntheticLambda0(ThemedIconSwitchProvider themedIconSwitchProvider, boolean z) {
        this.f$1 = themedIconSwitchProvider;
        this.f$0 = z;
    }

    public /* synthetic */ ColorCustomizationManager$$ExternalSyntheticLambda0(boolean z, CustomizationManager.Callback callback) {
        this.f$0 = z;
        this.f$1 = callback;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.$r8$classId) {
            case 0:
                boolean z = this.f$0;
                CustomizationManager.Callback callback = (CustomizationManager.Callback) this.f$1;
                if (z) {
                    callback.onSuccess();
                    return;
                } else {
                    callback.onError(null);
                    return;
                }
            case 1:
                ThemedIconSwitchProvider themedIconSwitchProvider = (ThemedIconSwitchProvider) this.f$1;
                boolean z2 = this.f$0;
                Objects.requireNonNull(themedIconSwitchProvider);
                ContentValues contentValues = new ContentValues();
                contentValues.put("boolean_value", Boolean.valueOf(z2));
                if (themedIconSwitchProvider.mContentResolver.update(themedIconSwitchProvider.mThemedIconUtils.getUriForPath("icon_themed"), contentValues, null, null) == 1) {
                    themedIconSwitchProvider.mCustomizationPreferences.setThemedIconEnabled(z2);
                    return;
                }
                return;
            default:
                ((ThemedIconSectionController$$ExternalSyntheticLambda0) ((ThemedIconSwitchProvider.FetchThemedIconEnabledCallback) this.f$1)).f$0.mThemedIconSectionView.mSwitchView.setChecked(this.f$0);
                return;
        }
    }
}
