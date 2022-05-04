package androidx.constraintlayout.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.ViewGroup;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.slice.compat.SliceProviderCompat$2;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
/* loaded from: classes.dex */
public final class Constraints extends ViewGroup {
    public ConstraintSet myConstraintSet;

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return new LayoutParams(getContext(), attributeSet);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z, int i, int i2, int i3, int i4) {
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams();
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return new ConstraintLayout.LayoutParams(layoutParams);
    }

    /* loaded from: classes.dex */
    public static class LayoutParams extends ConstraintLayout.LayoutParams {
        public float alpha;
        public boolean applyElevation;
        public float elevation;
        public float rotation;
        public float rotationX;
        public float rotationY;
        public float scaleX;
        public float scaleY;
        public float transformPivotX;
        public float transformPivotY;
        public float translationX;
        public float translationY;
        public float translationZ;

        public LayoutParams() {
            this.alpha = 1.0f;
            this.applyElevation = false;
            this.elevation = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
            this.rotation = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
            this.rotationX = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
            this.rotationY = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
            this.scaleX = 1.0f;
            this.scaleY = 1.0f;
            this.transformPivotX = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
            this.transformPivotY = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
            this.translationX = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
            this.translationY = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
            this.translationZ = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        }

        public LayoutParams(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            this.alpha = 1.0f;
            this.applyElevation = false;
            this.elevation = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
            this.rotation = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
            this.rotationX = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
            this.rotationY = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
            this.scaleX = 1.0f;
            this.scaleY = 1.0f;
            this.transformPivotX = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
            this.transformPivotY = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
            this.translationX = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
            this.translationY = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
            this.translationZ = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
            TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, SliceProviderCompat$2.ConstraintSet);
            int indexCount = obtainStyledAttributes.getIndexCount();
            for (int i = 0; i < indexCount; i++) {
                int index = obtainStyledAttributes.getIndex(i);
                if (index == 15) {
                    this.alpha = obtainStyledAttributes.getFloat(index, this.alpha);
                } else if (index == 28) {
                    this.elevation = obtainStyledAttributes.getFloat(index, this.elevation);
                    this.applyElevation = true;
                } else if (index == 23) {
                    this.rotationX = obtainStyledAttributes.getFloat(index, this.rotationX);
                } else if (index == 24) {
                    this.rotationY = obtainStyledAttributes.getFloat(index, this.rotationY);
                } else if (index == 22) {
                    this.rotation = obtainStyledAttributes.getFloat(index, this.rotation);
                } else if (index == 20) {
                    this.scaleX = obtainStyledAttributes.getFloat(index, this.scaleX);
                } else if (index == 21) {
                    this.scaleY = obtainStyledAttributes.getFloat(index, this.scaleY);
                } else if (index == 16) {
                    this.transformPivotX = obtainStyledAttributes.getFloat(index, this.transformPivotX);
                } else if (index == 17) {
                    this.transformPivotY = obtainStyledAttributes.getFloat(index, this.transformPivotY);
                } else if (index == 18) {
                    this.translationX = obtainStyledAttributes.getFloat(index, this.translationX);
                } else if (index == 19) {
                    this.translationY = obtainStyledAttributes.getFloat(index, this.translationY);
                } else if (index == 27) {
                    this.translationZ = obtainStyledAttributes.getFloat(index, this.translationZ);
                }
            }
        }
    }
}
