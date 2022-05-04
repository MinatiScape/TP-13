package androidx.appcompat.widget;

import android.content.Context;
import android.content.res.Configuration;
import android.util.AttributeSet;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewDebug;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.widget.LinearLayout;
import androidx.appcompat.view.menu.ActionMenuItemView;
import androidx.appcompat.view.menu.MenuBuilder;
import androidx.appcompat.view.menu.MenuItemImpl;
import androidx.appcompat.view.menu.MenuPresenter;
import androidx.appcompat.view.menu.MenuView;
import androidx.appcompat.widget.ActionMenuPresenter;
import androidx.appcompat.widget.LinearLayoutCompat;
import androidx.recyclerview.widget.RecyclerView;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.google.common.math.IntMath;
/* loaded from: classes.dex */
public class ActionMenuView extends LinearLayoutCompat implements MenuBuilder.ItemInvoker, MenuView {
    public MenuPresenter.Callback mActionMenuPresenterCallback;
    public boolean mFormatItems;
    public int mFormatItemsWidth;
    public int mGeneratedItemPadding;
    public MenuBuilder mMenu;
    public MenuBuilder.Callback mMenuBuilderCallback;
    public int mMinCellSize;
    public OnMenuItemClickListener mOnMenuItemClickListener;
    public Context mPopupContext;
    public int mPopupTheme;
    public ActionMenuPresenter mPresenter;
    public boolean mReserveOverflow;

    /* loaded from: classes.dex */
    public interface ActionMenuChildView {
        boolean needsDividerAfter();

        boolean needsDividerBefore();
    }

    /* loaded from: classes.dex */
    public static class ActionMenuPresenterCallback implements MenuPresenter.Callback {
        @Override // androidx.appcompat.view.menu.MenuPresenter.Callback
        public final void onCloseMenu(MenuBuilder menuBuilder, boolean z) {
        }

        @Override // androidx.appcompat.view.menu.MenuPresenter.Callback
        public final boolean onOpenSubMenu(MenuBuilder menuBuilder) {
            return false;
        }
    }

    /* loaded from: classes.dex */
    public static class LayoutParams extends LinearLayoutCompat.LayoutParams {
        @ViewDebug.ExportedProperty
        public int cellsUsed;
        @ViewDebug.ExportedProperty
        public boolean expandable;
        public boolean expanded;
        @ViewDebug.ExportedProperty
        public int extraPixels;
        @ViewDebug.ExportedProperty
        public boolean isOverflowButton;
        @ViewDebug.ExportedProperty
        public boolean preventEdgeOffset;

        public LayoutParams(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
        }

        public LayoutParams(ViewGroup.LayoutParams layoutParams) {
            super(layoutParams);
        }

        public LayoutParams(LayoutParams layoutParams) {
            super(layoutParams);
            this.isOverflowButton = layoutParams.isOverflowButton;
        }

        public LayoutParams() {
            super(-2);
            this.isOverflowButton = false;
        }
    }

    /* loaded from: classes.dex */
    public class MenuBuilderCallback implements MenuBuilder.Callback {
        public MenuBuilderCallback() {
        }

        @Override // androidx.appcompat.view.menu.MenuBuilder.Callback
        public final boolean onMenuItemSelected(MenuBuilder menuBuilder, MenuItem menuItem) {
            OnMenuItemClickListener onMenuItemClickListener = ActionMenuView.this.mOnMenuItemClickListener;
            if (onMenuItemClickListener == null) {
                return false;
            }
            Toolbar.this.getClass();
            return false;
        }

        @Override // androidx.appcompat.view.menu.MenuBuilder.Callback
        public final void onMenuModeChange(MenuBuilder menuBuilder) {
            MenuBuilder.Callback callback = ActionMenuView.this.mMenuBuilderCallback;
            if (callback != null) {
                callback.onMenuModeChange(menuBuilder);
            }
        }
    }

    /* loaded from: classes.dex */
    public interface OnMenuItemClickListener {
    }

    public ActionMenuView(Context context) {
        this(context, null);
    }

    @Override // android.view.View
    public final boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        return false;
    }

    @Override // androidx.appcompat.widget.LinearLayoutCompat, android.view.ViewGroup
    /* renamed from: generateDefaultLayoutParams */
    public final ViewGroup.LayoutParams mo2generateDefaultLayoutParams() {
        LayoutParams layoutParams = new LayoutParams();
        ((LinearLayout.LayoutParams) layoutParams).gravity = 16;
        return layoutParams;
    }

    public final boolean hasSupportDividerBeforeChildAt(int i) {
        boolean z = false;
        if (i == 0) {
            return false;
        }
        View childAt = getChildAt(i - 1);
        View childAt2 = getChildAt(i);
        if (i < getChildCount() && (childAt instanceof ActionMenuChildView)) {
            z = false | ((ActionMenuChildView) childAt).needsDividerAfter();
        }
        if (i <= 0 || !(childAt2 instanceof ActionMenuChildView)) {
            return z;
        }
        return z | ((ActionMenuChildView) childAt2).needsDividerBefore();
    }

    public ActionMenuView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mBaselineAligned = false;
        float f = context.getResources().getDisplayMetrics().density;
        this.mMinCellSize = (int) (56.0f * f);
        this.mGeneratedItemPadding = (int) (f * 4.0f);
        this.mPopupContext = context;
        this.mPopupTheme = 0;
    }

    public final Menu getMenu() {
        if (this.mMenu == null) {
            Context context = getContext();
            MenuBuilder menuBuilder = new MenuBuilder(context);
            this.mMenu = menuBuilder;
            menuBuilder.mCallback = new MenuBuilderCallback();
            ActionMenuPresenter actionMenuPresenter = new ActionMenuPresenter(context);
            this.mPresenter = actionMenuPresenter;
            actionMenuPresenter.mReserveOverflow = true;
            actionMenuPresenter.mReserveOverflowSet = true;
            MenuPresenter.Callback callback = this.mActionMenuPresenterCallback;
            if (callback == null) {
                callback = new ActionMenuPresenterCallback();
            }
            actionMenuPresenter.mCallback = callback;
            this.mMenu.addMenuPresenter(actionMenuPresenter, this.mPopupContext);
            ActionMenuPresenter actionMenuPresenter2 = this.mPresenter;
            actionMenuPresenter2.mMenuView = this;
            this.mMenu = actionMenuPresenter2.mMenu;
        }
        return this.mMenu;
    }

    @Override // androidx.appcompat.view.menu.MenuBuilder.ItemInvoker
    public final boolean invokeItem(MenuItemImpl menuItemImpl) {
        return this.mMenu.performItemAction(menuItemImpl, null, 0);
    }

    @Override // androidx.appcompat.widget.LinearLayoutCompat, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z, int i, int i2, int i3, int i4) {
        int i5;
        int i6;
        int i7;
        if (!this.mFormatItems) {
            super.onLayout(z, i, i2, i3, i4);
            return;
        }
        int childCount = getChildCount();
        int i8 = (i4 - i2) / 2;
        int i9 = this.mDividerWidth;
        int i10 = i3 - i;
        int paddingRight = (i10 - getPaddingRight()) - getPaddingLeft();
        boolean isLayoutRtl = ViewUtils.isLayoutRtl(this);
        int i11 = 0;
        int i12 = 0;
        for (int i13 = 0; i13 < childCount; i13++) {
            View childAt = getChildAt(i13);
            if (childAt.getVisibility() != 8) {
                LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                if (layoutParams.isOverflowButton) {
                    int measuredWidth = childAt.getMeasuredWidth();
                    if (hasSupportDividerBeforeChildAt(i13)) {
                        measuredWidth += i9;
                    }
                    int measuredHeight = childAt.getMeasuredHeight();
                    if (isLayoutRtl) {
                        i6 = getPaddingLeft() + ((LinearLayout.LayoutParams) layoutParams).leftMargin;
                        i7 = i6 + measuredWidth;
                    } else {
                        i7 = (getWidth() - getPaddingRight()) - ((LinearLayout.LayoutParams) layoutParams).rightMargin;
                        i6 = i7 - measuredWidth;
                    }
                    int i14 = i8 - (measuredHeight / 2);
                    childAt.layout(i6, i14, i7, measuredHeight + i14);
                    paddingRight -= measuredWidth;
                    i11 = 1;
                } else {
                    paddingRight -= (childAt.getMeasuredWidth() + ((LinearLayout.LayoutParams) layoutParams).leftMargin) + ((LinearLayout.LayoutParams) layoutParams).rightMargin;
                    hasSupportDividerBeforeChildAt(i13);
                    i12++;
                }
            }
        }
        if (childCount == 1 && i11 == 0) {
            View childAt2 = getChildAt(0);
            int measuredWidth2 = childAt2.getMeasuredWidth();
            int measuredHeight2 = childAt2.getMeasuredHeight();
            int i15 = (i10 / 2) - (measuredWidth2 / 2);
            int i16 = i8 - (measuredHeight2 / 2);
            childAt2.layout(i15, i16, measuredWidth2 + i15, measuredHeight2 + i16);
            return;
        }
        int i17 = i12 - (i11 ^ 1);
        if (i17 > 0) {
            i5 = paddingRight / i17;
        } else {
            i5 = 0;
        }
        int max = Math.max(0, i5);
        if (isLayoutRtl) {
            int width = getWidth() - getPaddingRight();
            for (int i18 = 0; i18 < childCount; i18++) {
                View childAt3 = getChildAt(i18);
                LayoutParams layoutParams2 = (LayoutParams) childAt3.getLayoutParams();
                if (childAt3.getVisibility() != 8 && !layoutParams2.isOverflowButton) {
                    int i19 = width - ((LinearLayout.LayoutParams) layoutParams2).rightMargin;
                    int measuredWidth3 = childAt3.getMeasuredWidth();
                    int measuredHeight3 = childAt3.getMeasuredHeight();
                    int i20 = i8 - (measuredHeight3 / 2);
                    childAt3.layout(i19 - measuredWidth3, i20, i19, measuredHeight3 + i20);
                    width = i19 - ((measuredWidth3 + ((LinearLayout.LayoutParams) layoutParams2).leftMargin) + max);
                }
            }
            return;
        }
        int paddingLeft = getPaddingLeft();
        for (int i21 = 0; i21 < childCount; i21++) {
            View childAt4 = getChildAt(i21);
            LayoutParams layoutParams3 = (LayoutParams) childAt4.getLayoutParams();
            if (childAt4.getVisibility() != 8 && !layoutParams3.isOverflowButton) {
                int i22 = paddingLeft + ((LinearLayout.LayoutParams) layoutParams3).leftMargin;
                int measuredWidth4 = childAt4.getMeasuredWidth();
                int measuredHeight4 = childAt4.getMeasuredHeight();
                int i23 = i8 - (measuredHeight4 / 2);
                childAt4.layout(i22, i23, i22 + measuredWidth4, measuredHeight4 + i23);
                paddingLeft = measuredWidth4 + ((LinearLayout.LayoutParams) layoutParams3).rightMargin + max + i22;
            }
        }
    }

    /* JADX WARN: Type inference failed for: r12v12, types: [int, boolean] */
    /* JADX WARN: Type inference failed for: r12v31 */
    /* JADX WARN: Type inference failed for: r12v32 */
    @Override // androidx.appcompat.widget.LinearLayoutCompat, android.view.View
    public final void onMeasure(int i, int i2) {
        boolean z;
        boolean z2;
        boolean z3;
        int i3;
        int i4;
        int i5;
        int i6;
        int i7;
        int i8;
        int i9;
        ?? r12;
        boolean z4;
        int i10;
        ActionMenuItemView actionMenuItemView;
        boolean z5;
        int i11;
        boolean z6;
        MenuBuilder menuBuilder;
        boolean z7 = this.mFormatItems;
        if (View.MeasureSpec.getMode(i) == 1073741824) {
            z = true;
        } else {
            z = false;
        }
        this.mFormatItems = z;
        if (z7 != z) {
            this.mFormatItemsWidth = 0;
        }
        int size = View.MeasureSpec.getSize(i);
        if (!(!this.mFormatItems || (menuBuilder = this.mMenu) == null || size == this.mFormatItemsWidth)) {
            this.mFormatItemsWidth = size;
            menuBuilder.onItemsChanged(true);
        }
        int childCount = getChildCount();
        if (!this.mFormatItems || childCount <= 0) {
            for (int i12 = 0; i12 < childCount; i12++) {
                LayoutParams layoutParams = (LayoutParams) getChildAt(i12).getLayoutParams();
                ((LinearLayout.LayoutParams) layoutParams).rightMargin = 0;
                ((LinearLayout.LayoutParams) layoutParams).leftMargin = 0;
            }
            super.onMeasure(i, i2);
            return;
        }
        int mode = View.MeasureSpec.getMode(i2);
        int size2 = View.MeasureSpec.getSize(i);
        int size3 = View.MeasureSpec.getSize(i2);
        int paddingRight = getPaddingRight() + getPaddingLeft();
        int paddingBottom = getPaddingBottom() + getPaddingTop();
        int childMeasureSpec = ViewGroup.getChildMeasureSpec(i2, paddingBottom, -2);
        int i13 = size2 - paddingRight;
        int i14 = this.mMinCellSize;
        int i15 = i13 / i14;
        int i16 = i13 % i14;
        if (i15 == 0) {
            setMeasuredDimension(i13, 0);
            return;
        }
        int i17 = (i16 / i15) + i14;
        int childCount2 = getChildCount();
        int i18 = 0;
        int i19 = 0;
        int i20 = 0;
        int i21 = 0;
        boolean z8 = false;
        int i22 = 0;
        long j = 0;
        while (i21 < childCount2) {
            View childAt = getChildAt(i21);
            int i23 = size3;
            if (childAt.getVisibility() == 8) {
                i6 = mode;
                i7 = i13;
                i8 = paddingBottom;
            } else {
                boolean z9 = childAt instanceof ActionMenuItemView;
                int i24 = i19 + 1;
                if (z9) {
                    int i25 = this.mGeneratedItemPadding;
                    i9 = i24;
                    r12 = 0;
                    childAt.setPadding(i25, 0, i25, 0);
                } else {
                    i9 = i24;
                    r12 = 0;
                }
                LayoutParams layoutParams2 = (LayoutParams) childAt.getLayoutParams();
                layoutParams2.expanded = r12;
                int i26 = r12 == true ? 1 : 0;
                int i27 = r12 == true ? 1 : 0;
                layoutParams2.extraPixels = i26;
                layoutParams2.cellsUsed = r12;
                layoutParams2.expandable = r12;
                ((LinearLayout.LayoutParams) layoutParams2).leftMargin = r12;
                ((LinearLayout.LayoutParams) layoutParams2).rightMargin = r12;
                if (!z9 || !((ActionMenuItemView) childAt).hasText()) {
                    z4 = false;
                } else {
                    z4 = true;
                }
                layoutParams2.preventEdgeOffset = z4;
                if (layoutParams2.isOverflowButton) {
                    i10 = 1;
                } else {
                    i10 = i15;
                }
                i7 = i13;
                LayoutParams layoutParams3 = (LayoutParams) childAt.getLayoutParams();
                i6 = mode;
                i8 = paddingBottom;
                int makeMeasureSpec = View.MeasureSpec.makeMeasureSpec(View.MeasureSpec.getSize(childMeasureSpec) - paddingBottom, View.MeasureSpec.getMode(childMeasureSpec));
                if (z9) {
                    actionMenuItemView = (ActionMenuItemView) childAt;
                } else {
                    actionMenuItemView = null;
                }
                if (actionMenuItemView == null || !actionMenuItemView.hasText()) {
                    z5 = false;
                } else {
                    z5 = true;
                }
                if (i10 <= 0 || (z5 && i10 < 2)) {
                    i11 = 0;
                } else {
                    childAt.measure(View.MeasureSpec.makeMeasureSpec(i10 * i17, RecyclerView.UNDEFINED_DURATION), makeMeasureSpec);
                    int measuredWidth = childAt.getMeasuredWidth();
                    i11 = measuredWidth / i17;
                    if (measuredWidth % i17 != 0) {
                        i11++;
                    }
                    if (z5 && i11 < 2) {
                        i11 = 2;
                    }
                }
                if (layoutParams3.isOverflowButton || !z5) {
                    z6 = false;
                } else {
                    z6 = true;
                }
                layoutParams3.expandable = z6;
                layoutParams3.cellsUsed = i11;
                childAt.measure(View.MeasureSpec.makeMeasureSpec(i17 * i11, IntMath.MAX_SIGNED_POWER_OF_TWO), makeMeasureSpec);
                i20 = Math.max(i20, i11);
                if (layoutParams2.expandable) {
                    i22++;
                }
                if (layoutParams2.isOverflowButton) {
                    z8 = true;
                }
                i15 -= i11;
                i18 = Math.max(i18, childAt.getMeasuredHeight());
                if (i11 == 1) {
                    j |= 1 << i21;
                }
                i19 = i9;
            }
            i21++;
            size3 = i23;
            paddingBottom = i8;
            i13 = i7;
            mode = i6;
        }
        int i28 = mode;
        int i29 = i13;
        int i30 = size3;
        if (!z8 || i19 != 2) {
            z2 = false;
        } else {
            z2 = true;
        }
        boolean z10 = false;
        while (i22 > 0 && i15 > 0) {
            int i31 = Integer.MAX_VALUE;
            int i32 = 0;
            long j2 = 0;
            for (int i33 = 0; i33 < childCount2; i33++) {
                LayoutParams layoutParams4 = (LayoutParams) getChildAt(i33).getLayoutParams();
                if (layoutParams4.expandable) {
                    int i34 = layoutParams4.cellsUsed;
                    if (i34 < i31) {
                        j2 = 1 << i33;
                        i31 = i34;
                        i32 = 1;
                    } else if (i34 == i31) {
                        i32++;
                        j2 |= 1 << i33;
                    }
                }
            }
            j |= j2;
            if (i32 > i15) {
                break;
            }
            int i35 = i31 + 1;
            int i36 = 0;
            while (i36 < childCount2) {
                View childAt2 = getChildAt(i36);
                LayoutParams layoutParams5 = (LayoutParams) childAt2.getLayoutParams();
                int i37 = childMeasureSpec;
                int i38 = childCount2;
                long j3 = 1 << i36;
                if ((j2 & j3) != 0) {
                    if (z2 && layoutParams5.preventEdgeOffset && i15 == 1) {
                        int i39 = this.mGeneratedItemPadding;
                        childAt2.setPadding(i39 + i17, 0, i39, 0);
                    }
                    layoutParams5.cellsUsed++;
                    layoutParams5.expanded = true;
                    i15--;
                } else if (layoutParams5.cellsUsed == i35) {
                    j |= j3;
                }
                i36++;
                childMeasureSpec = i37;
                childCount2 = i38;
            }
            z10 = true;
        }
        int i40 = childMeasureSpec;
        int i41 = childCount2;
        if (z8 || i19 != 1) {
            z3 = false;
        } else {
            z3 = true;
        }
        if (i15 <= 0 || j == 0 || (i15 >= i19 - 1 && !z3 && i20 <= 1)) {
            i3 = i41;
        } else {
            float bitCount = Long.bitCount(j);
            if (!z3) {
                if ((j & 1) != 0 && !((LayoutParams) getChildAt(0).getLayoutParams()).preventEdgeOffset) {
                    bitCount -= 0.5f;
                }
                int i42 = i41 - 1;
                if ((j & (1 << i42)) != 0 && !((LayoutParams) getChildAt(i42).getLayoutParams()).preventEdgeOffset) {
                    bitCount -= 0.5f;
                }
            }
            if (bitCount > HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                i5 = (int) ((i15 * i17) / bitCount);
            } else {
                i5 = 0;
            }
            boolean z11 = z10;
            i3 = i41;
            for (int i43 = 0; i43 < i3; i43++) {
                if ((j & (1 << i43)) != 0) {
                    View childAt3 = getChildAt(i43);
                    LayoutParams layoutParams6 = (LayoutParams) childAt3.getLayoutParams();
                    if (childAt3 instanceof ActionMenuItemView) {
                        layoutParams6.extraPixels = i5;
                        layoutParams6.expanded = true;
                        if (i43 == 0 && !layoutParams6.preventEdgeOffset) {
                            ((LinearLayout.LayoutParams) layoutParams6).leftMargin = (-i5) / 2;
                        }
                        z11 = true;
                    } else {
                        if (layoutParams6.isOverflowButton) {
                            layoutParams6.extraPixels = i5;
                            layoutParams6.expanded = true;
                            ((LinearLayout.LayoutParams) layoutParams6).rightMargin = (-i5) / 2;
                            z11 = true;
                        } else {
                            if (i43 != 0) {
                                ((LinearLayout.LayoutParams) layoutParams6).leftMargin = i5 / 2;
                            }
                            if (i43 != i3 - 1) {
                                ((LinearLayout.LayoutParams) layoutParams6).rightMargin = i5 / 2;
                            }
                        }
                    }
                }
            }
            z10 = z11;
        }
        if (z10) {
            for (int i44 = 0; i44 < i3; i44++) {
                View childAt4 = getChildAt(i44);
                LayoutParams layoutParams7 = (LayoutParams) childAt4.getLayoutParams();
                if (layoutParams7.expanded) {
                    childAt4.measure(View.MeasureSpec.makeMeasureSpec((layoutParams7.cellsUsed * i17) + layoutParams7.extraPixels, IntMath.MAX_SIGNED_POWER_OF_TWO), i40);
                }
            }
        }
        if (i28 != 1073741824) {
            i4 = i18;
        } else {
            i4 = i30;
        }
        setMeasuredDimension(i29, i4);
    }

    @Override // androidx.appcompat.widget.LinearLayoutCompat, android.view.ViewGroup
    /* renamed from: generateDefaultLayoutParams  reason: collision with other method in class */
    public final LinearLayoutCompat.LayoutParams mo2generateDefaultLayoutParams() {
        LayoutParams layoutParams = new LayoutParams();
        ((LinearLayout.LayoutParams) layoutParams).gravity = 16;
        return layoutParams;
    }

    @Override // androidx.appcompat.widget.LinearLayoutCompat, android.view.ViewGroup
    /* renamed from: generateLayoutParams */
    public final ViewGroup.LayoutParams mo3generateLayoutParams(AttributeSet attributeSet) {
        return new LayoutParams(getContext(), attributeSet);
    }

    @Override // android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        ActionMenuPresenter actionMenuPresenter = this.mPresenter;
        if (actionMenuPresenter != null) {
            actionMenuPresenter.updateMenuView();
            if (this.mPresenter.isOverflowMenuShowing()) {
                this.mPresenter.hideOverflowMenu();
                this.mPresenter.showOverflowMenu();
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        ActionMenuPresenter actionMenuPresenter = this.mPresenter;
        if (actionMenuPresenter != null) {
            actionMenuPresenter.hideOverflowMenu();
            ActionMenuPresenter.ActionButtonSubmenu actionButtonSubmenu = actionMenuPresenter.mActionButtonPopup;
            if (actionButtonSubmenu != null && actionButtonSubmenu.isShowing()) {
                actionButtonSubmenu.mPopup.dismiss();
            }
        }
    }

    @Override // androidx.appcompat.widget.LinearLayoutCompat, android.view.ViewGroup
    /* renamed from: generateLayoutParams  reason: collision with other method in class */
    public final LinearLayoutCompat.LayoutParams mo3generateLayoutParams(AttributeSet attributeSet) {
        return new LayoutParams(getContext(), attributeSet);
    }

    public static LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        LayoutParams layoutParams2;
        if (layoutParams != null) {
            if (layoutParams instanceof LayoutParams) {
                layoutParams2 = new LayoutParams((LayoutParams) layoutParams);
            } else {
                layoutParams2 = new LayoutParams(layoutParams);
            }
            if (((LinearLayout.LayoutParams) layoutParams2).gravity <= 0) {
                ((LinearLayout.LayoutParams) layoutParams2).gravity = 16;
            }
            return layoutParams2;
        }
        LayoutParams layoutParams3 = new LayoutParams();
        ((LinearLayout.LayoutParams) layoutParams3).gravity = 16;
        return layoutParams3;
    }

    @Override // androidx.appcompat.widget.LinearLayoutCompat, android.view.ViewGroup
    public final boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof LayoutParams;
    }

    @Override // androidx.appcompat.view.menu.MenuView
    public final void initialize(MenuBuilder menuBuilder) {
        this.mMenu = menuBuilder;
    }
}
