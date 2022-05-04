package com.android.customization.model.grid;

import androidx.lifecycle.SavedStateHandle;
import androidx.lifecycle.ViewModel;
/* loaded from: classes.dex */
public class GridOptionViewModel extends ViewModel {
    public SavedStateHandle mState;

    public GridOptionViewModel(SavedStateHandle savedStateHandle) {
        this.mState = savedStateHandle;
    }

    public GridOption getSelectedOption() {
        return (GridOption) this.mState.mRegular.get("selected_option");
    }

    public void setBottomActionBarVisible(boolean z) {
        this.mState.set("bottom_action_bar_visible", Boolean.valueOf(z));
    }

    public void setSelectedOption(GridOption gridOption) {
        this.mState.set("selected_option", gridOption);
    }
}
