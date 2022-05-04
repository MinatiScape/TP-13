package androidx.core.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.ProgressBar;
/* loaded from: classes.dex */
public class ContentLoadingProgressBar extends ProgressBar {
    public final ContentLoadingProgressBar$$ExternalSyntheticLambda3 mDelayedHide;
    public final ContentLoadingProgressBar$$ExternalSyntheticLambda1 mDelayedShow;
    public boolean mDismissed;
    public boolean mPostedHide;
    public boolean mPostedShow;
    public long mStartTime;

    public ContentLoadingProgressBar(Context context) {
        this(context, null);
    }

    /* JADX WARN: Type inference failed for: r2v2, types: [androidx.core.widget.ContentLoadingProgressBar$$ExternalSyntheticLambda3] */
    public ContentLoadingProgressBar(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        this.mStartTime = -1L;
        this.mPostedHide = false;
        this.mPostedShow = false;
        this.mDismissed = false;
        this.mDelayedHide = new Runnable() { // from class: androidx.core.widget.ContentLoadingProgressBar$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                ContentLoadingProgressBar contentLoadingProgressBar = ContentLoadingProgressBar.this;
                contentLoadingProgressBar.mPostedHide = false;
                contentLoadingProgressBar.mStartTime = -1L;
                contentLoadingProgressBar.setVisibility(8);
            }
        };
        this.mDelayedShow = new ContentLoadingProgressBar$$ExternalSyntheticLambda1(this, 0);
    }

    public final void hide() {
        post(new ContentLoadingProgressBar$$ExternalSyntheticLambda2(this, 0));
    }

    @Override // android.widget.ProgressBar, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        removeCallbacks(this.mDelayedHide);
        removeCallbacks(this.mDelayedShow);
    }

    @Override // android.widget.ProgressBar, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        removeCallbacks(this.mDelayedHide);
        removeCallbacks(this.mDelayedShow);
    }
}
