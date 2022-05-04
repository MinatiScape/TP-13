package com.google.android.material.datepicker;

import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.TextView;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import androidx.recyclerview.widget.RecyclerView;
import com.android.systemui.shared.R;
import com.google.android.material.datepicker.MaterialCalendar;
import java.util.Calendar;
import java.util.Iterator;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
public final class MonthsPagerAdapter extends RecyclerView.Adapter<ViewHolder> {
    public final CalendarConstraints calendarConstraints;
    public final DateSelector<?> dateSelector;
    public final int itemHeight;
    public final MaterialCalendar.OnDayClickListener onDayClickListener;

    /* loaded from: classes.dex */
    public static class ViewHolder extends RecyclerView.ViewHolder {
        public final MaterialCalendarGridView monthGrid;
        public final TextView monthTitle;

        public ViewHolder(LinearLayout linearLayout, boolean z) {
            super(linearLayout);
            TextView textView = (TextView) linearLayout.findViewById(R.id.month_title);
            this.monthTitle = textView;
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            new ViewCompat.AccessibilityViewProperty<Boolean>() { // from class: androidx.core.view.ViewCompat.4
                @Override // androidx.core.view.ViewCompat.AccessibilityViewProperty
                public final void frameworkSet(View view, Boolean bool) {
                    Api28Impl.setAccessibilityHeading(view, bool.booleanValue());
                }

                @Override // androidx.core.view.ViewCompat.AccessibilityViewProperty
                public final boolean shouldUpdate(Boolean bool, Boolean bool2) {
                    return !AccessibilityViewProperty.booleanNullToFalseEquals(bool, bool2);
                }

                @Override // androidx.core.view.ViewCompat.AccessibilityViewProperty
                public final Boolean frameworkGet(View view) {
                    return Boolean.valueOf(Api28Impl.isAccessibilityHeading(view));
                }
            }.set(textView, Boolean.TRUE);
            this.monthGrid = (MaterialCalendarGridView) linearLayout.findViewById(R.id.month_grid);
            if (!z) {
                textView.setVisibility(8);
            }
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public final int getItemCount() {
        return this.calendarConstraints.monthSpan;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public final long getItemId(int i) {
        Calendar dayCopy = UtcDates.getDayCopy(this.calendarConstraints.start.firstOfMonth);
        dayCopy.add(2, i);
        return new Month(dayCopy).firstOfMonth.getTimeInMillis();
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public final void onBindViewHolder(ViewHolder viewHolder, int i) {
        ViewHolder viewHolder2 = viewHolder;
        Calendar dayCopy = UtcDates.getDayCopy(this.calendarConstraints.start.firstOfMonth);
        dayCopy.add(2, i);
        Month month = new Month(dayCopy);
        viewHolder2.monthTitle.setText(month.getLongName());
        final MaterialCalendarGridView materialCalendarGridView = (MaterialCalendarGridView) viewHolder2.monthGrid.findViewById(R.id.month_grid);
        if (materialCalendarGridView.getAdapter2() == null || !month.equals(materialCalendarGridView.getAdapter2().month)) {
            MonthAdapter monthAdapter = new MonthAdapter(month, this.dateSelector, this.calendarConstraints);
            materialCalendarGridView.setNumColumns(month.daysInWeek);
            materialCalendarGridView.setAdapter((ListAdapter) monthAdapter);
        } else {
            materialCalendarGridView.invalidate();
            MonthAdapter adapter = materialCalendarGridView.getAdapter2();
            for (Long l : adapter.previouslySelectedDates) {
                adapter.updateSelectedStateForDate(materialCalendarGridView, l.longValue());
            }
            DateSelector<?> dateSelector = adapter.dateSelector;
            if (dateSelector != null) {
                for (Long l2 : dateSelector.getSelectedDays()) {
                    adapter.updateSelectedStateForDate(materialCalendarGridView, l2.longValue());
                }
                adapter.previouslySelectedDates = adapter.dateSelector.getSelectedDays();
            }
        }
        materialCalendarGridView.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.google.android.material.datepicker.MonthsPagerAdapter.1
            @Override // android.widget.AdapterView.OnItemClickListener
            public final void onItemClick(AdapterView<?> adapterView, View view, int i2, long j) {
                boolean z;
                MonthAdapter adapter2 = materialCalendarGridView.getAdapter2();
                if (i2 < adapter2.firstPositionInMonth() || i2 > adapter2.lastPositionInMonth()) {
                    z = false;
                } else {
                    z = true;
                }
                if (z) {
                    MaterialCalendar.OnDayClickListener onDayClickListener = MonthsPagerAdapter.this.onDayClickListener;
                    long longValue = materialCalendarGridView.getAdapter2().getItem(i2).longValue();
                    MaterialCalendar.AnonymousClass3 r1 = (MaterialCalendar.AnonymousClass3) onDayClickListener;
                    if (MaterialCalendar.this.calendarConstraints.validator.isValid(longValue)) {
                        MaterialCalendar.this.dateSelector.select(longValue);
                        Iterator it = MaterialCalendar.this.onSelectionChangedListeners.iterator();
                        while (it.hasNext()) {
                            ((OnSelectionChangedListener) it.next()).onSelectionChanged(MaterialCalendar.this.dateSelector.getSelection());
                        }
                        MaterialCalendar.this.recyclerView.getAdapter().notifyDataSetChanged();
                        RecyclerView recyclerView = MaterialCalendar.this.yearSelector;
                        if (recyclerView != null) {
                            recyclerView.getAdapter().notifyDataSetChanged();
                        }
                    }
                }
            }
        });
    }

    public MonthsPagerAdapter(ContextThemeWrapper contextThemeWrapper, DateSelector dateSelector, CalendarConstraints calendarConstraints, MaterialCalendar.AnonymousClass3 r8) {
        int i;
        Month month = calendarConstraints.start;
        Month month2 = calendarConstraints.end;
        Month month3 = calendarConstraints.openAt;
        if (month.firstOfMonth.compareTo(month3.firstOfMonth) > 0) {
            throw new IllegalArgumentException("firstPage cannot be after currentPage");
        } else if (month3.firstOfMonth.compareTo(month2.firstOfMonth) <= 0) {
            int i2 = MonthAdapter.MAXIMUM_WEEKS;
            Object obj = MaterialCalendar.MONTHS_VIEW_GROUP_TAG;
            int dimensionPixelSize = contextThemeWrapper.getResources().getDimensionPixelSize(R.dimen.mtrl_calendar_day_height) * i2;
            if (MaterialDatePicker.isFullscreen(contextThemeWrapper)) {
                i = contextThemeWrapper.getResources().getDimensionPixelSize(R.dimen.mtrl_calendar_day_height);
            } else {
                i = 0;
            }
            this.itemHeight = dimensionPixelSize + i;
            this.calendarConstraints = calendarConstraints;
            this.dateSelector = dateSelector;
            this.onDayClickListener = r8;
            if (!this.mObservable.hasObservers()) {
                this.mHasStableIds = true;
                return;
            }
            throw new IllegalStateException("Cannot change whether this adapter has stable IDs while the adapter has registered observers.");
        } else {
            throw new IllegalArgumentException("currentPage cannot be after lastPage");
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public final RecyclerView.ViewHolder onCreateViewHolder(RecyclerView recyclerView, int i) {
        LinearLayout linearLayout = (LinearLayout) LayoutInflater.from(recyclerView.getContext()).inflate(R.layout.mtrl_calendar_month_labeled, (ViewGroup) recyclerView, false);
        if (!MaterialDatePicker.isFullscreen(recyclerView.getContext())) {
            return new ViewHolder(linearLayout, false);
        }
        linearLayout.setLayoutParams(new RecyclerView.LayoutParams(-1, this.itemHeight));
        return new ViewHolder(linearLayout, true);
    }
}
