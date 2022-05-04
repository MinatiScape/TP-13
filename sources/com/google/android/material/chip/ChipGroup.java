package com.google.android.material.chip;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.core.view.accessibility.AccessibilityNodeInfoCompat;
import com.android.systemui.shared.R;
import com.google.android.material.R$styleable;
import com.google.android.material.internal.CheckableGroup;
import com.google.android.material.internal.FlowLayout;
import com.google.android.material.internal.MaterialCheckable;
import com.google.android.material.internal.ThemeEnforcement;
import com.google.android.material.theme.overlay.MaterialThemeOverlay;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public class ChipGroup extends FlowLayout {
    public static final /* synthetic */ int $r8$clinit = 0;
    public final CheckableGroup<Chip> checkableGroup;
    public int chipSpacingHorizontal;
    public int chipSpacingVertical;
    public final int defaultCheckedId;
    public final PassThroughHierarchyChangeListener passThroughListener;

    /* renamed from: com.google.android.material.chip.ChipGroup$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass1 implements CheckableGroup.OnCheckedStateChangeListener {
        public AnonymousClass1() {
        }
    }

    /* loaded from: classes.dex */
    public static class LayoutParams extends ViewGroup.MarginLayoutParams {
        public LayoutParams(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
        }

        public LayoutParams(ViewGroup.LayoutParams layoutParams) {
            super(layoutParams);
        }

        public LayoutParams() {
            super(-2, -2);
        }
    }

    /* loaded from: classes.dex */
    public class PassThroughHierarchyChangeListener implements ViewGroup.OnHierarchyChangeListener {
        public ViewGroup.OnHierarchyChangeListener onHierarchyChangeListener;

        public PassThroughHierarchyChangeListener() {
        }

        @Override // android.view.ViewGroup.OnHierarchyChangeListener
        public final void onChildViewAdded(View view, View view2) {
            if (view == ChipGroup.this && (view2 instanceof Chip)) {
                if (view2.getId() == -1) {
                    WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                    view2.setId(ViewCompat.Api17Impl.generateViewId());
                }
                CheckableGroup<Chip> checkableGroup = ChipGroup.this.checkableGroup;
                Chip chip = (Chip) view2;
                checkableGroup.checkables.put(Integer.valueOf(chip.getId()), chip);
                if (chip.isChecked()) {
                    checkableGroup.checkInternal(chip);
                }
                chip.onCheckedChangeListenerInternal = new CheckableGroup.AnonymousClass1();
            }
            ViewGroup.OnHierarchyChangeListener onHierarchyChangeListener = this.onHierarchyChangeListener;
            if (onHierarchyChangeListener != null) {
                onHierarchyChangeListener.onChildViewAdded(view, view2);
            }
        }

        @Override // android.view.ViewGroup.OnHierarchyChangeListener
        public final void onChildViewRemoved(View view, View view2) {
            ChipGroup chipGroup = ChipGroup.this;
            if (view == chipGroup && (view2 instanceof Chip)) {
                CheckableGroup<Chip> checkableGroup = chipGroup.checkableGroup;
                Chip chip = (Chip) view2;
                checkableGroup.getClass();
                chip.onCheckedChangeListenerInternal = null;
                checkableGroup.checkables.remove(Integer.valueOf(chip.getId()));
                checkableGroup.checkedIds.remove(Integer.valueOf(chip.getId()));
            }
            ViewGroup.OnHierarchyChangeListener onHierarchyChangeListener = this.onHierarchyChangeListener;
            if (onHierarchyChangeListener != null) {
                onHierarchyChangeListener.onChildViewRemoved(view, view2);
            }
        }
    }

    public ChipGroup(Context context) {
        this(context, null);
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return new LayoutParams(getContext(), attributeSet);
    }

    public ChipGroup(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, R.attr.chipGroupStyle);
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams();
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return new LayoutParams(layoutParams);
    }

    @Override // android.view.ViewGroup
    public final void setOnHierarchyChangeListener(ViewGroup.OnHierarchyChangeListener onHierarchyChangeListener) {
        this.passThroughListener.onHierarchyChangeListener = onHierarchyChangeListener;
    }

    public ChipGroup(Context context, AttributeSet attributeSet, int i) {
        super(MaterialThemeOverlay.wrap(context, attributeSet, i, R.style.Widget_MaterialComponents_ChipGroup), attributeSet, i);
        CheckableGroup<Chip> checkableGroup = new CheckableGroup<>();
        this.checkableGroup = checkableGroup;
        this.passThroughListener = new PassThroughHierarchyChangeListener();
        TypedArray obtainStyledAttributes = ThemeEnforcement.obtainStyledAttributes(getContext(), attributeSet, R$styleable.ChipGroup, i, R.style.Widget_MaterialComponents_ChipGroup, new int[0]);
        int dimensionPixelOffset = obtainStyledAttributes.getDimensionPixelOffset(1, 0);
        int dimensionPixelOffset2 = obtainStyledAttributes.getDimensionPixelOffset(2, dimensionPixelOffset);
        if (this.chipSpacingHorizontal != dimensionPixelOffset2) {
            this.chipSpacingHorizontal = dimensionPixelOffset2;
            this.itemSpacing = dimensionPixelOffset2;
            requestLayout();
        }
        int dimensionPixelOffset3 = obtainStyledAttributes.getDimensionPixelOffset(3, dimensionPixelOffset);
        if (this.chipSpacingVertical != dimensionPixelOffset3) {
            this.chipSpacingVertical = dimensionPixelOffset3;
            this.lineSpacing = dimensionPixelOffset3;
            requestLayout();
        }
        this.singleLine = obtainStyledAttributes.getBoolean(5, false);
        boolean z = obtainStyledAttributes.getBoolean(6, false);
        if (checkableGroup.singleSelection != z) {
            checkableGroup.singleSelection = z;
            boolean z2 = !checkableGroup.checkedIds.isEmpty();
            for (MaterialCheckable<Chip> materialCheckable : checkableGroup.checkables.values()) {
                checkableGroup.uncheckInternal(materialCheckable, false);
            }
            if (z2) {
                checkableGroup.onCheckedStateChanged();
            }
        }
        this.checkableGroup.selectionRequired = obtainStyledAttributes.getBoolean(4, false);
        this.defaultCheckedId = obtainStyledAttributes.getResourceId(0, -1);
        obtainStyledAttributes.recycle();
        this.checkableGroup.onCheckedStateChangeListener = new AnonymousClass1();
        super.setOnHierarchyChangeListener(this.passThroughListener);
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        ViewCompat.Api16Impl.setImportantForAccessibility(this, 1);
    }

    @Override // android.view.ViewGroup
    public final boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        if (!super.checkLayoutParams(layoutParams) || !(layoutParams instanceof LayoutParams)) {
            return false;
        }
        return true;
    }

    @Override // android.view.View
    public final void onFinishInflate() {
        super.onFinishInflate();
        int i = this.defaultCheckedId;
        if (i != -1) {
            CheckableGroup<Chip> checkableGroup = this.checkableGroup;
            MaterialCheckable<Chip> materialCheckable = (MaterialCheckable) checkableGroup.checkables.get(Integer.valueOf(i));
            if (materialCheckable != null && checkableGroup.checkInternal(materialCheckable)) {
                checkableGroup.onCheckedStateChanged();
            }
        }
    }

    @Override // android.view.View
    public final void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilityNodeInfo) {
        int i;
        int i2;
        super.onInitializeAccessibilityNodeInfo(accessibilityNodeInfo);
        if (this.singleLine) {
            i = 0;
            for (int i3 = 0; i3 < getChildCount(); i3++) {
                if (getChildAt(i3) instanceof Chip) {
                    i++;
                }
            }
        } else {
            i = -1;
        }
        int i4 = this.rowCount;
        if (this.checkableGroup.singleSelection) {
            i2 = 1;
        } else {
            i2 = 2;
        }
        accessibilityNodeInfo.setCollectionInfo((AccessibilityNodeInfo.CollectionInfo) AccessibilityNodeInfoCompat.CollectionInfoCompat.obtain(i4, i, i2).mInfo);
    }

    @Override // com.google.android.material.internal.FlowLayout
    public final boolean isSingleLine() {
        return this.singleLine;
    }
}
