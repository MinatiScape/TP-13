package android.support.v4.widget;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.v4.view.AbsSavedState;
/* loaded from: classes.dex */
class SlidingPaneLayout$SavedState extends AbsSavedState {
    public static final Parcelable.Creator<SlidingPaneLayout$SavedState> CREATOR = new Parcelable.ClassLoaderCreator<SlidingPaneLayout$SavedState>() { // from class: android.support.v4.widget.SlidingPaneLayout$SavedState.1
        @Override // android.os.Parcelable.ClassLoaderCreator
        public final SlidingPaneLayout$SavedState createFromParcel(Parcel parcel, ClassLoader classLoader) {
            return new SlidingPaneLayout$SavedState(parcel);
        }

        @Override // android.os.Parcelable.Creator
        public final Object createFromParcel(Parcel parcel) {
            return new SlidingPaneLayout$SavedState(parcel);
        }

        @Override // android.os.Parcelable.Creator
        public final Object[] newArray(int i) {
            return new SlidingPaneLayout$SavedState[i];
        }
    };
    public boolean isOpen;

    public SlidingPaneLayout$SavedState(Parcel parcel) {
        super(parcel, null);
        boolean z;
        if (parcel.readInt() != 0) {
            z = true;
        } else {
            z = false;
        }
        this.isOpen = z;
    }

    @Override // android.support.v4.view.AbsSavedState, android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.writeParcelable(this.mSuperState, i);
        parcel.writeInt(this.isOpen ? 1 : 0);
    }
}
