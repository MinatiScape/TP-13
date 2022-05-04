package androidx.preference;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import androidx.appcompat.R$id;
import androidx.core.content.res.TypedArrayUtils;
import com.android.systemui.shared.R;
/* loaded from: classes.dex */
public class SwitchPreferenceCompat extends TwoStatePreference {
    public SwitchPreferenceCompat(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, R.attr.switchPreferenceCompatStyle);
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R$id.SwitchPreferenceCompat, R.attr.switchPreferenceCompatStyle, 0);
        this.mSummaryOn = TypedArrayUtils.getString(obtainStyledAttributes, 7, 0);
        this.mSummaryOff = TypedArrayUtils.getString(obtainStyledAttributes, 6, 1);
        TypedArrayUtils.getString(obtainStyledAttributes, 9, 3);
        TypedArrayUtils.getString(obtainStyledAttributes, 8, 4);
        this.mDisableDependentsState = obtainStyledAttributes.getBoolean(5, obtainStyledAttributes.getBoolean(2, false));
        obtainStyledAttributes.recycle();
    }
}
