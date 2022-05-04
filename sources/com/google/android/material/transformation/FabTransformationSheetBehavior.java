package com.google.android.material.transformation;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewParent;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.viewpager2.R$styleable;
import com.android.systemui.shared.R;
import com.google.android.material.animation.MotionSpec;
import com.google.android.material.transformation.FabTransformationBehavior;
import java.util.HashMap;
import java.util.WeakHashMap;
@Deprecated
/* loaded from: classes.dex */
public class FabTransformationSheetBehavior extends FabTransformationBehavior {
    public HashMap importantForAccessibilityMap;

    public FabTransformationSheetBehavior() {
    }

    public FabTransformationSheetBehavior(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    @Override // com.google.android.material.transformation.FabTransformationBehavior
    public final FabTransformationBehavior.FabTransformationSpec onCreateMotionSpec(Context context, boolean z) {
        int i;
        if (z) {
            i = R.animator.mtrl_fab_transformation_sheet_expand_spec;
        } else {
            i = R.animator.mtrl_fab_transformation_sheet_collapse_spec;
        }
        FabTransformationBehavior.FabTransformationSpec fabTransformationSpec = new FabTransformationBehavior.FabTransformationSpec();
        fabTransformationSpec.timings = MotionSpec.createFromResource(context, i);
        fabTransformationSpec.positioning = new R$styleable();
        return fabTransformationSpec;
    }

    @Override // com.google.android.material.transformation.ExpandableTransformationBehavior, com.google.android.material.transformation.ExpandableBehavior
    public final void onExpandedStateChange(View view, View view2, boolean z, boolean z2) {
        boolean z3;
        ViewParent parent = view2.getParent();
        if (parent instanceof CoordinatorLayout) {
            CoordinatorLayout coordinatorLayout = (CoordinatorLayout) parent;
            int childCount = coordinatorLayout.getChildCount();
            if (z) {
                this.importantForAccessibilityMap = new HashMap(childCount);
            }
            for (int i = 0; i < childCount; i++) {
                View childAt = coordinatorLayout.getChildAt(i);
                if (!(childAt.getLayoutParams() instanceof CoordinatorLayout.LayoutParams) || !(((CoordinatorLayout.LayoutParams) childAt.getLayoutParams()).mBehavior instanceof FabTransformationScrimBehavior)) {
                    z3 = false;
                } else {
                    z3 = true;
                }
                if (childAt != view2 && !z3) {
                    if (!z) {
                        HashMap hashMap = this.importantForAccessibilityMap;
                        if (hashMap != null && hashMap.containsKey(childAt)) {
                            int intValue = ((Integer) this.importantForAccessibilityMap.get(childAt)).intValue();
                            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                            ViewCompat.Api16Impl.setImportantForAccessibility(childAt, intValue);
                        }
                    } else {
                        this.importantForAccessibilityMap.put(childAt, Integer.valueOf(childAt.getImportantForAccessibility()));
                        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap2 = ViewCompat.sViewPropertyAnimatorMap;
                        ViewCompat.Api16Impl.setImportantForAccessibility(childAt, 4);
                    }
                }
            }
            if (!z) {
                this.importantForAccessibilityMap = null;
            }
        }
        super.onExpandedStateChange(view, view2, z, z2);
    }
}
