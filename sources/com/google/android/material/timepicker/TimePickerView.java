package com.google.android.material.timepicker;

import android.content.Context;
import android.util.AttributeSet;
import android.view.GestureDetector;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Checkable;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.constraintlayout.widget.ConstraintSet;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewPropertyAnimatorCompat;
import com.android.systemui.shared.R;
import com.google.android.material.button.MaterialButtonToggleGroup;
import com.google.android.material.chip.Chip;
import java.util.WeakHashMap;
/* loaded from: classes.dex */
class TimePickerView extends ConstraintLayout {
    public static final /* synthetic */ int $r8$clinit = 0;
    public final AnonymousClass1 selectionListener;
    public final MaterialButtonToggleGroup toggle;

    public TimePickerView(Context context) {
        this(context, null);
    }

    public TimePickerView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public final void updateToggleConstraints() {
        boolean z;
        if (this.toggle.getVisibility() == 0) {
            ConstraintSet constraintSet = new ConstraintSet();
            constraintSet.clone(this);
            WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
            char c = 1;
            if (ViewCompat.Api17Impl.getLayoutDirection(this) == 0) {
                z = true;
            } else {
                z = false;
            }
            if (z) {
                c = 2;
            }
            if (constraintSet.mConstraints.containsKey(Integer.valueOf((int) R.id.material_clock_display))) {
                ConstraintSet.Constraint constraint = constraintSet.mConstraints.get(Integer.valueOf((int) R.id.material_clock_display));
                switch (c) {
                    case 1:
                        ConstraintSet.Layout layout = constraint.layout;
                        layout.leftToRight = -1;
                        layout.leftToLeft = -1;
                        layout.leftMargin = -1;
                        layout.goneLeftMargin = -1;
                        break;
                    case 2:
                        ConstraintSet.Layout layout2 = constraint.layout;
                        layout2.rightToRight = -1;
                        layout2.rightToLeft = -1;
                        layout2.rightMargin = -1;
                        layout2.goneRightMargin = -1;
                        break;
                    case 3:
                        ConstraintSet.Layout layout3 = constraint.layout;
                        layout3.topToBottom = -1;
                        layout3.topToTop = -1;
                        layout3.topMargin = -1;
                        layout3.goneTopMargin = -1;
                        break;
                    case 4:
                        ConstraintSet.Layout layout4 = constraint.layout;
                        layout4.bottomToTop = -1;
                        layout4.bottomToBottom = -1;
                        layout4.bottomMargin = -1;
                        layout4.goneBottomMargin = -1;
                        break;
                    case 5:
                        constraint.layout.baselineToBaseline = -1;
                        break;
                    case 6:
                        ConstraintSet.Layout layout5 = constraint.layout;
                        layout5.startToEnd = -1;
                        layout5.startToStart = -1;
                        layout5.startMargin = -1;
                        layout5.goneStartMargin = -1;
                        break;
                    case 7:
                        ConstraintSet.Layout layout6 = constraint.layout;
                        layout6.endToStart = -1;
                        layout6.endToEnd = -1;
                        layout6.endMargin = -1;
                        layout6.goneEndMargin = -1;
                        break;
                    default:
                        throw new IllegalArgumentException("unknown constraint");
                }
            }
            constraintSet.applyTo(this);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r5v1, types: [android.view.View$OnClickListener, com.google.android.material.timepicker.TimePickerView$1] */
    public TimePickerView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        ?? r5 = new View.OnClickListener() { // from class: com.google.android.material.timepicker.TimePickerView.1
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                TimePickerView timePickerView = TimePickerView.this;
                int i2 = TimePickerView.$r8$clinit;
                timePickerView.getClass();
            }
        };
        this.selectionListener = r5;
        LayoutInflater.from(context).inflate(R.layout.material_timepicker, this);
        ClockFaceView clockFaceView = (ClockFaceView) findViewById(R.id.material_clock_face);
        MaterialButtonToggleGroup materialButtonToggleGroup = (MaterialButtonToggleGroup) findViewById(R.id.material_clock_period_toggle);
        this.toggle = materialButtonToggleGroup;
        materialButtonToggleGroup.onButtonCheckedListeners.add(new MaterialButtonToggleGroup.OnButtonCheckedListener() { // from class: com.google.android.material.timepicker.TimePickerView.2
            @Override // com.google.android.material.button.MaterialButtonToggleGroup.OnButtonCheckedListener
            public final void onButtonChecked() {
                TimePickerView timePickerView = TimePickerView.this;
                int i2 = TimePickerView.$r8$clinit;
                timePickerView.getClass();
            }
        });
        Chip chip = (Chip) findViewById(R.id.material_minute_tv);
        Chip chip2 = (Chip) findViewById(R.id.material_hour_tv);
        ClockHandView clockHandView = (ClockHandView) findViewById(R.id.material_clock_hand);
        WeakHashMap<View, ViewPropertyAnimatorCompat> weakHashMap = ViewCompat.sViewPropertyAnimatorMap;
        ViewCompat.Api19Impl.setAccessibilityLiveRegion(chip, 2);
        ViewCompat.Api19Impl.setAccessibilityLiveRegion(chip2, 2);
        final GestureDetector gestureDetector = new GestureDetector(getContext(), new GestureDetector.SimpleOnGestureListener() { // from class: com.google.android.material.timepicker.TimePickerView.3
            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnDoubleTapListener
            public final boolean onDoubleTap(MotionEvent motionEvent) {
                TimePickerView timePickerView = TimePickerView.this;
                int i2 = TimePickerView.$r8$clinit;
                timePickerView.getClass();
                return false;
            }
        });
        View.OnTouchListener onTouchListener = new View.OnTouchListener() { // from class: com.google.android.material.timepicker.TimePickerView.4
            @Override // android.view.View.OnTouchListener
            public final boolean onTouch(View view, MotionEvent motionEvent) {
                if (((Checkable) view).isChecked()) {
                    return gestureDetector.onTouchEvent(motionEvent);
                }
                return false;
            }
        };
        chip.setOnTouchListener(onTouchListener);
        chip2.setOnTouchListener(onTouchListener);
        chip.setTag(R.id.selection_type, 12);
        chip2.setTag(R.id.selection_type, 10);
        chip.setOnClickListener(r5);
        chip2.setOnClickListener(r5);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        updateToggleConstraints();
    }

    @Override // android.view.View
    public final void onVisibilityChanged(View view, int i) {
        super.onVisibilityChanged(view, i);
        if (view == this && i == 0) {
            updateToggleConstraints();
        }
    }
}
