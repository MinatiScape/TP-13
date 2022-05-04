package com.android.wallpaper.widget;

import android.content.Context;
import android.graphics.Matrix;
import android.util.AttributeSet;
import android.widget.ImageView;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
/* loaded from: classes.dex */
public class WallpaperThumbnailView extends ImageView {
    public WallpaperThumbnailView(Context context) {
        super(context);
        setScaleType(ImageView.ScaleType.MATRIX);
    }

    public WallpaperThumbnailView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        setScaleType(ImageView.ScaleType.MATRIX);
    }

    @Override // android.view.View
    public final void onLayout(boolean z, int i, int i2, int i3, int i4) {
        float f;
        float f2;
        super.onLayout(z, i, i2, i3, i4);
        if (getDrawable() != null) {
            Matrix imageMatrix = getImageMatrix();
            int width = (getWidth() - getPaddingLeft()) - getPaddingRight();
            int height = (getHeight() - getPaddingTop()) - getPaddingBottom();
            int intrinsicWidth = getDrawable().getIntrinsicWidth();
            int intrinsicHeight = getDrawable().getIntrinsicHeight();
            if (intrinsicWidth * height > intrinsicHeight * width) {
                f2 = height;
                f = intrinsicHeight;
            } else {
                f2 = width;
                f = intrinsicWidth;
            }
            float f3 = f2 / f;
            imageMatrix.setScale(f3, f3);
            float f4 = intrinsicHeight * f3;
            float f5 = height;
            if (f4 > f5) {
                imageMatrix.postTranslate(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, -((f4 - f5) / 2.0f));
            }
            if (getLayoutDirection() == 1) {
                imageMatrix.postTranslate(-((intrinsicWidth * f3) - width), HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
            }
            setImageMatrix(imageMatrix);
            invalidate();
        }
    }
}
