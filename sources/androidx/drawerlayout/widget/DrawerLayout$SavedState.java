package androidx.drawerlayout.widget;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.customview.view.AbsSavedState;
/* loaded from: classes.dex */
public class DrawerLayout$SavedState extends AbsSavedState {
    public static final Parcelable.Creator<DrawerLayout$SavedState> CREATOR = new Parcelable.ClassLoaderCreator<DrawerLayout$SavedState>() { // from class: androidx.drawerlayout.widget.DrawerLayout$SavedState.1
        @Override // android.os.Parcelable.ClassLoaderCreator
        public final DrawerLayout$SavedState createFromParcel(Parcel parcel, ClassLoader classLoader) {
            return new DrawerLayout$SavedState(parcel, classLoader);
        }

        @Override // android.os.Parcelable.Creator
        public final Object createFromParcel(Parcel parcel) {
            return new DrawerLayout$SavedState(parcel, null);
        }

        @Override // android.os.Parcelable.Creator
        public final Object[] newArray(int i) {
            return new DrawerLayout$SavedState[i];
        }
    };
    public int lockModeEnd;
    public int lockModeLeft;
    public int lockModeRight;
    public int lockModeStart;
    public int openDrawerGravity;

    @Override // androidx.customview.view.AbsSavedState, android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.writeParcelable(this.mSuperState, i);
        parcel.writeInt(this.openDrawerGravity);
        parcel.writeInt(this.lockModeLeft);
        parcel.writeInt(this.lockModeRight);
        parcel.writeInt(this.lockModeStart);
        parcel.writeInt(this.lockModeEnd);
    }

    public DrawerLayout$SavedState(Parcel parcel, ClassLoader classLoader) {
        super(parcel, classLoader);
        this.openDrawerGravity = 0;
        this.openDrawerGravity = parcel.readInt();
        this.lockModeLeft = parcel.readInt();
        this.lockModeRight = parcel.readInt();
        this.lockModeStart = parcel.readInt();
        this.lockModeEnd = parcel.readInt();
    }
}
