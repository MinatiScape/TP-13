package androidx.preference;

import android.content.res.TypedArray;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import androidx.preference.Preference;
import com.android.systemui.shared.R;
/* loaded from: classes.dex */
public class EditTextPreference extends DialogPreference {

    /* loaded from: classes.dex */
    public static final class SimpleSummaryProvider implements Preference.SummaryProvider<EditTextPreference> {
        public static SimpleSummaryProvider sSimpleSummaryProvider;

        @Override // androidx.preference.Preference.SummaryProvider
        public final CharSequence provideSummary(EditTextPreference editTextPreference) {
            EditTextPreference editTextPreference2 = editTextPreference;
            editTextPreference2.getClass();
            if (TextUtils.isEmpty(null)) {
                return editTextPreference2.mContext.getString(R.string.not_set);
            }
            return null;
        }
    }

    /* loaded from: classes.dex */
    public static class SavedState extends Preference.BaseSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: androidx.preference.EditTextPreference.SavedState.1
            @Override // android.os.Parcelable.Creator
            public final SavedState createFromParcel(Parcel parcel) {
                return new SavedState(parcel);
            }

            @Override // android.os.Parcelable.Creator
            public final SavedState[] newArray(int i) {
                return new SavedState[i];
            }
        };
        public String mText;

        public SavedState(Parcel parcel) {
            super(parcel);
            this.mText = parcel.readString();
        }

        @Override // android.view.AbsSavedState, android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i) {
            super.writeToParcel(parcel, i);
            parcel.writeString(this.mText);
        }
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public EditTextPreference(android.content.Context r4, android.util.AttributeSet r5) {
        /*
            r3 = this;
            r0 = 2130968934(0x7f040166, float:1.7546536E38)
            r1 = 16842898(0x1010092, float:2.3693967E-38)
            int r0 = androidx.core.content.res.TypedArrayUtils.getAttr(r4, r0, r1)
            r3.<init>(r4, r5, r0)
            int[] r1 = androidx.appcompat.R$id.EditTextPreference
            r2 = 0
            android.content.res.TypedArray r4 = r4.obtainStyledAttributes(r5, r1, r0, r2)
            boolean r5 = r4.getBoolean(r2, r2)
            boolean r5 = r4.getBoolean(r2, r5)
            if (r5 == 0) goto L2d
            androidx.preference.EditTextPreference$SimpleSummaryProvider r5 = androidx.preference.EditTextPreference.SimpleSummaryProvider.sSimpleSummaryProvider
            if (r5 != 0) goto L29
            androidx.preference.EditTextPreference$SimpleSummaryProvider r5 = new androidx.preference.EditTextPreference$SimpleSummaryProvider
            r5.<init>()
            androidx.preference.EditTextPreference.SimpleSummaryProvider.sSimpleSummaryProvider = r5
        L29:
            androidx.preference.EditTextPreference$SimpleSummaryProvider r5 = androidx.preference.EditTextPreference.SimpleSummaryProvider.sSimpleSummaryProvider
            r3.mSummaryProvider = r5
        L2d:
            r4.recycle()
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.preference.EditTextPreference.<init>(android.content.Context, android.util.AttributeSet):void");
    }

    @Override // androidx.preference.Preference
    public final Object onGetDefaultValue(TypedArray typedArray, int i) {
        return typedArray.getString(i);
    }
}
