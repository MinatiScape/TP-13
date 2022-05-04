package com.android.wallpaper.picker;

import android.app.Activity;
import android.content.Context;
import android.util.AttributeSet;
import androidx.cardview.widget.CardView;
import com.android.systemui.shared.R;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.android.wallpaper.util.ScreenSizeCalculator;
import com.android.wallpaper.util.SizeCalculator;
/* loaded from: classes.dex */
public final class WallpaperSectionView extends SectionView {
    public CardView mHomePreviewCard;
    public CardView mLockscreenPreviewCard;

    public WallpaperSectionView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public final void matchDeviceShape(CardView cardView) {
        float screenAspectRatio = ScreenSizeCalculator.getInstance().getScreenAspectRatio(getContext());
        int measuredWidth = cardView.getMeasuredWidth();
        cardView.getLayoutParams().height = (int) (measuredWidth * screenAspectRatio);
        cardView.setRadius(SizeCalculator.getPreviewCornerRadius((Activity) getContext(), measuredWidth));
    }

    @Override // android.view.View
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mHomePreviewCard = (CardView) findViewById(R.id.home_preview);
        this.mLockscreenPreviewCard = (CardView) findViewById(R.id.lock_preview);
        CardView.this.setElevation(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        CardView.this.setElevation(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
    }

    @Override // android.widget.LinearLayout, android.view.View
    public void onMeasure(int i, int i2) {
        super.onMeasure(i, i2);
        matchDeviceShape(this.mHomePreviewCard);
        matchDeviceShape(this.mLockscreenPreviewCard);
    }
}
