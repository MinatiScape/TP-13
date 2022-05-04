package com.google.android.material.navigation;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import androidx.customview.view.AbsSavedState;
/* loaded from: classes.dex */
public class NavigationView$SavedState extends AbsSavedState {
    public static final Parcelable.Creator<NavigationView$SavedState> CREATOR = new Parcelable.ClassLoaderCreator<NavigationView$SavedState>() { // from class: com.google.android.material.navigation.NavigationView$SavedState.1
        @Override // android.os.Parcelable.ClassLoaderCreator
        public final NavigationView$SavedState createFromParcel(Parcel parcel, ClassLoader classLoader) {
            return new NavigationView$SavedState(parcel, classLoader);
        }

        @Override // android.os.Parcelable.Creator
        public final Object createFromParcel(Parcel parcel) {
            return new NavigationView$SavedState(parcel, null);
        }

        @Override // android.os.Parcelable.Creator
        public final Object[] newArray(int i) {
            return new NavigationView$SavedState[i];
        }
    };
    public Bundle menuState;

    @Override // androidx.customview.view.AbsSavedState, android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.writeParcelable(this.mSuperState, i);
        parcel.writeBundle(this.menuState);
    }

    public NavigationView$SavedState(Parcel parcel, ClassLoader classLoader) {
        super(parcel, classLoader);
        this.menuState = parcel.readBundle(classLoader);
    }
}
