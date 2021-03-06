package com.android.customization.picker.themedicon;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.CompoundButton;
import android.widget.Switch;
import com.android.systemui.shared.R;
import com.android.wallpaper.picker.SectionView;
/* loaded from: classes.dex */
public class ThemedIconSectionView extends SectionView {
    public static final /* synthetic */ int $r8$clinit = 0;
    public Switch mSwitchView;

    public ThemedIconSectionView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        context.getString(R.string.themed_icon_title);
    }

    @Override // android.view.View
    public final void onFinishInflate() {
        super.onFinishInflate();
        this.mSwitchView = (Switch) findViewById(R.id.themed_icon_toggle);
        setOnClickListener(new View.OnClickListener() { // from class: com.android.customization.picker.themedicon.ThemedIconSectionView$$ExternalSyntheticLambda0
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                ThemedIconSectionView.this.mSwitchView.toggle();
            }
        });
        this.mSwitchView.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() { // from class: com.android.customization.picker.themedicon.ThemedIconSectionView$$ExternalSyntheticLambda1
            @Override // android.widget.CompoundButton.OnCheckedChangeListener
            public final void onCheckedChanged(CompoundButton compoundButton, boolean z) {
                ThemedIconSectionView themedIconSectionView = ThemedIconSectionView.this;
                int i = ThemedIconSectionView.$r8$clinit;
                SectionView.SectionViewListener sectionViewListener = themedIconSectionView.mSectionViewListener;
                if (sectionViewListener != null) {
                    sectionViewListener.onViewActivated(themedIconSectionView.getContext(), z);
                }
            }
        });
    }
}
