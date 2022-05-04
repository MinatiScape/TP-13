package androidx.preference;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.ArrayAdapter;
import com.android.systemui.shared.R;
/* loaded from: classes.dex */
public class DropDownPreference extends ListPreference {
    public final ArrayAdapter mAdapter;

    @Override // androidx.preference.Preference
    public final void notifyChanged() {
        ArrayAdapter arrayAdapter = this.mAdapter;
        if (arrayAdapter != null) {
            arrayAdapter.notifyDataSetChanged();
        }
    }

    public DropDownPreference(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, R.attr.dropdownPreferenceStyle);
        ArrayAdapter arrayAdapter = new ArrayAdapter(context, 17367049);
        this.mAdapter = arrayAdapter;
        arrayAdapter.clear();
        CharSequence[] charSequenceArr = this.mEntries;
        if (charSequenceArr != null) {
            for (CharSequence charSequence : charSequenceArr) {
                this.mAdapter.add(charSequence.toString());
            }
        }
    }
}
