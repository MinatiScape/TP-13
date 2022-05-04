package androidx.core.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.EdgeEffect;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
/* loaded from: classes.dex */
public class EdgeEffectCompat$Api31Impl {
    public static EdgeEffect create(Context context, AttributeSet attrs) {
        try {
            return new EdgeEffect(context, attrs);
        } catch (Throwable unused) {
            return new EdgeEffect(context);
        }
    }

    public static float getDistance(EdgeEffect edgeEffect) {
        try {
            return edgeEffect.getDistance();
        } catch (Throwable unused) {
            return HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        }
    }

    public static float onPullDistance(EdgeEffect edgeEffect, float deltaDistance, float displacement) {
        try {
            return edgeEffect.onPullDistance(deltaDistance, displacement);
        } catch (Throwable unused) {
            edgeEffect.onPull(deltaDistance, displacement);
            return HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        }
    }
}
