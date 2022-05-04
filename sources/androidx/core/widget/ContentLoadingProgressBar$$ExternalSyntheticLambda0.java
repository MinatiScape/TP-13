package androidx.core.widget;

import com.android.wallpaper.util.WallpaperConnection;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class ContentLoadingProgressBar$$ExternalSyntheticLambda0 implements Runnable {
    public final /* synthetic */ int $r8$classId;
    public final /* synthetic */ Object f$0;

    public /* synthetic */ ContentLoadingProgressBar$$ExternalSyntheticLambda0(Object obj, int i) {
        this.$r8$classId = i;
        this.f$0 = obj;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.$r8$classId) {
            case 0:
                ContentLoadingProgressBar contentLoadingProgressBar = (ContentLoadingProgressBar) this.f$0;
                contentLoadingProgressBar.mStartTime = -1L;
                contentLoadingProgressBar.mDismissed = false;
                contentLoadingProgressBar.removeCallbacks(contentLoadingProgressBar.mDelayedHide);
                contentLoadingProgressBar.mPostedHide = false;
                if (!contentLoadingProgressBar.mPostedShow) {
                    contentLoadingProgressBar.postDelayed(contentLoadingProgressBar.mDelayedShow, 500L);
                    contentLoadingProgressBar.mPostedShow = true;
                    return;
                }
                return;
            default:
                r3.reparentWallpaperSurface(((WallpaperConnection) this.f$0).mContainerView);
                return;
        }
    }
}
