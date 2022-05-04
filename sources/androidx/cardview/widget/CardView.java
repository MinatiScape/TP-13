package androidx.cardview.widget;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
import androidx.cardview.R$styleable;
import androidx.core.util.Preconditions;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import com.android.systemui.shared.R;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public class CardView extends FrameLayout {
    public static final int[] COLOR_BACKGROUND_ATTR = {16842801};
    public static final Preconditions IMPL = new Preconditions();
    public final AnonymousClass1 mCardViewDelegate;
    public boolean mCompatPadding;
    public final Rect mContentPadding;
    public boolean mPreventCornerOverlap;
    public final Rect mShadowBounds;

    /* renamed from: androidx.cardview.widget.CardView$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass1 {
        public Drawable mCardBackground;

        public AnonymousClass1() {
        }

        public final void setShadowPadding(int i, int i2, int i3, int i4) {
            CardView.this.mShadowBounds.set(i, i2, i3, i4);
            CardView cardView = CardView.this;
            Rect rect = cardView.mContentPadding;
            CardView.super.setPadding(i + rect.left, i2 + rect.top, i3 + rect.right, i4 + rect.bottom);
        }
    }

    public CardView(Context context) {
        this(context, null);
    }

    @Override // android.view.View
    public final void setPadding(int i, int i2, int i3, int i4) {
    }

    @Override // android.view.View
    public final void setPaddingRelative(int i, int i2, int i3, int i4) {
    }

    public CardView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, R.attr.cardViewStyle);
    }

    public final void setRadius(float f) {
        RoundRectDrawable roundRectDrawable = (RoundRectDrawable) this.mCardViewDelegate.mCardBackground;
        if (f != roundRectDrawable.mRadius) {
            roundRectDrawable.mRadius = f;
            roundRectDrawable.updateBounds(null);
            roundRectDrawable.invalidateSelf();
        }
    }

    public CardView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        ColorStateList colorStateList;
        float f;
        int i2;
        Rect rect = new Rect();
        this.mContentPadding = rect;
        this.mShadowBounds = new Rect();
        AnonymousClass1 r1 = new AnonymousClass1();
        this.mCardViewDelegate = r1;
        int[] iArr = R$styleable.CardView;
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, iArr, i, R.style.CardView);
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        ViewCompat.Api29Impl.saveAttributeDataForStyleable(this, context, iArr, attributeSet, obtainStyledAttributes, i, R.style.CardView);
        if (obtainStyledAttributes.hasValue(2)) {
            colorStateList = obtainStyledAttributes.getColorStateList(2);
        } else {
            TypedArray obtainStyledAttributes2 = getContext().obtainStyledAttributes(COLOR_BACKGROUND_ATTR);
            int color = obtainStyledAttributes2.getColor(0, 0);
            obtainStyledAttributes2.recycle();
            float[] fArr = new float[3];
            Color.colorToHSV(color, fArr);
            if (fArr[2] > 0.5f) {
                i2 = getResources().getColor(R.color.cardview_light_background);
            } else {
                i2 = getResources().getColor(R.color.cardview_dark_background);
            }
            colorStateList = ColorStateList.valueOf(i2);
        }
        float dimension = obtainStyledAttributes.getDimension(3, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        float dimension2 = obtainStyledAttributes.getDimension(4, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        float dimension3 = obtainStyledAttributes.getDimension(5, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        this.mCompatPadding = obtainStyledAttributes.getBoolean(7, false);
        this.mPreventCornerOverlap = obtainStyledAttributes.getBoolean(6, true);
        int dimensionPixelSize = obtainStyledAttributes.getDimensionPixelSize(8, 0);
        rect.left = obtainStyledAttributes.getDimensionPixelSize(10, dimensionPixelSize);
        rect.top = obtainStyledAttributes.getDimensionPixelSize(12, dimensionPixelSize);
        rect.right = obtainStyledAttributes.getDimensionPixelSize(11, dimensionPixelSize);
        rect.bottom = obtainStyledAttributes.getDimensionPixelSize(9, dimensionPixelSize);
        dimension3 = dimension2 > dimension3 ? dimension2 : dimension3;
        obtainStyledAttributes.getDimensionPixelSize(0, 0);
        obtainStyledAttributes.getDimensionPixelSize(1, 0);
        obtainStyledAttributes.recycle();
        RoundRectDrawable roundRectDrawable = new RoundRectDrawable(colorStateList, dimension);
        r1.mCardBackground = roundRectDrawable;
        setBackgroundDrawable(roundRectDrawable);
        setClipToOutline(true);
        setElevation(dimension2);
        RoundRectDrawable roundRectDrawable2 = (RoundRectDrawable) r1.mCardBackground;
        boolean z = this.mCompatPadding;
        boolean z2 = this.mPreventCornerOverlap;
        if (!(dimension3 == roundRectDrawable2.mPadding && roundRectDrawable2.mInsetForPadding == z && roundRectDrawable2.mInsetForRadius == z2)) {
            roundRectDrawable2.mPadding = dimension3;
            roundRectDrawable2.mInsetForPadding = z;
            roundRectDrawable2.mInsetForRadius = z2;
            roundRectDrawable2.updateBounds(null);
            roundRectDrawable2.invalidateSelf();
        }
        if (!this.mCompatPadding) {
            r1.setShadowPadding(0, 0, 0, 0);
            return;
        }
        Drawable drawable = r1.mCardBackground;
        float f2 = ((RoundRectDrawable) drawable).mPadding;
        float f3 = ((RoundRectDrawable) drawable).mRadius;
        if (this.mPreventCornerOverlap) {
            f = (float) (((1.0d - RoundRectDrawableWithShadow.COS_45) * f3) + f2);
        } else {
            int i3 = RoundRectDrawableWithShadow.$r8$clinit;
            f = f2;
        }
        int ceil = (int) Math.ceil(f);
        int ceil2 = (int) Math.ceil(RoundRectDrawableWithShadow.calculateVerticalPadding(f2, f3, this.mPreventCornerOverlap));
        r1.setShadowPadding(ceil, ceil2, ceil, ceil2);
    }

    @Override // android.widget.FrameLayout, android.view.View
    public final void onMeasure(int i, int i2) {
        super.onMeasure(i, i2);
    }

    @Override // android.view.View
    public final void setMinimumHeight(int i) {
        super.setMinimumHeight(i);
    }

    @Override // android.view.View
    public final void setMinimumWidth(int i) {
        super.setMinimumWidth(i);
    }
}
