package com.google.android.material.floatingactionbutton;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.util.Property;
import android.view.View;
import android.view.ViewGroup;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import com.google.android.material.R$styleable;
import com.google.android.material.appbar.AppBarLayout;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.google.android.material.button.MaterialButton;
import com.google.android.material.internal.DescendantOffsetUtils;
import java.util.List;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public final class ExtendedFloatingActionButton extends MaterialButton implements CoordinatorLayout.AttachedBehavior {
    public static final /* synthetic */ int $r8$clinit = 0;

    /* loaded from: classes.dex */
    public static class ExtendedFloatingActionButtonBehavior<T extends ExtendedFloatingActionButton> extends CoordinatorLayout.Behavior<T> {
        public boolean autoHideEnabled;
        public boolean autoShrinkEnabled;
        public Rect tmpRect;

        public ExtendedFloatingActionButtonBehavior() {
            this.autoHideEnabled = false;
            this.autoShrinkEnabled = true;
        }

        public void setInternalAutoHideCallback(OnChangedCallback onChangedCallback) {
        }

        public void setInternalAutoShrinkCallback(OnChangedCallback onChangedCallback) {
        }

        @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
        public final /* bridge */ /* synthetic */ boolean getInsetDodgeRect(View view) {
            ExtendedFloatingActionButton extendedFloatingActionButton = (ExtendedFloatingActionButton) view;
            return false;
        }

        @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
        public final void onAttachedToLayoutParams(CoordinatorLayout.LayoutParams layoutParams) {
            if (layoutParams.dodgeInsetEdges == 0) {
                layoutParams.dodgeInsetEdges = 80;
            }
        }

        @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
        public final boolean onDependentViewChanged(CoordinatorLayout coordinatorLayout, View view, View view2) {
            boolean z;
            ExtendedFloatingActionButton extendedFloatingActionButton = (ExtendedFloatingActionButton) view;
            if (view2 instanceof AppBarLayout) {
                updateFabVisibilityForAppBarLayout(coordinatorLayout, (AppBarLayout) view2, extendedFloatingActionButton);
            } else {
                ViewGroup.LayoutParams layoutParams = view2.getLayoutParams();
                if (layoutParams instanceof CoordinatorLayout.LayoutParams) {
                    z = ((CoordinatorLayout.LayoutParams) layoutParams).mBehavior instanceof BottomSheetBehavior;
                } else {
                    z = false;
                }
                if (z) {
                    updateFabVisibilityForBottomSheet(view2, extendedFloatingActionButton);
                }
            }
            return false;
        }

        @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.Behavior
        public final boolean onLayoutChild(CoordinatorLayout coordinatorLayout, View view, int i) {
            boolean z;
            ExtendedFloatingActionButton extendedFloatingActionButton = (ExtendedFloatingActionButton) view;
            List<View> dependencies = coordinatorLayout.getDependencies(extendedFloatingActionButton);
            int size = dependencies.size();
            for (int i2 = 0; i2 < size; i2++) {
                View view2 = dependencies.get(i2);
                if (view2 instanceof AppBarLayout) {
                    updateFabVisibilityForAppBarLayout(coordinatorLayout, (AppBarLayout) view2, extendedFloatingActionButton);
                } else {
                    ViewGroup.LayoutParams layoutParams = view2.getLayoutParams();
                    if (layoutParams instanceof CoordinatorLayout.LayoutParams) {
                        z = ((CoordinatorLayout.LayoutParams) layoutParams).mBehavior instanceof BottomSheetBehavior;
                    } else {
                        z = false;
                    }
                    if (z) {
                        updateFabVisibilityForBottomSheet(view2, extendedFloatingActionButton);
                    }
                }
            }
            coordinatorLayout.onLayoutChild(extendedFloatingActionButton, i);
            return true;
        }

        public final boolean updateFabVisibilityForAppBarLayout(CoordinatorLayout coordinatorLayout, AppBarLayout appBarLayout, ExtendedFloatingActionButton extendedFloatingActionButton) {
            boolean z;
            CoordinatorLayout.LayoutParams layoutParams = (CoordinatorLayout.LayoutParams) extendedFloatingActionButton.getLayoutParams();
            if ((this.autoHideEnabled || this.autoShrinkEnabled) && layoutParams.mAnchorId == appBarLayout.getId()) {
                z = true;
            } else {
                z = false;
            }
            if (!z) {
                return false;
            }
            if (this.tmpRect == null) {
                this.tmpRect = new Rect();
            }
            Rect rect = this.tmpRect;
            DescendantOffsetUtils.getDescendantRect(coordinatorLayout, appBarLayout, rect);
            if (rect.bottom <= appBarLayout.getMinimumHeightForVisibleOverlappingContent()) {
                if (this.autoShrinkEnabled) {
                    int i = ExtendedFloatingActionButton.$r8$clinit;
                } else {
                    int i2 = ExtendedFloatingActionButton.$r8$clinit;
                }
                throw null;
            }
            if (this.autoShrinkEnabled) {
                int i3 = ExtendedFloatingActionButton.$r8$clinit;
            } else {
                int i4 = ExtendedFloatingActionButton.$r8$clinit;
            }
            throw null;
        }

        public final boolean updateFabVisibilityForBottomSheet(View view, ExtendedFloatingActionButton extendedFloatingActionButton) {
            boolean z;
            CoordinatorLayout.LayoutParams layoutParams = (CoordinatorLayout.LayoutParams) extendedFloatingActionButton.getLayoutParams();
            if ((this.autoHideEnabled || this.autoShrinkEnabled) && layoutParams.mAnchorId == view.getId()) {
                z = true;
            } else {
                z = false;
            }
            if (!z) {
                return false;
            }
            if (view.getTop() < (extendedFloatingActionButton.getHeight() / 2) + ((ViewGroup.MarginLayoutParams) ((CoordinatorLayout.LayoutParams) extendedFloatingActionButton.getLayoutParams())).topMargin) {
                if (this.autoShrinkEnabled) {
                    int i = ExtendedFloatingActionButton.$r8$clinit;
                } else {
                    int i2 = ExtendedFloatingActionButton.$r8$clinit;
                }
                throw null;
            }
            if (this.autoShrinkEnabled) {
                int i3 = ExtendedFloatingActionButton.$r8$clinit;
            } else {
                int i4 = ExtendedFloatingActionButton.$r8$clinit;
            }
            throw null;
        }

        public ExtendedFloatingActionButtonBehavior(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R$styleable.ExtendedFloatingActionButton_Behavior_Layout);
            this.autoHideEnabled = obtainStyledAttributes.getBoolean(0, false);
            this.autoShrinkEnabled = obtainStyledAttributes.getBoolean(1, true);
            obtainStyledAttributes.recycle();
        }
    }

    /* loaded from: classes.dex */
    public static abstract class OnChangedCallback {
    }

    @Override // androidx.coordinatorlayout.widget.CoordinatorLayout.AttachedBehavior
    public final CoordinatorLayout.Behavior<ExtendedFloatingActionButton> getBehavior() {
        return null;
    }

    public int getCollapsedSize() {
        return 0;
    }

    @Override // android.widget.TextView
    public final void setTextColor(int i) {
        super.setTextColor(i);
        getTextColors();
    }

    static {
        new Property<View, Float>() { // from class: com.google.android.material.floatingactionbutton.ExtendedFloatingActionButton.4
            @Override // android.util.Property
            public final Float get(View view) {
                return Float.valueOf(view.getLayoutParams().width);
            }

            @Override // android.util.Property
            public final void set(View view, Float f) {
                View view2 = view;
                view2.getLayoutParams().width = f.intValue();
                view2.requestLayout();
            }
        };
        new Property<View, Float>() { // from class: com.google.android.material.floatingactionbutton.ExtendedFloatingActionButton.5
            @Override // android.util.Property
            public final Float get(View view) {
                return Float.valueOf(view.getLayoutParams().height);
            }

            @Override // android.util.Property
            public final void set(View view, Float f) {
                View view2 = view;
                view2.getLayoutParams().height = f.intValue();
                view2.requestLayout();
            }
        };
        new Property<View, Float>() { // from class: com.google.android.material.floatingactionbutton.ExtendedFloatingActionButton.6
            @Override // android.util.Property
            public final Float get(View view) {
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                return Float.valueOf(ViewCompat.Api17Impl.getPaddingStart(view));
            }

            @Override // android.util.Property
            public final void set(View view, Float f) {
                View view2 = view;
                int intValue = f.intValue();
                int paddingTop = view2.getPaddingTop();
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                ViewCompat.Api17Impl.setPaddingRelative(view2, intValue, paddingTop, ViewCompat.Api17Impl.getPaddingEnd(view2), view2.getPaddingBottom());
            }
        };
        new Property<View, Float>() { // from class: com.google.android.material.floatingactionbutton.ExtendedFloatingActionButton.7
            @Override // android.util.Property
            public final Float get(View view) {
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                return Float.valueOf(ViewCompat.Api17Impl.getPaddingEnd(view));
            }

            @Override // android.util.Property
            public final void set(View view, Float f) {
                View view2 = view;
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                ViewCompat.Api17Impl.setPaddingRelative(view2, ViewCompat.Api17Impl.getPaddingStart(view2), view2.getPaddingTop(), f.intValue(), view2.getPaddingBottom());
            }
        };
    }

    @Override // android.widget.TextView
    public final void setTextColor(ColorStateList colorStateList) {
        super.setTextColor(colorStateList);
        getTextColors();
    }

    @Override // android.widget.TextView, android.view.View
    public final void setPadding(int i, int i2, int i3, int i4) {
        super.setPadding(i, i2, i3, i4);
    }

    @Override // android.widget.TextView, android.view.View
    public final void setPaddingRelative(int i, int i2, int i3, int i4) {
        super.setPaddingRelative(i, i2, i3, i4);
    }

    @Override // com.google.android.material.button.MaterialButton, android.widget.TextView, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
    }
}
