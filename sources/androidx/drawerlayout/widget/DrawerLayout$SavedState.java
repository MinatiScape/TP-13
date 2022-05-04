package androidx.drawerlayout.widget;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.customview.view.AbsSavedState;
/* loaded from: classes.dex */
public class DrawerLayout$SavedState extends AbsSavedState {
    public static final Parcelable.Creator<DrawerLayout$SavedState> CREATOR = new Parcelable.ClassLoaderCreator<DrawerLayout$SavedState>() { // from class: androidx.drawerlayout.widget.DrawerLayout$SavedState.1
        @Override // android.os.Parcelable.ClassLoaderCreator
        public DrawerLayout$SavedState createFromParcel(Parcel in, ClassLoader loader) {
            return new DrawerLayout$SavedState(in, loader);
        }

        @Override // android.os.Parcelable.Creator
        public Object[] newArray(int size) {
            return new DrawerLayout$SavedState[size];
        }

        @Override // android.os.Parcelable.Creator
        public Object createFromParcel(Parcel in) {
            return new DrawerLayout$SavedState(in, null);
        }
    };
    public int lockModeEnd;
    public int lockModeLeft;
    public int lockModeRight;
    public int lockModeStart;
    public int openDrawerGravity;

    public DrawerLayout$SavedState(Parcel in, ClassLoader loader) {
        super(in, loader);
        this.openDrawerGravity = 0;
        this.openDrawerGravity = in.readInt();
        this.lockModeLeft = in.readInt();
        this.lockModeRight = in.readInt();
        this.lockModeStart = in.readInt();
        this.lockModeEnd = in.readInt();
    }

    @Override // androidx.customview.view.AbsSavedState, android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeParcelable(this.mSuperState, flags);
        dest.writeInt(this.openDrawerGravity);
        dest.writeInt(this.lockModeLeft);
        dest.writeInt(this.lockModeRight);
        dest.writeInt(this.lockModeStart);
        dest.writeInt(this.lockModeEnd);
    }
}
