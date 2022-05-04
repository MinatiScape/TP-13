package com.google.android.material.datepicker;

import android.content.Context;
import android.content.res.Resources;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import androidx.core.util.Pair;
import androidx.transition.R$id;
import com.android.systemui.shared.R;
import com.google.android.material.datepicker.MaterialTextInputPicker;
import com.google.android.material.internal.ViewUtils;
import com.google.android.material.resources.MaterialAttributes;
import com.google.android.material.textfield.TextInputLayout;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Locale;
/* loaded from: classes.dex */
public class RangeDateSelector implements DateSelector<Pair<Long, Long>> {
    public static final Parcelable.Creator<RangeDateSelector> CREATOR = new Parcelable.Creator<RangeDateSelector>() { // from class: com.google.android.material.datepicker.RangeDateSelector.3
        @Override // android.os.Parcelable.Creator
        public final RangeDateSelector createFromParcel(Parcel parcel) {
            RangeDateSelector rangeDateSelector = new RangeDateSelector();
            rangeDateSelector.selectedStartItem = (Long) parcel.readValue(Long.class.getClassLoader());
            rangeDateSelector.selectedEndItem = (Long) parcel.readValue(Long.class.getClassLoader());
            return rangeDateSelector;
        }

        @Override // android.os.Parcelable.Creator
        public final RangeDateSelector[] newArray(int i) {
            return new RangeDateSelector[i];
        }
    };
    public String invalidRangeStartError;
    public Long selectedStartItem = null;
    public Long selectedEndItem = null;
    public Long proposedTextStart = null;
    public Long proposedTextEnd = null;

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public static void access$100(RangeDateSelector rangeDateSelector, TextInputLayout textInputLayout, TextInputLayout textInputLayout2, OnSelectionChangedListener onSelectionChangedListener) {
        boolean z;
        Long l = rangeDateSelector.proposedTextStart;
        if (l == null || rangeDateSelector.proposedTextEnd == null) {
            if (textInputLayout.getError() != null && rangeDateSelector.invalidRangeStartError.contentEquals(textInputLayout.getError())) {
                textInputLayout.setError(null);
            }
            if (textInputLayout2.getError() != null && " ".contentEquals(textInputLayout2.getError())) {
                textInputLayout2.setError(null);
            }
            onSelectionChangedListener.onIncompleteSelectionChanged();
            return;
        }
        if (l.longValue() <= rangeDateSelector.proposedTextEnd.longValue()) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            Long l2 = rangeDateSelector.proposedTextStart;
            rangeDateSelector.selectedStartItem = l2;
            Long l3 = rangeDateSelector.proposedTextEnd;
            rangeDateSelector.selectedEndItem = l3;
            onSelectionChangedListener.onSelectionChanged(new Pair(l2, l3));
            return;
        }
        textInputLayout.setError(rangeDateSelector.invalidRangeStartError);
        textInputLayout2.setError(" ");
        onSelectionChangedListener.onIncompleteSelectionChanged();
    }

    @Override // com.google.android.material.datepicker.DateSelector
    public final ArrayList getSelectedDays() {
        ArrayList arrayList = new ArrayList();
        Long l = this.selectedStartItem;
        if (l != null) {
            arrayList.add(l);
        }
        Long l2 = this.selectedEndItem;
        if (l2 != null) {
            arrayList.add(l2);
        }
        return arrayList;
    }

    @Override // com.google.android.material.datepicker.DateSelector
    public final ArrayList getSelectedRanges() {
        if (this.selectedStartItem == null || this.selectedEndItem == null) {
            return new ArrayList();
        }
        ArrayList arrayList = new ArrayList();
        arrayList.add(new Pair(this.selectedStartItem, this.selectedEndItem));
        return arrayList;
    }

    @Override // com.google.android.material.datepicker.DateSelector
    public final Pair<Long, Long> getSelection() {
        return new Pair<>(this.selectedStartItem, this.selectedEndItem);
    }

    @Override // com.google.android.material.datepicker.DateSelector
    public final boolean isSelectionComplete() {
        boolean z;
        Long l = this.selectedStartItem;
        if (!(l == null || this.selectedEndItem == null)) {
            if (l.longValue() <= this.selectedEndItem.longValue()) {
                z = true;
            } else {
                z = false;
            }
            if (z) {
                return true;
            }
        }
        return false;
    }

    @Override // com.google.android.material.datepicker.DateSelector
    public final View onCreateTextInputView(LayoutInflater layoutInflater, ViewGroup viewGroup, CalendarConstraints calendarConstraints, final MaterialTextInputPicker.AnonymousClass1 r21) {
        View inflate = layoutInflater.inflate(R.layout.mtrl_picker_text_input_date_range, viewGroup, false);
        final TextInputLayout textInputLayout = (TextInputLayout) inflate.findViewById(R.id.mtrl_picker_text_input_range_start);
        final TextInputLayout textInputLayout2 = (TextInputLayout) inflate.findViewById(R.id.mtrl_picker_text_input_range_end);
        EditText editText = textInputLayout.editText;
        EditText editText2 = textInputLayout2.editText;
        if (R$id.isDateInputKeyboardMissingSeparatorCharacters()) {
            editText.setInputType(17);
            editText2.setInputType(17);
        }
        this.invalidRangeStartError = inflate.getResources().getString(R.string.mtrl_picker_invalid_range);
        SimpleDateFormat textInputFormat = UtcDates.getTextInputFormat();
        Long l = this.selectedStartItem;
        if (l != null) {
            editText.setText(textInputFormat.format(l));
            this.proposedTextStart = this.selectedStartItem;
        }
        Long l2 = this.selectedEndItem;
        if (l2 != null) {
            editText2.setText(textInputFormat.format(l2));
            this.proposedTextEnd = this.selectedEndItem;
        }
        String textInputHint = UtcDates.getTextInputHint(inflate.getResources(), textInputFormat);
        textInputLayout.setPlaceholderText(textInputHint);
        textInputLayout2.setPlaceholderText(textInputHint);
        editText.addTextChangedListener(new DateFormatTextWatcher(textInputHint, textInputFormat, textInputLayout, calendarConstraints) { // from class: com.google.android.material.datepicker.RangeDateSelector.1
            @Override // com.google.android.material.datepicker.DateFormatTextWatcher
            public final void onInvalidDate() {
                RangeDateSelector rangeDateSelector = RangeDateSelector.this;
                rangeDateSelector.proposedTextStart = null;
                RangeDateSelector.access$100(rangeDateSelector, textInputLayout, textInputLayout2, r21);
            }

            @Override // com.google.android.material.datepicker.DateFormatTextWatcher
            public final void onValidDate(Long l3) {
                RangeDateSelector rangeDateSelector = RangeDateSelector.this;
                rangeDateSelector.proposedTextStart = l3;
                RangeDateSelector.access$100(rangeDateSelector, textInputLayout, textInputLayout2, r21);
            }
        });
        editText2.addTextChangedListener(new DateFormatTextWatcher(textInputHint, textInputFormat, textInputLayout2, calendarConstraints) { // from class: com.google.android.material.datepicker.RangeDateSelector.2
            @Override // com.google.android.material.datepicker.DateFormatTextWatcher
            public final void onInvalidDate() {
                RangeDateSelector rangeDateSelector = RangeDateSelector.this;
                rangeDateSelector.proposedTextEnd = null;
                RangeDateSelector.access$100(rangeDateSelector, textInputLayout, textInputLayout2, r21);
            }

            @Override // com.google.android.material.datepicker.DateFormatTextWatcher
            public final void onValidDate(Long l3) {
                RangeDateSelector rangeDateSelector = RangeDateSelector.this;
                rangeDateSelector.proposedTextEnd = l3;
                RangeDateSelector.access$100(rangeDateSelector, textInputLayout, textInputLayout2, r21);
            }
        });
        editText.requestFocus();
        editText.post(new ViewUtils.AnonymousClass1(editText));
        return inflate;
    }

    @Override // com.google.android.material.datepicker.DateSelector
    public final void select(long j) {
        boolean z;
        Long l = this.selectedStartItem;
        if (l == null) {
            this.selectedStartItem = Long.valueOf(j);
            return;
        }
        if (this.selectedEndItem == null) {
            if (l.longValue() <= j) {
                z = true;
            } else {
                z = false;
            }
            if (z) {
                this.selectedEndItem = Long.valueOf(j);
                return;
            }
        }
        this.selectedEndItem = null;
        this.selectedStartItem = Long.valueOf(j);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.writeValue(this.selectedStartItem);
        parcel.writeValue(this.selectedEndItem);
    }

    @Override // com.google.android.material.datepicker.DateSelector
    public final int getDefaultThemeResId(Context context) {
        int i;
        Resources resources = context.getResources();
        DisplayMetrics displayMetrics = resources.getDisplayMetrics();
        if (Math.min(displayMetrics.widthPixels, displayMetrics.heightPixels) > resources.getDimensionPixelSize(R.dimen.mtrl_calendar_maximum_default_fullscreen_minor_axis)) {
            i = R.attr.materialCalendarTheme;
        } else {
            i = R.attr.materialCalendarFullscreenTheme;
        }
        return MaterialAttributes.resolveOrThrow(context, i, MaterialDatePicker.class.getCanonicalName());
    }

    @Override // com.google.android.material.datepicker.DateSelector
    public final String getSelectionDisplayString(Context context) {
        Pair pair;
        Resources resources = context.getResources();
        Long l = this.selectedStartItem;
        if (l == null && this.selectedEndItem == null) {
            return resources.getString(R.string.mtrl_picker_range_header_unselected);
        }
        Long l2 = this.selectedEndItem;
        if (l2 == null) {
            return resources.getString(R.string.mtrl_picker_range_header_only_start_selected, DateStrings.getDateString(l.longValue()));
        }
        if (l == null) {
            return resources.getString(R.string.mtrl_picker_range_header_only_end_selected, DateStrings.getDateString(l2.longValue()));
        }
        Calendar todayCalendar = UtcDates.getTodayCalendar();
        Calendar utcCalendarOf = UtcDates.getUtcCalendarOf(null);
        utcCalendarOf.setTimeInMillis(l.longValue());
        Calendar utcCalendarOf2 = UtcDates.getUtcCalendarOf(null);
        utcCalendarOf2.setTimeInMillis(l2.longValue());
        if (utcCalendarOf.get(1) != utcCalendarOf2.get(1)) {
            pair = new Pair(DateStrings.getYearMonthDay(l.longValue(), Locale.getDefault()), DateStrings.getYearMonthDay(l2.longValue(), Locale.getDefault()));
        } else if (utcCalendarOf.get(1) == todayCalendar.get(1)) {
            pair = new Pair(DateStrings.getMonthDay(l.longValue(), Locale.getDefault()), DateStrings.getMonthDay(l2.longValue(), Locale.getDefault()));
        } else {
            pair = new Pair(DateStrings.getMonthDay(l.longValue(), Locale.getDefault()), DateStrings.getYearMonthDay(l2.longValue(), Locale.getDefault()));
        }
        return resources.getString(R.string.mtrl_picker_range_header_selected, pair.first, pair.second);
    }
}
