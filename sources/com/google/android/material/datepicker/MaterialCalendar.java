package com.google.android.material.datepicker;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.os.Bundle;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.GridView;
import android.widget.ListAdapter;
import androidx.core.util.Pair;
import androidx.core.view.AccessibilityDelegateCompat;
import androidx.core.view.ViewCompat;
import androidx.core.view.accessibility.AccessibilityNodeInfoCompat;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.PagerSnapHelper;
import androidx.recyclerview.widget.RecyclerView;
import com.android.systemui.shared.R;
import com.google.android.material.button.MaterialButton;
import com.google.android.material.datepicker.MaterialDatePicker;
import java.util.Calendar;
import java.util.GregorianCalendar;
/* loaded from: classes.dex */
public final class MaterialCalendar<S> extends PickerFragment<S> {
    public CalendarConstraints calendarConstraints;
    public CalendarSelector calendarSelector;
    public CalendarStyle calendarStyle;
    public Month current;
    public DateSelector<S> dateSelector;
    public View dayFrame;
    public RecyclerView recyclerView;
    public int themeResId;
    public View yearFrame;
    public RecyclerView yearSelector;
    public static final Object MONTHS_VIEW_GROUP_TAG = "MONTHS_VIEW_GROUP_TAG";
    public static final Object NAVIGATION_PREV_TAG = "NAVIGATION_PREV_TAG";
    public static final Object NAVIGATION_NEXT_TAG = "NAVIGATION_NEXT_TAG";
    public static final Object SELECTOR_TOGGLE_TAG = "SELECTOR_TOGGLE_TAG";

    /* renamed from: com.google.android.material.datepicker.MaterialCalendar$3  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass3 implements OnDayClickListener {
        public AnonymousClass3() {
        }
    }

    /* loaded from: classes.dex */
    public enum CalendarSelector {
        DAY,
        YEAR
    }

    /* loaded from: classes.dex */
    public interface OnDayClickListener {
    }

    @Override // androidx.fragment.app.Fragment
    public final View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        final int i;
        int i2;
        ContextThemeWrapper contextThemeWrapper = new ContextThemeWrapper(getContext(), this.themeResId);
        this.calendarStyle = new CalendarStyle(contextThemeWrapper);
        LayoutInflater cloneInContext = layoutInflater.cloneInContext(contextThemeWrapper);
        Month month = this.calendarConstraints.start;
        if (MaterialDatePicker.isFullscreen(contextThemeWrapper)) {
            i2 = R.layout.mtrl_calendar_vertical;
            i = 1;
        } else {
            i2 = R.layout.mtrl_calendar_horizontal;
            i = 0;
        }
        View inflate = cloneInContext.inflate(i2, viewGroup, false);
        Resources resources = requireContext().getResources();
        int dimensionPixelOffset = resources.getDimensionPixelOffset(R.dimen.mtrl_calendar_navigation_bottom_padding) + resources.getDimensionPixelOffset(R.dimen.mtrl_calendar_navigation_top_padding) + resources.getDimensionPixelSize(R.dimen.mtrl_calendar_navigation_height);
        int dimensionPixelSize = resources.getDimensionPixelSize(R.dimen.mtrl_calendar_days_of_week_height);
        int i3 = MonthAdapter.MAXIMUM_WEEKS;
        inflate.setMinimumHeight(dimensionPixelOffset + dimensionPixelSize + (resources.getDimensionPixelOffset(R.dimen.mtrl_calendar_month_vertical_padding) * (i3 - 1)) + (resources.getDimensionPixelSize(R.dimen.mtrl_calendar_day_height) * i3) + resources.getDimensionPixelOffset(R.dimen.mtrl_calendar_bottom_padding));
        GridView gridView = (GridView) inflate.findViewById(R.id.mtrl_calendar_days_of_week);
        ViewCompat.setAccessibilityDelegate(gridView, new AccessibilityDelegateCompat() { // from class: com.google.android.material.datepicker.MaterialCalendar.1
            @Override // androidx.core.view.AccessibilityDelegateCompat
            public final void onInitializeAccessibilityNodeInfo(View view, AccessibilityNodeInfoCompat accessibilityNodeInfoCompat) {
                this.mOriginalDelegate.onInitializeAccessibilityNodeInfo(view, accessibilityNodeInfoCompat.mInfo);
                accessibilityNodeInfoCompat.mInfo.setCollectionInfo(null);
            }
        });
        gridView.setAdapter((ListAdapter) new DaysOfWeekAdapter());
        gridView.setNumColumns(month.daysInWeek);
        gridView.setEnabled(false);
        this.recyclerView = (RecyclerView) inflate.findViewById(R.id.mtrl_calendar_months);
        getContext();
        this.recyclerView.setLayoutManager(new SmoothCalendarLayoutManager(i) { // from class: com.google.android.material.datepicker.MaterialCalendar.2
            @Override // androidx.recyclerview.widget.LinearLayoutManager
            public final void calculateExtraLayoutSpace(RecyclerView.State state, int[] iArr) {
                if (i == 0) {
                    iArr[0] = MaterialCalendar.this.recyclerView.getWidth();
                    iArr[1] = MaterialCalendar.this.recyclerView.getWidth();
                    return;
                }
                iArr[0] = MaterialCalendar.this.recyclerView.getHeight();
                iArr[1] = MaterialCalendar.this.recyclerView.getHeight();
            }
        });
        this.recyclerView.setTag(MONTHS_VIEW_GROUP_TAG);
        final MonthsPagerAdapter monthsPagerAdapter = new MonthsPagerAdapter(contextThemeWrapper, this.dateSelector, this.calendarConstraints, new AnonymousClass3());
        this.recyclerView.setAdapter(monthsPagerAdapter);
        int integer = contextThemeWrapper.getResources().getInteger(R.integer.mtrl_calendar_year_selector_span);
        RecyclerView recyclerView = (RecyclerView) inflate.findViewById(R.id.mtrl_calendar_year_selector_frame);
        this.yearSelector = recyclerView;
        if (recyclerView != null) {
            recyclerView.setHasFixedSize(true);
            this.yearSelector.setLayoutManager(new GridLayoutManager(integer, 0));
            this.yearSelector.setAdapter(new YearGridAdapter(this));
            this.yearSelector.addItemDecoration(new RecyclerView.ItemDecoration() { // from class: com.google.android.material.datepicker.MaterialCalendar.4
                public final Calendar startItem = UtcDates.getUtcCalendarOf(null);
                public final Calendar endItem = UtcDates.getUtcCalendarOf(null);

                @Override // androidx.recyclerview.widget.RecyclerView.ItemDecoration
                public final void onDraw(Canvas canvas, RecyclerView recyclerView2) {
                    int i4;
                    int i5;
                    if ((recyclerView2.getAdapter() instanceof YearGridAdapter) && (recyclerView2.getLayoutManager() instanceof GridLayoutManager)) {
                        YearGridAdapter yearGridAdapter = (YearGridAdapter) recyclerView2.getAdapter();
                        GridLayoutManager gridLayoutManager = (GridLayoutManager) recyclerView2.getLayoutManager();
                        for (Pair pair : MaterialCalendar.this.dateSelector.getSelectedRanges()) {
                            F f = pair.first;
                            if (!(f == 0 || pair.second == null)) {
                                this.startItem.setTimeInMillis(((Long) f).longValue());
                                this.endItem.setTimeInMillis(((Long) pair.second).longValue());
                                int i6 = this.startItem.get(1) - yearGridAdapter.materialCalendar.calendarConstraints.start.year;
                                int i7 = this.endItem.get(1) - yearGridAdapter.materialCalendar.calendarConstraints.start.year;
                                View findViewByPosition = gridLayoutManager.findViewByPosition(i6);
                                View findViewByPosition2 = gridLayoutManager.findViewByPosition(i7);
                                int i8 = gridLayoutManager.mSpanCount;
                                int i9 = i6 / i8;
                                int i10 = i7 / i8;
                                for (int i11 = i9; i11 <= i10; i11++) {
                                    View findViewByPosition3 = gridLayoutManager.findViewByPosition(gridLayoutManager.mSpanCount * i11);
                                    if (findViewByPosition3 != null) {
                                        int top = findViewByPosition3.getTop() + MaterialCalendar.this.calendarStyle.year.insets.top;
                                        int bottom = findViewByPosition3.getBottom() - MaterialCalendar.this.calendarStyle.year.insets.bottom;
                                        if (i11 == i9) {
                                            i4 = (findViewByPosition.getWidth() / 2) + findViewByPosition.getLeft();
                                        } else {
                                            i4 = 0;
                                        }
                                        if (i11 == i10) {
                                            i5 = (findViewByPosition2.getWidth() / 2) + findViewByPosition2.getLeft();
                                        } else {
                                            i5 = recyclerView2.getWidth();
                                        }
                                        canvas.drawRect(i4, top, i5, bottom, MaterialCalendar.this.calendarStyle.rangeFill);
                                    }
                                }
                            }
                        }
                    }
                }
            });
        }
        if (inflate.findViewById(R.id.month_navigation_fragment_toggle) != null) {
            final MaterialButton materialButton = (MaterialButton) inflate.findViewById(R.id.month_navigation_fragment_toggle);
            materialButton.setTag(SELECTOR_TOGGLE_TAG);
            ViewCompat.setAccessibilityDelegate(materialButton, new AccessibilityDelegateCompat() { // from class: com.google.android.material.datepicker.MaterialCalendar.5
                @Override // androidx.core.view.AccessibilityDelegateCompat
                public final void onInitializeAccessibilityNodeInfo(View view, AccessibilityNodeInfoCompat accessibilityNodeInfoCompat) {
                    String str;
                    this.mOriginalDelegate.onInitializeAccessibilityNodeInfo(view, accessibilityNodeInfoCompat.mInfo);
                    if (MaterialCalendar.this.dayFrame.getVisibility() == 0) {
                        str = MaterialCalendar.this.getString(R.string.mtrl_picker_toggle_to_year_selection);
                    } else {
                        str = MaterialCalendar.this.getString(R.string.mtrl_picker_toggle_to_day_selection);
                    }
                    accessibilityNodeInfoCompat.mInfo.setHintText(str);
                }
            });
            MaterialButton materialButton2 = (MaterialButton) inflate.findViewById(R.id.month_navigation_previous);
            materialButton2.setTag(NAVIGATION_PREV_TAG);
            MaterialButton materialButton3 = (MaterialButton) inflate.findViewById(R.id.month_navigation_next);
            materialButton3.setTag(NAVIGATION_NEXT_TAG);
            this.yearFrame = inflate.findViewById(R.id.mtrl_calendar_year_selector_frame);
            this.dayFrame = inflate.findViewById(R.id.mtrl_calendar_day_selector_frame);
            setSelector(CalendarSelector.DAY);
            materialButton.setText(this.current.getLongName());
            this.recyclerView.addOnScrollListener(new RecyclerView.OnScrollListener() { // from class: com.google.android.material.datepicker.MaterialCalendar.6
                @Override // androidx.recyclerview.widget.RecyclerView.OnScrollListener
                public final void onScrollStateChanged(RecyclerView recyclerView2, int i4) {
                    if (i4 == 0) {
                        recyclerView2.announceForAccessibility(materialButton.getText());
                    }
                }

                @Override // androidx.recyclerview.widget.RecyclerView.OnScrollListener
                public final void onScrolled(RecyclerView recyclerView2, int i4, int i5) {
                    int i6;
                    if (i4 < 0) {
                        i6 = ((LinearLayoutManager) MaterialCalendar.this.recyclerView.getLayoutManager()).findFirstVisibleItemPosition();
                    } else {
                        i6 = ((LinearLayoutManager) MaterialCalendar.this.recyclerView.getLayoutManager()).findLastVisibleItemPosition();
                    }
                    MaterialCalendar materialCalendar = MaterialCalendar.this;
                    Calendar dayCopy = UtcDates.getDayCopy(monthsPagerAdapter.calendarConstraints.start.firstOfMonth);
                    dayCopy.add(2, i6);
                    materialCalendar.current = new Month(dayCopy);
                    MaterialButton materialButton4 = materialButton;
                    Calendar dayCopy2 = UtcDates.getDayCopy(monthsPagerAdapter.calendarConstraints.start.firstOfMonth);
                    dayCopy2.add(2, i6);
                    materialButton4.setText(new Month(dayCopy2).getLongName());
                }
            });
            materialButton.setOnClickListener(new View.OnClickListener() { // from class: com.google.android.material.datepicker.MaterialCalendar.7
                @Override // android.view.View.OnClickListener
                public final void onClick(View view) {
                    MaterialCalendar materialCalendar = MaterialCalendar.this;
                    CalendarSelector calendarSelector = CalendarSelector.DAY;
                    CalendarSelector calendarSelector2 = materialCalendar.calendarSelector;
                    CalendarSelector calendarSelector3 = CalendarSelector.YEAR;
                    if (calendarSelector2 == calendarSelector3) {
                        materialCalendar.setSelector(calendarSelector);
                    } else if (calendarSelector2 == calendarSelector) {
                        materialCalendar.setSelector(calendarSelector3);
                    }
                }
            });
            materialButton3.setOnClickListener(new View.OnClickListener() { // from class: com.google.android.material.datepicker.MaterialCalendar.8
                @Override // android.view.View.OnClickListener
                public final void onClick(View view) {
                    int findFirstVisibleItemPosition = ((LinearLayoutManager) MaterialCalendar.this.recyclerView.getLayoutManager()).findFirstVisibleItemPosition() + 1;
                    if (findFirstVisibleItemPosition < MaterialCalendar.this.recyclerView.getAdapter().getItemCount()) {
                        MaterialCalendar materialCalendar = MaterialCalendar.this;
                        Calendar dayCopy = UtcDates.getDayCopy(monthsPagerAdapter.calendarConstraints.start.firstOfMonth);
                        dayCopy.add(2, findFirstVisibleItemPosition);
                        materialCalendar.setCurrentMonth(new Month(dayCopy));
                    }
                }
            });
            materialButton2.setOnClickListener(new View.OnClickListener() { // from class: com.google.android.material.datepicker.MaterialCalendar.9
                @Override // android.view.View.OnClickListener
                public final void onClick(View view) {
                    int findLastVisibleItemPosition = ((LinearLayoutManager) MaterialCalendar.this.recyclerView.getLayoutManager()).findLastVisibleItemPosition() - 1;
                    if (findLastVisibleItemPosition >= 0) {
                        MaterialCalendar materialCalendar = MaterialCalendar.this;
                        Calendar dayCopy = UtcDates.getDayCopy(monthsPagerAdapter.calendarConstraints.start.firstOfMonth);
                        dayCopy.add(2, findLastVisibleItemPosition);
                        materialCalendar.setCurrentMonth(new Month(dayCopy));
                    }
                }
            });
        }
        if (!MaterialDatePicker.isFullscreen(contextThemeWrapper)) {
            new PagerSnapHelper().attachToRecyclerView(this.recyclerView);
        }
        RecyclerView recyclerView2 = this.recyclerView;
        Month month2 = this.current;
        Month month3 = monthsPagerAdapter.calendarConstraints.start;
        if (month3.firstOfMonth instanceof GregorianCalendar) {
            recyclerView2.scrollToPosition((month2.month - month3.month) + ((month2.year - month3.year) * 12));
            return inflate;
        }
        throw new IllegalArgumentException("Only Gregorian calendars are supported.");
    }

    @Override // androidx.fragment.app.Fragment
    public final void onSaveInstanceState(Bundle bundle) {
        bundle.putInt("THEME_RES_ID_KEY", this.themeResId);
        bundle.putParcelable("GRID_SELECTOR_KEY", this.dateSelector);
        bundle.putParcelable("CALENDAR_CONSTRAINTS_KEY", this.calendarConstraints);
        bundle.putParcelable("CURRENT_MONTH_KEY", this.current);
    }

    public final void setCurrentMonth(Month month) {
        boolean z;
        Month month2 = ((MonthsPagerAdapter) this.recyclerView.getAdapter()).calendarConstraints.start;
        Calendar calendar = month2.firstOfMonth;
        if (calendar instanceof GregorianCalendar) {
            int i = month.year;
            int i2 = month2.year;
            int i3 = month.month;
            int i4 = month2.month;
            final int i5 = (i3 - i4) + ((i - i2) * 12);
            Month month3 = this.current;
            if (calendar instanceof GregorianCalendar) {
                int i6 = i5 - ((month3.month - i4) + ((month3.year - i2) * 12));
                boolean z2 = true;
                if (Math.abs(i6) > 3) {
                    z = true;
                } else {
                    z = false;
                }
                if (i6 <= 0) {
                    z2 = false;
                }
                this.current = month;
                if (z && z2) {
                    this.recyclerView.scrollToPosition(i5 - 3);
                    this.recyclerView.post(new Runnable() { // from class: com.google.android.material.datepicker.MaterialCalendar.10
                        @Override // java.lang.Runnable
                        public final void run() {
                            MaterialCalendar.this.recyclerView.smoothScrollToPosition(i5);
                        }
                    });
                } else if (z) {
                    this.recyclerView.scrollToPosition(i5 + 3);
                    this.recyclerView.post(new Runnable() { // from class: com.google.android.material.datepicker.MaterialCalendar.10
                        @Override // java.lang.Runnable
                        public final void run() {
                            MaterialCalendar.this.recyclerView.smoothScrollToPosition(i5);
                        }
                    });
                } else {
                    this.recyclerView.post(new Runnable() { // from class: com.google.android.material.datepicker.MaterialCalendar.10
                        @Override // java.lang.Runnable
                        public final void run() {
                            MaterialCalendar.this.recyclerView.smoothScrollToPosition(i5);
                        }
                    });
                }
            } else {
                throw new IllegalArgumentException("Only Gregorian calendars are supported.");
            }
        } else {
            throw new IllegalArgumentException("Only Gregorian calendars are supported.");
        }
    }

    public final void setSelector(CalendarSelector calendarSelector) {
        this.calendarSelector = calendarSelector;
        if (calendarSelector == CalendarSelector.YEAR) {
            this.yearSelector.getLayoutManager().scrollToPosition(this.current.year - ((YearGridAdapter) this.yearSelector.getAdapter()).materialCalendar.calendarConstraints.start.year);
            this.yearFrame.setVisibility(0);
            this.dayFrame.setVisibility(8);
        } else if (calendarSelector == CalendarSelector.DAY) {
            this.yearFrame.setVisibility(8);
            this.dayFrame.setVisibility(0);
            setCurrentMonth(this.current);
        }
    }

    @Override // com.google.android.material.datepicker.PickerFragment
    public final boolean addOnSelectionChangedListener(MaterialDatePicker.AnonymousClass3 r1) {
        return super.addOnSelectionChangedListener(r1);
    }

    @Override // androidx.fragment.app.Fragment
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (bundle == null) {
            bundle = this.mArguments;
        }
        this.themeResId = bundle.getInt("THEME_RES_ID_KEY");
        this.dateSelector = (DateSelector) bundle.getParcelable("GRID_SELECTOR_KEY");
        this.calendarConstraints = (CalendarConstraints) bundle.getParcelable("CALENDAR_CONSTRAINTS_KEY");
        this.current = (Month) bundle.getParcelable("CURRENT_MONTH_KEY");
    }
}
