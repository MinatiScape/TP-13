package com.android.wallpaper.widget;

import android.content.Context;
import android.graphics.drawable.GradientDrawable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import androidx.transition.R$id;
import com.android.internal.util.ArrayUtils;
import com.android.systemui.shared.R;
import com.android.wallpaper.module.WallpaperSetter$$ExternalSyntheticLambda1;
import com.android.wallpaper.widget.BottomActionBar;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import java.util.ArrayDeque;
import java.util.Arrays;
import java.util.Deque;
import java.util.EnumMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.function.Consumer;
/* loaded from: classes.dex */
public class BottomActionBar extends FrameLayout {
    public static final /* synthetic */ int $r8$clinit = 0;
    public AccessibilityCallback mAccessibilityCallback;
    public final Map<BottomAction, View> mActionMap;
    public final QueueStateBottomSheetBehavior<ViewGroup> mBottomSheetBehavior;
    public final ViewGroup mBottomSheetView;
    public BottomAction mLastSelectedAction;
    public BottomAction mSelectedAction;
    public final Map<BottomAction, BottomSheetContent<?>> mContentViewMap = new EnumMap(BottomAction.class);
    public final Map<BottomAction, OnActionSelectedListener> mActionSelectedListeners = new EnumMap(BottomAction.class);
    public final Set<VisibilityChangeListener> mVisibilityChangeListeners = new HashSet();

    /* loaded from: classes.dex */
    public interface AccessibilityCallback {
        void onBottomSheetCollapsed();

        void onBottomSheetExpanded();
    }

    /* loaded from: classes.dex */
    public interface BottomActionBarHost {
        BottomActionBar getBottomActionBar();
    }

    /* loaded from: classes.dex */
    public static abstract class BottomSheetContent<T extends View> {
        public T mContentView;
        public boolean mIsVisible;

        public BottomSheetContent(Context context) {
            this.mContentView = createView(context);
            setVisibility(false);
        }

        public final T createView(Context context) {
            T t = (T) LayoutInflater.from(context).inflate(getViewId(), (ViewGroup) null);
            onViewCreated(t);
            t.setFocusable(true);
            return t;
        }

        public abstract int getViewId();

        public void onRecreateView(T t) {
        }

        public abstract void onViewCreated(T t);

        public final void setVisibility(boolean z) {
            this.mIsVisible = z;
            this.mContentView.setVisibility(z ? 0 : 8);
        }
    }

    /* loaded from: classes.dex */
    public interface OnActionSelectedListener {
        void onActionSelected(boolean z);
    }

    /* loaded from: classes.dex */
    public static class QueueStateBottomSheetBehavior<V extends View> extends BottomSheetBehavior<V> {
        public boolean mIsQueueProcessing;
        public final Deque<Integer> mStateQueue = new ArrayDeque();

        public QueueStateBottomSheetBehavior(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            setBottomSheetCallback(null);
        }

        public void enqueue(int i) {
            if (this.mStateQueue.isEmpty() || this.mStateQueue.getLast().intValue() != i) {
                this.mStateQueue.add(Integer.valueOf(i));
            }
        }

        @Override // com.google.android.material.bottomsheet.BottomSheetBehavior
        public void setBottomSheetCallback(final BottomSheetBehavior.BottomSheetCallback bottomSheetCallback) {
            super.setBottomSheetCallback(new BottomSheetBehavior.BottomSheetCallback() { // from class: com.android.wallpaper.widget.BottomActionBar.QueueStateBottomSheetBehavior.1
                @Override // com.google.android.material.bottomsheet.BottomSheetBehavior.BottomSheetCallback
                public void onSlide(View view, float f) {
                    BottomSheetBehavior.BottomSheetCallback bottomSheetCallback2 = bottomSheetCallback;
                    if (bottomSheetCallback2 != null) {
                        bottomSheetCallback2.onSlide(view, f);
                    }
                }

                @Override // com.google.android.material.bottomsheet.BottomSheetBehavior.BottomSheetCallback
                public void onStateChanged(View view, int i) {
                    if (!QueueStateBottomSheetBehavior.this.mStateQueue.isEmpty()) {
                        if (i == QueueStateBottomSheetBehavior.this.mStateQueue.getFirst().intValue()) {
                            QueueStateBottomSheetBehavior.this.mStateQueue.removeFirst();
                            if (QueueStateBottomSheetBehavior.this.mStateQueue.isEmpty()) {
                                QueueStateBottomSheetBehavior.this.mIsQueueProcessing = false;
                            } else {
                                QueueStateBottomSheetBehavior queueStateBottomSheetBehavior = QueueStateBottomSheetBehavior.this;
                                queueStateBottomSheetBehavior.setState(queueStateBottomSheetBehavior.mStateQueue.getFirst().intValue());
                            }
                        } else {
                            QueueStateBottomSheetBehavior queueStateBottomSheetBehavior2 = QueueStateBottomSheetBehavior.this;
                            queueStateBottomSheetBehavior2.setState(queueStateBottomSheetBehavior2.mStateQueue.getFirst().intValue());
                        }
                    }
                    BottomSheetBehavior.BottomSheetCallback bottomSheetCallback2 = bottomSheetCallback;
                    if (bottomSheetCallback2 != null) {
                        bottomSheetCallback2.onStateChanged(view, i);
                    }
                }
            });
        }
    }

    /* loaded from: classes.dex */
    public interface VisibilityChangeListener {
        void onVisibilityChange(boolean z);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
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
        QueueStateBottomSheetBehavior<ViewGroup> queueStateBottomSheetBehavior = (QueueStateBottomSheetBehavior) BottomSheetBehavior.from(this.mBottomSheetView);
        this.mBottomSheetBehavior = queueStateBottomSheetBehavior;
        queueStateBottomSheetBehavior.setState(4);
        queueStateBottomSheetBehavior.setBottomSheetCallback(new BottomSheetBehavior.BottomSheetCallback() { // from class: com.android.wallpaper.widget.BottomActionBar.1
            @Override // com.google.android.material.bottomsheet.BottomSheetBehavior.BottomSheetCallback
            public void onSlide(View view, float f) {
            }

            @Override // com.google.android.material.bottomsheet.BottomSheetBehavior.BottomSheetCallback
            public void onStateChanged(View view, int i2) {
                BottomActionBar bottomActionBar = BottomActionBar.this;
                if (bottomActionBar.mBottomSheetBehavior.mIsQueueProcessing) {
                    bottomActionBar.disableActions();
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
        setOnApplyWindowInsetsListener(BottomActionBar$$ExternalSyntheticLambda0.INSTANCE);
        BottomAction[] bottomActionArr = {bottomAction2, bottomAction};
        final int[] iArr = {1, 4};
        for (int i2 = 0; i2 < 2; i2++) {
            this.mActionMap.get(bottomActionArr[i2]).setAccessibilityDelegate(new View.AccessibilityDelegate(this) { // from class: com.android.wallpaper.widget.BottomActionBar.2
                @Override // android.view.View.AccessibilityDelegate
                public void sendAccessibilityEvent(View view, int i3) {
                    if (!ArrayUtils.contains(iArr, i3)) {
                        super.sendAccessibilityEvent(view, i3);
                    }
                }
            });
        }
    }

    public void bindBottomSheetContentWithAction(BottomSheetContent<?> bottomSheetContent, BottomAction bottomAction) {
        this.mContentViewMap.put(bottomAction, bottomSheetContent);
        this.mBottomSheetView.addView(bottomSheetContent.mContentView);
        setActionClickListener(bottomAction, new BottomActionBar$$ExternalSyntheticLambda1(this, bottomAction));
    }

    public void deselectAction(BottomAction bottomAction) {
        if (isExpandable(bottomAction)) {
            this.mBottomSheetBehavior.setState(4);
        }
        updateSelectedState(bottomAction, false);
        if (bottomAction == this.mSelectedAction) {
            this.mSelectedAction = null;
        }
    }

    public void disableActions() {
        disableActions(BottomAction.values());
    }

    public void enableActionButtonsWithBottomSheet(boolean z) {
        if (z) {
            enableActions((BottomAction[]) this.mContentViewMap.keySet().toArray(new BottomAction[0]));
        } else {
            disableActions((BottomAction[]) this.mContentViewMap.keySet().toArray(new BottomAction[0]));
        }
    }

    public void enableActions() {
        enableActions(BottomAction.values());
    }

    public final CharSequence getAccessibilityText(BottomAction bottomAction, boolean z) {
        int accessibilityStringRes;
        if (bottomAction == null || (accessibilityStringRes = bottomAction.getAccessibilityStringRes(z)) == 0) {
            return null;
        }
        return ((FrameLayout) this).mContext.getText(accessibilityStringRes);
    }

    public void hideActions(BottomAction... bottomActionArr) {
        for (BottomAction bottomAction : bottomActionArr) {
            this.mActionMap.get(bottomAction).setVisibility(8);
            if (isExpandable(bottomAction) && this.mSelectedAction == bottomAction) {
                hideBottomSheetAndDeselectButtonIfExpanded();
            }
        }
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
        return bottomAction != null && this.mContentViewMap.containsKey(bottomAction);
    }

    @Override // android.view.View
    public void onVisibilityAggregated(final boolean z) {
        super.onVisibilityAggregated(z);
        this.mVisibilityChangeListeners.forEach(new Consumer() { // from class: com.android.wallpaper.widget.BottomActionBar$$ExternalSyntheticLambda6
            @Override // java.util.function.Consumer
            public final void accept(Object obj) {
                boolean z2 = z;
                int i = BottomActionBar.$r8$clinit;
                ((BottomActionBar.VisibilityChangeListener) obj).onVisibilityChange(z2);
            }
        });
    }

    public void setActionClickListener(final BottomAction bottomAction, final View.OnClickListener onClickListener) {
        View view = this.mActionMap.get(bottomAction);
        if (!view.hasOnClickListeners()) {
            view.setOnClickListener(new View.OnClickListener() { // from class: com.android.wallpaper.widget.BottomActionBar$$ExternalSyntheticLambda2
                @Override // android.view.View.OnClickListener
                public final void onClick(View view2) {
                    BottomActionBar bottomActionBar = BottomActionBar.this;
                    BottomActionBar.BottomAction bottomAction2 = bottomAction;
                    View.OnClickListener onClickListener2 = onClickListener;
                    BottomActionBar.BottomAction bottomAction3 = bottomActionBar.mSelectedAction;
                    if (bottomAction3 == null || !bottomActionBar.mActionMap.get(bottomAction3).isSelected()) {
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
                        queueStateBottomSheetBehavior.setState(queueStateBottomSheetBehavior.mStateQueue.getFirst().intValue());
                        queueStateBottomSheetBehavior.mIsQueueProcessing = true;
                    }
                }
            });
            return;
        }
        throw new IllegalStateException("Had already set a click listener to button: " + bottomAction);
    }

    public void setColor(final Context context) {
        this.mBottomSheetView.setBackground(context.getDrawable(R.drawable.bottom_sheet_background));
        if (this.mBottomSheetView.getChildCount() > 0) {
            this.mBottomSheetView.removeAllViews();
            this.mContentViewMap.values().forEach(new Consumer() { // from class: com.android.wallpaper.widget.BottomActionBar$$ExternalSyntheticLambda5
                /* JADX WARN: Type inference failed for: r2v2, types: [T extends android.view.View, android.view.View] */
                @Override // java.util.function.Consumer
                public final void accept(Object obj) {
                    BottomActionBar bottomActionBar = BottomActionBar.this;
                    Context context2 = context;
                    BottomActionBar.BottomSheetContent bottomSheetContent = (BottomActionBar.BottomSheetContent) obj;
                    int i = BottomActionBar.$r8$clinit;
                    Objects.requireNonNull(bottomActionBar);
                    bottomSheetContent.onRecreateView(bottomSheetContent.mContentView);
                    bottomSheetContent.mContentView = bottomSheetContent.createView(context2);
                    bottomSheetContent.setVisibility(bottomSheetContent.mIsVisible);
                    bottomActionBar.mBottomSheetView.addView(bottomSheetContent.mContentView);
                }
            });
        }
        ViewGroup viewGroup = (ViewGroup) findViewById(R.id.action_tabs);
        viewGroup.setBackgroundColor(R$id.getColorAttr(context, 16842801));
        for (int i = 0; i < viewGroup.getChildCount(); i++) {
            View childAt = viewGroup.getChildAt(i);
            if (childAt instanceof ImageView) {
                childAt.setBackground(context.getDrawable(R.drawable.bottom_action_button_background));
                ((ImageView) childAt).setImageTintList(context.getColorStateList(R.color.bottom_action_button_color_tint));
            }
        }
    }

    public void showActions(BottomAction... bottomActionArr) {
        for (BottomAction bottomAction : bottomActionArr) {
            this.mActionMap.get(bottomAction).setVisibility(0);
        }
    }

    public void showActionsOnly(BottomAction... bottomActionArr) {
        this.mActionMap.keySet().forEach(new WallpaperSetter$$ExternalSyntheticLambda1(this, new HashSet(Arrays.asList(bottomActionArr))));
    }

    public final void updateSelectedState(BottomAction bottomAction, boolean z) {
        View view = this.mActionMap.get(bottomAction);
        if (view.isSelected() != z) {
            OnActionSelectedListener onActionSelectedListener = this.mActionSelectedListeners.get(bottomAction);
            if (onActionSelectedListener != null) {
                onActionSelectedListener.onActionSelected(z);
            }
            view.setSelected(z);
        }
    }

    public void disableActions(BottomAction... bottomActionArr) {
        for (BottomAction bottomAction : bottomActionArr) {
            this.mActionMap.get(bottomAction).setEnabled(false);
        }
    }

    public void enableActions(BottomAction... bottomActionArr) {
        for (BottomAction bottomAction : bottomActionArr) {
            this.mActionMap.get(bottomAction).setEnabled(true);
        }
    }

    /* loaded from: classes.dex */
    public enum BottomAction {
        ROTATION,
        DELETE,
        INFORMATION(R.string.accessibility_info_shown, R.string.accessibility_info_hidden),
        EDIT,
        CUSTOMIZE(R.string.accessibility_customize_shown, R.string.accessibility_customize_hidden),
        DOWNLOAD,
        PROGRESS,
        APPLY,
        APPLY_TEXT;
        
        private final int mHiddenAccessibilityResId;
        private final int mShownAccessibilityResId;

        BottomAction() {
            this.mShownAccessibilityResId = 0;
            this.mHiddenAccessibilityResId = 0;
        }

        public int getAccessibilityStringRes(boolean z) {
            return z ? this.mShownAccessibilityResId : this.mHiddenAccessibilityResId;
        }

        BottomAction(int i, int i2) {
            this.mShownAccessibilityResId = i;
            this.mHiddenAccessibilityResId = i2;
        }
    }
}
