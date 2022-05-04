package com.android.customization.model.grid;

import androidx.lifecycle.SavedStateHandle;
import androidx.lifecycle.ViewModel;
/* loaded from: classes.dex */
public final class GridOptionViewModel extends ViewModel {
    public SavedStateHandle mState;

    public final GridOption getSelectedOption() {
        return (GridOption) this.mState.mRegular.get("selected_option");
    }

    public GridOptionViewModel(SavedStateHandle savedStateHandle) {
        this.mState = savedStateHandle;
    }
}
