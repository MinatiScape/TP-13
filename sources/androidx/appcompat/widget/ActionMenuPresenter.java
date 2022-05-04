package androidx.appcompat.widget;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.SparseBooleanArray;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.LinearLayout;
import androidx.appcompat.view.menu.ActionMenuItemView;
import androidx.appcompat.view.menu.BaseMenuPresenter;
import androidx.appcompat.view.menu.MenuBuilder;
import androidx.appcompat.view.menu.MenuItemImpl;
import androidx.appcompat.view.menu.MenuPopup;
import androidx.appcompat.view.menu.MenuPopupHelper;
import androidx.appcompat.view.menu.MenuPresenter;
import androidx.appcompat.view.menu.MenuView;
import androidx.appcompat.view.menu.ShowableListMenu;
import androidx.appcompat.view.menu.SubMenuBuilder;
import androidx.appcompat.widget.ActionMenuView;
import androidx.core.view.ActionProvider;
import com.android.systemui.shared.R;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final class ActionMenuPresenter extends BaseMenuPresenter {
    public ActionButtonSubmenu mActionButtonPopup;
    public int mActionItemWidthLimit;
    public boolean mExpandedActionViewsExclusive;
    public int mMaxItems;
    public OverflowMenuButton mOverflowButton;
    public OverflowPopup mOverflowPopup;
    public ActionMenuPopupCallback mPopupCallback;
    public OpenOverflowRunnable mPostedOpenRunnable;
    public boolean mReserveOverflow;
    public boolean mReserveOverflowSet;
    public int mWidthLimit;
    public final SparseBooleanArray mActionButtonGroups = new SparseBooleanArray();
    public final PopupPresenterCallback mPopupPresenterCallback = new PopupPresenterCallback();

    /* loaded from: classes.dex */
    public class ActionButtonSubmenu extends MenuPopupHelper {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public ActionButtonSubmenu(Context context, SubMenuBuilder subMenuBuilder, View view) {
            super(context, subMenuBuilder, view, false);
            boolean z = false;
            if (!((subMenuBuilder.mItem.mFlags & 32) == 32 ? true : z)) {
                View view2 = ActionMenuPresenter.this.mOverflowButton;
                this.mAnchorView = view2 == null ? (View) ActionMenuPresenter.this.mMenuView : view2;
            }
            PopupPresenterCallback popupPresenterCallback = ActionMenuPresenter.this.mPopupPresenterCallback;
            this.mPresenterCallback = popupPresenterCallback;
            MenuPopup menuPopup = this.mPopup;
            if (menuPopup != null) {
                menuPopup.setCallback(popupPresenterCallback);
            }
        }

        @Override // androidx.appcompat.view.menu.MenuPopupHelper
        public final void onDismiss() {
            ActionMenuPresenter.this.mActionButtonPopup = null;
            super.onDismiss();
        }
    }

    /* loaded from: classes.dex */
    public class ActionMenuPopupCallback extends ActionMenuItemView.PopupCallback {
        public ActionMenuPopupCallback() {
        }
    }

    /* loaded from: classes.dex */
    public class OpenOverflowRunnable implements Runnable {
        public OverflowPopup mPopup;

        public OpenOverflowRunnable(OverflowPopup overflowPopup) {
            this.mPopup = overflowPopup;
        }

        @Override // java.lang.Runnable
        public final void run() {
            MenuBuilder.Callback callback;
            MenuBuilder menuBuilder = ActionMenuPresenter.this.mMenu;
            if (!(menuBuilder == null || (callback = menuBuilder.mCallback) == null)) {
                callback.onMenuModeChange(menuBuilder);
            }
            View view = (View) ActionMenuPresenter.this.mMenuView;
            if (!(view == null || view.getWindowToken() == null)) {
                OverflowPopup overflowPopup = this.mPopup;
                boolean z = true;
                if (!overflowPopup.isShowing()) {
                    if (overflowPopup.mAnchorView == null) {
                        z = false;
                    } else {
                        overflowPopup.showPopup(0, 0, false, false);
                    }
                }
                if (z) {
                    ActionMenuPresenter.this.mOverflowPopup = this.mPopup;
                }
            }
            ActionMenuPresenter.this.mPostedOpenRunnable = null;
        }
    }

    /* loaded from: classes.dex */
    public class OverflowMenuButton extends AppCompatImageView implements ActionMenuView.ActionMenuChildView {
        @Override // androidx.appcompat.widget.ActionMenuView.ActionMenuChildView
        public final boolean needsDividerAfter() {
            return false;
        }

        @Override // androidx.appcompat.widget.ActionMenuView.ActionMenuChildView
        public final boolean needsDividerBefore() {
            return false;
        }

        public OverflowMenuButton(Context context) {
            super(context, null, R.attr.actionOverflowButtonStyle);
            setClickable(true);
            setFocusable(true);
            setVisibility(0);
            setEnabled(true);
            setTooltipText(getContentDescription());
            setOnTouchListener(new ForwardingListener(this) { // from class: androidx.appcompat.widget.ActionMenuPresenter.OverflowMenuButton.1
                @Override // androidx.appcompat.widget.ForwardingListener
                public final ShowableListMenu getPopup() {
                    OverflowPopup overflowPopup = ActionMenuPresenter.this.mOverflowPopup;
                    if (overflowPopup == null) {
                        return null;
                    }
                    return overflowPopup.getPopup();
                }

                @Override // androidx.appcompat.widget.ForwardingListener
                public final boolean onForwardingStarted() {
                    ActionMenuPresenter.this.showOverflowMenu();
                    return true;
                }

                @Override // androidx.appcompat.widget.ForwardingListener
                public final boolean onForwardingStopped() {
                    ActionMenuPresenter actionMenuPresenter = ActionMenuPresenter.this;
                    if (actionMenuPresenter.mPostedOpenRunnable != null) {
                        return false;
                    }
                    actionMenuPresenter.hideOverflowMenu();
                    return true;
                }
            });
        }

        @Override // android.view.View
        public final boolean performClick() {
            if (super.performClick()) {
                return true;
            }
            playSoundEffect(0);
            ActionMenuPresenter.this.showOverflowMenu();
            return true;
        }

        @Override // android.widget.ImageView
        public final boolean setFrame(int i, int i2, int i3, int i4) {
            boolean frame = super.setFrame(i, i2, i3, i4);
            Drawable drawable = getDrawable();
            Drawable background = getBackground();
            if (!(drawable == null || background == null)) {
                int width = getWidth();
                int height = getHeight();
                int max = Math.max(width, height) / 2;
                int paddingLeft = (width + (getPaddingLeft() - getPaddingRight())) / 2;
                int paddingTop = (height + (getPaddingTop() - getPaddingBottom())) / 2;
                background.setHotspotBounds(paddingLeft - max, paddingTop - max, paddingLeft + max, paddingTop + max);
            }
            return frame;
        }
    }

    /* loaded from: classes.dex */
    public class OverflowPopup extends MenuPopupHelper {
        public OverflowPopup(Context context, MenuBuilder menuBuilder, OverflowMenuButton overflowMenuButton) {
            super(context, menuBuilder, overflowMenuButton, true);
            this.mDropDownGravity = 8388613;
            PopupPresenterCallback popupPresenterCallback = ActionMenuPresenter.this.mPopupPresenterCallback;
            this.mPresenterCallback = popupPresenterCallback;
            MenuPopup menuPopup = this.mPopup;
            if (menuPopup != null) {
                menuPopup.setCallback(popupPresenterCallback);
            }
        }

        @Override // androidx.appcompat.view.menu.MenuPopupHelper
        public final void onDismiss() {
            MenuBuilder menuBuilder = ActionMenuPresenter.this.mMenu;
            if (menuBuilder != null) {
                menuBuilder.close(true);
            }
            ActionMenuPresenter.this.mOverflowPopup = null;
            super.onDismiss();
        }
    }

    /* loaded from: classes.dex */
    public class PopupPresenterCallback implements MenuPresenter.Callback {
        public PopupPresenterCallback() {
        }

        @Override // androidx.appcompat.view.menu.MenuPresenter.Callback
        public final void onCloseMenu(MenuBuilder menuBuilder, boolean z) {
            if (menuBuilder instanceof SubMenuBuilder) {
                menuBuilder.getRootMenu().close(false);
            }
            MenuPresenter.Callback callback = ActionMenuPresenter.this.mCallback;
            if (callback != null) {
                callback.onCloseMenu(menuBuilder, z);
            }
        }

        @Override // androidx.appcompat.view.menu.MenuPresenter.Callback
        public final boolean onOpenSubMenu(MenuBuilder menuBuilder) {
            ActionMenuPresenter actionMenuPresenter = ActionMenuPresenter.this;
            if (menuBuilder == actionMenuPresenter.mMenu) {
                return false;
            }
            ((SubMenuBuilder) menuBuilder).mItem.getClass();
            actionMenuPresenter.getClass();
            MenuPresenter.Callback callback = ActionMenuPresenter.this.mCallback;
            if (callback != null) {
                return callback.onOpenSubMenu(menuBuilder);
            }
            return false;
        }
    }

    @SuppressLint({"BanParcelableUsage"})
    /* loaded from: classes.dex */
    public static class SavedState implements Parcelable {
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: androidx.appcompat.widget.ActionMenuPresenter.SavedState.1
            @Override // android.os.Parcelable.Creator
            public final SavedState createFromParcel(Parcel parcel) {
                return new SavedState(parcel);
            }

            @Override // android.os.Parcelable.Creator
            public final SavedState[] newArray(int i) {
                return new SavedState[i];
            }
        };
        public int openSubMenuId;

        public SavedState() {
            throw null;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i) {
            parcel.writeInt(this.openSubMenuId);
        }

        public SavedState(Parcel parcel) {
            this.openSubMenuId = parcel.readInt();
        }
    }

    @Override // androidx.appcompat.view.menu.MenuPresenter
    public final boolean flagActionItems() {
        int i;
        ArrayList<MenuItemImpl> arrayList;
        boolean z;
        boolean z2;
        boolean z3;
        boolean z4;
        boolean z5;
        boolean z6;
        boolean z7;
        ActionMenuPresenter actionMenuPresenter = this;
        MenuBuilder menuBuilder = actionMenuPresenter.mMenu;
        View view = null;
        boolean z8 = false;
        if (menuBuilder != null) {
            arrayList = menuBuilder.getVisibleItems();
            i = arrayList.size();
        } else {
            arrayList = null;
            i = 0;
        }
        int i2 = actionMenuPresenter.mMaxItems;
        int i3 = actionMenuPresenter.mActionItemWidthLimit;
        int makeMeasureSpec = View.MeasureSpec.makeMeasureSpec(0, 0);
        ViewGroup viewGroup = (ViewGroup) actionMenuPresenter.mMenuView;
        int i4 = 0;
        boolean z9 = false;
        int i5 = 0;
        int i6 = 0;
        while (true) {
            z = true;
            if (i4 >= i) {
                break;
            }
            MenuItemImpl menuItemImpl = arrayList.get(i4);
            if (menuItemImpl.requiresActionButton()) {
                i5++;
            } else {
                if ((menuItemImpl.mShowAsAction & 1) == 1) {
                    z7 = true;
                } else {
                    z7 = false;
                }
                if (z7) {
                    i6++;
                } else {
                    z9 = true;
                }
            }
            if (actionMenuPresenter.mExpandedActionViewsExclusive && menuItemImpl.mIsActionViewExpanded) {
                i2 = 0;
            }
            i4++;
        }
        if (actionMenuPresenter.mReserveOverflow && (z9 || i6 + i5 > i2)) {
            i2--;
        }
        int i7 = i2 - i5;
        SparseBooleanArray sparseBooleanArray = actionMenuPresenter.mActionButtonGroups;
        sparseBooleanArray.clear();
        int i8 = 0;
        int i9 = 0;
        while (i8 < i) {
            MenuItemImpl menuItemImpl2 = arrayList.get(i8);
            if (menuItemImpl2.requiresActionButton()) {
                View itemView = actionMenuPresenter.getItemView(menuItemImpl2, view, viewGroup);
                itemView.measure(makeMeasureSpec, makeMeasureSpec);
                int measuredWidth = itemView.getMeasuredWidth();
                i3 -= measuredWidth;
                if (i9 == 0) {
                    i9 = measuredWidth;
                }
                int i10 = menuItemImpl2.mGroup;
                if (i10 != 0) {
                    sparseBooleanArray.put(i10, z);
                }
                menuItemImpl2.setIsActionButton(z);
                z2 = z8;
            } else {
                if ((menuItemImpl2.mShowAsAction & z) == z) {
                    z3 = z;
                } else {
                    z3 = z8;
                }
                if (z3) {
                    int i11 = menuItemImpl2.mGroup;
                    boolean z10 = sparseBooleanArray.get(i11);
                    if ((i7 > 0 || z10) && i3 > 0) {
                        z4 = z;
                    } else {
                        z4 = z8;
                    }
                    if (z4) {
                        View itemView2 = actionMenuPresenter.getItemView(menuItemImpl2, view, viewGroup);
                        itemView2.measure(makeMeasureSpec, makeMeasureSpec);
                        int measuredWidth2 = itemView2.getMeasuredWidth();
                        i3 -= measuredWidth2;
                        if (i9 == 0) {
                            i9 = measuredWidth2;
                        }
                        if (i3 + i9 > 0) {
                            z6 = z;
                        } else {
                            z6 = false;
                        }
                        z4 &= z6;
                    }
                    boolean z11 = z4;
                    if (z11 && i11 != 0) {
                        sparseBooleanArray.put(i11, z);
                    } else if (z10) {
                        sparseBooleanArray.put(i11, false);
                        for (int i12 = 0; i12 < i8; i12++) {
                            MenuItemImpl menuItemImpl3 = arrayList.get(i12);
                            if (menuItemImpl3.mGroup == i11) {
                                if ((menuItemImpl3.mFlags & 32) == 32) {
                                    z5 = true;
                                } else {
                                    z5 = false;
                                }
                                if (z5) {
                                    i7++;
                                }
                                menuItemImpl3.setIsActionButton(false);
                            }
                        }
                    }
                    if (z11) {
                        i7--;
                    }
                    menuItemImpl2.setIsActionButton(z11);
                    z2 = false;
                } else {
                    z2 = z8;
                    menuItemImpl2.setIsActionButton(z2);
                }
            }
            i8++;
            z8 = z2;
            view = null;
            z = true;
            actionMenuPresenter = this;
        }
        return z;
    }

    public final boolean hideOverflowMenu() {
        MenuView menuView;
        OpenOverflowRunnable openOverflowRunnable = this.mPostedOpenRunnable;
        if (openOverflowRunnable == null || (menuView = this.mMenuView) == null) {
            OverflowPopup overflowPopup = this.mOverflowPopup;
            if (overflowPopup == null) {
                return false;
            }
            if (overflowPopup.isShowing()) {
                overflowPopup.mPopup.dismiss();
            }
            return true;
        }
        ((View) menuView).removeCallbacks(openOverflowRunnable);
        this.mPostedOpenRunnable = null;
        return true;
    }

    @Override // androidx.appcompat.view.menu.MenuPresenter
    public final void initForMenu(Context context, MenuBuilder menuBuilder) {
        this.mContext = context;
        LayoutInflater.from(context);
        this.mMenu = menuBuilder;
        Resources resources = context.getResources();
        if (!this.mReserveOverflowSet) {
            this.mReserveOverflow = true;
        }
        int i = 2;
        this.mWidthLimit = context.getResources().getDisplayMetrics().widthPixels / 2;
        Configuration configuration = context.getResources().getConfiguration();
        int i2 = configuration.screenWidthDp;
        int i3 = configuration.screenHeightDp;
        if (configuration.smallestScreenWidthDp > 600 || i2 > 600 || ((i2 > 960 && i3 > 720) || (i2 > 720 && i3 > 960))) {
            i = 5;
        } else if (i2 >= 500 || ((i2 > 640 && i3 > 480) || (i2 > 480 && i3 > 640))) {
            i = 4;
        } else if (i2 >= 360) {
            i = 3;
        }
        this.mMaxItems = i;
        int i4 = this.mWidthLimit;
        if (this.mReserveOverflow) {
            if (this.mOverflowButton == null) {
                this.mOverflowButton = new OverflowMenuButton(this.mSystemContext);
                int makeMeasureSpec = View.MeasureSpec.makeMeasureSpec(0, 0);
                this.mOverflowButton.measure(makeMeasureSpec, makeMeasureSpec);
            }
            i4 -= this.mOverflowButton.getMeasuredWidth();
        } else {
            this.mOverflowButton = null;
        }
        this.mActionItemWidthLimit = i4;
        float f = resources.getDisplayMetrics().density;
    }

    public final boolean isOverflowMenuShowing() {
        OverflowPopup overflowPopup = this.mOverflowPopup;
        if (overflowPopup == null || !overflowPopup.isShowing()) {
            return false;
        }
        return true;
    }

    public final boolean showOverflowMenu() {
        MenuBuilder menuBuilder;
        if (!this.mReserveOverflow || isOverflowMenuShowing() || (menuBuilder = this.mMenu) == null || this.mMenuView == null || this.mPostedOpenRunnable != null) {
            return false;
        }
        menuBuilder.flagActionItems();
        if (menuBuilder.mNonActionItems.isEmpty()) {
            return false;
        }
        OpenOverflowRunnable openOverflowRunnable = new OpenOverflowRunnable(new OverflowPopup(this.mContext, this.mMenu, this.mOverflowButton));
        this.mPostedOpenRunnable = openOverflowRunnable;
        ((View) this.mMenuView).post(openOverflowRunnable);
        return true;
    }

    @Override // androidx.appcompat.view.menu.MenuPresenter
    public final void updateMenuView() {
        int i;
        boolean z;
        boolean z2;
        MenuItemImpl menuItemImpl;
        ViewGroup viewGroup = (ViewGroup) this.mMenuView;
        boolean z3 = false;
        ArrayList<MenuItemImpl> arrayList = null;
        if (viewGroup != null) {
            MenuBuilder menuBuilder = this.mMenu;
            if (menuBuilder != null) {
                menuBuilder.flagActionItems();
                ArrayList<MenuItemImpl> visibleItems = this.mMenu.getVisibleItems();
                int size = visibleItems.size();
                i = 0;
                for (int i2 = 0; i2 < size; i2++) {
                    MenuItemImpl menuItemImpl2 = visibleItems.get(i2);
                    if ((menuItemImpl2.mFlags & 32) == 32) {
                        z2 = true;
                    } else {
                        z2 = false;
                    }
                    if (z2) {
                        View childAt = viewGroup.getChildAt(i);
                        if (childAt instanceof MenuView.ItemView) {
                            menuItemImpl = ((MenuView.ItemView) childAt).getItemData();
                        } else {
                            menuItemImpl = null;
                        }
                        View itemView = getItemView(menuItemImpl2, childAt, viewGroup);
                        if (menuItemImpl2 != menuItemImpl) {
                            itemView.setPressed(false);
                            itemView.jumpDrawablesToCurrentState();
                        }
                        if (itemView != childAt) {
                            ViewGroup viewGroup2 = (ViewGroup) itemView.getParent();
                            if (viewGroup2 != null) {
                                viewGroup2.removeView(itemView);
                            }
                            ((ViewGroup) this.mMenuView).addView(itemView, i);
                        }
                        i++;
                    }
                }
            } else {
                i = 0;
            }
            while (i < viewGroup.getChildCount()) {
                if (viewGroup.getChildAt(i) == this.mOverflowButton) {
                    z = false;
                } else {
                    viewGroup.removeViewAt(i);
                    z = true;
                }
                if (!z) {
                    i++;
                }
            }
        }
        ((View) this.mMenuView).requestLayout();
        MenuBuilder menuBuilder2 = this.mMenu;
        if (menuBuilder2 != null) {
            menuBuilder2.flagActionItems();
            ArrayList<MenuItemImpl> arrayList2 = menuBuilder2.mActionItems;
            int size2 = arrayList2.size();
            for (int i3 = 0; i3 < size2; i3++) {
                ActionProvider actionProvider = arrayList2.get(i3).mActionProvider;
            }
        }
        MenuBuilder menuBuilder3 = this.mMenu;
        if (menuBuilder3 != null) {
            menuBuilder3.flagActionItems();
            arrayList = menuBuilder3.mNonActionItems;
        }
        if (this.mReserveOverflow && arrayList != null) {
            int size3 = arrayList.size();
            if (size3 == 1) {
                z3 = !arrayList.get(0).mIsActionViewExpanded;
            } else if (size3 > 0) {
                z3 = true;
            }
        }
        if (z3) {
            if (this.mOverflowButton == null) {
                this.mOverflowButton = new OverflowMenuButton(this.mSystemContext);
            }
            ViewGroup viewGroup3 = (ViewGroup) this.mOverflowButton.getParent();
            if (viewGroup3 != this.mMenuView) {
                if (viewGroup3 != null) {
                    viewGroup3.removeView(this.mOverflowButton);
                }
                ActionMenuView actionMenuView = (ActionMenuView) this.mMenuView;
                OverflowMenuButton overflowMenuButton = this.mOverflowButton;
                actionMenuView.getClass();
                ActionMenuView.LayoutParams layoutParams = new ActionMenuView.LayoutParams();
                ((LinearLayout.LayoutParams) layoutParams).gravity = 16;
                layoutParams.isOverflowButton = true;
                actionMenuView.addView(overflowMenuButton, layoutParams);
            }
        } else {
            OverflowMenuButton overflowMenuButton2 = this.mOverflowButton;
            if (overflowMenuButton2 != null) {
                ViewParent parent = overflowMenuButton2.getParent();
                MenuView menuView = this.mMenuView;
                if (parent == menuView) {
                    ((ViewGroup) menuView).removeView(this.mOverflowButton);
                }
            }
        }
        ((ActionMenuView) this.mMenuView).mReserveOverflow = this.mReserveOverflow;
    }

    public ActionMenuPresenter(Context context) {
        super(context);
    }

    public final View getItemView(MenuItemImpl menuItemImpl, View view, ViewGroup viewGroup) {
        MenuView.ItemView itemView;
        View actionView = menuItemImpl.getActionView();
        int i = 0;
        if (actionView == null || menuItemImpl.hasCollapsibleActionView()) {
            if (view instanceof MenuView.ItemView) {
                itemView = (MenuView.ItemView) view;
            } else {
                itemView = (MenuView.ItemView) this.mSystemInflater.inflate(this.mItemLayoutRes, viewGroup, false);
            }
            itemView.initialize(menuItemImpl);
            ActionMenuItemView actionMenuItemView = (ActionMenuItemView) itemView;
            actionMenuItemView.mItemInvoker = (ActionMenuView) this.mMenuView;
            if (this.mPopupCallback == null) {
                this.mPopupCallback = new ActionMenuPopupCallback();
            }
            actionMenuItemView.mPopupCallback = this.mPopupCallback;
            actionView = (View) itemView;
        }
        if (menuItemImpl.mIsActionViewExpanded) {
            i = 8;
        }
        actionView.setVisibility(i);
        ViewGroup.LayoutParams layoutParams = actionView.getLayoutParams();
        if (!((ActionMenuView) viewGroup).checkLayoutParams(layoutParams)) {
            actionView.setLayoutParams(ActionMenuView.generateLayoutParams(layoutParams));
        }
        return actionView;
    }

    @Override // androidx.appcompat.view.menu.MenuPresenter
    public final void onCloseMenu(MenuBuilder menuBuilder, boolean z) {
        hideOverflowMenu();
        ActionButtonSubmenu actionButtonSubmenu = this.mActionButtonPopup;
        if (actionButtonSubmenu != null && actionButtonSubmenu.isShowing()) {
            actionButtonSubmenu.mPopup.dismiss();
        }
        MenuPresenter.Callback callback = this.mCallback;
        if (callback != null) {
            callback.onCloseMenu(menuBuilder, z);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:41:0x0087  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x008f  */
    @Override // androidx.appcompat.view.menu.MenuPresenter
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean onSubMenuSelected(androidx.appcompat.view.menu.SubMenuBuilder r9) {
        /*
            r8 = this;
            boolean r0 = r9.hasVisibleItems()
            r1 = 0
            if (r0 != 0) goto L8
            return r1
        L8:
            r0 = r9
        L9:
            androidx.appcompat.view.menu.MenuBuilder r2 = r0.mParentMenu
            androidx.appcompat.view.menu.MenuBuilder r3 = r8.mMenu
            if (r2 == r3) goto L13
            r0 = r2
            androidx.appcompat.view.menu.SubMenuBuilder r0 = (androidx.appcompat.view.menu.SubMenuBuilder) r0
            goto L9
        L13:
            androidx.appcompat.view.menu.MenuItemImpl r0 = r0.mItem
            androidx.appcompat.view.menu.MenuView r2 = r8.mMenuView
            android.view.ViewGroup r2 = (android.view.ViewGroup) r2
            r3 = 0
            if (r2 != 0) goto L1d
            goto L3a
        L1d:
            int r4 = r2.getChildCount()
            r5 = r1
        L22:
            if (r5 >= r4) goto L3a
            android.view.View r6 = r2.getChildAt(r5)
            boolean r7 = r6 instanceof androidx.appcompat.view.menu.MenuView.ItemView
            if (r7 == 0) goto L37
            r7 = r6
            androidx.appcompat.view.menu.MenuView$ItemView r7 = (androidx.appcompat.view.menu.MenuView.ItemView) r7
            androidx.appcompat.view.menu.MenuItemImpl r7 = r7.getItemData()
            if (r7 != r0) goto L37
            r3 = r6
            goto L3a
        L37:
            int r5 = r5 + 1
            goto L22
        L3a:
            if (r3 != 0) goto L3d
            return r1
        L3d:
            androidx.appcompat.view.menu.MenuItemImpl r0 = r9.mItem
            r0.getClass()
            int r0 = r9.size()
            r2 = r1
        L47:
            r4 = 1
            if (r2 >= r0) goto L5f
            android.view.MenuItem r5 = r9.getItem(r2)
            boolean r6 = r5.isVisible()
            if (r6 == 0) goto L5c
            android.graphics.drawable.Drawable r5 = r5.getIcon()
            if (r5 == 0) goto L5c
            r0 = r4
            goto L60
        L5c:
            int r2 = r2 + 1
            goto L47
        L5f:
            r0 = r1
        L60:
            androidx.appcompat.widget.ActionMenuPresenter$ActionButtonSubmenu r2 = new androidx.appcompat.widget.ActionMenuPresenter$ActionButtonSubmenu
            android.content.Context r5 = r8.mContext
            r2.<init>(r5, r9, r3)
            r8.mActionButtonPopup = r2
            r2.mForceShowIcon = r0
            androidx.appcompat.view.menu.MenuPopup r2 = r2.mPopup
            if (r2 == 0) goto L72
            r2.setForceShowIcon(r0)
        L72:
            androidx.appcompat.widget.ActionMenuPresenter$ActionButtonSubmenu r0 = r8.mActionButtonPopup
            boolean r2 = r0.isShowing()
            if (r2 == 0) goto L7c
        L7a:
            r1 = r4
            goto L85
        L7c:
            android.view.View r2 = r0.mAnchorView
            if (r2 != 0) goto L81
            goto L85
        L81:
            r0.showPopup(r1, r1, r1, r1)
            goto L7a
        L85:
            if (r1 == 0) goto L8f
            androidx.appcompat.view.menu.MenuPresenter$Callback r8 = r8.mCallback
            if (r8 == 0) goto L8e
            r8.onOpenSubMenu(r9)
        L8e:
            return r4
        L8f:
            java.lang.IllegalStateException r8 = new java.lang.IllegalStateException
            java.lang.String r9 = "MenuPopupHelper cannot be used without an anchor"
            r8.<init>(r9)
            throw r8
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.appcompat.widget.ActionMenuPresenter.onSubMenuSelected(androidx.appcompat.view.menu.SubMenuBuilder):boolean");
    }
}
