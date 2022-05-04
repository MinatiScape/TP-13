package androidx.appcompat.widget;

import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.text.Editable;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.text.style.ImageSpan;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.TouchDelegate;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import android.view.inputmethod.InputMethodManager;
import android.widget.AdapterView;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.appcompat.R$styleable;
import androidx.appcompat.view.CollapsibleActionView;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.customview.view.AbsSavedState;
import com.android.systemui.shared.R;
import com.google.common.math.IntMath;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public class SearchView extends LinearLayoutCompat implements CollapsibleActionView {
    public static final /* synthetic */ int $r8$clinit = 0;
    public boolean mClearingFocus;
    public final ImageView mCloseButton;
    public final ImageView mCollapsedIcon;
    public int mCollapsedImeOptions;
    public final CharSequence mDefaultQueryHint;
    public final View mDropDownAnchor;
    public boolean mExpandedInActionView;
    public final ImageView mGoButton;
    public boolean mIconified;
    public boolean mIconifiedByDefault;
    public int mMaxWidth;
    public String mOldQueryText;
    public final AnonymousClass5 mOnClickListener;
    public final AnonymousClass7 mOnEditorActionListener;
    public final AnonymousClass8 mOnItemClickListener;
    public final AnonymousClass9 mOnItemSelectedListener;
    public CharSequence mQueryHint;
    public AnonymousClass2 mReleaseCursorRunnable;
    public final ImageView mSearchButton;
    public final View mSearchEditFrame;
    public final Drawable mSearchHintIcon;
    public final View mSearchPlate;
    public final SearchAutoComplete mSearchSrcTextView;
    public Rect mSearchSrcTextViewBounds;
    public Rect mSearchSrtTextViewBoundsExpanded;
    public final View mSubmitArea;
    public int[] mTemp;
    public int[] mTemp2;
    public AnonymousClass6 mTextKeyListener;
    public AnonymousClass10 mTextWatcher;
    public UpdatableTouchDelegate mTouchDelegate;
    public final AnonymousClass1 mUpdateDrawableStateRunnable;
    public final ImageView mVoiceButton;

    /* loaded from: classes.dex */
    public static class SavedState extends AbsSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.ClassLoaderCreator<SavedState>() { // from class: androidx.appcompat.widget.SearchView.SavedState.1
            @Override // android.os.Parcelable.ClassLoaderCreator
            public final SavedState createFromParcel(Parcel parcel, ClassLoader classLoader) {
                return new SavedState(parcel, classLoader);
            }

            @Override // android.os.Parcelable.Creator
            public final Object createFromParcel(Parcel parcel) {
                return new SavedState(parcel, null);
            }

            @Override // android.os.Parcelable.Creator
            public final Object[] newArray(int i) {
                return new SavedState[i];
            }
        };
        public boolean isIconified;

        public SavedState(Parcelable parcelable) {
            super(parcelable);
        }

        public SavedState(Parcel parcel, ClassLoader classLoader) {
            super(parcel, classLoader);
            this.isIconified = ((Boolean) parcel.readValue(null)).booleanValue();
        }

        public final String toString() {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("SearchView.SavedState{");
            m.append(Integer.toHexString(System.identityHashCode(this)));
            m.append(" isIconified=");
            m.append(this.isIconified);
            m.append("}");
            return m.toString();
        }

        @Override // androidx.customview.view.AbsSavedState, android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i) {
            parcel.writeParcelable(this.mSuperState, i);
            parcel.writeValue(Boolean.valueOf(this.isIconified));
        }
    }

    /* loaded from: classes.dex */
    public static class SearchAutoComplete extends AppCompatAutoCompleteTextView {
        public boolean mHasPendingShowSoftInputRequest;
        public final AnonymousClass1 mRunShowSoftInputIfNecessary;
        public SearchView mSearchView;
        public int mThreshold;

        public SearchAutoComplete(Context context) {
            this(context, null);
        }

        @Override // android.widget.AutoCompleteTextView, android.widget.TextView, android.view.View
        public final boolean onKeyPreIme(int i, KeyEvent keyEvent) {
            if (i == 4) {
                if (keyEvent.getAction() == 0 && keyEvent.getRepeatCount() == 0) {
                    KeyEvent.DispatcherState keyDispatcherState = getKeyDispatcherState();
                    if (keyDispatcherState != null) {
                        keyDispatcherState.startTracking(keyEvent, this);
                    }
                    return true;
                } else if (keyEvent.getAction() == 1) {
                    KeyEvent.DispatcherState keyDispatcherState2 = getKeyDispatcherState();
                    if (keyDispatcherState2 != null) {
                        keyDispatcherState2.handleUpEvent(keyEvent);
                    }
                    if (keyEvent.isTracking() && !keyEvent.isCanceled()) {
                        this.mSearchView.clearFocus();
                        setImeVisibility(false);
                        return true;
                    }
                }
            }
            return super.onKeyPreIme(i, keyEvent);
        }

        @Override // android.widget.AutoCompleteTextView
        public final void performCompletion() {
        }

        @Override // android.widget.AutoCompleteTextView
        public final void replaceText(CharSequence charSequence) {
        }

        public SearchAutoComplete(Context context, AttributeSet attributeSet) {
            this(context, attributeSet, R.attr.autoCompleteTextViewStyle);
        }

        @Override // android.widget.AutoCompleteTextView
        public final boolean enoughToFilter() {
            if (this.mThreshold <= 0 || super.enoughToFilter()) {
                return true;
            }
            return false;
        }

        /* JADX WARN: Type inference failed for: r1v1, types: [androidx.appcompat.widget.SearchView$SearchAutoComplete$1] */
        public SearchAutoComplete(Context context, AttributeSet attributeSet, int i) {
            super(context, attributeSet, i);
            this.mRunShowSoftInputIfNecessary = new Runnable() { // from class: androidx.appcompat.widget.SearchView.SearchAutoComplete.1
                @Override // java.lang.Runnable
                public final void run() {
                    SearchAutoComplete searchAutoComplete = SearchAutoComplete.this;
                    if (searchAutoComplete.mHasPendingShowSoftInputRequest) {
                        ((InputMethodManager) searchAutoComplete.getContext().getSystemService("input_method")).showSoftInput(searchAutoComplete, 0);
                        searchAutoComplete.mHasPendingShowSoftInputRequest = false;
                    }
                }
            };
            this.mThreshold = getThreshold();
        }

        @Override // androidx.appcompat.widget.AppCompatAutoCompleteTextView, android.widget.TextView, android.view.View
        public final InputConnection onCreateInputConnection(EditorInfo editorInfo) {
            InputConnection onCreateInputConnection = super.onCreateInputConnection(editorInfo);
            if (this.mHasPendingShowSoftInputRequest) {
                removeCallbacks(this.mRunShowSoftInputIfNecessary);
                post(this.mRunShowSoftInputIfNecessary);
            }
            return onCreateInputConnection;
        }

        @Override // android.view.View
        public final void onFinishInflate() {
            int i;
            super.onFinishInflate();
            DisplayMetrics displayMetrics = getResources().getDisplayMetrics();
            Configuration configuration = getResources().getConfiguration();
            int i2 = configuration.screenWidthDp;
            int i3 = configuration.screenHeightDp;
            if (i2 >= 960 && i3 >= 720 && configuration.orientation == 2) {
                i = 256;
            } else if (i2 >= 600 || (i2 >= 640 && i3 >= 480)) {
                i = 192;
            } else {
                i = 160;
            }
            setMinWidth((int) TypedValue.applyDimension(1, i, displayMetrics));
        }

        @Override // android.widget.AutoCompleteTextView, android.widget.TextView, android.view.View
        public final void onFocusChanged(boolean z, int i, Rect rect) {
            super.onFocusChanged(z, i, rect);
            SearchView searchView = this.mSearchView;
            searchView.updateViewsVisibility(searchView.mIconified);
            searchView.post(searchView.mUpdateDrawableStateRunnable);
            if (searchView.mSearchSrcTextView.hasFocus()) {
                searchView.mSearchSrcTextView.refreshAutoCompleteResults();
            }
        }

        @Override // android.widget.AutoCompleteTextView, android.widget.TextView, android.view.View
        public final void onWindowFocusChanged(boolean z) {
            boolean z2;
            super.onWindowFocusChanged(z);
            if (z && this.mSearchView.hasFocus() && getVisibility() == 0) {
                this.mHasPendingShowSoftInputRequest = true;
                Context context = getContext();
                int i = SearchView.$r8$clinit;
                if (context.getResources().getConfiguration().orientation == 2) {
                    z2 = true;
                } else {
                    z2 = false;
                }
                if (z2) {
                    setInputMethodMode(1);
                    if (enoughToFilter()) {
                        showDropDown();
                    }
                }
            }
        }

        public final void setImeVisibility(boolean z) {
            InputMethodManager inputMethodManager = (InputMethodManager) getContext().getSystemService("input_method");
            if (!z) {
                this.mHasPendingShowSoftInputRequest = false;
                removeCallbacks(this.mRunShowSoftInputIfNecessary);
                inputMethodManager.hideSoftInputFromWindow(getWindowToken(), 0);
            } else if (inputMethodManager.isActive(this)) {
                this.mHasPendingShowSoftInputRequest = false;
                removeCallbacks(this.mRunShowSoftInputIfNecessary);
                inputMethodManager.showSoftInput(this, 0);
            } else {
                this.mHasPendingShowSoftInputRequest = true;
            }
        }

        @Override // android.widget.AutoCompleteTextView
        public final void setThreshold(int i) {
            super.setThreshold(i);
            this.mThreshold = i;
        }
    }

    public SearchView(Context context) {
        this(context, null);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void clearFocus() {
        this.mClearingFocus = true;
        super.clearFocus();
        this.mSearchSrcTextView.clearFocus();
        this.mSearchSrcTextView.setImeVisibility(false);
        this.mClearingFocus = false;
    }

    /* loaded from: classes.dex */
    public static class UpdatableTouchDelegate extends TouchDelegate {
        public final Rect mActualBounds;
        public boolean mDelegateTargeted;
        public final View mDelegateView;
        public final int mSlop;
        public final Rect mSlopBounds;
        public final Rect mTargetBounds;

        public UpdatableTouchDelegate(Rect rect, Rect rect2, SearchAutoComplete searchAutoComplete) {
            super(rect, searchAutoComplete);
            int scaledTouchSlop = ViewConfiguration.get(searchAutoComplete.getContext()).getScaledTouchSlop();
            this.mSlop = scaledTouchSlop;
            Rect rect3 = new Rect();
            this.mTargetBounds = rect3;
            Rect rect4 = new Rect();
            this.mSlopBounds = rect4;
            Rect rect5 = new Rect();
            this.mActualBounds = rect5;
            rect3.set(rect);
            rect4.set(rect);
            int i = -scaledTouchSlop;
            rect4.inset(i, i);
            rect5.set(rect2);
            this.mDelegateView = searchAutoComplete;
        }

        @Override // android.view.TouchDelegate
        public final boolean onTouchEvent(MotionEvent motionEvent) {
            boolean z;
            boolean z2;
            int x = (int) motionEvent.getX();
            int y = (int) motionEvent.getY();
            int action = motionEvent.getAction();
            boolean z3 = true;
            if (action != 0) {
                if (action == 1 || action == 2) {
                    z2 = this.mDelegateTargeted;
                    if (z2 && !this.mSlopBounds.contains(x, y)) {
                        z3 = z2;
                        z = false;
                    }
                } else {
                    if (action == 3) {
                        z2 = this.mDelegateTargeted;
                        this.mDelegateTargeted = false;
                    }
                    z = true;
                    z3 = false;
                }
                z3 = z2;
                z = true;
            } else {
                if (this.mTargetBounds.contains(x, y)) {
                    this.mDelegateTargeted = true;
                    z = true;
                }
                z = true;
                z3 = false;
            }
            if (!z3) {
                return false;
            }
            if (!z || this.mActualBounds.contains(x, y)) {
                Rect rect = this.mActualBounds;
                motionEvent.setLocation(x - rect.left, y - rect.top);
            } else {
                motionEvent.setLocation(this.mDelegateView.getWidth() / 2, this.mDelegateView.getHeight() / 2);
            }
            return this.mDelegateView.dispatchTouchEvent(motionEvent);
        }
    }

    public SearchView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, R.attr.searchViewStyle);
    }

    @Override // androidx.appcompat.view.CollapsibleActionView
    public final void onActionViewCollapsed() {
        this.mSearchSrcTextView.setText("");
        SearchAutoComplete searchAutoComplete = this.mSearchSrcTextView;
        searchAutoComplete.setSelection(searchAutoComplete.length());
        clearFocus();
        updateViewsVisibility(true);
        this.mSearchSrcTextView.setImeOptions(this.mCollapsedImeOptions);
        this.mExpandedInActionView = false;
    }

    @Override // androidx.appcompat.view.CollapsibleActionView
    public final void onActionViewExpanded() {
        if (!this.mExpandedInActionView) {
            this.mExpandedInActionView = true;
            int imeOptions = this.mSearchSrcTextView.getImeOptions();
            this.mCollapsedImeOptions = imeOptions;
            this.mSearchSrcTextView.setImeOptions(imeOptions | 33554432);
            this.mSearchSrcTextView.setText("");
            updateViewsVisibility(false);
            this.mSearchSrcTextView.requestFocus();
            this.mSearchSrcTextView.setImeVisibility(true);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        removeCallbacks(this.mUpdateDrawableStateRunnable);
        post(this.mReleaseCursorRunnable);
        super.onDetachedFromWindow();
    }

    @Override // androidx.appcompat.widget.LinearLayoutCompat, android.view.View
    public final void onMeasure(int i, int i2) {
        int i3;
        if (this.mIconified) {
            super.onMeasure(i, i2);
            return;
        }
        int mode = View.MeasureSpec.getMode(i);
        int size = View.MeasureSpec.getSize(i);
        if (mode == Integer.MIN_VALUE) {
            int i4 = this.mMaxWidth;
            size = i4 > 0 ? Math.min(i4, size) : Math.min(getContext().getResources().getDimensionPixelSize(R.dimen.abc_search_view_preferred_width), size);
        } else if (mode == 0) {
            size = this.mMaxWidth;
            if (size <= 0) {
                size = getContext().getResources().getDimensionPixelSize(R.dimen.abc_search_view_preferred_width);
            }
        } else if (mode == 1073741824 && (i3 = this.mMaxWidth) > 0) {
            size = Math.min(i3, size);
        }
        int mode2 = View.MeasureSpec.getMode(i2);
        int size2 = View.MeasureSpec.getSize(i2);
        if (mode2 == Integer.MIN_VALUE) {
            size2 = Math.min(getContext().getResources().getDimensionPixelSize(R.dimen.abc_search_view_preferred_height), size2);
        } else if (mode2 == 0) {
            size2 = getContext().getResources().getDimensionPixelSize(R.dimen.abc_search_view_preferred_height);
        }
        super.onMeasure(View.MeasureSpec.makeMeasureSpec(size, IntMath.MAX_SIGNED_POWER_OF_TWO), View.MeasureSpec.makeMeasureSpec(size2, IntMath.MAX_SIGNED_POWER_OF_TWO));
    }

    @Override // android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof SavedState)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SavedState savedState = (SavedState) parcelable;
        super.onRestoreInstanceState(savedState.mSuperState);
        updateViewsVisibility(savedState.isIconified);
        requestLayout();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final boolean requestFocus(int i, Rect rect) {
        if (this.mClearingFocus || !isFocusable()) {
            return false;
        }
        if (this.mIconified) {
            return super.requestFocus(i, rect);
        }
        boolean requestFocus = this.mSearchSrcTextView.requestFocus(i, rect);
        if (requestFocus) {
            updateViewsVisibility(false);
        }
        return requestFocus;
    }

    public final void updateCloseButton() {
        int[] iArr;
        boolean z = true;
        boolean z2 = !TextUtils.isEmpty(this.mSearchSrcTextView.getText());
        int i = 0;
        if (!z2 && (!this.mIconifiedByDefault || this.mExpandedInActionView)) {
            z = false;
        }
        ImageView imageView = this.mCloseButton;
        if (!z) {
            i = 8;
        }
        imageView.setVisibility(i);
        Drawable drawable = this.mCloseButton.getDrawable();
        if (drawable != null) {
            if (z2) {
                iArr = ViewGroup.ENABLED_STATE_SET;
            } else {
                iArr = ViewGroup.EMPTY_STATE_SET;
            }
            drawable.setState(iArr);
        }
    }

    public final void updateFocusedState() {
        int[] iArr;
        if (this.mSearchSrcTextView.hasFocus()) {
            iArr = ViewGroup.FOCUSED_STATE_SET;
        } else {
            iArr = ViewGroup.EMPTY_STATE_SET;
        }
        Drawable background = this.mSearchPlate.getBackground();
        if (background != null) {
            background.setState(iArr);
        }
        Drawable background2 = this.mSubmitArea.getBackground();
        if (background2 != null) {
            background2.setState(iArr);
        }
        invalidate();
    }

    public final void updateQueryHint() {
        SpannableStringBuilder spannableStringBuilder = this.mQueryHint;
        if (spannableStringBuilder == null) {
            spannableStringBuilder = this.mDefaultQueryHint;
        }
        SearchAutoComplete searchAutoComplete = this.mSearchSrcTextView;
        if (spannableStringBuilder == null) {
            spannableStringBuilder = "";
        }
        if (this.mIconifiedByDefault && this.mSearchHintIcon != null) {
            int textSize = (int) (searchAutoComplete.getTextSize() * 1.25d);
            this.mSearchHintIcon.setBounds(0, 0, textSize, textSize);
            SpannableStringBuilder spannableStringBuilder2 = new SpannableStringBuilder("   ");
            spannableStringBuilder2.setSpan(new ImageSpan(this.mSearchHintIcon), 1, 2, 33);
            spannableStringBuilder2.append(spannableStringBuilder);
            spannableStringBuilder = spannableStringBuilder2;
        }
        searchAutoComplete.setHint(spannableStringBuilder);
    }

    public final void updateViewsVisibility(boolean z) {
        int i;
        int i2;
        this.mIconified = z;
        int i3 = 0;
        if (z) {
            i = 0;
        } else {
            i = 8;
        }
        TextUtils.isEmpty(this.mSearchSrcTextView.getText());
        this.mSearchButton.setVisibility(i);
        this.mGoButton.setVisibility(8);
        View view = this.mSearchEditFrame;
        if (z) {
            i2 = 8;
        } else {
            i2 = 0;
        }
        view.setVisibility(i2);
        if (this.mCollapsedIcon.getDrawable() == null || this.mIconifiedByDefault) {
            i3 = 8;
        }
        this.mCollapsedIcon.setVisibility(i3);
        updateCloseButton();
        this.mVoiceButton.setVisibility(8);
        this.mSubmitArea.setVisibility(8);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v4, types: [androidx.appcompat.widget.SearchView$1] */
    /* JADX WARN: Type inference failed for: r0v5, types: [androidx.appcompat.widget.SearchView$2] */
    /* JADX WARN: Type inference failed for: r0v7, types: [androidx.appcompat.widget.SearchView$6] */
    /* JADX WARN: Type inference failed for: r0v8, types: [androidx.appcompat.widget.SearchView$10] */
    /* JADX WARN: Type inference failed for: r10v0, types: [android.view.View$OnClickListener, androidx.appcompat.widget.SearchView$5] */
    /* JADX WARN: Type inference failed for: r11v0, types: [androidx.appcompat.widget.SearchView$7, android.widget.TextView$OnEditorActionListener] */
    /* JADX WARN: Type inference failed for: r12v0, types: [androidx.appcompat.widget.SearchView$8, android.widget.AdapterView$OnItemClickListener] */
    /* JADX WARN: Type inference failed for: r13v0, types: [androidx.appcompat.widget.SearchView$9, android.widget.AdapterView$OnItemSelectedListener] */
    public SearchView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mSearchSrcTextViewBounds = new Rect();
        this.mSearchSrtTextViewBoundsExpanded = new Rect();
        this.mTemp = new int[2];
        this.mTemp2 = new int[2];
        this.mUpdateDrawableStateRunnable = new Runnable() { // from class: androidx.appcompat.widget.SearchView.1
            @Override // java.lang.Runnable
            public final void run() {
                SearchView.this.updateFocusedState();
            }
        };
        this.mReleaseCursorRunnable = new Runnable() { // from class: androidx.appcompat.widget.SearchView.2
            @Override // java.lang.Runnable
            public final void run() {
                SearchView.this.getClass();
            }
        };
        new WeakHashMap();
        ?? r10 = new View.OnClickListener() { // from class: androidx.appcompat.widget.SearchView.5
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                SearchAutoComplete searchAutoComplete;
                SearchView searchView = SearchView.this;
                if (view == searchView.mSearchButton) {
                    searchView.updateViewsVisibility(false);
                    searchView.mSearchSrcTextView.requestFocus();
                    searchView.mSearchSrcTextView.setImeVisibility(true);
                } else if (view == searchView.mCloseButton) {
                    if (!TextUtils.isEmpty(searchView.mSearchSrcTextView.getText())) {
                        searchView.mSearchSrcTextView.setText("");
                        searchView.mSearchSrcTextView.requestFocus();
                        searchView.mSearchSrcTextView.setImeVisibility(true);
                    } else if (searchView.mIconifiedByDefault) {
                        searchView.clearFocus();
                        searchView.updateViewsVisibility(true);
                    }
                } else if (view == searchView.mGoButton) {
                    Editable text = searchView.mSearchSrcTextView.getText();
                    if (text != null && TextUtils.getTrimmedLength(text) > 0) {
                        searchView.mSearchSrcTextView.setImeVisibility(false);
                        searchView.mSearchSrcTextView.dismissDropDown();
                    }
                } else if (view != searchView.mVoiceButton && view == (searchAutoComplete = searchView.mSearchSrcTextView)) {
                    searchAutoComplete.refreshAutoCompleteResults();
                }
            }
        };
        this.mOnClickListener = r10;
        this.mTextKeyListener = new View.OnKeyListener() { // from class: androidx.appcompat.widget.SearchView.6
            @Override // android.view.View.OnKeyListener
            public final boolean onKey(View view, int i2, KeyEvent keyEvent) {
                SearchView.this.getClass();
                return false;
            }
        };
        ?? r11 = new TextView.OnEditorActionListener() { // from class: androidx.appcompat.widget.SearchView.7
            @Override // android.widget.TextView.OnEditorActionListener
            public final boolean onEditorAction(TextView textView, int i2, KeyEvent keyEvent) {
                SearchView searchView = SearchView.this;
                Editable text = searchView.mSearchSrcTextView.getText();
                if (text == null || TextUtils.getTrimmedLength(text) <= 0) {
                    return true;
                }
                searchView.mSearchSrcTextView.setImeVisibility(false);
                searchView.mSearchSrcTextView.dismissDropDown();
                return true;
            }
        };
        this.mOnEditorActionListener = r11;
        ?? r12 = new AdapterView.OnItemClickListener() { // from class: androidx.appcompat.widget.SearchView.8
            @Override // android.widget.AdapterView.OnItemClickListener
            public final void onItemClick(AdapterView<?> adapterView, View view, int i2, long j) {
                SearchView.this.getClass();
                throw null;
            }
        };
        this.mOnItemClickListener = r12;
        ?? r13 = new AdapterView.OnItemSelectedListener() { // from class: androidx.appcompat.widget.SearchView.9
            @Override // android.widget.AdapterView.OnItemSelectedListener
            public final void onNothingSelected(AdapterView<?> adapterView) {
            }

            @Override // android.widget.AdapterView.OnItemSelectedListener
            public final void onItemSelected(AdapterView<?> adapterView, View view, int i2, long j) {
                SearchView.this.mSearchSrcTextView.getText();
                throw null;
            }
        };
        this.mOnItemSelectedListener = r13;
        this.mTextWatcher = new TextWatcher() { // from class: androidx.appcompat.widget.SearchView.10
            @Override // android.text.TextWatcher
            public final void afterTextChanged(Editable editable) {
            }

            @Override // android.text.TextWatcher
            public final void beforeTextChanged(CharSequence charSequence, int i2, int i3, int i4) {
            }

            @Override // android.text.TextWatcher
            public final void onTextChanged(CharSequence charSequence, int i2, int i3, int i4) {
                SearchView searchView = SearchView.this;
                TextUtils.isEmpty(searchView.mSearchSrcTextView.getText());
                searchView.mGoButton.setVisibility(8);
                searchView.mVoiceButton.setVisibility(8);
                searchView.updateCloseButton();
                searchView.mSubmitArea.setVisibility(8);
                searchView.mOldQueryText = charSequence.toString();
            }
        };
        int[] iArr = R$styleable.SearchView;
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, iArr, i, 0);
        TintTypedArray tintTypedArray = new TintTypedArray(context, obtainStyledAttributes);
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        ViewCompat.Api29Impl.saveAttributeDataForStyleable(this, context, iArr, attributeSet, obtainStyledAttributes, i, 0);
        LayoutInflater.from(context).inflate(tintTypedArray.getResourceId(9, R.layout.abc_search_view), (ViewGroup) this, true);
        SearchAutoComplete searchAutoComplete = (SearchAutoComplete) findViewById(R.id.search_src_text);
        this.mSearchSrcTextView = searchAutoComplete;
        searchAutoComplete.mSearchView = this;
        this.mSearchEditFrame = findViewById(R.id.search_edit_frame);
        View findViewById = findViewById(R.id.search_plate);
        this.mSearchPlate = findViewById;
        View findViewById2 = findViewById(R.id.submit_area);
        this.mSubmitArea = findViewById2;
        ImageView imageView = (ImageView) findViewById(R.id.search_button);
        this.mSearchButton = imageView;
        ImageView imageView2 = (ImageView) findViewById(R.id.search_go_btn);
        this.mGoButton = imageView2;
        ImageView imageView3 = (ImageView) findViewById(R.id.search_close_btn);
        this.mCloseButton = imageView3;
        ImageView imageView4 = (ImageView) findViewById(R.id.search_voice_btn);
        this.mVoiceButton = imageView4;
        ImageView imageView5 = (ImageView) findViewById(R.id.search_mag_icon);
        this.mCollapsedIcon = imageView5;
        ViewCompat.Api16Impl.setBackground(findViewById, tintTypedArray.getDrawable(10));
        ViewCompat.Api16Impl.setBackground(findViewById2, tintTypedArray.getDrawable(14));
        imageView.setImageDrawable(tintTypedArray.getDrawable(13));
        imageView2.setImageDrawable(tintTypedArray.getDrawable(7));
        imageView3.setImageDrawable(tintTypedArray.getDrawable(4));
        imageView4.setImageDrawable(tintTypedArray.getDrawable(16));
        imageView5.setImageDrawable(tintTypedArray.getDrawable(13));
        this.mSearchHintIcon = tintTypedArray.getDrawable(12);
        imageView.setTooltipText(getResources().getString(R.string.abc_searchview_description_search));
        tintTypedArray.getResourceId(15, R.layout.abc_search_dropdown_item_icons_2line);
        tintTypedArray.getResourceId(5, 0);
        imageView.setOnClickListener(r10);
        imageView3.setOnClickListener(r10);
        imageView2.setOnClickListener(r10);
        imageView4.setOnClickListener(r10);
        searchAutoComplete.setOnClickListener(r10);
        searchAutoComplete.addTextChangedListener(this.mTextWatcher);
        searchAutoComplete.setOnEditorActionListener(r11);
        searchAutoComplete.setOnItemClickListener(r12);
        searchAutoComplete.setOnItemSelectedListener(r13);
        searchAutoComplete.setOnKeyListener(this.mTextKeyListener);
        searchAutoComplete.setOnFocusChangeListener(new View.OnFocusChangeListener() { // from class: androidx.appcompat.widget.SearchView.3
            @Override // android.view.View.OnFocusChangeListener
            public final void onFocusChange(View view, boolean z) {
                SearchView.this.getClass();
            }
        });
        boolean z = tintTypedArray.getBoolean(8, true);
        if (this.mIconifiedByDefault != z) {
            this.mIconifiedByDefault = z;
            updateViewsVisibility(z);
            updateQueryHint();
        }
        int dimensionPixelSize = tintTypedArray.getDimensionPixelSize(1, -1);
        if (dimensionPixelSize != -1) {
            this.mMaxWidth = dimensionPixelSize;
            requestLayout();
        }
        this.mDefaultQueryHint = tintTypedArray.getText(6);
        this.mQueryHint = tintTypedArray.getText(11);
        int i2 = tintTypedArray.getInt(3, -1);
        if (i2 != -1) {
            searchAutoComplete.setImeOptions(i2);
        }
        int i3 = tintTypedArray.getInt(2, -1);
        if (i3 != -1) {
            searchAutoComplete.setInputType(i3);
        }
        setFocusable(tintTypedArray.getBoolean(0, true));
        tintTypedArray.recycle();
        Intent intent = new Intent("android.speech.action.WEB_SEARCH");
        intent.addFlags(268435456);
        intent.putExtra("android.speech.extra.LANGUAGE_MODEL", "web_search");
        new Intent("android.speech.action.RECOGNIZE_SPEECH").addFlags(268435456);
        View findViewById3 = findViewById(searchAutoComplete.getDropDownAnchor());
        this.mDropDownAnchor = findViewById3;
        if (findViewById3 != null) {
            findViewById3.addOnLayoutChangeListener(new View.OnLayoutChangeListener() { // from class: androidx.appcompat.widget.SearchView.4
                @Override // android.view.View.OnLayoutChangeListener
                public final void onLayoutChange(View view, int i4, int i5, int i6, int i7, int i8, int i9, int i10, int i11) {
                    int i12;
                    int i13;
                    SearchView searchView = SearchView.this;
                    if (searchView.mDropDownAnchor.getWidth() > 1) {
                        Resources resources = searchView.getContext().getResources();
                        int paddingLeft = searchView.mSearchPlate.getPaddingLeft();
                        Rect rect = new Rect();
                        boolean isLayoutRtl = ViewUtils.isLayoutRtl(searchView);
                        if (searchView.mIconifiedByDefault) {
                            i12 = resources.getDimensionPixelSize(R.dimen.abc_dropdownitem_text_padding_left) + resources.getDimensionPixelSize(R.dimen.abc_dropdownitem_icon_width);
                        } else {
                            i12 = 0;
                        }
                        searchView.mSearchSrcTextView.getDropDownBackground().getPadding(rect);
                        if (isLayoutRtl) {
                            i13 = -rect.left;
                        } else {
                            i13 = paddingLeft - (rect.left + i12);
                        }
                        searchView.mSearchSrcTextView.setDropDownHorizontalOffset(i13);
                        searchView.mSearchSrcTextView.setDropDownWidth((((searchView.mDropDownAnchor.getWidth() + rect.left) + rect.right) + i12) - paddingLeft);
                    }
                }
            });
        }
        updateViewsVisibility(this.mIconifiedByDefault);
        updateQueryHint();
    }

    @Override // androidx.appcompat.widget.LinearLayoutCompat, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
        if (z) {
            SearchAutoComplete searchAutoComplete = this.mSearchSrcTextView;
            Rect rect = this.mSearchSrcTextViewBounds;
            searchAutoComplete.getLocationInWindow(this.mTemp);
            getLocationInWindow(this.mTemp2);
            int[] iArr = this.mTemp;
            int i5 = iArr[1];
            int[] iArr2 = this.mTemp2;
            int i6 = i5 - iArr2[1];
            int i7 = iArr[0] - iArr2[0];
            rect.set(i7, i6, searchAutoComplete.getWidth() + i7, searchAutoComplete.getHeight() + i6);
            Rect rect2 = this.mSearchSrtTextViewBoundsExpanded;
            Rect rect3 = this.mSearchSrcTextViewBounds;
            rect2.set(rect3.left, 0, rect3.right, i4 - i2);
            UpdatableTouchDelegate updatableTouchDelegate = this.mTouchDelegate;
            if (updatableTouchDelegate == null) {
                UpdatableTouchDelegate updatableTouchDelegate2 = new UpdatableTouchDelegate(this.mSearchSrtTextViewBoundsExpanded, this.mSearchSrcTextViewBounds, this.mSearchSrcTextView);
                this.mTouchDelegate = updatableTouchDelegate2;
                setTouchDelegate(updatableTouchDelegate2);
                return;
            }
            Rect rect4 = this.mSearchSrtTextViewBoundsExpanded;
            Rect rect5 = this.mSearchSrcTextViewBounds;
            updatableTouchDelegate.mTargetBounds.set(rect4);
            updatableTouchDelegate.mSlopBounds.set(rect4);
            Rect rect6 = updatableTouchDelegate.mSlopBounds;
            int i8 = -updatableTouchDelegate.mSlop;
            rect6.inset(i8, i8);
            updatableTouchDelegate.mActualBounds.set(rect5);
        }
    }

    @Override // android.view.View
    public final Parcelable onSaveInstanceState() {
        SavedState savedState = new SavedState(super.onSaveInstanceState());
        savedState.isIconified = this.mIconified;
        return savedState;
    }

    @Override // android.view.View
    public final void onWindowFocusChanged(boolean z) {
        super.onWindowFocusChanged(z);
        post(this.mUpdateDrawableStateRunnable);
    }
}
