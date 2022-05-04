package androidx.customview.widget;

import android.graphics.Rect;
import android.os.Bundle;
import android.view.View;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.view.accessibility.AccessibilityNodeInfo;
import androidx.core.view.AccessibilityDelegateCompat;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.core.view.accessibility.AccessibilityNodeInfoCompat;
import androidx.core.view.accessibility.AccessibilityNodeProviderCompat;
import androidx.recyclerview.widget.RecyclerView;
import com.android.systemui.shared.system.QuickStepContract;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.google.android.material.chip.Chip;
import com.google.android.material.chip.ChipDrawable;
import java.util.ArrayList;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public abstract class ExploreByTouchHelper extends AccessibilityDelegateCompat {
    public static final Rect INVALID_BOUNDS = new Rect(Integer.MAX_VALUE, Integer.MAX_VALUE, RecyclerView.UNDEFINED_DURATION, RecyclerView.UNDEFINED_DURATION);
    public static final AnonymousClass1 NODE_ADAPTER = new Object() { // from class: androidx.customview.widget.ExploreByTouchHelper.1
    };
    public static final AnonymousClass2 SPARSE_VALUES_ADAPTER = new Object() { // from class: androidx.customview.widget.ExploreByTouchHelper.2
    };
    public final View mHost;
    public final AccessibilityManager mManager;
    public MyNodeProvider mNodeProvider;
    public final Rect mTempScreenRect = new Rect();
    public final Rect mTempParentRect = new Rect();
    public final Rect mTempVisibleRect = new Rect();
    public final int[] mTempGlobalRect = new int[2];
    public int mAccessibilityFocusedVirtualViewId = RecyclerView.UNDEFINED_DURATION;
    public int mKeyboardFocusedVirtualViewId = RecyclerView.UNDEFINED_DURATION;
    public int mHoveredVirtualViewId = RecyclerView.UNDEFINED_DURATION;

    /* loaded from: classes.dex */
    public class MyNodeProvider extends AccessibilityNodeProviderCompat {
        @Override // androidx.core.view.accessibility.AccessibilityNodeProviderCompat
        public final AccessibilityNodeInfoCompat findFocus(int i) {
            int i2;
            if (i == 2) {
                i2 = ExploreByTouchHelper.this.mAccessibilityFocusedVirtualViewId;
            } else {
                i2 = ExploreByTouchHelper.this.mKeyboardFocusedVirtualViewId;
            }
            if (i2 == Integer.MIN_VALUE) {
                return null;
            }
            return createAccessibilityNodeInfo(i2);
        }

        public MyNodeProvider() {
        }

        @Override // androidx.core.view.accessibility.AccessibilityNodeProviderCompat
        public final AccessibilityNodeInfoCompat createAccessibilityNodeInfo(int i) {
            return new AccessibilityNodeInfoCompat(AccessibilityNodeInfo.obtain(ExploreByTouchHelper.this.obtainAccessibilityNodeInfo(i).mInfo));
        }

        @Override // androidx.core.view.accessibility.AccessibilityNodeProviderCompat
        public final boolean performAction(int i, int i2, Bundle bundle) {
            int i3;
            ExploreByTouchHelper exploreByTouchHelper = ExploreByTouchHelper.this;
            if (i != -1) {
                boolean z = true;
                if (i2 == 1) {
                    return exploreByTouchHelper.requestKeyboardFocusForVirtualView(i);
                }
                if (i2 == 2) {
                    if (exploreByTouchHelper.mKeyboardFocusedVirtualViewId == i) {
                        exploreByTouchHelper.mKeyboardFocusedVirtualViewId = RecyclerView.UNDEFINED_DURATION;
                        Chip.ChipTouchHelper chipTouchHelper = (Chip.ChipTouchHelper) exploreByTouchHelper;
                        if (i == 1) {
                            Chip chip = Chip.this;
                            chip.closeIconFocused = false;
                            chip.refreshDrawableState();
                        }
                        exploreByTouchHelper.sendEventForVirtualView(i, 8);
                        return z;
                    }
                    z = false;
                    return z;
                } else if (i2 == 64) {
                    if (exploreByTouchHelper.mManager.isEnabled() && exploreByTouchHelper.mManager.isTouchExplorationEnabled() && (i3 = exploreByTouchHelper.mAccessibilityFocusedVirtualViewId) != i) {
                        if (i3 != Integer.MIN_VALUE) {
                            exploreByTouchHelper.mAccessibilityFocusedVirtualViewId = RecyclerView.UNDEFINED_DURATION;
                            exploreByTouchHelper.mHost.invalidate();
                            exploreByTouchHelper.sendEventForVirtualView(i3, QuickStepContract.SYSUI_STATE_ONE_HANDED_ACTIVE);
                        }
                        exploreByTouchHelper.mAccessibilityFocusedVirtualViewId = i;
                        exploreByTouchHelper.mHost.invalidate();
                        exploreByTouchHelper.sendEventForVirtualView(i, QuickStepContract.SYSUI_STATE_DIALOG_SHOWING);
                        return z;
                    }
                    z = false;
                    return z;
                } else if (i2 != 128) {
                    Chip.ChipTouchHelper chipTouchHelper2 = (Chip.ChipTouchHelper) exploreByTouchHelper;
                    chipTouchHelper2.getClass();
                    if (i2 != 16) {
                        return false;
                    }
                    if (i == 0) {
                        return Chip.this.performClick();
                    }
                    if (i != 1) {
                        return false;
                    }
                    Chip.this.playSoundEffect(0);
                    return false;
                } else {
                    if (exploreByTouchHelper.mAccessibilityFocusedVirtualViewId == i) {
                        exploreByTouchHelper.mAccessibilityFocusedVirtualViewId = RecyclerView.UNDEFINED_DURATION;
                        exploreByTouchHelper.mHost.invalidate();
                        exploreByTouchHelper.sendEventForVirtualView(i, QuickStepContract.SYSUI_STATE_ONE_HANDED_ACTIVE);
                        return z;
                    }
                    z = false;
                    return z;
                }
            } else {
                View view = exploreByTouchHelper.mHost;
                WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
                return ViewCompat.Api16Impl.performAccessibilityAction(view, i2, bundle);
            }
        }
    }

    public abstract void getVisibleVirtualViews(ArrayList arrayList);

    public final AccessibilityNodeInfoCompat obtainAccessibilityNodeInfo(int i) {
        if (i != -1) {
            return createNodeForChild(i);
        }
        AccessibilityNodeInfo obtain = AccessibilityNodeInfo.obtain(this.mHost);
        AccessibilityNodeInfoCompat accessibilityNodeInfoCompat = new AccessibilityNodeInfoCompat(obtain);
        View view = this.mHost;
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        view.onInitializeAccessibilityNodeInfo(obtain);
        ArrayList arrayList = new ArrayList();
        getVisibleVirtualViews(arrayList);
        if (obtain.getChildCount() <= 0 || arrayList.size() <= 0) {
            int size = arrayList.size();
            for (int i2 = 0; i2 < size; i2++) {
                accessibilityNodeInfoCompat.mInfo.addChild(this.mHost, ((Integer) arrayList.get(i2)).intValue());
            }
            return accessibilityNodeInfoCompat;
        }
        throw new RuntimeException("Views cannot have both real and virtual children");
    }

    public abstract void onPopulateNodeForVirtualView(int i, AccessibilityNodeInfoCompat accessibilityNodeInfoCompat);

    @Override // androidx.core.view.AccessibilityDelegateCompat
    public final AccessibilityNodeProviderCompat getAccessibilityNodeProvider(View view) {
        if (this.mNodeProvider == null) {
            this.mNodeProvider = new MyNodeProvider();
        }
        return this.mNodeProvider;
    }

    @Override // androidx.core.view.AccessibilityDelegateCompat
    public final void onInitializeAccessibilityNodeInfo(View view, AccessibilityNodeInfoCompat accessibilityNodeInfoCompat) {
        boolean z;
        this.mOriginalDelegate.onInitializeAccessibilityNodeInfo(view, accessibilityNodeInfoCompat.mInfo);
        Chip.ChipTouchHelper chipTouchHelper = (Chip.ChipTouchHelper) this;
        ChipDrawable chipDrawable = Chip.this.chipDrawable;
        if (chipDrawable == null || !chipDrawable.checkable) {
            z = false;
        } else {
            z = true;
        }
        accessibilityNodeInfoCompat.mInfo.setCheckable(z);
        accessibilityNodeInfoCompat.mInfo.setClickable(Chip.this.isClickable());
        accessibilityNodeInfoCompat.mInfo.setClassName(Chip.this.getAccessibilityClassName());
        accessibilityNodeInfoCompat.mInfo.setText(Chip.this.getText());
    }

    public final boolean requestKeyboardFocusForVirtualView(int i) {
        int i2;
        if ((!this.mHost.isFocused() && !this.mHost.requestFocus()) || (i2 = this.mKeyboardFocusedVirtualViewId) == i) {
            return false;
        }
        if (i2 != Integer.MIN_VALUE) {
            this.mKeyboardFocusedVirtualViewId = RecyclerView.UNDEFINED_DURATION;
            Chip.ChipTouchHelper chipTouchHelper = (Chip.ChipTouchHelper) this;
            if (i2 == 1) {
                Chip chip = Chip.this;
                chip.closeIconFocused = false;
                chip.refreshDrawableState();
            }
            sendEventForVirtualView(i2, 8);
        }
        if (i == Integer.MIN_VALUE) {
            return false;
        }
        this.mKeyboardFocusedVirtualViewId = i;
        Chip.ChipTouchHelper chipTouchHelper2 = (Chip.ChipTouchHelper) this;
        if (i == 1) {
            Chip chip2 = Chip.this;
            chip2.closeIconFocused = true;
            chip2.refreshDrawableState();
        }
        sendEventForVirtualView(i, 8);
        return true;
    }

    public final void sendEventForVirtualView(int i, int i2) {
        ViewParent parent;
        AccessibilityEvent accessibilityEvent;
        if (i != Integer.MIN_VALUE && this.mManager.isEnabled() && (parent = this.mHost.getParent()) != null) {
            if (i != -1) {
                accessibilityEvent = AccessibilityEvent.obtain(i2);
                AccessibilityNodeInfoCompat obtainAccessibilityNodeInfo = obtainAccessibilityNodeInfo(i);
                accessibilityEvent.getText().add(obtainAccessibilityNodeInfo.getText());
                accessibilityEvent.setContentDescription(obtainAccessibilityNodeInfo.mInfo.getContentDescription());
                accessibilityEvent.setScrollable(obtainAccessibilityNodeInfo.mInfo.isScrollable());
                accessibilityEvent.setPassword(obtainAccessibilityNodeInfo.mInfo.isPassword());
                accessibilityEvent.setEnabled(obtainAccessibilityNodeInfo.mInfo.isEnabled());
                accessibilityEvent.setChecked(obtainAccessibilityNodeInfo.mInfo.isChecked());
                if (!accessibilityEvent.getText().isEmpty() || accessibilityEvent.getContentDescription() != null) {
                    accessibilityEvent.setClassName(obtainAccessibilityNodeInfo.mInfo.getClassName());
                    accessibilityEvent.setSource(this.mHost, i);
                    accessibilityEvent.setPackageName(this.mHost.getContext().getPackageName());
                } else {
                    throw new RuntimeException("Callbacks must add text or a content description in populateEventForVirtualViewId()");
                }
            } else {
                accessibilityEvent = AccessibilityEvent.obtain(i2);
                this.mHost.onInitializeAccessibilityEvent(accessibilityEvent);
            }
            parent.requestSendAccessibilityEvent(this.mHost, accessibilityEvent);
        }
    }

    public ExploreByTouchHelper(View view) {
        if (view != null) {
            this.mHost = view;
            this.mManager = (AccessibilityManager) view.getContext().getSystemService("accessibility");
            view.setFocusable(true);
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            if (ViewCompat.Api16Impl.getImportantForAccessibility(view) == 0) {
                ViewCompat.Api16Impl.setImportantForAccessibility(view, 1);
                return;
            }
            return;
        }
        throw new IllegalArgumentException("View may not be null");
    }

    public final AccessibilityNodeInfoCompat createNodeForChild(int i) {
        boolean z;
        AccessibilityNodeInfo obtain = AccessibilityNodeInfo.obtain();
        AccessibilityNodeInfoCompat accessibilityNodeInfoCompat = new AccessibilityNodeInfoCompat(obtain);
        obtain.setEnabled(true);
        obtain.setFocusable(true);
        obtain.setClassName("android.view.View");
        Rect rect = INVALID_BOUNDS;
        obtain.setBoundsInParent(rect);
        obtain.setBoundsInScreen(rect);
        View view = this.mHost;
        accessibilityNodeInfoCompat.mParentVirtualDescendantId = -1;
        obtain.setParent(view);
        onPopulateNodeForVirtualView(i, accessibilityNodeInfoCompat);
        if (accessibilityNodeInfoCompat.getText() == null && obtain.getContentDescription() == null) {
            throw new RuntimeException("Callbacks must add text or a content description in populateNodeForVirtualViewId()");
        }
        obtain.getBoundsInParent(this.mTempParentRect);
        obtain.getBoundsInScreen(this.mTempScreenRect);
        if (!this.mTempParentRect.equals(rect) || !this.mTempScreenRect.equals(rect)) {
            int actions = obtain.getActions();
            if ((actions & 64) != 0) {
                throw new RuntimeException("Callbacks must not add ACTION_ACCESSIBILITY_FOCUS in populateNodeForVirtualViewId()");
            } else if ((actions & 128) == 0) {
                obtain.setPackageName(this.mHost.getContext().getPackageName());
                View view2 = this.mHost;
                accessibilityNodeInfoCompat.mVirtualDescendantId = i;
                obtain.setSource(view2, i);
                boolean z2 = false;
                if (this.mAccessibilityFocusedVirtualViewId == i) {
                    obtain.setAccessibilityFocused(true);
                    accessibilityNodeInfoCompat.addAction(128);
                } else {
                    obtain.setAccessibilityFocused(false);
                    accessibilityNodeInfoCompat.addAction(64);
                }
                if (this.mKeyboardFocusedVirtualViewId == i) {
                    z = true;
                } else {
                    z = false;
                }
                if (z) {
                    accessibilityNodeInfoCompat.addAction(2);
                } else if (obtain.isFocusable()) {
                    accessibilityNodeInfoCompat.addAction(1);
                }
                obtain.setFocused(z);
                this.mHost.getLocationOnScreen(this.mTempGlobalRect);
                if (this.mTempScreenRect.equals(rect)) {
                    Rect rect2 = this.mTempParentRect;
                    obtain.setBoundsInParent(rect2);
                    Rect rect3 = new Rect();
                    rect3.set(rect2);
                    if (accessibilityNodeInfoCompat.mParentVirtualDescendantId != -1) {
                        AccessibilityNodeInfoCompat accessibilityNodeInfoCompat2 = new AccessibilityNodeInfoCompat(AccessibilityNodeInfo.obtain());
                        Rect rect4 = new Rect();
                        for (int i2 = accessibilityNodeInfoCompat.mParentVirtualDescendantId; i2 != -1; i2 = accessibilityNodeInfoCompat2.mParentVirtualDescendantId) {
                            View view3 = this.mHost;
                            accessibilityNodeInfoCompat2.mParentVirtualDescendantId = -1;
                            accessibilityNodeInfoCompat2.mInfo.setParent(view3, -1);
                            accessibilityNodeInfoCompat2.mInfo.setBoundsInParent(INVALID_BOUNDS);
                            onPopulateNodeForVirtualView(i2, accessibilityNodeInfoCompat2);
                            accessibilityNodeInfoCompat2.mInfo.getBoundsInParent(rect4);
                            rect3.offset(rect4.left, rect4.top);
                        }
                        accessibilityNodeInfoCompat2.mInfo.recycle();
                    }
                    this.mHost.getLocationOnScreen(this.mTempGlobalRect);
                    rect3.offset(this.mTempGlobalRect[0] - this.mHost.getScrollX(), this.mTempGlobalRect[1] - this.mHost.getScrollY());
                    accessibilityNodeInfoCompat.mInfo.setBoundsInScreen(rect3);
                    accessibilityNodeInfoCompat.mInfo.getBoundsInScreen(this.mTempScreenRect);
                }
                if (this.mHost.getLocalVisibleRect(this.mTempVisibleRect)) {
                    this.mTempVisibleRect.offset(this.mTempGlobalRect[0] - this.mHost.getScrollX(), this.mTempGlobalRect[1] - this.mHost.getScrollY());
                    if (this.mTempScreenRect.intersect(this.mTempVisibleRect)) {
                        accessibilityNodeInfoCompat.mInfo.setBoundsInScreen(this.mTempScreenRect);
                        Rect rect5 = this.mTempScreenRect;
                        if (rect5 != null && !rect5.isEmpty() && this.mHost.getWindowVisibility() == 0) {
                            ViewParent parent = this.mHost.getParent();
                            while (true) {
                                if (parent instanceof View) {
                                    View view4 = (View) parent;
                                    if (view4.getAlpha() <= HingeAngleProviderKt.FULLY_CLOSED_DEGREES || view4.getVisibility() != 0) {
                                        break;
                                    }
                                    parent = view4.getParent();
                                } else if (parent != null) {
                                    z2 = true;
                                }
                            }
                        }
                        if (z2) {
                            accessibilityNodeInfoCompat.mInfo.setVisibleToUser(true);
                        }
                    }
                }
                return accessibilityNodeInfoCompat;
            } else {
                throw new RuntimeException("Callbacks must not add ACTION_CLEAR_ACCESSIBILITY_FOCUS in populateNodeForVirtualViewId()");
            }
        } else {
            throw new RuntimeException("Callbacks must set parent bounds or screen bounds in populateNodeForVirtualViewId()");
        }
    }

    @Override // androidx.core.view.AccessibilityDelegateCompat
    public final void onInitializeAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
        super.onInitializeAccessibilityEvent(view, accessibilityEvent);
    }
}
