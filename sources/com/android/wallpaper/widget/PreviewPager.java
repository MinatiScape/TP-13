package com.android.wallpaper.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Point;
import android.util.AttributeSet;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.WindowManager;
import android.widget.LinearLayout;
import android.widget.Scroller;
import androidx.interpolator.view.animation.LinearOutSlowInInterpolator;
import androidx.slice.SliceSpecs;
import androidx.viewpager.widget.ViewPager;
import com.android.systemui.shared.R;
import com.android.wallpaper.util.ScreenSizeCalculator;
import java.lang.reflect.Field;
import java.util.ArrayList;
/* loaded from: classes.dex */
public class PreviewPager extends LinearLayout {
    public static final /* synthetic */ int $r8$clinit = 0;
    public final PageIndicator mPageIndicator;
    public final AnonymousClass4 mPageListener;
    public int mPageStyle;
    public float mScreenAspectRatio;
    public final ViewPager mViewPager;

    /* loaded from: classes.dex */
    public static class PreviewPagerScroller extends Scroller {
        @Override // android.widget.Scroller
        public final void startScroll(int i, int i2, int i3, int i4, int i5) {
            super.startScroll(i, i2, i3, i4, 500);
        }

        public PreviewPagerScroller(Context context, LinearOutSlowInInterpolator linearOutSlowInInterpolator) {
            super(context, linearOutSlowInInterpolator);
        }
    }

    public PreviewPager(Context context) {
        this(context, null);
    }

    public PreviewPager(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    @Override // android.widget.LinearLayout, android.view.View
    public final void onMeasure(int i, int i2) {
        if (this.mPageStyle == 1) {
            int size = View.MeasureSpec.getSize(i);
            int size2 = View.MeasureSpec.getSize(i2) - ((View) this.mPageIndicator.getParent()).getLayoutParams().height;
            if (size > 0) {
                int paddingBottom = (size / 2) - (((int) (((size2 - this.mViewPager.getPaddingBottom()) - this.mViewPager.getPaddingTop()) / this.mScreenAspectRatio)) / 2);
                ViewPager viewPager = this.mViewPager;
                viewPager.setPaddingRelative(paddingBottom, viewPager.getPaddingTop(), paddingBottom, this.mViewPager.getPaddingBottom());
            }
        }
        super.onMeasure(i, i2);
    }

    /* JADX WARN: Type inference failed for: r8v8, types: [com.android.wallpaper.widget.PreviewPager$4, java.lang.Object] */
    public PreviewPager(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        LayoutInflater.from(context).inflate(R.layout.preview_pager, this);
        Resources resources = context.getResources();
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, SliceSpecs.PreviewPager, i, 0);
        this.mPageStyle = obtainStyledAttributes.getInteger(0, 0);
        obtainStyledAttributes.recycle();
        ViewPager viewPager = (ViewPager) findViewById(R.id.preview_viewpager);
        this.mViewPager = viewPager;
        viewPager.setPageTransformer(new PreviewPager$$ExternalSyntheticLambda2(this));
        int dimensionPixelOffset = resources.getDimensionPixelOffset(R.dimen.preview_page_gap);
        int i2 = viewPager.mPageMargin;
        viewPager.mPageMargin = dimensionPixelOffset;
        int width = viewPager.getWidth();
        viewPager.recomputeScrollPosition(width, width, dimensionPixelOffset, i2);
        viewPager.requestLayout();
        viewPager.setClipToPadding(false);
        int i3 = this.mPageStyle;
        if (i3 == 0) {
            int max = Math.max(resources.getDimensionPixelOffset(R.dimen.preview_page_horizontal_margin), viewPager.getResources().getDisplayMetrics().widthPixels / 8);
            viewPager.setPadding(max, resources.getDimensionPixelOffset(R.dimen.preview_page_top_margin), max, resources.getDimensionPixelOffset(R.dimen.preview_page_bottom_margin));
        } else if (i3 == 1) {
            Point screenSize = ScreenSizeCalculator.getInstance().getScreenSize(((WindowManager) context.getSystemService(WindowManager.class)).getDefaultDisplay());
            this.mScreenAspectRatio = screenSize.y / screenSize.x;
            viewPager.setPadding(0, resources.getDimensionPixelOffset(R.dimen.preview_page_top_margin), 0, resources.getDimensionPixelOffset(R.dimen.preview_page_bottom_margin));
            int i4 = screenSize.x / 2;
            int i5 = viewPager.mPageMargin;
            viewPager.mPageMargin = i4;
            int width2 = viewPager.getWidth();
            viewPager.recomputeScrollPosition(width2, width2, i4, i5);
            viewPager.requestLayout();
            viewPager.addOnLayoutChangeListener(new View.OnLayoutChangeListener() { // from class: com.android.wallpaper.widget.PreviewPager.1
                @Override // android.view.View.OnLayoutChangeListener
                public final void onLayoutChange(View view, int i6, int i7, int i8, int i9, int i10, int i11, int i12, int i13) {
                    ViewPager viewPager2 = PreviewPager.this.mViewPager;
                    int paddingEnd = view.getPaddingEnd();
                    int i14 = viewPager2.mPageMargin;
                    viewPager2.mPageMargin = paddingEnd;
                    int width3 = viewPager2.getWidth();
                    viewPager2.recomputeScrollPosition(width3, width3, paddingEnd, i14);
                    viewPager2.requestLayout();
                    PreviewPager.this.mViewPager.removeOnLayoutChangeListener(this);
                }
            });
        }
        try {
            Field declaredField = ViewPager.class.getDeclaredField("mScroller");
            declaredField.setAccessible(true);
            declaredField.set(viewPager, new PreviewPagerScroller(context, new LinearOutSlowInInterpolator()));
        } catch (IllegalAccessException | IllegalArgumentException | NoSuchFieldException e) {
            Log.e("PreviewPager", "Failed to setup pager scroller.", e);
        }
        this.mPageIndicator = (PageIndicator) findViewById(R.id.page_indicator);
        findViewById(R.id.arrow_previous).setOnClickListener(new PreviewPager$$ExternalSyntheticLambda0(this, 0));
        findViewById(R.id.arrow_next).setOnClickListener(new PreviewPager$$ExternalSyntheticLambda1(this, 0));
        ?? r8 = new ViewPager.OnPageChangeListener() { // from class: com.android.wallpaper.widget.PreviewPager.4
            @Override // androidx.viewpager.widget.ViewPager.OnPageChangeListener
            public final void onPageScrolled(int i6, float f) {
                PreviewPager.this.mPageIndicator.setLocation(Math.round((i6 + f) * 100.0f) / 100.0f);
                PreviewPager.this.getClass();
            }

            @Override // androidx.viewpager.widget.ViewPager.OnPageChangeListener
            public final void onPageScrollStateChanged(int i6) {
                PreviewPager previewPager = PreviewPager.this;
                int i7 = PreviewPager.$r8$clinit;
                previewPager.getClass();
            }
        };
        this.mPageListener = r8;
        ViewPager viewPager2 = this.mViewPager;
        if (viewPager2.mOnPageChangeListeners == null) {
            viewPager2.mOnPageChangeListeners = new ArrayList();
        }
        viewPager2.mOnPageChangeListeners.add(r8);
    }
}
