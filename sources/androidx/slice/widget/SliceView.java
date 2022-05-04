package androidx.slice.widget;

import android.app.PendingIntent;
import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.os.Handler;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityManager;
import androidx.lifecycle.Observer;
import androidx.slice.ArrayUtils;
import androidx.slice.Slice;
import androidx.slice.SliceItem;
import androidx.slice.SliceMetadata;
import androidx.slice.core.SliceAction;
import androidx.slice.core.SliceActionImpl;
import androidx.slice.core.SliceQuery;
import com.android.systemui.shared.R;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
/* loaded from: classes.dex */
public class SliceView extends ViewGroup implements Observer<Slice>, View.OnClickListener {
    public static final Comparator<SliceAction> SLICE_ACTION_PRIORITY_COMPARATOR = new Comparator<SliceAction>() { // from class: androidx.slice.widget.SliceView.3
        @Override // java.util.Comparator
        public int compare(SliceAction action1, SliceAction action2) {
            int priority = action1.getPriority();
            int priority2 = action2.getPriority();
            if (priority < 0 && priority2 < 0) {
                return 0;
            }
            if (priority >= 0) {
                if (priority2 >= 0) {
                    if (priority2 >= priority) {
                        if (priority2 <= priority) {
                            return 0;
                        }
                    }
                }
                return -1;
            }
            return 1;
        }
    };
    public ActionRow mActionRow;
    public int mActionRowHeight;
    public List<SliceAction> mActions;
    public Slice mCurrentSlice;
    public boolean mCurrentSliceLoggedVisible;
    public SliceMetrics mCurrentSliceMetrics;
    public SliceChildView mCurrentView;
    public int mDownX;
    public int mDownY;
    public Handler mHandler;
    public boolean mInLongpress;
    public int mLargeHeight;
    public ListContent mListContent;
    public View.OnLongClickListener mLongClickListener;
    public Runnable mLongpressCheck;
    public int mMinTemplateHeight;
    public View.OnClickListener mOnClickListener;
    public boolean mPressing;
    public Runnable mRefreshLastUpdated;
    public int mShortcutSize;
    public boolean mShowActionDividers;
    public boolean mShowHeaderDivider;
    public boolean mShowLastUpdated;
    public boolean mShowTitleItems;
    public SliceMetadata mSliceMetadata;
    public SliceStyle mSliceStyle;
    public int mThemeTintColor;
    public int mTouchSlopSquared;
    public SliceViewPolicy mViewPolicy;

    /* loaded from: classes.dex */
    public interface OnSliceActionListener {
        void onSliceAction(EventInfo info, SliceItem item);
    }

    public SliceView(Context context) {
        this(context, null);
    }

    public final void applyConfigurations() {
        this.mCurrentView.setSliceActionListener(null);
        SliceChildView sliceChildView = this.mCurrentView;
        SliceStyle sliceStyle = this.mSliceStyle;
        sliceChildView.setStyle(sliceStyle, sliceStyle.getRowStyle(null));
        this.mCurrentView.setTint(getTintColor());
        ListContent listContent = this.mListContent;
        if (listContent == null || listContent.getLayoutDir() == -1) {
            this.mCurrentView.setLayoutDirection(2);
        } else {
            this.mCurrentView.setLayoutDirection(this.mListContent.getLayoutDir());
        }
    }

    public final ViewGroup.LayoutParams getChildLp(View child) {
        if (!(child instanceof ShortcutView)) {
            return new ViewGroup.LayoutParams(-1, -1);
        }
        int i = this.mShortcutSize;
        return new ViewGroup.LayoutParams(i, i);
    }

    public final int getTintColor() {
        int i = this.mThemeTintColor;
        if (i != -1) {
            return i;
        }
        SliceItem findSubtype = SliceQuery.findSubtype(this.mCurrentSlice, "int", "color");
        if (findSubtype != null) {
            return findSubtype.getInt();
        }
        return SliceViewUtil.getColorAttr(getContext(), 16843829);
    }

    public final boolean handleTouchForLongpress(MotionEvent ev) {
        int actionMasked = ev.getActionMasked();
        if (actionMasked != 0) {
            if (actionMasked != 1) {
                if (actionMasked == 2) {
                    int rawX = ((int) ev.getRawX()) - this.mDownX;
                    int rawY = ((int) ev.getRawY()) - this.mDownY;
                    if ((rawY * rawY) + (rawX * rawX) > this.mTouchSlopSquared) {
                        this.mPressing = false;
                        this.mHandler.removeCallbacks(this.mLongpressCheck);
                    }
                    return this.mInLongpress;
                } else if (actionMasked != 3) {
                    return false;
                }
            }
            boolean z = this.mInLongpress;
            this.mPressing = false;
            this.mInLongpress = false;
            this.mHandler.removeCallbacks(this.mLongpressCheck);
            return z;
        }
        this.mHandler.removeCallbacks(this.mLongpressCheck);
        this.mDownX = (int) ev.getRawX();
        this.mDownY = (int) ev.getRawY();
        this.mPressing = true;
        this.mInLongpress = false;
        this.mHandler.postDelayed(this.mLongpressCheck, ViewConfiguration.getLongPressTimeout());
        return false;
    }

    public final void init(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        SliceStyle sliceStyle = new SliceStyle(context, attrs, defStyleAttr, defStyleRes);
        this.mSliceStyle = sliceStyle;
        this.mThemeTintColor = sliceStyle.mTintColor;
        this.mShortcutSize = getContext().getResources().getDimensionPixelSize(R.dimen.abc_slice_shortcut_size);
        this.mMinTemplateHeight = getContext().getResources().getDimensionPixelSize(R.dimen.abc_slice_row_min_height);
        this.mLargeHeight = getResources().getDimensionPixelSize(R.dimen.abc_slice_large_height);
        this.mActionRowHeight = getResources().getDimensionPixelSize(R.dimen.abc_slice_action_row_height);
        this.mViewPolicy = new SliceViewPolicy();
        TemplateView templateView = new TemplateView(getContext());
        this.mCurrentView = templateView;
        templateView.setPolicy(this.mViewPolicy);
        SliceChildView sliceChildView = this.mCurrentView;
        addView(sliceChildView, getChildLp(sliceChildView));
        applyConfigurations();
        ActionRow actionRow = new ActionRow(getContext());
        this.mActionRow = actionRow;
        actionRow.setBackground(new ColorDrawable(-1118482));
        ActionRow actionRow2 = this.mActionRow;
        addView(actionRow2, getChildLp(actionRow2));
        updateActions();
        int scaledTouchSlop = ViewConfiguration.get(getContext()).getScaledTouchSlop();
        this.mTouchSlopSquared = scaledTouchSlop * scaledTouchSlop;
        this.mHandler = new Handler();
        setClipToPadding(false);
        super.setOnClickListener(this);
    }

    public final void logSliceMetricsVisibilityChange(boolean visibility) {
        SliceMetrics sliceMetrics = this.mCurrentSliceMetrics;
        if (sliceMetrics != null) {
            if (visibility && !this.mCurrentSliceLoggedVisible) {
                ((SliceMetricsWrapper) sliceMetrics).mSliceMetrics.logVisible();
                this.mCurrentSliceLoggedVisible = true;
            }
            if (!visibility && this.mCurrentSliceLoggedVisible) {
                ((SliceMetricsWrapper) this.mCurrentSliceMetrics).mSliceMetrics.logHidden();
                this.mCurrentSliceLoggedVisible = false;
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (isShown()) {
            logSliceMetricsVisibilityChange(true);
            refreshLastUpdatedLabel(true);
        }
    }

    @Override // androidx.lifecycle.Observer
    public void onChanged(Slice slice) {
        RowContent rowContent;
        View view;
        Slice slice2 = slice;
        View findFocus = findFocus();
        if (findFocus != null) {
            new LocationBasedViewTracker(this, findFocus, LocationBasedViewTracker.INPUT_FOCUS);
        }
        boolean z = false;
        if (((AccessibilityManager) getContext().getSystemService("accessibility")).isTouchExplorationEnabled()) {
            ArrayList<View> arrayList = new ArrayList<>();
            addFocusables(arrayList, 2, 0);
            Iterator<View> it = arrayList.iterator();
            while (true) {
                if (!it.hasNext()) {
                    view = null;
                    break;
                }
                view = it.next();
                if (view.isAccessibilityFocused()) {
                    break;
                }
            }
            if (view != null) {
                new LocationBasedViewTracker(this, view, LocationBasedViewTracker.A11Y_FOCUS);
            }
        }
        if (slice2 == null || slice2.getUri() == null) {
            logSliceMetricsVisibilityChange(false);
            this.mCurrentSliceMetrics = null;
        } else {
            Slice slice3 = this.mCurrentSlice;
            if (slice3 == null || !slice3.getUri().equals(slice2.getUri())) {
                logSliceMetricsVisibilityChange(false);
                this.mCurrentSliceMetrics = new SliceMetricsWrapper(getContext(), slice2.getUri());
            }
        }
        boolean z2 = (slice2 == null || this.mCurrentSlice == null || !slice2.getUri().equals(this.mCurrentSlice.getUri())) ? false : true;
        SliceMetadata sliceMetadata = this.mSliceMetadata;
        this.mCurrentSlice = slice2;
        SliceMetadata sliceMetadata2 = slice2 != null ? new SliceMetadata(getContext(), this.mCurrentSlice) : null;
        this.mSliceMetadata = sliceMetadata2;
        if (!z2) {
            this.mCurrentView.resetView();
        } else if (sliceMetadata.getLoadingState() == 2 && sliceMetadata2.getLoadingState() == 0) {
            return;
        }
        SliceMetadata sliceMetadata3 = this.mSliceMetadata;
        ListContent listContent = sliceMetadata3 != null ? sliceMetadata3.mListContent : null;
        this.mListContent = listContent;
        if (this.mShowTitleItems) {
            this.mShowTitleItems = true;
            if (!(listContent == null || (rowContent = listContent.mHeaderContent) == null)) {
                rowContent.mShowTitleItems = true;
            }
        }
        if (this.mShowHeaderDivider) {
            this.mShowHeaderDivider = true;
            if (!(listContent == null || listContent.mHeaderContent == null || listContent.mRowItems.size() <= 1)) {
                listContent.mHeaderContent.mShowBottomDivider = true;
            }
        }
        if (this.mShowActionDividers) {
            this.mShowActionDividers = true;
            ListContent listContent2 = this.mListContent;
            if (listContent2 != null) {
                Iterator<SliceContent> it2 = listContent2.mRowItems.iterator();
                while (it2.hasNext()) {
                    SliceContent next = it2.next();
                    if (next instanceof RowContent) {
                        ((RowContent) next).mShowActionDivider = true;
                    }
                }
            }
        }
        ListContent listContent3 = this.mListContent;
        if (listContent3 == null || !listContent3.isValid()) {
            this.mActions = null;
            this.mCurrentView.resetView();
            updateActions();
            return;
        }
        this.mCurrentView.setLoadingActions(null);
        SliceMetadata sliceMetadata4 = this.mSliceMetadata;
        this.mActions = sliceMetadata4.mSliceActions;
        this.mCurrentView.setLastUpdated(sliceMetadata4.mLastUpdated);
        SliceChildView sliceChildView = this.mCurrentView;
        if (this.mShowLastUpdated && this.mSliceMetadata.isExpired()) {
            z = true;
        }
        sliceChildView.setShowLastUpdated(z);
        this.mCurrentView.setAllowTwoLines(ArrayUtils.contains(this.mSliceMetadata.mSlice.mHints, "permission_request"));
        this.mCurrentView.setTint(getTintColor());
        if (this.mListContent.getLayoutDir() != -1) {
            this.mCurrentView.setLayoutDirection(this.mListContent.getLayoutDir());
        } else {
            this.mCurrentView.setLayoutDirection(2);
        }
        this.mCurrentView.setSliceContent(this.mListContent);
        updateActions();
        logSliceMetricsVisibilityChange(true);
        refreshLastUpdatedLabel(true);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        ListContent listContent = this.mListContent;
        if (listContent == null || listContent.getShortcut(getContext()) == null) {
            View.OnClickListener onClickListener = this.mOnClickListener;
            if (onClickListener != null) {
                onClickListener.onClick(this);
                return;
            }
            return;
        }
        try {
            SliceActionImpl sliceActionImpl = (SliceActionImpl) this.mListContent.getShortcut(getContext());
            SliceItem sliceItem = sliceActionImpl.mActionItem;
            if (sliceItem != null && sliceItem.fireActionInternal(getContext(), null)) {
                this.mCurrentView.setActionLoading(sliceActionImpl.mSliceItem);
            }
        } catch (PendingIntent.CanceledException e) {
            Log.e("SliceView", "PendingIntent for slice cannot be sent", e);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        logSliceMetricsVisibilityChange(false);
        refreshLastUpdatedLabel(false);
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent ev) {
        return (this.mLongClickListener != null && handleTouchForLongpress(ev)) || super.onInterceptTouchEvent(ev);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onLayout(boolean changed, int l, int t, int r, int b) {
        SliceChildView sliceChildView = this.mCurrentView;
        sliceChildView.layout(0, 0, sliceChildView.getMeasuredWidth(), sliceChildView.getMeasuredHeight());
        if (this.mActionRow.getVisibility() != 8) {
            int measuredHeight = sliceChildView.getMeasuredHeight();
            ActionRow actionRow = this.mActionRow;
            actionRow.layout(0, measuredHeight, actionRow.getMeasuredWidth(), this.mActionRow.getMeasuredHeight() + measuredHeight);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:66:0x00e1, code lost:
        if (r2 >= (r10 + r0)) goto L67;
     */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void onMeasure(int r9, int r10) {
        /*
            Method dump skipped, instructions count: 300
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.slice.widget.SliceView.onMeasure(int, int):void");
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent ev) {
        return (this.mLongClickListener != null && handleTouchForLongpress(ev)) || super.onTouchEvent(ev);
    }

    @Override // android.view.View
    public void onVisibilityChanged(View changedView, int visibility) {
        super.onVisibilityChanged(changedView, visibility);
        if (isAttachedToWindow()) {
            boolean z = true;
            logSliceMetricsVisibilityChange(visibility == 0);
            if (visibility != 0) {
                z = false;
            }
            refreshLastUpdatedLabel(z);
        }
    }

    @Override // android.view.View
    public void onWindowVisibilityChanged(int visibility) {
        super.onWindowVisibilityChanged(visibility);
        boolean z = true;
        logSliceMetricsVisibilityChange(visibility == 0);
        if (visibility != 0) {
            z = false;
        }
        refreshLastUpdatedLabel(z);
    }

    public final void refreshLastUpdatedLabel(boolean visibility) {
        SliceMetadata sliceMetadata;
        if (this.mShowLastUpdated && (sliceMetadata = this.mSliceMetadata) != null) {
            if (sliceMetadata.mExpiry == -1) {
                return;
            }
            if (visibility) {
                Handler handler = this.mHandler;
                Runnable runnable = this.mRefreshLastUpdated;
                long j = 60000;
                if (!sliceMetadata.isExpired()) {
                    SliceMetadata sliceMetadata2 = this.mSliceMetadata;
                    Objects.requireNonNull(sliceMetadata2);
                    long currentTimeMillis = System.currentTimeMillis();
                    long j2 = sliceMetadata2.mExpiry;
                    long j3 = 0;
                    if (!(j2 == 0 || j2 == -1 || currentTimeMillis > j2)) {
                        j3 = j2 - currentTimeMillis;
                    }
                    j = 60000 + j3;
                }
                handler.postDelayed(runnable, j);
                return;
            }
            this.mHandler.removeCallbacks(this.mRefreshLastUpdated);
        }
    }

    @Override // android.view.View
    public void setOnClickListener(View.OnClickListener listener) {
        this.mOnClickListener = listener;
    }

    @Override // android.view.View
    public void setOnLongClickListener(View.OnLongClickListener listener) {
        super.setOnLongClickListener(listener);
        this.mLongClickListener = listener;
    }

    public void setSliceViewPolicy(SliceViewPolicy policy) {
        this.mViewPolicy = policy;
    }

    public final void updateActions() {
        if (this.mActions == null) {
            this.mActionRow.setVisibility(8);
            this.mCurrentView.setSliceActions(null);
            this.mCurrentView.setInsets(getPaddingStart(), getPaddingTop(), getPaddingEnd(), getPaddingBottom());
            return;
        }
        ArrayList arrayList = new ArrayList(this.mActions);
        Collections.sort(arrayList, SLICE_ACTION_PRIORITY_COMPARATOR);
        this.mCurrentView.setSliceActions(arrayList);
        this.mCurrentView.setInsets(getPaddingStart(), getPaddingTop(), getPaddingEnd(), getPaddingBottom());
        this.mActionRow.setVisibility(8);
    }

    public SliceView(Context context, AttributeSet attrs) {
        this(context, attrs, R.attr.sliceViewStyle);
    }

    public SliceView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mShowLastUpdated = true;
        this.mCurrentSliceLoggedVisible = false;
        this.mShowTitleItems = false;
        this.mShowHeaderDivider = false;
        this.mShowActionDividers = false;
        this.mThemeTintColor = -1;
        this.mLongpressCheck = new Runnable() { // from class: androidx.slice.widget.SliceView.1
            @Override // java.lang.Runnable
            public void run() {
                View.OnLongClickListener onLongClickListener;
                SliceView sliceView = SliceView.this;
                if (sliceView.mPressing && (onLongClickListener = sliceView.mLongClickListener) != null) {
                    sliceView.mInLongpress = true;
                    onLongClickListener.onLongClick(sliceView);
                    SliceView.this.performHapticFeedback(0);
                }
            }
        };
        this.mRefreshLastUpdated = new Runnable() { // from class: androidx.slice.widget.SliceView.2
            @Override // java.lang.Runnable
            public void run() {
                SliceMetadata sliceMetadata = SliceView.this.mSliceMetadata;
                if (sliceMetadata != null && sliceMetadata.isExpired()) {
                    SliceView.this.mCurrentView.setShowLastUpdated(true);
                    SliceView sliceView = SliceView.this;
                    sliceView.mCurrentView.setSliceContent(sliceView.mListContent);
                }
                SliceView.this.mHandler.postDelayed(this, 60000L);
            }
        };
        init(context, attrs, defStyleAttr, R.style.Widget_SliceView);
    }

    public SliceView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mShowLastUpdated = true;
        this.mCurrentSliceLoggedVisible = false;
        this.mShowTitleItems = false;
        this.mShowHeaderDivider = false;
        this.mShowActionDividers = false;
        this.mThemeTintColor = -1;
        this.mLongpressCheck = new Runnable() { // from class: androidx.slice.widget.SliceView.1
            @Override // java.lang.Runnable
            public void run() {
                View.OnLongClickListener onLongClickListener;
                SliceView sliceView = SliceView.this;
                if (sliceView.mPressing && (onLongClickListener = sliceView.mLongClickListener) != null) {
                    sliceView.mInLongpress = true;
                    onLongClickListener.onLongClick(sliceView);
                    SliceView.this.performHapticFeedback(0);
                }
            }
        };
        this.mRefreshLastUpdated = new Runnable() { // from class: androidx.slice.widget.SliceView.2
            @Override // java.lang.Runnable
            public void run() {
                SliceMetadata sliceMetadata = SliceView.this.mSliceMetadata;
                if (sliceMetadata != null && sliceMetadata.isExpired()) {
                    SliceView.this.mCurrentView.setShowLastUpdated(true);
                    SliceView sliceView = SliceView.this;
                    sliceView.mCurrentView.setSliceContent(sliceView.mListContent);
                }
                SliceView.this.mHandler.postDelayed(this, 60000L);
            }
        };
        init(context, attrs, defStyleAttr, defStyleRes);
    }
}
