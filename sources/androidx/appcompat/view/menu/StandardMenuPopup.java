package androidx.appcompat.view.menu;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Rect;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import android.widget.ListView;
import android.widget.PopupWindow;
import android.widget.TextView;
import androidx.appcompat.view.menu.MenuPresenter;
import androidx.appcompat.widget.DropDownListView;
import androidx.appcompat.widget.MenuPopupWindow;
import com.android.systemui.shared.R;
import java.util.Objects;
/* loaded from: classes.dex */
public final class StandardMenuPopup extends MenuPopup implements PopupWindow.OnDismissListener, View.OnKeyListener {
    public final MenuAdapter mAdapter;
    public View mAnchorView;
    public int mContentWidth;
    public final Context mContext;
    public boolean mHasContentWidth;
    public final MenuBuilder mMenu;
    public PopupWindow.OnDismissListener mOnDismissListener;
    public final boolean mOverflowOnly;
    public final MenuPopupWindow mPopup;
    public final int mPopupMaxWidth;
    public final int mPopupStyleAttr;
    public final int mPopupStyleRes;
    public MenuPresenter.Callback mPresenterCallback;
    public boolean mShowTitle;
    public View mShownAnchorView;
    public ViewTreeObserver mTreeObserver;
    public boolean mWasDismissed;
    public final ViewTreeObserver.OnGlobalLayoutListener mGlobalLayoutListener = new ViewTreeObserver.OnGlobalLayoutListener() { // from class: androidx.appcompat.view.menu.StandardMenuPopup.1
        @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
        public void onGlobalLayout() {
            if (StandardMenuPopup.this.isShowing()) {
                StandardMenuPopup standardMenuPopup = StandardMenuPopup.this;
                if (!standardMenuPopup.mPopup.mModal) {
                    View view = standardMenuPopup.mShownAnchorView;
                    if (view == null || !view.isShown()) {
                        StandardMenuPopup.this.dismiss();
                    } else {
                        StandardMenuPopup.this.mPopup.show();
                    }
                }
            }
        }
    };
    public final View.OnAttachStateChangeListener mAttachStateChangeListener = new View.OnAttachStateChangeListener() { // from class: androidx.appcompat.view.menu.StandardMenuPopup.2
        @Override // android.view.View.OnAttachStateChangeListener
        public void onViewAttachedToWindow(View view) {
        }

        @Override // android.view.View.OnAttachStateChangeListener
        public void onViewDetachedFromWindow(View view) {
            ViewTreeObserver viewTreeObserver = StandardMenuPopup.this.mTreeObserver;
            if (viewTreeObserver != null) {
                if (!viewTreeObserver.isAlive()) {
                    StandardMenuPopup.this.mTreeObserver = view.getViewTreeObserver();
                }
                StandardMenuPopup standardMenuPopup = StandardMenuPopup.this;
                standardMenuPopup.mTreeObserver.removeGlobalOnLayoutListener(standardMenuPopup.mGlobalLayoutListener);
            }
            view.removeOnAttachStateChangeListener(this);
        }
    };
    public int mDropDownGravity = 0;

    public StandardMenuPopup(Context context, MenuBuilder menuBuilder, View view, int i, int i2, boolean z) {
        this.mContext = context;
        this.mMenu = menuBuilder;
        this.mOverflowOnly = z;
        this.mAdapter = new MenuAdapter(menuBuilder, LayoutInflater.from(context), z, R.layout.abc_popup_menu_item_layout);
        this.mPopupStyleAttr = i;
        this.mPopupStyleRes = i2;
        Resources resources = context.getResources();
        this.mPopupMaxWidth = Math.max(resources.getDisplayMetrics().widthPixels / 2, resources.getDimensionPixelSize(R.dimen.abc_config_prefDialogWidth));
        this.mAnchorView = view;
        this.mPopup = new MenuPopupWindow(context, null, i, i2);
        menuBuilder.addMenuPresenter(this, context);
    }

    @Override // androidx.appcompat.view.menu.MenuPopup
    public void addMenu(MenuBuilder menuBuilder) {
    }

    @Override // androidx.appcompat.view.menu.ShowableListMenu
    public void dismiss() {
        if (isShowing()) {
            this.mPopup.dismiss();
        }
    }

    @Override // androidx.appcompat.view.menu.MenuPresenter
    public boolean flagActionItems() {
        return false;
    }

    @Override // androidx.appcompat.view.menu.ShowableListMenu
    public ListView getListView() {
        return this.mPopup.mDropDownList;
    }

    @Override // androidx.appcompat.view.menu.ShowableListMenu
    public boolean isShowing() {
        return !this.mWasDismissed && this.mPopup.isShowing();
    }

    @Override // androidx.appcompat.view.menu.MenuPresenter
    public void onCloseMenu(MenuBuilder menuBuilder, boolean z) {
        if (menuBuilder == this.mMenu) {
            dismiss();
            MenuPresenter.Callback callback = this.mPresenterCallback;
            if (callback != null) {
                callback.onCloseMenu(menuBuilder, z);
            }
        }
    }

    @Override // android.widget.PopupWindow.OnDismissListener
    public void onDismiss() {
        this.mWasDismissed = true;
        this.mMenu.close(true);
        ViewTreeObserver viewTreeObserver = this.mTreeObserver;
        if (viewTreeObserver != null) {
            if (!viewTreeObserver.isAlive()) {
                this.mTreeObserver = this.mShownAnchorView.getViewTreeObserver();
            }
            this.mTreeObserver.removeGlobalOnLayoutListener(this.mGlobalLayoutListener);
            this.mTreeObserver = null;
        }
        this.mShownAnchorView.removeOnAttachStateChangeListener(this.mAttachStateChangeListener);
        PopupWindow.OnDismissListener onDismissListener = this.mOnDismissListener;
        if (onDismissListener != null) {
            onDismissListener.onDismiss();
        }
    }

    @Override // android.view.View.OnKeyListener
    public boolean onKey(View view, int i, KeyEvent keyEvent) {
        if (keyEvent.getAction() != 1 || i != 82) {
            return false;
        }
        dismiss();
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0070  */
    @Override // androidx.appcompat.view.menu.MenuPresenter
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean onSubMenuSelected(androidx.appcompat.view.menu.SubMenuBuilder r10) {
        /*
            r9 = this;
            boolean r0 = r10.hasVisibleItems()
            r1 = 0
            if (r0 == 0) goto L78
            androidx.appcompat.view.menu.MenuPopupHelper r0 = new androidx.appcompat.view.menu.MenuPopupHelper
            android.content.Context r3 = r9.mContext
            android.view.View r5 = r9.mShownAnchorView
            boolean r6 = r9.mOverflowOnly
            int r7 = r9.mPopupStyleAttr
            int r8 = r9.mPopupStyleRes
            r2 = r0
            r4 = r10
            r2.<init>(r3, r4, r5, r6, r7, r8)
            androidx.appcompat.view.menu.MenuPresenter$Callback r2 = r9.mPresenterCallback
            r0.setPresenterCallback(r2)
            boolean r2 = androidx.appcompat.view.menu.MenuPopup.shouldPreserveIconSpacing(r10)
            r0.mForceShowIcon = r2
            androidx.appcompat.view.menu.MenuPopup r3 = r0.mPopup
            if (r3 == 0) goto L2a
            r3.setForceShowIcon(r2)
        L2a:
            android.widget.PopupWindow$OnDismissListener r2 = r9.mOnDismissListener
            r0.mOnDismissListener = r2
            r2 = 0
            r9.mOnDismissListener = r2
            androidx.appcompat.view.menu.MenuBuilder r2 = r9.mMenu
            r2.close(r1)
            androidx.appcompat.widget.MenuPopupWindow r2 = r9.mPopup
            int r3 = r2.mDropDownHorizontalOffset
            boolean r4 = r2.mDropDownVerticalOffsetSet
            if (r4 != 0) goto L40
            r2 = r1
            goto L42
        L40:
            int r2 = r2.mDropDownVerticalOffset
        L42:
            int r4 = r9.mDropDownGravity
            android.view.View r5 = r9.mAnchorView
            java.util.WeakHashMap<android.view.View, androidx.core.view.ViewPropertyAnimatorCompat> r6 = androidx.core.view.ViewCompat.sViewPropertyAnimatorMap
            int r5 = r5.getLayoutDirection()
            int r4 = android.view.Gravity.getAbsoluteGravity(r4, r5)
            r4 = r4 & 7
            r5 = 5
            if (r4 != r5) goto L5c
            android.view.View r4 = r9.mAnchorView
            int r4 = r4.getWidth()
            int r3 = r3 + r4
        L5c:
            boolean r4 = r0.isShowing()
            r5 = 1
            if (r4 == 0) goto L64
            goto L6d
        L64:
            android.view.View r4 = r0.mAnchorView
            if (r4 != 0) goto L6a
            r0 = r1
            goto L6e
        L6a:
            r0.showPopup(r3, r2, r5, r5)
        L6d:
            r0 = r5
        L6e:
            if (r0 == 0) goto L78
            androidx.appcompat.view.menu.MenuPresenter$Callback r9 = r9.mPresenterCallback
            if (r9 == 0) goto L77
            r9.onOpenSubMenu(r10)
        L77:
            return r5
        L78:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.appcompat.view.menu.StandardMenuPopup.onSubMenuSelected(androidx.appcompat.view.menu.SubMenuBuilder):boolean");
    }

    @Override // androidx.appcompat.view.menu.MenuPopup
    public void setAnchorView(View view) {
        this.mAnchorView = view;
    }

    @Override // androidx.appcompat.view.menu.MenuPresenter
    public void setCallback(MenuPresenter.Callback callback) {
        this.mPresenterCallback = callback;
    }

    @Override // androidx.appcompat.view.menu.MenuPopup
    public void setForceShowIcon(boolean z) {
        this.mAdapter.mForceShowIcon = z;
    }

    @Override // androidx.appcompat.view.menu.MenuPopup
    public void setGravity(int i) {
        this.mDropDownGravity = i;
    }

    @Override // androidx.appcompat.view.menu.MenuPopup
    public void setHorizontalOffset(int i) {
        this.mPopup.mDropDownHorizontalOffset = i;
    }

    @Override // androidx.appcompat.view.menu.MenuPopup
    public void setOnDismissListener(PopupWindow.OnDismissListener onDismissListener) {
        this.mOnDismissListener = onDismissListener;
    }

    @Override // androidx.appcompat.view.menu.MenuPopup
    public void setShowTitle(boolean z) {
        this.mShowTitle = z;
    }

    @Override // androidx.appcompat.view.menu.MenuPopup
    public void setVerticalOffset(int i) {
        MenuPopupWindow menuPopupWindow = this.mPopup;
        menuPopupWindow.mDropDownVerticalOffset = i;
        menuPopupWindow.mDropDownVerticalOffsetSet = true;
    }

    @Override // androidx.appcompat.view.menu.ShowableListMenu
    public void show() {
        View view;
        boolean z = true;
        if (!isShowing()) {
            if (this.mWasDismissed || (view = this.mAnchorView) == null) {
                z = false;
            } else {
                this.mShownAnchorView = view;
                this.mPopup.mPopup.setOnDismissListener(this);
                MenuPopupWindow menuPopupWindow = this.mPopup;
                menuPopupWindow.mItemClickListener = this;
                menuPopupWindow.setModal(true);
                View view2 = this.mShownAnchorView;
                boolean z2 = this.mTreeObserver == null;
                ViewTreeObserver viewTreeObserver = view2.getViewTreeObserver();
                this.mTreeObserver = viewTreeObserver;
                if (z2) {
                    viewTreeObserver.addOnGlobalLayoutListener(this.mGlobalLayoutListener);
                }
                view2.addOnAttachStateChangeListener(this.mAttachStateChangeListener);
                MenuPopupWindow menuPopupWindow2 = this.mPopup;
                menuPopupWindow2.mDropDownAnchorView = view2;
                menuPopupWindow2.mDropDownGravity = this.mDropDownGravity;
                if (!this.mHasContentWidth) {
                    this.mContentWidth = MenuPopup.measureIndividualMenuWidth(this.mAdapter, null, this.mContext, this.mPopupMaxWidth);
                    this.mHasContentWidth = true;
                }
                this.mPopup.setContentWidth(this.mContentWidth);
                this.mPopup.mPopup.setInputMethodMode(2);
                MenuPopupWindow menuPopupWindow3 = this.mPopup;
                Rect rect = this.mEpicenterBounds;
                Objects.requireNonNull(menuPopupWindow3);
                menuPopupWindow3.mEpicenterBounds = rect != null ? new Rect(rect) : null;
                this.mPopup.show();
                DropDownListView dropDownListView = this.mPopup.mDropDownList;
                dropDownListView.setOnKeyListener(this);
                if (this.mShowTitle && this.mMenu.mHeaderTitle != null) {
                    FrameLayout frameLayout = (FrameLayout) LayoutInflater.from(this.mContext).inflate(R.layout.abc_popup_menu_header_item_layout, (ViewGroup) dropDownListView, false);
                    TextView textView = (TextView) frameLayout.findViewById(16908310);
                    if (textView != null) {
                        textView.setText(this.mMenu.mHeaderTitle);
                    }
                    frameLayout.setEnabled(false);
                    dropDownListView.addHeaderView(frameLayout, null, false);
                }
                this.mPopup.setAdapter(this.mAdapter);
                this.mPopup.show();
            }
        }
        if (!z) {
            throw new IllegalStateException("StandardMenuPopup cannot be used without an anchor");
        }
    }

    @Override // androidx.appcompat.view.menu.MenuPresenter
    public void updateMenuView(boolean z) {
        this.mHasContentWidth = false;
        MenuAdapter menuAdapter = this.mAdapter;
        if (menuAdapter != null) {
            menuAdapter.notifyDataSetChanged();
        }
    }
}
