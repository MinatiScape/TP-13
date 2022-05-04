package com.google.android.material.navigation;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import androidx.customview.view.AbsSavedState;
/* loaded from: classes.dex */
class NavigationBarView$SavedState extends AbsSavedState {
    public static final Parcelable.Creator<NavigationBarView$SavedState> CREATOR = new Parcelable.ClassLoaderCreator<NavigationBarView$SavedState>() { // from class: com.google.android.material.navigation.NavigationBarView$SavedState.1
        @Override // android.os.Parcelable.ClassLoaderCreator
        public final NavigationBarView$SavedState createFromParcel(Parcel parcel, ClassLoader classLoader) {
            return new NavigationBarView$SavedState(parcel, classLoader);
        }

        @Override // android.os.Parcelable.Creator
        public final Object createFromParcel(Parcel parcel) {
            return new NavigationBarView$SavedState(parcel, null);
        }

        @Override // android.os.Parcelable.Creator
        public final Object[] newArray(int i) {
            return new NavigationBarView$SavedState[i];
        }
    };
    public Bundle menuPresenterState;

    @Override // androidx.customview.view.AbsSavedState, android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.writeParcelable(this.mSuperState, i);
        parcel.writeBundle(this.menuPresenterState);
    }

    public NavigationBarView$SavedState(Parcel parcel, ClassLoader classLoader) {
        super(parcel, classLoader);
        this.menuPresenterState = parcel.readBundle(classLoader == null ? getClass().getClassLoader() : classLoader);
    }
}
