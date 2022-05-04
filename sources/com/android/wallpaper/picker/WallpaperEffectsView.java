package com.android.wallpaper.picker;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.LinearLayout;
import android.widget.Switch;
import com.android.systemui.shared.R;
/* loaded from: classes.dex */
public class WallpaperEffectsView extends LinearLayout {
    public Switch mCinematicSwitch;
    public EffectSwitchListener mListener;

    /* loaded from: classes.dex */
    public interface EffectSwitchListener {
    }

    @Override // android.view.View
    public final void onFinishInflate() {
        super.onFinishInflate();
        this.mCinematicSwitch = (Switch) findViewById(R.id.cinematic_effect_switch);
    }

    public WallpaperEffectsView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
    }
}
