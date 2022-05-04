package androidx.core.view;

import android.util.Log;
import android.view.View;
import android.view.ViewParent;
/* loaded from: classes.dex */
public class NestedScrollingChildHelper {
    public boolean mIsNestedScrollingEnabled;
    public ViewParent mNestedScrollingParentNonTouch;
    public ViewParent mNestedScrollingParentTouch;
    public int[] mTempNestedScrollConsumed;
    public final View mView;

    public NestedScrollingChildHelper(View view) {
        this.mView = view;
    }

    public boolean dispatchNestedFling(float velocityX, float velocityY, boolean consumed) {
        ViewParent nestedScrollingParentForType;
        if (!this.mIsNestedScrollingEnabled || (nestedScrollingParentForType = getNestedScrollingParentForType(0)) == null) {
            return false;
        }
        try {
            return nestedScrollingParentForType.onNestedFling(this.mView, velocityX, velocityY, consumed);
        } catch (AbstractMethodError e) {
            Log.e("ViewParentCompat", "ViewParent " + nestedScrollingParentForType + " does not implement interface method onNestedFling", e);
            return false;
        }
    }

    public boolean dispatchNestedPreFling(float velocityX, float velocityY) {
        ViewParent nestedScrollingParentForType;
        if (!this.mIsNestedScrollingEnabled || (nestedScrollingParentForType = getNestedScrollingParentForType(0)) == null) {
            return false;
        }
        try {
            return nestedScrollingParentForType.onNestedPreFling(this.mView, velocityX, velocityY);
        } catch (AbstractMethodError e) {
            Log.e("ViewParentCompat", "ViewParent " + nestedScrollingParentForType + " does not implement interface method onNestedPreFling", e);
            return false;
        }
    }

    public boolean dispatchNestedPreScroll(int dx, int dy, int[] consumed, int[] offsetInWindow, int type) {
        ViewParent nestedScrollingParentForType;
        int i;
        int i2;
        int[] iArr;
        if (!this.mIsNestedScrollingEnabled || (nestedScrollingParentForType = getNestedScrollingParentForType(type)) == null) {
            return false;
        }
        if (dx != 0 || dy != 0) {
            if (offsetInWindow != null) {
                this.mView.getLocationInWindow(offsetInWindow);
                i2 = offsetInWindow[0];
                i = offsetInWindow[1];
            } else {
                i2 = 0;
                i = 0;
            }
            if (consumed == null) {
                if (this.mTempNestedScrollConsumed == null) {
                    this.mTempNestedScrollConsumed = new int[2];
                }
                iArr = this.mTempNestedScrollConsumed;
            } else {
                iArr = consumed;
            }
            iArr[0] = 0;
            iArr[1] = 0;
            View view = this.mView;
            if (nestedScrollingParentForType instanceof NestedScrollingParent2) {
                ((NestedScrollingParent2) nestedScrollingParentForType).onNestedPreScroll(view, dx, dy, iArr, type);
            } else if (type == 0) {
                try {
                    nestedScrollingParentForType.onNestedPreScroll(view, dx, dy, iArr);
                } catch (AbstractMethodError e) {
                    Log.e("ViewParentCompat", "ViewParent " + nestedScrollingParentForType + " does not implement interface method onNestedPreScroll", e);
                }
            }
            if (offsetInWindow != null) {
                this.mView.getLocationInWindow(offsetInWindow);
                offsetInWindow[0] = offsetInWindow[0] - i2;
                offsetInWindow[1] = offsetInWindow[1] - i;
            }
            return (iArr[0] == 0 && iArr[1] == 0) ? false : true;
        } else if (offsetInWindow == null) {
            return false;
        } else {
            offsetInWindow[0] = 0;
            offsetInWindow[1] = 0;
            return false;
        }
    }

    public boolean dispatchNestedScroll(int dxConsumed, int dyConsumed, int dxUnconsumed, int dyUnconsumed, int[] offsetInWindow) {
        return dispatchNestedScrollInternal(dxConsumed, dyConsumed, dxUnconsumed, dyUnconsumed, offsetInWindow, 0, null);
    }

    public final boolean dispatchNestedScrollInternal(int dxConsumed, int dyConsumed, int dxUnconsumed, int dyUnconsumed, int[] offsetInWindow, int type, int[] consumed) {
        ViewParent nestedScrollingParentForType;
        int i;
        int i2;
        int[] iArr;
        if (!this.mIsNestedScrollingEnabled || (nestedScrollingParentForType = getNestedScrollingParentForType(type)) == null) {
            return false;
        }
        if (dxConsumed == 0 && dyConsumed == 0 && dxUnconsumed == 0 && dyUnconsumed == 0) {
            if (offsetInWindow != null) {
                offsetInWindow[0] = 0;
                offsetInWindow[1] = 0;
            }
            return false;
        }
        if (offsetInWindow != null) {
            this.mView.getLocationInWindow(offsetInWindow);
            i2 = offsetInWindow[0];
            i = offsetInWindow[1];
        } else {
            i2 = 0;
            i = 0;
        }
        if (consumed == null) {
            if (this.mTempNestedScrollConsumed == null) {
                this.mTempNestedScrollConsumed = new int[2];
            }
            int[] iArr2 = this.mTempNestedScrollConsumed;
            iArr2[0] = 0;
            iArr2[1] = 0;
            iArr = iArr2;
        } else {
            iArr = consumed;
        }
        View view = this.mView;
        if (nestedScrollingParentForType instanceof NestedScrollingParent3) {
            ((NestedScrollingParent3) nestedScrollingParentForType).onNestedScroll(view, dxConsumed, dyConsumed, dxUnconsumed, dyUnconsumed, type, iArr);
        } else {
            iArr[0] = iArr[0] + dxUnconsumed;
            iArr[1] = iArr[1] + dyUnconsumed;
            if (nestedScrollingParentForType instanceof NestedScrollingParent2) {
                ((NestedScrollingParent2) nestedScrollingParentForType).onNestedScroll(view, dxConsumed, dyConsumed, dxUnconsumed, dyUnconsumed, type);
            } else if (type == 0) {
                try {
                    nestedScrollingParentForType.onNestedScroll(view, dxConsumed, dyConsumed, dxUnconsumed, dyUnconsumed);
                } catch (AbstractMethodError e) {
                    Log.e("ViewParentCompat", "ViewParent " + nestedScrollingParentForType + " does not implement interface method onNestedScroll", e);
                }
            }
        }
        if (offsetInWindow != null) {
            this.mView.getLocationInWindow(offsetInWindow);
            offsetInWindow[0] = offsetInWindow[0] - i2;
            offsetInWindow[1] = offsetInWindow[1] - i;
        }
        return true;
    }

    public final ViewParent getNestedScrollingParentForType(int type) {
        if (type == 0) {
            return this.mNestedScrollingParentTouch;
        }
        if (type != 1) {
            return null;
        }
        return this.mNestedScrollingParentNonTouch;
    }

    public boolean hasNestedScrollingParent(int type) {
        return getNestedScrollingParentForType(type) != null;
    }

    public boolean startNestedScroll(int axes, int type) {
        boolean z;
        if (getNestedScrollingParentForType(type) != null) {
            return true;
        }
        if (this.mIsNestedScrollingEnabled) {
            View view = this.mView;
            for (ViewParent parent = this.mView.getParent(); parent != null; parent = parent.getParent()) {
                View view2 = this.mView;
                boolean z2 = parent instanceof NestedScrollingParent2;
                if (z2) {
                    z = ((NestedScrollingParent2) parent).onStartNestedScroll(view, view2, axes, type);
                } else {
                    if (type == 0) {
                        try {
                            z = parent.onStartNestedScroll(view, view2, axes);
                        } catch (AbstractMethodError e) {
                            Log.e("ViewParentCompat", "ViewParent " + parent + " does not implement interface method onStartNestedScroll", e);
                        }
                    }
                    z = false;
                }
                if (z) {
                    if (type == 0) {
                        this.mNestedScrollingParentTouch = parent;
                    } else if (type == 1) {
                        this.mNestedScrollingParentNonTouch = parent;
                    }
                    View view3 = this.mView;
                    if (z2) {
                        ((NestedScrollingParent2) parent).onNestedScrollAccepted(view, view3, axes, type);
                    } else if (type == 0) {
                        try {
                            parent.onNestedScrollAccepted(view, view3, axes);
                        } catch (AbstractMethodError e2) {
                            Log.e("ViewParentCompat", "ViewParent " + parent + " does not implement interface method onNestedScrollAccepted", e2);
                        }
                    }
                    return true;
                }
                if (parent instanceof View) {
                    view = parent;
                }
            }
        }
        return false;
    }

    public void stopNestedScroll(int type) {
        ViewParent nestedScrollingParentForType = getNestedScrollingParentForType(type);
        if (nestedScrollingParentForType != null) {
            View view = this.mView;
            if (nestedScrollingParentForType instanceof NestedScrollingParent2) {
                ((NestedScrollingParent2) nestedScrollingParentForType).onStopNestedScroll(view, type);
            } else if (type == 0) {
                try {
                    nestedScrollingParentForType.onStopNestedScroll(view);
                } catch (AbstractMethodError e) {
                    Log.e("ViewParentCompat", "ViewParent " + nestedScrollingParentForType + " does not implement interface method onStopNestedScroll", e);
                }
            }
            if (type == 0) {
                this.mNestedScrollingParentTouch = null;
            } else if (type == 1) {
                this.mNestedScrollingParentNonTouch = null;
            }
        }
    }

    public void dispatchNestedScroll(int dxConsumed, int dyConsumed, int dxUnconsumed, int dyUnconsumed, int[] offsetInWindow, int type, int[] consumed) {
        dispatchNestedScrollInternal(dxConsumed, dyConsumed, dxUnconsumed, dyUnconsumed, null, type, consumed);
    }
}
