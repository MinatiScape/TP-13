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
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import com.android.systemui.shared.R;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public class CardView extends FrameLayout {
    public static final int[] COLOR_BACKGROUND_ATTR = {16842801};
    public static final CardViewImpl IMPL = new CardViewApi21Impl();
    public final CardViewDelegate mCardViewDelegate;
    public boolean mCompatPadding;
    public final Rect mContentPadding;
    public boolean mPreventCornerOverlap;
    public final Rect mShadowBounds;
    public int mUserSetMinHeight;
    public int mUserSetMinWidth;

    /* renamed from: androidx.cardview.widget.CardView$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass1 implements CardViewDelegate {
        public Drawable mCardBackground;

        public AnonymousClass1() {
        }

        public void setShadowPadding(int left, int top, int right, int bottom) {
            CardView.this.mShadowBounds.set(left, top, right, bottom);
            CardView cardView = CardView.this;
            Rect rect = cardView.mContentPadding;
            CardView.super.setPadding(left + rect.left, top + rect.top, right + rect.right, bottom + rect.bottom);
        }
    }

    public CardView(Context context) {
        this(context, null);
    }

    @Override // android.widget.FrameLayout, android.view.View
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
    }

    @Override // android.view.View
    public void setMinimumHeight(int minHeight) {
        this.mUserSetMinHeight = minHeight;
        super.setMinimumHeight(minHeight);
    }

    @Override // android.view.View
    public void setMinimumWidth(int minWidth) {
        this.mUserSetMinWidth = minWidth;
        super.setMinimumWidth(minWidth);
    }

    @Override // android.view.View
    public void setPadding(int left, int top, int right, int bottom) {
    }

    @Override // android.view.View
    public void setPaddingRelative(int start, int top, int end, int bottom) {
    }

    public void setRadius(float radius) {
        RoundRectDrawable cardBackground = ((CardViewApi21Impl) IMPL).getCardBackground(this.mCardViewDelegate);
        if (radius != cardBackground.mRadius) {
            cardBackground.mRadius = radius;
            cardBackground.updateBounds(null);
            cardBackground.invalidateSelf();
        }
    }

    public CardView(Context context, AttributeSet attrs) {
        this(context, attrs, R.attr.cardViewStyle);
    }

    public CardView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        ColorStateList colorStateList;
        int i;
        Rect rect = new Rect();
        this.mContentPadding = rect;
        this.mShadowBounds = new Rect();
        AnonymousClass1 r1 = new AnonymousClass1();
        this.mCardViewDelegate = r1;
        int[] iArr = R$styleable.CardView;
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attrs, iArr, defStyleAttr, R.style.CardView);
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        ViewCompat.Api29Impl.saveAttributeDataForStyleable(this, context, iArr, attrs, obtainStyledAttributes, defStyleAttr, R.style.CardView);
        if (obtainStyledAttributes.hasValue(2)) {
            colorStateList = obtainStyledAttributes.getColorStateList(2);
        } else {
            TypedArray obtainStyledAttributes2 = getContext().obtainStyledAttributes(COLOR_BACKGROUND_ATTR);
            int color = obtainStyledAttributes2.getColor(0, 0);
            obtainStyledAttributes2.recycle();
            float[] fArr = new float[3];
            Color.colorToHSV(color, fArr);
            if (fArr[2] > 0.5f) {
                i = getResources().getColor(R.color.cardview_light_background);
            } else {
                i = getResources().getColor(R.color.cardview_dark_background);
            }
            colorStateList = ColorStateList.valueOf(i);
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
        this.mUserSetMinWidth = obtainStyledAttributes.getDimensionPixelSize(0, 0);
        this.mUserSetMinHeight = obtainStyledAttributes.getDimensionPixelSize(1, 0);
        obtainStyledAttributes.recycle();
        CardViewApi21Impl cardViewApi21Impl = (CardViewApi21Impl) IMPL;
        RoundRectDrawable roundRectDrawable = new RoundRectDrawable(colorStateList, dimension);
        AnonymousClass1 r11 = r1;
        r11.mCardBackground = roundRectDrawable;
        CardView.this.setBackgroundDrawable(roundRectDrawable);
        CardView cardView = CardView.this;
        cardView.setClipToOutline(true);
        cardView.setElevation(dimension2);
        RoundRectDrawable cardBackground = cardViewApi21Impl.getCardBackground(r1);
        CardView cardView2 = CardView.this;
        boolean z = cardView2.mCompatPadding;
        boolean z2 = cardView2.mPreventCornerOverlap;
        if (!(dimension3 == cardBackground.mPadding && cardBackground.mInsetForPadding == z && cardBackground.mInsetForRadius == z2)) {
            cardBackground.mPadding = dimension3;
            cardBackground.mInsetForPadding = z;
            cardBackground.mInsetForRadius = z2;
            cardBackground.updateBounds(null);
            cardBackground.invalidateSelf();
        }
        if (!CardView.this.mCompatPadding) {
            r11.setShadowPadding(0, 0, 0, 0);
            return;
        }
        float f = cardViewApi21Impl.getCardBackground(r1).mPadding;
        float f2 = cardViewApi21Impl.getCardBackground(r1).mRadius;
        int ceil = (int) Math.ceil(RoundRectDrawableWithShadow.calculateHorizontalPadding(f, f2, CardView.this.mPreventCornerOverlap));
        int ceil2 = (int) Math.ceil(RoundRectDrawableWithShadow.calculateVerticalPadding(f, f2, CardView.this.mPreventCornerOverlap));
        r11.setShadowPadding(ceil, ceil2, ceil, ceil2);
    }
}
