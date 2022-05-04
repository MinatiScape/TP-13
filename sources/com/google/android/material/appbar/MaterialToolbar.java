package com.google.android.material.appbar;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.util.Pair;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.appcompat.R$layout;
import androidx.appcompat.widget.AppCompatImageView;
import androidx.appcompat.widget.Toolbar;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import com.android.systemui.shared.R;
import com.google.android.material.R$styleable;
import com.google.android.material.internal.ThemeEnforcement;
import com.google.android.material.internal.ToolbarUtils;
import com.google.android.material.shape.MaterialShapeDrawable;
import com.google.android.material.theme.overlay.MaterialThemeOverlay;
import com.google.common.math.IntMath;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public class MaterialToolbar extends Toolbar {
    public static final ImageView.ScaleType[] LOGO_SCALE_TYPE_ARRAY = {ImageView.ScaleType.MATRIX, ImageView.ScaleType.FIT_XY, ImageView.ScaleType.FIT_START, ImageView.ScaleType.FIT_CENTER, ImageView.ScaleType.FIT_END, ImageView.ScaleType.CENTER, ImageView.ScaleType.CENTER_CROP, ImageView.ScaleType.CENTER_INSIDE};
    public Boolean logoAdjustViewBounds;
    public ImageView.ScaleType logoScaleType;
    public Integer navigationIconTint;
    public boolean subtitleCentered;
    public boolean titleCentered;

    public MaterialToolbar(Context context) {
        this(context, null);
    }

    public MaterialToolbar(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, R.attr.toolbarStyle);
    }

    @Override // androidx.appcompat.widget.Toolbar
    public final void setNavigationIcon(Drawable drawable) {
        if (!(drawable == null || this.navigationIconTint == null)) {
            drawable = drawable.mutate();
            drawable.setTint(this.navigationIconTint.intValue());
        }
        super.setNavigationIcon(drawable);
    }

    public MaterialToolbar(Context context, AttributeSet attributeSet, int i) {
        super(MaterialThemeOverlay.wrap(context, attributeSet, i, R.style.Widget_MaterialComponents_Toolbar), attributeSet, i);
        Context context2 = getContext();
        int i2 = 0;
        TypedArray obtainStyledAttributes = ThemeEnforcement.obtainStyledAttributes(context2, attributeSet, R$styleable.MaterialToolbar, i, R.style.Widget_MaterialComponents_Toolbar, new int[0]);
        if (obtainStyledAttributes.hasValue(2)) {
            this.navigationIconTint = Integer.valueOf(obtainStyledAttributes.getColor(2, -1));
            Drawable navigationIcon = getNavigationIcon();
            if (navigationIcon != null) {
                setNavigationIcon(navigationIcon);
            }
        }
        this.titleCentered = obtainStyledAttributes.getBoolean(4, false);
        this.subtitleCentered = obtainStyledAttributes.getBoolean(3, false);
        int i3 = obtainStyledAttributes.getInt(1, -1);
        if (i3 >= 0) {
            ImageView.ScaleType[] scaleTypeArr = LOGO_SCALE_TYPE_ARRAY;
            if (i3 < scaleTypeArr.length) {
                this.logoScaleType = scaleTypeArr[i3];
            }
        }
        if (obtainStyledAttributes.hasValue(0)) {
            this.logoAdjustViewBounds = Boolean.valueOf(obtainStyledAttributes.getBoolean(0, false));
        }
        obtainStyledAttributes.recycle();
        Drawable background = getBackground();
        if (background == null || (background instanceof ColorDrawable)) {
            MaterialShapeDrawable materialShapeDrawable = new MaterialShapeDrawable();
            materialShapeDrawable.setFillColor(ColorStateList.valueOf(background != null ? ((ColorDrawable) background).getColor() : i2));
            materialShapeDrawable.initializeElevationOverlay(context2);
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            materialShapeDrawable.setElevation(ViewCompat.Api21Impl.getElevation(this));
            ViewCompat.Api16Impl.setBackground(this, materialShapeDrawable);
        }
    }

    public final void layoutTitleCenteredHorizontally(TextView textView, Pair pair) {
        int measuredWidth = getMeasuredWidth();
        int measuredWidth2 = textView.getMeasuredWidth();
        int i = (measuredWidth / 2) - (measuredWidth2 / 2);
        int i2 = measuredWidth2 + i;
        int max = Math.max(Math.max(((Integer) pair.first).intValue() - i, 0), Math.max(i2 - ((Integer) pair.second).intValue(), 0));
        if (max > 0) {
            i += max;
            i2 -= max;
            textView.measure(View.MeasureSpec.makeMeasureSpec(i2 - i, IntMath.MAX_SIGNED_POWER_OF_TWO), textView.getMeasuredHeightAndState());
        }
        textView.layout(i, textView.getTop(), i2, textView.getBottom());
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        Drawable background = getBackground();
        if (background instanceof MaterialShapeDrawable) {
            R$layout.setParentAbsoluteElevation(this, (MaterialShapeDrawable) background);
        }
    }

    @Override // androidx.appcompat.widget.Toolbar, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z, int i, int i2, int i3, int i4) {
        Drawable drawable;
        super.onLayout(z, i, i2, i3, i4);
        int i5 = 0;
        if (this.titleCentered || this.subtitleCentered) {
            TextView textView = ToolbarUtils.getTextView(this, this.mTitleText);
            TextView textView2 = ToolbarUtils.getTextView(this, this.mSubtitleText);
            if (!(textView == null && textView2 == null)) {
                int measuredWidth = getMeasuredWidth();
                int i6 = measuredWidth / 2;
                int paddingLeft = getPaddingLeft();
                int paddingRight = measuredWidth - getPaddingRight();
                for (int i7 = 0; i7 < getChildCount(); i7++) {
                    View childAt = getChildAt(i7);
                    if (!(childAt.getVisibility() == 8 || childAt == textView || childAt == textView2)) {
                        if (childAt.getRight() < i6 && childAt.getRight() > paddingLeft) {
                            paddingLeft = childAt.getRight();
                        }
                        if (childAt.getLeft() > i6 && childAt.getLeft() < paddingRight) {
                            paddingRight = childAt.getLeft();
                        }
                    }
                }
                Pair pair = new Pair(Integer.valueOf(paddingLeft), Integer.valueOf(paddingRight));
                if (this.titleCentered && textView != null) {
                    layoutTitleCenteredHorizontally(textView, pair);
                }
                if (this.subtitleCentered && textView2 != null) {
                    layoutTitleCenteredHorizontally(textView2, pair);
                }
            }
        }
        AppCompatImageView appCompatImageView = this.mLogoView;
        ImageView imageView = null;
        if (appCompatImageView != null) {
            drawable = appCompatImageView.getDrawable();
        } else {
            drawable = null;
        }
        while (true) {
            if (i5 >= getChildCount()) {
                break;
            }
            View childAt2 = getChildAt(i5);
            if (childAt2 instanceof ImageView) {
                ImageView imageView2 = (ImageView) childAt2;
                if (drawable != null && imageView2.getDrawable().getConstantState().equals(drawable.getConstantState())) {
                    imageView = imageView2;
                    break;
                }
            }
            i5++;
        }
        if (imageView != null) {
            Boolean bool = this.logoAdjustViewBounds;
            if (bool != null) {
                imageView.setAdjustViewBounds(bool.booleanValue());
            }
            ImageView.ScaleType scaleType = this.logoScaleType;
            if (scaleType != null) {
                imageView.setScaleType(scaleType);
            }
        }
    }

    @Override // android.view.View
    public final void setElevation(float f) {
        super.setElevation(f);
        Drawable background = getBackground();
        if (background instanceof MaterialShapeDrawable) {
            ((MaterialShapeDrawable) background).setElevation(f);
        }
    }
}
