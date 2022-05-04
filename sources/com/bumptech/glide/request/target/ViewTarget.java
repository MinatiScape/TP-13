package com.bumptech.glide.request.target;

import android.content.Context;
import android.graphics.Point;
import android.graphics.drawable.Drawable;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.Log;
import android.view.Display;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.WindowManager;
import androidx.collection.ContainerHelpers;
import com.android.systemui.shared.R;
import com.bumptech.glide.request.Request;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
@Deprecated
/* loaded from: classes.dex */
public abstract class ViewTarget<T extends View, Z> extends BaseTarget<Z> {
    public final SizeDeterminer sizeDeterminer;
    public final T view;

    /* loaded from: classes.dex */
    public static final class SizeDeterminer {
        public static Integer maxDisplayLength;
        public final ArrayList cbs = new ArrayList();
        public SizeDeterminerLayoutListener layoutListener;
        public final View view;

        /* loaded from: classes.dex */
        public static final class SizeDeterminerLayoutListener implements ViewTreeObserver.OnPreDrawListener {
            public final WeakReference<SizeDeterminer> sizeDeterminerRef;

            @Override // android.view.ViewTreeObserver.OnPreDrawListener
            public final boolean onPreDraw() {
                boolean z;
                boolean z2;
                if (Log.isLoggable("ViewTarget", 2)) {
                    Log.v("ViewTarget", "OnGlobalLayoutListener called attachStateListener=" + this);
                }
                SizeDeterminer sizeDeterminer = this.sizeDeterminerRef.get();
                if (sizeDeterminer != null && !sizeDeterminer.cbs.isEmpty()) {
                    int targetWidth = sizeDeterminer.getTargetWidth();
                    int targetHeight = sizeDeterminer.getTargetHeight();
                    boolean z3 = false;
                    if (targetWidth > 0 || targetWidth == Integer.MIN_VALUE) {
                        z = true;
                    } else {
                        z = false;
                    }
                    if (z) {
                        if (targetHeight > 0 || targetHeight == Integer.MIN_VALUE) {
                            z2 = true;
                        } else {
                            z2 = false;
                        }
                        if (z2) {
                            z3 = true;
                        }
                    }
                    if (z3) {
                        Iterator it = new ArrayList(sizeDeterminer.cbs).iterator();
                        while (it.hasNext()) {
                            ((SizeReadyCallback) it.next()).onSizeReady(targetWidth, targetHeight);
                        }
                        ViewTreeObserver viewTreeObserver = sizeDeterminer.view.getViewTreeObserver();
                        if (viewTreeObserver.isAlive()) {
                            viewTreeObserver.removeOnPreDrawListener(sizeDeterminer.layoutListener);
                        }
                        sizeDeterminer.layoutListener = null;
                        sizeDeterminer.cbs.clear();
                    }
                }
                return true;
            }

            public SizeDeterminerLayoutListener(SizeDeterminer sizeDeterminer) {
                this.sizeDeterminerRef = new WeakReference<>(sizeDeterminer);
            }
        }

        public final int getTargetDimen(int i, int i2, int i3) {
            int i4 = i2 - i3;
            if (i4 > 0) {
                return i4;
            }
            int i5 = i - i3;
            if (i5 > 0) {
                return i5;
            }
            if (this.view.isLayoutRequested() || i2 != -2) {
                return 0;
            }
            if (Log.isLoggable("ViewTarget", 4)) {
                Log.i("ViewTarget", "Glide treats LayoutParams.WRAP_CONTENT as a request for an image the size of this device's screen dimensions. If you want to load the original image and are ok with the corresponding memory cost and OOMs (depending on the input size), use override(Target.SIZE_ORIGINAL). Otherwise, use LayoutParams.MATCH_PARENT, set layout_width and layout_height to fixed dimension, or use .override() with fixed dimensions.");
            }
            Context context = this.view.getContext();
            if (maxDisplayLength == null) {
                WindowManager windowManager = (WindowManager) context.getSystemService("window");
                ContainerHelpers.checkNotNull(windowManager);
                Display defaultDisplay = windowManager.getDefaultDisplay();
                Point point = new Point();
                defaultDisplay.getSize(point);
                maxDisplayLength = Integer.valueOf(Math.max(point.x, point.y));
            }
            return maxDisplayLength.intValue();
        }

        public final int getTargetHeight() {
            int i;
            int paddingBottom = this.view.getPaddingBottom() + this.view.getPaddingTop();
            ViewGroup.LayoutParams layoutParams = this.view.getLayoutParams();
            if (layoutParams != null) {
                i = layoutParams.height;
            } else {
                i = 0;
            }
            return getTargetDimen(this.view.getHeight(), i, paddingBottom);
        }

        public final int getTargetWidth() {
            int i;
            int paddingRight = this.view.getPaddingRight() + this.view.getPaddingLeft();
            ViewGroup.LayoutParams layoutParams = this.view.getLayoutParams();
            if (layoutParams != null) {
                i = layoutParams.width;
            } else {
                i = 0;
            }
            return getTargetDimen(this.view.getWidth(), i, paddingRight);
        }

        public SizeDeterminer(View view) {
            this.view = view;
        }
    }

    @Override // com.bumptech.glide.request.target.BaseTarget, com.bumptech.glide.request.target.Target
    public final Request getRequest() {
        Object tag = this.view.getTag(R.id.glide_custom_view_target_tag);
        if (tag == null) {
            return null;
        }
        if (tag instanceof Request) {
            return (Request) tag;
        }
        throw new IllegalArgumentException("You must not call setTag() on a view Glide is targeting");
    }

    @Override // com.bumptech.glide.request.target.Target
    public final void getSize(SizeReadyCallback sizeReadyCallback) {
        boolean z;
        boolean z2;
        SizeDeterminer sizeDeterminer = this.sizeDeterminer;
        int targetWidth = sizeDeterminer.getTargetWidth();
        int targetHeight = sizeDeterminer.getTargetHeight();
        boolean z3 = false;
        if (targetWidth > 0 || targetWidth == Integer.MIN_VALUE) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            if (targetHeight > 0 || targetHeight == Integer.MIN_VALUE) {
                z2 = true;
            } else {
                z2 = false;
            }
            if (z2) {
                z3 = true;
            }
        }
        if (z3) {
            sizeReadyCallback.onSizeReady(targetWidth, targetHeight);
            return;
        }
        if (!sizeDeterminer.cbs.contains(sizeReadyCallback)) {
            sizeDeterminer.cbs.add(sizeReadyCallback);
        }
        if (sizeDeterminer.layoutListener == null) {
            ViewTreeObserver viewTreeObserver = sizeDeterminer.view.getViewTreeObserver();
            SizeDeterminer.SizeDeterminerLayoutListener sizeDeterminerLayoutListener = new SizeDeterminer.SizeDeterminerLayoutListener(sizeDeterminer);
            sizeDeterminer.layoutListener = sizeDeterminerLayoutListener;
            viewTreeObserver.addOnPreDrawListener(sizeDeterminerLayoutListener);
        }
    }

    @Override // com.bumptech.glide.request.target.BaseTarget, com.bumptech.glide.request.target.Target
    public void onLoadCleared(Drawable drawable) {
        SizeDeterminer sizeDeterminer = this.sizeDeterminer;
        ViewTreeObserver viewTreeObserver = sizeDeterminer.view.getViewTreeObserver();
        if (viewTreeObserver.isAlive()) {
            viewTreeObserver.removeOnPreDrawListener(sizeDeterminer.layoutListener);
        }
        sizeDeterminer.layoutListener = null;
        sizeDeterminer.cbs.clear();
    }

    @Override // com.bumptech.glide.request.target.Target
    public final void removeCallback(SizeReadyCallback sizeReadyCallback) {
        this.sizeDeterminer.cbs.remove(sizeReadyCallback);
    }

    @Override // com.bumptech.glide.request.target.BaseTarget, com.bumptech.glide.request.target.Target
    public final void setRequest(Request request) {
        this.view.setTag(R.id.glide_custom_view_target_tag, request);
    }

    public final String toString() {
        StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Target for: ");
        m.append(this.view);
        return m.toString();
    }

    public ViewTarget(T t) {
        ContainerHelpers.checkNotNull(t);
        this.view = t;
        this.sizeDeterminer = new SizeDeterminer(t);
    }
}
