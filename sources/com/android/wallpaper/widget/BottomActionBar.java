package com.android.wallpaper.widget;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.drawable.GradientDrawable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ProgressBar;
import androidx.appcompat.R$bool;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import com.android.internal.util.ArrayUtils;
import com.android.systemui.shared.R;
import com.android.wallpaper.widget.BottomActionBar;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import java.util.ArrayDeque;
import java.util.Arrays;
import java.util.EnumMap;
import java.util.HashSet;
import java.util.Set;
import java.util.function.Consumer;
/* loaded from: classes.dex */
public class BottomActionBar extends FrameLayout {
    public static final /* synthetic */ int $r8$clinit = 0;
    public AccessibilityCallback mAccessibilityCallback;
    public final EnumMap mActionMap;
    public final QueueStateBottomSheetBehavior<ViewGroup> mBottomSheetBehavior;
    public final ViewGroup mBottomSheetView;
    public BottomAction mLastSelectedAction;
    public BottomAction mSelectedAction;
    public final EnumMap mContentViewMap = new EnumMap(BottomAction.class);
    public final EnumMap mActionSelectedListeners = new EnumMap(BottomAction.class);
    public final HashSet mVisibilityChangeListeners = new HashSet();

    /* loaded from: classes.dex */
    public interface AccessibilityCallback {
        void onBottomSheetCollapsed();

        void onBottomSheetExpanded();
    }

    /* loaded from: classes.dex */
    public enum BottomAction {
        ROTATION(0, 0),
        DELETE(0, 0),
        INFORMATION(R.string.accessibility_info_shown, R.string.accessibility_info_hidden),
        EDIT(0, 0),
        CUSTOMIZE(R.string.accessibility_customize_shown, R.string.accessibility_customize_hidden),
        EFFECTS(0, 0),
        DOWNLOAD(0, 0),
        PROGRESS(0, 0),
        APPLY(0, 0),
        APPLY_TEXT(0, 0);
        
        private final int mHiddenAccessibilityResId;
        private final int mShownAccessibilityResId;

        BottomAction() {
            throw null;
        }

        BottomAction(int i, int i2) {
            this.mShownAccessibilityResId = i;
            this.mHiddenAccessibilityResId = i2;
        }

        public final int getAccessibilityStringRes(boolean z) {
            if (z) {
                return this.mShownAccessibilityResId;
            }
            return this.mHiddenAccessibilityResId;
        }
    }

    /* loaded from: classes.dex */
    public interface BottomActionBarHost {
        BottomActionBar getBottomActionBar();
    }

    /* loaded from: classes.dex */
    public interface OnActionSelectedListener {
        void onActionSelected();
    }

    /* loaded from: classes.dex */
    public static class QueueStateBottomSheetBehavior<V extends View> extends BottomSheetBehavior<V> {
        public boolean mIsQueueProcessing;
        public final ArrayDeque mStateQueue = new ArrayDeque();

        /* renamed from: com.android.wallpaper.widget.BottomActionBar$QueueStateBottomSheetBehavior$1  reason: invalid class name */
        /* loaded from: classes.dex */
        public final class AnonymousClass1 extends BottomSheetBehavior.BottomSheetCallback {
            public final /* synthetic */ BottomSheetBehavior.BottomSheetCallback val$callback;

            public AnonymousClass1(AnonymousClass1 r2) {
                this.val$callback = r2;
            }

            @Override // com.google.android.material.bottomsheet.BottomSheetBehavior.BottomSheetCallback
            public final void onSlide(View view, float f) {
                BottomSheetBehavior.BottomSheetCallback bottomSheetCallback = this.val$callback;
                if (bottomSheetCallback != null) {
                    bottomSheetCallback.onSlide(view, f);
                }
            }

            @Override // com.google.android.material.bottomsheet.BottomSheetBehavior.BottomSheetCallback
            public final void onStateChanged(View view, int i) {
                if (!QueueStateBottomSheetBehavior.this.mStateQueue.isEmpty()) {
                    if (i == ((Integer) QueueStateBottomSheetBehavior.this.mStateQueue.getFirst()).intValue()) {
                        QueueStateBottomSheetBehavior.this.mStateQueue.removeFirst();
                        if (QueueStateBottomSheetBehavior.this.mStateQueue.isEmpty()) {
                            QueueStateBottomSheetBehavior.this.mIsQueueProcessing = false;
                        } else {
                            QueueStateBottomSheetBehavior queueStateBottomSheetBehavior = QueueStateBottomSheetBehavior.this;
                            queueStateBottomSheetBehavior.setState(((Integer) queueStateBottomSheetBehavior.mStateQueue.getFirst()).intValue());
                        }
                    } else {
                        QueueStateBottomSheetBehavior queueStateBottomSheetBehavior2 = QueueStateBottomSheetBehavior.this;
                        queueStateBottomSheetBehavior2.setState(((Integer) queueStateBottomSheetBehavior2.mStateQueue.getFirst()).intValue());
                    }
                }
                BottomSheetBehavior.BottomSheetCallback bottomSheetCallback = this.val$callback;
                if (bottomSheetCallback != null) {
                    bottomSheetCallback.onStateChanged(view, i);
                }
            }
        }

        public final void enqueue(int i) {
            if (this.mStateQueue.isEmpty() || ((Integer) this.mStateQueue.getLast()).intValue() != i) {
                this.mStateQueue.add(Integer.valueOf(i));
            }
        }

        public QueueStateBottomSheetBehavior(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            AnonymousClass1 r2 = new AnonymousClass1(null);
            Log.w("BottomSheetBehavior", "BottomSheetBehavior now supports multiple callbacks. `setBottomSheetCallback()` removes all existing callbacks, including ones set internally by library authors, which may result in unintended behavior. This may change in the future. Please use `addBottomSheetCallback()` and `removeBottomSheetCallback()` instead to set your own callbacks.");
            this.callbacks.clear();
            this.callbacks.add(r2);
        }
    }

    /* loaded from: classes.dex */
    public interface VisibilityChangeListener {
        void onVisibilityChange();
    }

    public final void disableActions(BottomAction... bottomActionArr) {
        for (BottomAction bottomAction : bottomActionArr) {
            ((View) this.mActionMap.get(bottomAction)).setEnabled(false);
        }
    }

    public final void enableActionButtonsWithBottomSheet(boolean z) {
        if (z) {
            for (BottomAction bottomAction : (BottomAction[]) this.mContentViewMap.keySet().toArray(new BottomAction[0])) {
                ((View) this.mActionMap.get(bottomAction)).setEnabled(true);
            }
            return;
        }
        disableActions((BottomAction[]) this.mContentViewMap.keySet().toArray(new BottomAction[0]));
    }

    public final CharSequence getAccessibilityText(BottomAction bottomAction, boolean z) {
        int accessibilityStringRes;
        if (bottomAction == null || (accessibilityStringRes = bottomAction.getAccessibilityStringRes(z)) == 0) {
            return null;
        }
        return ((FrameLayout) this).mContext.getText(accessibilityStringRes);
    }

    public final void hideActions(BottomAction... bottomActionArr) {
        for (BottomAction bottomAction : bottomActionArr) {
            ((View) this.mActionMap.get(bottomAction)).setVisibility(8);
            if (isExpandable(bottomAction) && this.mSelectedAction == bottomAction) {
                hideBottomSheetAndDeselectButtonIfExpanded();
            }
        }
    }

    public final void showActions(BottomAction... bottomActionArr) {
        for (BottomAction bottomAction : bottomActionArr) {
            ((View) this.mActionMap.get(bottomAction)).setVisibility(0);
        }
    }

    /* loaded from: classes.dex */
    public static abstract class BottomSheetContent<T extends View> {
        public T mContentView;
        public boolean mIsVisible = false;

        public abstract int getViewId();

        public void onRecreateView() {
        }

        public abstract void onViewCreated(T t);

        public BottomSheetContent(Context context) {
            T t = (T) LayoutInflater.from(context).inflate(getViewId(), (ViewGroup) null);
            onViewCreated(t);
            t.setFocusable(true);
            this.mContentView = t;
            t.setVisibility(8);
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Type inference failed for: r11v8, types: [com.android.wallpaper.widget.BottomActionBar$1] */
    public BottomActionBar(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        BottomAction bottomAction = BottomAction.CUSTOMIZE;
        BottomAction bottomAction2 = BottomAction.INFORMATION;
        EnumMap enumMap = new EnumMap(BottomAction.class);
        this.mActionMap = enumMap;
        LayoutInflater.from(context).inflate(R.layout.bottom_actions_layout, (ViewGroup) this, true);
        enumMap.put((EnumMap) BottomAction.ROTATION, (BottomAction) findViewById(R.id.action_rotation));
        enumMap.put((EnumMap) BottomAction.DELETE, (BottomAction) findViewById(R.id.action_delete));
        enumMap.put((EnumMap) bottomAction2, (BottomAction) findViewById(R.id.action_information));
        enumMap.put((EnumMap) BottomAction.EDIT, (BottomAction) findViewById(R.id.action_edit));
        enumMap.put((EnumMap) bottomAction, (BottomAction) findViewById(R.id.action_customize));
        enumMap.put((EnumMap) BottomAction.EFFECTS, (BottomAction) findViewById(R.id.action_effects));
        enumMap.put((EnumMap) BottomAction.DOWNLOAD, (BottomAction) findViewById(R.id.action_download));
        enumMap.put((EnumMap) BottomAction.PROGRESS, (BottomAction) findViewById(R.id.action_progress));
        enumMap.put((EnumMap) BottomAction.APPLY, (BottomAction) findViewById(R.id.action_apply));
        enumMap.put((EnumMap) BottomAction.APPLY_TEXT, (BottomAction) findViewById(R.id.action_apply_text_button));
        ViewGroup viewGroup = (ViewGroup) findViewById(R.id.action_bottom_sheet);
        this.mBottomSheetView = viewGroup;
        GradientDrawable gradientDrawable = (GradientDrawable) viewGroup.getBackground();
        try {
            float[] cornerRadii = gradientDrawable.getCornerRadii();
            if (cornerRadii != null) {
                for (int i = 0; i < cornerRadii.length; i++) {
                    cornerRadii[i] = cornerRadii[i] * 2.0f;
                }
                GradientDrawable gradientDrawable2 = (GradientDrawable) gradientDrawable.mutate();
                gradientDrawable2.setCornerRadii(cornerRadii);
                viewGroup.setBackground(gradientDrawable2);
            }
        } catch (NullPointerException unused) {
        }
        setColor(context);
        ViewGroup.LayoutParams layoutParams = this.mBottomSheetView.getLayoutParams();
        if (layoutParams instanceof CoordinatorLayout.LayoutParams) {
            CoordinatorLayout.Behavior behavior = ((CoordinatorLayout.LayoutParams) layoutParams).mBehavior;
            if (behavior instanceof BottomSheetBehavior) {
                QueueStateBottomSheetBehavior<ViewGroup> queueStateBottomSheetBehavior = (QueueStateBottomSheetBehavior) ((BottomSheetBehavior) behavior);
                this.mBottomSheetBehavior = queueStateBottomSheetBehavior;
                queueStateBottomSheetBehavior.setState(4);
                QueueStateBottomSheetBehavior.AnonymousClass1 r2 = new QueueStateBottomSheetBehavior.AnonymousClass1(new BottomSheetBehavior.BottomSheetCallback() { // from class: com.android.wallpaper.widget.BottomActionBar.1
                    @Override // com.google.android.material.bottomsheet.BottomSheetBehavior.BottomSheetCallback
                    public final void onSlide(View view, float f) {
                    }

                    @Override // com.google.android.material.bottomsheet.BottomSheetBehavior.BottomSheetCallback
                    public final void onStateChanged(View view, int i2) {
                        BottomActionBar bottomActionBar = BottomActionBar.this;
                        if (bottomActionBar.mBottomSheetBehavior.mIsQueueProcessing) {
                            bottomActionBar.disableActions(BottomAction.values());
                            BottomActionBar bottomActionBar2 = BottomActionBar.this;
                            BottomAction bottomAction3 = bottomActionBar2.mSelectedAction;
                            if (bottomAction3 != null && i2 == 4) {
                                bottomActionBar2.mContentViewMap.forEach(new BottomActionBar$$ExternalSyntheticLambda3(bottomAction3));
                                return;
                            }
                            return;
                        }
                        if (bottomActionBar.mAccessibilityCallback != null) {
                            if (i2 == 4) {
                                CharSequence accessibilityText = bottomActionBar.getAccessibilityText(bottomActionBar.mLastSelectedAction, false);
                                if (!TextUtils.isEmpty(accessibilityText)) {
                                    bottomActionBar.setAccessibilityPaneTitle(accessibilityText);
                                }
                                bottomActionBar.mAccessibilityCallback.onBottomSheetCollapsed();
                            } else if (i2 == 3) {
                                CharSequence accessibilityText2 = bottomActionBar.getAccessibilityText(bottomActionBar.mSelectedAction, true);
                                if (!TextUtils.isEmpty(accessibilityText2)) {
                                    bottomActionBar.setAccessibilityPaneTitle(accessibilityText2);
                                }
                                bottomActionBar.mAccessibilityCallback.onBottomSheetExpanded();
                            }
                        }
                        BottomActionBar.this.enableActions();
                        BottomActionBar bottomActionBar3 = BottomActionBar.this;
                        if (bottomActionBar3.isExpandable(bottomActionBar3.mSelectedAction)) {
                            if (i2 == 4) {
                                BottomActionBar bottomActionBar4 = BottomActionBar.this;
                                bottomActionBar4.updateSelectedState(bottomActionBar4.mSelectedAction, false);
                            } else if (i2 == 3) {
                                BottomActionBar bottomActionBar5 = BottomActionBar.this;
                                bottomActionBar5.updateSelectedState(bottomActionBar5.mSelectedAction, true);
                            }
                        }
                    }
                });
                Log.w("BottomSheetBehavior", "BottomSheetBehavior now supports multiple callbacks. `setBottomSheetCallback()` removes all existing callbacks, including ones set internally by library authors, which may result in unintended behavior. This may change in the future. Please use `addBottomSheetCallback()` and `removeBottomSheetCallback()` instead to set your own callbacks.");
                queueStateBottomSheetBehavior.callbacks.clear();
                queueStateBottomSheetBehavior.callbacks.add(r2);
                setOnApplyWindowInsetsListener(BottomActionBar$$ExternalSyntheticLambda0.INSTANCE);
                BottomAction[] bottomActionArr = {bottomAction2, bottomAction};
                final int[] iArr = {1, 4};
                for (int i2 = 0; i2 < 2; i2++) {
                    ((View) this.mActionMap.get(bottomActionArr[i2])).setAccessibilityDelegate(new View.AccessibilityDelegate() { // from class: com.android.wallpaper.widget.BottomActionBar.2
                        @Override // android.view.View.AccessibilityDelegate
                        public final void sendAccessibilityEvent(View view, int i3) {
                            if (!ArrayUtils.contains(iArr, i3)) {
                                super.sendAccessibilityEvent(view, i3);
                            }
                        }
                    });
                }
                return;
            }
            throw new IllegalArgumentException("The view is not associated with BottomSheetBehavior");
        }
        throw new IllegalArgumentException("The view is not a child of CoordinatorLayout");
    }

    public final void bindBottomSheetContentWithAction(BottomSheetContent<?> bottomSheetContent, final BottomAction bottomAction) {
        this.mContentViewMap.put((EnumMap) bottomAction, (BottomAction) bottomSheetContent);
        this.mBottomSheetView.addView(bottomSheetContent.mContentView);
        setActionClickListener(bottomAction, new View.OnClickListener() { // from class: com.android.wallpaper.widget.BottomActionBar$$ExternalSyntheticLambda1
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                BottomActionBar bottomActionBar = BottomActionBar.this;
                BottomActionBar.BottomAction bottomAction2 = bottomAction;
                if (bottomActionBar.mBottomSheetBehavior.state == 4) {
                    bottomActionBar.mContentViewMap.forEach(new BottomActionBar$$ExternalSyntheticLambda3(bottomAction2));
                }
                bottomActionBar.mBottomSheetView.setAccessibilityTraversalAfter(view.getId());
            }
        });
    }

    public final void hideBottomSheetAndDeselectButtonIfExpanded() {
        if (isExpandable(this.mSelectedAction)) {
            QueueStateBottomSheetBehavior<ViewGroup> queueStateBottomSheetBehavior = this.mBottomSheetBehavior;
            if (queueStateBottomSheetBehavior.state == 3) {
                queueStateBottomSheetBehavior.setState(4);
                updateSelectedState(this.mSelectedAction, false);
                this.mSelectedAction = null;
            }
        }
    }

    public final boolean isExpandable(BottomAction bottomAction) {
        if (bottomAction == null || !this.mContentViewMap.containsKey(bottomAction)) {
            return false;
        }
        return true;
    }

    public final void setActionClickListener(final BottomAction bottomAction, final View.OnClickListener onClickListener) {
        View view = (View) this.mActionMap.get(bottomAction);
        if (!view.hasOnClickListeners()) {
            view.setOnClickListener(new View.OnClickListener() { // from class: com.android.wallpaper.widget.BottomActionBar$$ExternalSyntheticLambda2
                @Override // android.view.View.OnClickListener
                public final void onClick(View view2) {
                    BottomActionBar bottomActionBar = BottomActionBar.this;
                    BottomActionBar.BottomAction bottomAction2 = bottomAction;
                    View.OnClickListener onClickListener2 = onClickListener;
                    BottomActionBar.BottomAction bottomAction3 = bottomActionBar.mSelectedAction;
                    if (bottomAction3 == null || !((View) bottomActionBar.mActionMap.get(bottomAction3)).isSelected()) {
                        bottomActionBar.mSelectedAction = null;
                    } else {
                        bottomActionBar.updateSelectedState(bottomActionBar.mSelectedAction, false);
                        if (bottomActionBar.isExpandable(bottomActionBar.mSelectedAction)) {
                            bottomActionBar.mBottomSheetBehavior.enqueue(4);
                        }
                    }
                    if (bottomAction2 == bottomActionBar.mSelectedAction) {
                        bottomActionBar.mSelectedAction = null;
                    } else {
                        bottomActionBar.mSelectedAction = bottomAction2;
                        bottomActionBar.mLastSelectedAction = bottomAction2;
                        bottomActionBar.updateSelectedState(bottomAction2, true);
                        if (bottomActionBar.isExpandable(bottomActionBar.mSelectedAction)) {
                            bottomActionBar.mBottomSheetBehavior.enqueue(3);
                        }
                    }
                    onClickListener2.onClick(view2);
                    BottomActionBar.QueueStateBottomSheetBehavior<ViewGroup> queueStateBottomSheetBehavior = bottomActionBar.mBottomSheetBehavior;
                    if (!queueStateBottomSheetBehavior.mStateQueue.isEmpty()) {
                        queueStateBottomSheetBehavior.setState(((Integer) queueStateBottomSheetBehavior.mStateQueue.getFirst()).intValue());
                        queueStateBottomSheetBehavior.mIsQueueProcessing = true;
                    }
                }
            });
            return;
        }
        throw new IllegalStateException("Had already set a click listener to button: " + bottomAction);
    }

    public final void setColor(final Context context) {
        this.mBottomSheetView.setBackground(context.getDrawable(R.drawable.bottom_sheet_background));
        if (this.mBottomSheetView.getChildCount() > 0) {
            this.mBottomSheetView.removeAllViews();
            this.mContentViewMap.values().forEach(new Consumer() { // from class: com.android.wallpaper.widget.BottomActionBar$$ExternalSyntheticLambda5
                /* JADX WARN: Type inference failed for: r3v3, types: [T extends android.view.View, android.view.View] */
                @Override // java.util.function.Consumer
                public final void accept(Object obj) {
                    int i;
                    BottomActionBar bottomActionBar = BottomActionBar.this;
                    Context context2 = context;
                    BottomActionBar.BottomSheetContent bottomSheetContent = (BottomActionBar.BottomSheetContent) obj;
                    int i2 = BottomActionBar.$r8$clinit;
                    bottomActionBar.getClass();
                    T t = bottomSheetContent.mContentView;
                    bottomSheetContent.onRecreateView();
                    ?? inflate = LayoutInflater.from(context2).inflate(bottomSheetContent.getViewId(), (ViewGroup) null);
                    bottomSheetContent.onViewCreated(inflate);
                    inflate.setFocusable(true);
                    bottomSheetContent.mContentView = inflate;
                    boolean z = bottomSheetContent.mIsVisible;
                    bottomSheetContent.mIsVisible = z;
                    if (z) {
                        i = 0;
                    } else {
                        i = 8;
                    }
                    inflate.setVisibility(i);
                    bottomActionBar.mBottomSheetView.addView(bottomSheetContent.mContentView);
                }
            });
        }
        ViewGroup viewGroup = (ViewGroup) findViewById(R.id.action_tabs);
        viewGroup.setBackgroundColor(R$bool.getColorAttr(context, 16842801));
        ColorStateList colorStateList = context.getColorStateList(R.color.bottom_action_button_color_tint);
        for (int i = 0; i < viewGroup.getChildCount(); i++) {
            View childAt = viewGroup.getChildAt(i);
            if (childAt instanceof ImageView) {
                childAt.setBackground(context.getDrawable(R.drawable.bottom_action_button_background));
                ((ImageView) childAt).setImageTintList(colorStateList);
            } else if (childAt instanceof ProgressBar) {
                ((ProgressBar) childAt).setIndeterminateTintList(colorStateList);
            }
        }
    }

    public final void showActionsOnly(BottomAction... bottomActionArr) {
        final HashSet hashSet = new HashSet(Arrays.asList(bottomActionArr));
        this.mActionMap.keySet().forEach(new Consumer() { // from class: com.android.wallpaper.widget.BottomActionBar$$ExternalSyntheticLambda6
            @Override // java.util.function.Consumer
            public final void accept(Object obj) {
                BottomActionBar bottomActionBar = BottomActionBar.this;
                Set set = hashSet;
                BottomActionBar.BottomAction bottomAction = (BottomActionBar.BottomAction) obj;
                int i = BottomActionBar.$r8$clinit;
                bottomActionBar.getClass();
                if (set.contains(bottomAction)) {
                    bottomActionBar.showActions(bottomAction);
                } else {
                    bottomActionBar.hideActions(bottomAction);
                }
            }
        });
    }

    public final void updateSelectedState(BottomAction bottomAction, boolean z) {
        View view = (View) this.mActionMap.get(bottomAction);
        if (view.isSelected() != z) {
            OnActionSelectedListener onActionSelectedListener = (OnActionSelectedListener) this.mActionSelectedListeners.get(bottomAction);
            if (onActionSelectedListener != null) {
                onActionSelectedListener.onActionSelected();
            }
            view.setSelected(z);
        }
    }

    public final void deselectAction(BottomAction bottomAction) {
        if (isExpandable(bottomAction)) {
            this.mBottomSheetBehavior.setState(4);
        }
        updateSelectedState(bottomAction, false);
        if (bottomAction == this.mSelectedAction) {
            this.mSelectedAction = null;
        }
    }

    public final void enableActions() {
        for (BottomAction bottomAction : BottomAction.values()) {
            ((View) this.mActionMap.get(bottomAction)).setEnabled(true);
        }
    }

    @Override // android.view.View
    public final void onVisibilityAggregated(final boolean z) {
        super.onVisibilityAggregated(z);
        this.mVisibilityChangeListeners.forEach(new Consumer() { // from class: com.android.wallpaper.widget.BottomActionBar$$ExternalSyntheticLambda7
            @Override // java.util.function.Consumer
            public final void accept(Object obj) {
                int i = BottomActionBar.$r8$clinit;
                ((BottomActionBar.VisibilityChangeListener) obj).onVisibilityChange();
            }
        });
    }
}
