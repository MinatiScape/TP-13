package androidx.preference;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import androidx.appcompat.R$id;
import androidx.core.content.res.TypedArrayUtils;
import androidx.preference.Preference;
import com.android.systemui.shared.R;
/* loaded from: classes.dex */
public class ListPreference extends DialogPreference {
    public CharSequence[] mEntries;
    public CharSequence[] mEntryValues;
    public String mSummary;

    /* loaded from: classes.dex */
    public static final class SimpleSummaryProvider implements Preference.SummaryProvider<ListPreference> {
        public static SimpleSummaryProvider sSimpleSummaryProvider;

        @Override // androidx.preference.Preference.SummaryProvider
        public final CharSequence provideSummary(ListPreference listPreference) {
            ListPreference listPreference2 = listPreference;
            listPreference2.getClass();
            if (TextUtils.isEmpty(null)) {
                return listPreference2.mContext.getString(R.string.not_set);
            }
            return null;
        }
    }

    public ListPreference(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R$id.ListPreference, i, 0);
        CharSequence[] textArray = obtainStyledAttributes.getTextArray(2);
        this.mEntries = textArray == null ? obtainStyledAttributes.getTextArray(0) : textArray;
        CharSequence[] textArray2 = obtainStyledAttributes.getTextArray(3);
        this.mEntryValues = textArray2 == null ? obtainStyledAttributes.getTextArray(1) : textArray2;
        if (obtainStyledAttributes.getBoolean(4, obtainStyledAttributes.getBoolean(4, false))) {
            if (SimpleSummaryProvider.sSimpleSummaryProvider == null) {
                SimpleSummaryProvider.sSimpleSummaryProvider = new SimpleSummaryProvider();
            }
            this.mSummaryProvider = SimpleSummaryProvider.sSimpleSummaryProvider;
            notifyChanged();
        }
        obtainStyledAttributes.recycle();
        TypedArray obtainStyledAttributes2 = context.obtainStyledAttributes(attributeSet, R$id.Preference, i, 0);
        this.mSummary = TypedArrayUtils.getString(obtainStyledAttributes2, 33, 7);
        obtainStyledAttributes2.recycle();
    }

    public final CharSequence getEntry() {
        return null;
    }

    /* loaded from: classes.dex */
    public static class SavedState extends Preference.BaseSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: androidx.preference.ListPreference.SavedState.1
            @Override // android.os.Parcelable.Creator
            public final SavedState createFromParcel(Parcel parcel) {
                return new SavedState(parcel);
            }

            @Override // android.os.Parcelable.Creator
            public final SavedState[] newArray(int i) {
                return new SavedState[i];
            }
        };
        public String mValue;

        public SavedState(Parcel parcel) {
            super(parcel);
            this.mValue = parcel.readString();
        }

        @Override // android.view.AbsSavedState, android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i) {
            super.writeToParcel(parcel, i);
            parcel.writeString(this.mValue);
        }
    }

    @Override // androidx.preference.Preference
    public final CharSequence getSummary() {
        Preference.SummaryProvider summaryProvider = this.mSummaryProvider;
        if (summaryProvider != null) {
            return summaryProvider.provideSummary(this);
        }
        CharSequence entry = getEntry();
        CharSequence summary = super.getSummary();
        String str = this.mSummary;
        if (str == null) {
            return summary;
        }
        Object[] objArr = new Object[1];
        if (entry == null) {
            entry = "";
        }
        objArr[0] = entry;
        String format = String.format(str, objArr);
        if (TextUtils.equals(format, summary)) {
            return summary;
        }
        Log.w("ListPreference", "Setting a summary with a String formatting marker is no longer supported. You should use a SummaryProvider instead.");
        return format;
    }

    @Override // androidx.preference.Preference
    public final Object onGetDefaultValue(TypedArray typedArray, int i) {
        return typedArray.getString(i);
    }

    public ListPreference(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, TypedArrayUtils.getAttr(context, R.attr.dialogPreferenceStyle, 16842897));
    }
}
