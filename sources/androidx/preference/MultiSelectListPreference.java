package androidx.preference;

import android.content.res.TypedArray;
import android.os.Parcel;
import android.os.Parcelable;
import androidx.preference.Preference;
import java.util.Collections;
import java.util.HashSet;
/* loaded from: classes.dex */
public class MultiSelectListPreference extends DialogPreference {

    /* loaded from: classes.dex */
    public static class SavedState extends Preference.BaseSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: androidx.preference.MultiSelectListPreference.SavedState.1
            @Override // android.os.Parcelable.Creator
            public final SavedState createFromParcel(Parcel parcel) {
                return new SavedState(parcel);
            }

            @Override // android.os.Parcelable.Creator
            public final SavedState[] newArray(int i) {
                return new SavedState[i];
            }
        };
        public HashSet mValues = new HashSet();

        public SavedState(Parcel parcel) {
            super(parcel);
            int readInt = parcel.readInt();
            String[] strArr = new String[readInt];
            parcel.readStringArray(strArr);
            Collections.addAll(this.mValues, strArr);
        }

        @Override // android.view.AbsSavedState, android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i) {
            super.writeToParcel(parcel, i);
            parcel.writeInt(this.mValues.size());
            HashSet hashSet = this.mValues;
            parcel.writeStringArray((String[]) hashSet.toArray(new String[hashSet.size()]));
        }
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public MultiSelectListPreference(android.content.Context r3, android.util.AttributeSet r4) {
        /*
            r2 = this;
            r0 = 2130968897(0x7f040141, float:1.754646E38)
            r1 = 16842897(0x1010091, float:2.3693964E-38)
            int r0 = androidx.core.content.res.TypedArrayUtils.getAttr(r3, r0, r1)
            r2.<init>(r3, r4, r0)
            java.util.HashSet r2 = new java.util.HashSet
            r2.<init>()
            int[] r2 = androidx.appcompat.R$id.MultiSelectListPreference
            r1 = 0
            android.content.res.TypedArray r2 = r3.obtainStyledAttributes(r4, r2, r0, r1)
            r3 = 2
            java.lang.CharSequence[] r3 = r2.getTextArray(r3)
            if (r3 != 0) goto L23
            r2.getTextArray(r1)
        L23:
            r3 = 3
            r4 = 1
            java.lang.CharSequence[] r3 = r2.getTextArray(r3)
            if (r3 != 0) goto L2e
            r2.getTextArray(r4)
        L2e:
            r2.recycle()
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.preference.MultiSelectListPreference.<init>(android.content.Context, android.util.AttributeSet):void");
    }

    @Override // androidx.preference.Preference
    public final Object onGetDefaultValue(TypedArray typedArray, int i) {
        CharSequence[] textArray = typedArray.getTextArray(i);
        HashSet hashSet = new HashSet();
        for (CharSequence charSequence : textArray) {
            hashSet.add(charSequence.toString());
        }
        return hashSet;
    }
}
