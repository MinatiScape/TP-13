package com.android.wallpaper.picker;

import android.content.Context;
import android.graphics.Point;
import android.util.AttributeSet;
import android.view.WindowManager;
import androidx.cardview.widget.CardView;
import com.android.systemui.shared.R;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.android.wallpaper.util.ScreenSizeCalculator;
/* loaded from: classes.dex */
public final class WallpaperSectionView extends SectionView {
    public CardView mHomePreviewCard;
    public CardView mLockscreenPreviewCard;

    public final void matchDeviceShape(CardView cardView) {
        ScreenSizeCalculator screenSizeCalculator = ScreenSizeCalculator.getInstance();
        Context context = getContext();
        screenSizeCalculator.getClass();
        Point screenSize = screenSizeCalculator.getScreenSize(((WindowManager) context.getSystemService(WindowManager.class)).getDefaultDisplay());
        cardView.getLayoutParams().height = (int) (cardView.getMeasuredWidth() * (screenSize.y / screenSize.x));
        cardView.setRadius(getResources().getDimension(R.dimen.wallpaper_picker_entry_card_corner_radius));
    }

    @Override // android.view.View
    public final void onFinishInflate() {
        super.onFinishInflate();
        this.mHomePreviewCard = (CardView) findViewById(R.id.home_preview);
        this.mLockscreenPreviewCard = (CardView) findViewById(R.id.lock_preview);
        CardView.this.setElevation(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        CardView.this.setElevation(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
    }

    @Override // android.widget.LinearLayout, android.view.View
    public final void onMeasure(int i, int i2) {
        super.onMeasure(i, i2);
        matchDeviceShape(this.mHomePreviewCard);
        matchDeviceShape(this.mLockscreenPreviewCard);
    }

    public WallpaperSectionView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }
}
