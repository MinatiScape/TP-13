package androidx.cardview.widget;

import android.graphics.drawable.Drawable;
/* loaded from: classes.dex */
public class RoundRectDrawableWithShadow extends Drawable {
    public static final double COS_45 = Math.cos(Math.toRadians(45.0d));

    public static float calculateHorizontalPadding(float maxShadowSize, float cornerRadius, boolean addPaddingForCorners) {
        if (!addPaddingForCorners) {
            return maxShadowSize;
        }
        return (float) (((1.0d - COS_45) * cornerRadius) + maxShadowSize);
    }

    public static float calculateVerticalPadding(float maxShadowSize, float cornerRadius, boolean addPaddingForCorners) {
        if (!addPaddingForCorners) {
            return maxShadowSize * 1.5f;
        }
        return (float) (((1.0d - COS_45) * cornerRadius) + (maxShadowSize * 1.5f));
    }
}
