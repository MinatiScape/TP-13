package com.google.android.material.navigation;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.material.internal.ParcelableSparseArray;
/* loaded from: classes.dex */
class NavigationBarPresenter$SavedState implements Parcelable {
    public static final Parcelable.Creator<NavigationBarPresenter$SavedState> CREATOR = new Parcelable.Creator<NavigationBarPresenter$SavedState>() { // from class: com.google.android.material.navigation.NavigationBarPresenter$SavedState.1
        @Override // android.os.Parcelable.Creator
        public final NavigationBarPresenter$SavedState createFromParcel(Parcel parcel) {
            return new NavigationBarPresenter$SavedState(parcel);
        }

        @Override // android.os.Parcelable.Creator
        public final NavigationBarPresenter$SavedState[] newArray(int i) {
            return new NavigationBarPresenter$SavedState[i];
        }
    };
    public ParcelableSparseArray badgeSavedStates;
    public int selectedItemId;

    public NavigationBarPresenter$SavedState() {
        throw null;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.selectedItemId);
        parcel.writeParcelable(this.badgeSavedStates, 0);
    }

    public NavigationBarPresenter$SavedState(Parcel parcel) {
        this.selectedItemId = parcel.readInt();
        this.badgeSavedStates = (ParcelableSparseArray) parcel.readParcelable(getClass().getClassLoader());
    }
}
