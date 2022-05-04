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
import android.widget.PopupWindow;
import android.widget.TextView;
import androidx.appcompat.view.menu.MenuPresenter;
import androidx.appcompat.widget.DropDownListView;
import androidx.appcompat.widget.MenuPopupWindow;
import com.android.systemui.shared.R;
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
    public final AnonymousClass1 mGlobalLayoutListener = new ViewTreeObserver.OnGlobalLayoutListener() { // from class: androidx.appcompat.view.menu.StandardMenuPopup.1
        @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
        public final void onGlobalLayout() {
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
    public final AnonymousClass2 mAttachStateChangeListener = new View.OnAttachStateChangeListener() { // from class: androidx.appcompat.view.menu.StandardMenuPopup.2
        @Override // android.view.View.OnAttachStateChangeListener
        public final void onViewAttachedToWindow(View view) {
        }

        @Override // android.view.View.OnAttachStateChangeListener
        public final void onViewDetachedFromWindow(View view) {
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

    @Override // androidx.appcompat.view.menu.MenuPopup
    public final void addMenu(MenuBuilder menuBuilder) {
    }

    @Override // androidx.appcompat.view.menu.MenuPresenter
    public final boolean flagActionItems() {
        return false;
    }

    @Override // android.widget.PopupWindow.OnDismissListener
    public final void onDismiss() {
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

    @Override // androidx.appcompat.view.menu.MenuPresenter
    public final void updateMenuView() {
        this.mHasContentWidth = false;
        MenuAdapter menuAdapter = this.mAdapter;
        if (menuAdapter != null) {
            menuAdapter.notifyDataSetChanged();
        }
    }

    @Override // androidx.appcompat.view.menu.ShowableListMenu
    public final DropDownListView getListView() {
        return this.mPopup.mDropDownList;
    }

    @Override // androidx.appcompat.view.menu.ShowableListMenu
    public final boolean isShowing() {
        if (this.mWasDismissed || !this.mPopup.isShowing()) {
            return false;
        }
        return true;
    }

    @Override // androidx.appcompat.view.menu.MenuPresenter
    public final void onCloseMenu(MenuBuilder menuBuilder, boolean z) {
        if (menuBuilder == this.mMenu) {
            dismiss();
            MenuPresenter.Callback callback = this.mPresenterCallback;
            if (callback != null) {
                callback.onCloseMenu(menuBuilder, z);
            }
        }
    }

    @Override // androidx.appcompat.view.menu.MenuPopup
    public final void setForceShowIcon(boolean z) {
        this.mAdapter.mForceShowIcon = z;
    }

    @Override // androidx.appcompat.view.menu.MenuPopup
    public final void setHorizontalOffset(int i) {
        this.mPopup.mDropDownHorizontalOffset = i;
    }

    @Override // androidx.appcompat.view.menu.MenuPopup
    public final void setVerticalOffset(int i) {
        this.mPopup.setVerticalOffset(i);
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [androidx.appcompat.view.menu.StandardMenuPopup$1] */
    /* JADX WARN: Type inference failed for: r0v1, types: [androidx.appcompat.view.menu.StandardMenuPopup$2] */
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
        this.mPopup = new MenuPopupWindow(context, i, i2);
        menuBuilder.addMenuPresenter(this, context);
    }

    @Override // androidx.appcompat.view.menu.ShowableListMenu
    public final void dismiss() {
        if (isShowing()) {
            this.mPopup.dismiss();
        }
    }

    @Override // android.view.View.OnKeyListener
    public final boolean onKey(View view, int i, KeyEvent keyEvent) {
        if (keyEvent.getAction() != 1 || i != 82) {
            return false;
        }
        dismiss();
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0072  */
    @Override // androidx.appcompat.view.menu.MenuPresenter
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean onSubMenuSelected(androidx.appcompat.view.menu.SubMenuBuilder r10) {
        /*
            r9 = this;
            boolean r0 = r10.hasVisibleItems()
            r1 = 0
            if (r0 == 0) goto L7a
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
            r0.mPresenterCallback = r2
            androidx.appcompat.view.menu.MenuPopup r3 = r0.mPopup
            if (r3 == 0) goto L23
            r3.setCallback(r2)
        L23:
            boolean r2 = androidx.appcompat.view.menu.MenuPopup.shouldPreserveIconSpacing(r10)
            r0.mForceShowIcon = r2
            androidx.appcompat.view.menu.MenuPopup r3 = r0.mPopup
            if (r3 == 0) goto L30
            r3.setForceShowIcon(r2)
        L30:
            android.widget.PopupWindow$OnDismissListener r2 = r9.mOnDismissListener
            r0.mOnDismissListener = r2
            r2 = 0
            r9.mOnDismissListener = r2
            androidx.appcompat.view.menu.MenuBuilder r2 = r9.mMenu
            r2.close(r1)
            androidx.appcompat.widget.MenuPopupWindow r2 = r9.mPopup
            int r3 = r2.mDropDownHorizontalOffset
            int r2 = r2.getVerticalOffset()
            int r4 = r9.mDropDownGravity
            android.view.View r5 = r9.mAnchorView
            java.util.WeakHashMap<android.view.View, androidx.core.view.ViewPropertyAnimatorCompat> r6 = androidx.core.view.ViewCompat.sViewPropertyAnimatorMap
            int r5 = androidx.core.view.ViewCompat.Api17Impl.getLayoutDirection(r5)
            int r4 = android.view.Gravity.getAbsoluteGravity(r4, r5)
            r4 = r4 & 7
            r5 = 5
            if (r4 != r5) goto L5e
            android.view.View r4 = r9.mAnchorView
            int r4 = r4.getWidth()
            int r3 = r3 + r4
        L5e:
            boolean r4 = r0.isShowing()
            r5 = 1
            if (r4 == 0) goto L66
            goto L6f
        L66:
            android.view.View r4 = r0.mAnchorView
            if (r4 != 0) goto L6c
            r0 = r1
            goto L70
        L6c:
            r0.showPopup(r3, r2, r5, r5)
        L6f:
            r0 = r5
        L70:
            if (r0 == 0) goto L7a
            androidx.appcompat.view.menu.MenuPresenter$Callback r9 = r9.mPresenterCallback
            if (r9 == 0) goto L79
            r9.onOpenSubMenu(r10)
        L79:
            return r5
        L7a:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.appcompat.view.menu.StandardMenuPopup.onSubMenuSelected(androidx.appcompat.view.menu.SubMenuBuilder):boolean");
    }

    @Override // androidx.appcompat.view.menu.ShowableListMenu
    public final void show() {
        View view;
        boolean z;
        Rect rect;
        boolean z2 = true;
        if (!isShowing()) {
            if (this.mWasDismissed || (view = this.mAnchorView) == null) {
                z2 = false;
            } else {
                this.mShownAnchorView = view;
                this.mPopup.mPopup.setOnDismissListener(this);
                MenuPopupWindow menuPopupWindow = this.mPopup;
                menuPopupWindow.mItemClickListener = this;
                menuPopupWindow.mModal = true;
                menuPopupWindow.mPopup.setFocusable(true);
                View view2 = this.mShownAnchorView;
                if (this.mTreeObserver == null) {
                    z = true;
                } else {
                    z = false;
                }
                ViewTreeObserver viewTreeObserver = view2.getViewTreeObserver();
                this.mTreeObserver = viewTreeObserver;
                if (z) {
                    viewTreeObserver.addOnGlobalLayoutListener(this.mGlobalLayoutListener);
                }
                view2.addOnAttachStateChangeListener(this.mAttachStateChangeListener);
                MenuPopupWindow menuPopupWindow2 = this.mPopup;
                menuPopupWindow2.mDropDownAnchorView = view2;
                menuPopupWindow2.mDropDownGravity = this.mDropDownGravity;
                if (!this.mHasContentWidth) {
                    this.mContentWidth = MenuPopup.measureIndividualMenuWidth(this.mAdapter, this.mContext, this.mPopupMaxWidth);
                    this.mHasContentWidth = true;
                }
                this.mPopup.setContentWidth(this.mContentWidth);
                this.mPopup.mPopup.setInputMethodMode(2);
                MenuPopupWindow menuPopupWindow3 = this.mPopup;
                Rect rect2 = this.mEpicenterBounds;
                if (rect2 != null) {
                    menuPopupWindow3.getClass();
                    rect = new Rect(rect2);
                } else {
                    rect = null;
                }
                menuPopupWindow3.mEpicenterBounds = rect;
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
        if (!z2) {
            throw new IllegalStateException("StandardMenuPopup cannot be used without an anchor");
        }
    }

    @Override // androidx.appcompat.view.menu.MenuPopup
    public final void setAnchorView(View view) {
        this.mAnchorView = view;
    }

    @Override // androidx.appcompat.view.menu.MenuPresenter
    public final void setCallback(MenuPresenter.Callback callback) {
        this.mPresenterCallback = callback;
    }

    @Override // androidx.appcompat.view.menu.MenuPopup
    public final void setGravity(int i) {
        this.mDropDownGravity = i;
    }

    @Override // androidx.appcompat.view.menu.MenuPopup
    public final void setOnDismissListener(PopupWindow.OnDismissListener onDismissListener) {
        this.mOnDismissListener = onDismissListener;
    }

    @Override // androidx.appcompat.view.menu.MenuPopup
    public final void setShowTitle(boolean z) {
        this.mShowTitle = z;
    }
}
