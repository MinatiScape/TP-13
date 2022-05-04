package com.android.wallpaper.widget;

import android.app.WallpaperColors;
import android.content.Context;
import android.graphics.Point;
import android.text.format.DateFormat;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.TextView;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleObserver;
import androidx.lifecycle.OnLifecycleEvent;
import com.android.systemui.shared.R;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.android.wallpaper.util.ScreenSizeCalculator;
import com.android.wallpaper.util.TimeUtils$TimeTicker;
import com.google.common.math.IntMath;
import java.util.Calendar;
import java.util.Locale;
import java.util.TimeZone;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
/* loaded from: classes.dex */
public class LockScreenPreviewer implements LifecycleObserver {
    public static final ExecutorService sExecutorService = Executors.newSingleThreadExecutor();
    public final Context mContext;
    public final String mDatePattern = DateFormat.getBestDateTimePattern(Locale.getDefault(), "EEE, MMM d");
    public final Lifecycle mLifecycle;
    public final TextView mLockDate;
    public final TextView mLockTime;
    public TimeUtils$TimeTicker mTicker;

    public final void setColor(WallpaperColors wallpaperColors) {
        int i;
        int i2;
        boolean z = true;
        if (!(wallpaperColors == null || (wallpaperColors.getColorHints() & 1) == 0)) {
            z = false;
        }
        Context context = this.mContext;
        if (z) {
            i = R.color.text_color_light;
        } else {
            i = R.color.text_color_dark;
        }
        int color = context.getColor(i);
        Context context2 = this.mContext;
        if (z) {
            i2 = R.color.smartspace_preview_shadow_color_dark;
        } else {
            i2 = R.color.smartspace_preview_shadow_color_transparent;
        }
        int color2 = context2.getColor(i2);
        this.mLockDate.setTextColor(color);
        this.mLockDate.setShadowLayer(this.mContext.getResources().getDimension(R.dimen.smartspace_preview_key_ambient_shadow_blur), HingeAngleProviderKt.FULLY_CLOSED_DEGREES, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, color2);
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_PAUSE)
    public void onPause() {
        if (this.mTicker != null) {
            sExecutorService.submit(new LockScreenPreviewer$$ExternalSyntheticLambda1(this, 0));
        }
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_RESUME)
    public void onResume() {
        if (this.mTicker == null) {
            sExecutorService.submit(new LockScreenPreviewer$$ExternalSyntheticLambda2(this, 0));
        }
        updateDateTime();
    }

    public final void release() {
        this.mLifecycle.removeObserver(this);
        if (this.mTicker != null) {
            sExecutorService.submit(new LockScreenPreviewer$$ExternalSyntheticLambda1(this, 0));
        }
    }

    public final void setDateViewVisibility(boolean z) {
        int i;
        TextView textView = this.mLockDate;
        if (z) {
            i = 0;
        } else {
            i = 4;
        }
        textView.setVisibility(i);
    }

    public LockScreenPreviewer(Lifecycle lifecycle, Context context, final ViewGroup viewGroup) {
        boolean z;
        this.mLifecycle = lifecycle;
        this.mContext = context;
        final View inflate = LayoutInflater.from(context).inflate(R.layout.lock_screen_preview, (ViewGroup) null);
        this.mLockTime = (TextView) inflate.findViewById(R.id.lock_time);
        this.mLockDate = (TextView) inflate.findViewById(R.id.lock_date);
        final Point screenSize = ScreenSizeCalculator.getInstance().getScreenSize(((WindowManager) context.getSystemService(WindowManager.class)).getDefaultDisplay());
        if (context.getResources().getConfiguration().getLayoutDirection() == 0) {
            z = true;
        } else {
            z = false;
        }
        final boolean z2 = z;
        final View rootView = viewGroup.getRootView();
        rootView.addOnLayoutChangeListener(new View.OnLayoutChangeListener() { // from class: com.android.wallpaper.widget.LockScreenPreviewer.1
            @Override // android.view.View.OnLayoutChangeListener
            public final void onLayoutChange(View view, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8) {
                int i9;
                float f;
                float f2;
                int measuredHeight = viewGroup.getMeasuredHeight();
                int measuredWidth = viewGroup.getMeasuredWidth();
                inflate.measure(View.MeasureSpec.makeMeasureSpec(screenSize.x, IntMath.MAX_SIGNED_POWER_OF_TWO), View.MeasureSpec.makeMeasureSpec(screenSize.y, IntMath.MAX_SIGNED_POWER_OF_TWO));
                View view2 = inflate;
                Point point = screenSize;
                view2.layout(0, 0, point.x, point.y);
                if (measuredHeight > 0) {
                    f = measuredHeight;
                    i9 = screenSize.y;
                } else {
                    f = measuredWidth;
                    i9 = screenSize.x;
                }
                float f3 = f / i9;
                inflate.setScaleX(f3);
                inflate.setScaleY(f3);
                View view3 = inflate;
                if (z2) {
                    f2 = 0.0f;
                } else {
                    f2 = view3.getMeasuredWidth();
                }
                view3.setPivotX(f2);
                inflate.setPivotY(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                viewGroup.removeAllViews();
                ViewGroup viewGroup2 = viewGroup;
                View view4 = inflate;
                viewGroup2.addView(view4, view4.getMeasuredWidth(), inflate.getMeasuredHeight());
                rootView.removeOnLayoutChangeListener(this);
            }
        });
        lifecycle.addObserver(this);
    }

    public final void updateDateTime() {
        String str;
        Calendar calendar = Calendar.getInstance(TimeZone.getDefault());
        this.mLockDate.setText(DateFormat.format(this.mDatePattern, calendar));
        TextView textView = this.mLockTime;
        if (DateFormat.is24HourFormat(textView.getContext())) {
            str = "HH\nmm";
        } else {
            str = "hh\nmm";
        }
        textView.setText(DateFormat.format(str, calendar));
    }
}
