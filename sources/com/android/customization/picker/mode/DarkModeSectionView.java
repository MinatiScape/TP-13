package com.android.customization.picker.mode;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.CompoundButton;
import android.widget.Switch;
import com.android.systemui.shared.R;
import com.android.wallpaper.picker.SectionView;
/* loaded from: classes.dex */
public final class DarkModeSectionView extends SectionView {
    public boolean mIsDarkModeActivated;

    public DarkModeSectionView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        boolean z;
        context.getString(R.string.mode_title);
        if ((context.getResources().getConfiguration().uiMode & 32) != 0) {
            z = true;
        } else {
            z = false;
        }
        this.mIsDarkModeActivated = z;
    }

    @Override // android.view.View
    public final void onFinishInflate() {
        super.onFinishInflate();
        final Switch r0 = (Switch) findViewById(R.id.dark_mode_toggle);
        r0.setChecked(this.mIsDarkModeActivated);
        r0.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() { // from class: com.android.customization.picker.mode.DarkModeSectionView$$ExternalSyntheticLambda1
            @Override // android.widget.CompoundButton.OnCheckedChangeListener
            public final void onCheckedChanged(CompoundButton compoundButton, boolean z) {
                r0.setChecked(DarkModeSectionView.this.mIsDarkModeActivated);
            }
        });
        setOnClickListener(new DarkModeSectionView$$ExternalSyntheticLambda0(this, 0));
    }

    @Override // android.view.View
    public final void setEnabled(boolean z) {
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            getChildAt(i).setEnabled(z);
        }
    }
}
