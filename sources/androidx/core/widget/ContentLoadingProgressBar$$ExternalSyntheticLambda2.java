package androidx.core.widget;

import android.util.Log;
import android.widget.ImageView;
import androidx.appcompat.R$bool;
import androidx.fragment.app.FragmentActivity;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.picker.LivePreviewFragment;
import com.android.wallpaper.util.WallpaperConnection;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class ContentLoadingProgressBar$$ExternalSyntheticLambda2 implements Runnable {
    public final /* synthetic */ int $r8$classId;
    public final /* synthetic */ Object f$0;

    public /* synthetic */ ContentLoadingProgressBar$$ExternalSyntheticLambda2(Object obj, int i) {
        this.$r8$classId = i;
        this.f$0 = obj;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i;
        switch (this.$r8$classId) {
            case 0:
                ContentLoadingProgressBar contentLoadingProgressBar = (ContentLoadingProgressBar) this.f$0;
                contentLoadingProgressBar.mDismissed = true;
                contentLoadingProgressBar.removeCallbacks(contentLoadingProgressBar.mDelayedShow);
                contentLoadingProgressBar.mPostedShow = false;
                long currentTimeMillis = System.currentTimeMillis();
                long j = contentLoadingProgressBar.mStartTime;
                long j2 = currentTimeMillis - j;
                if (j2 >= 500 || j == -1) {
                    contentLoadingProgressBar.setVisibility(8);
                    return;
                } else if (!contentLoadingProgressBar.mPostedHide) {
                    contentLoadingProgressBar.postDelayed(contentLoadingProgressBar.mDelayedHide, 500 - j2);
                    contentLoadingProgressBar.mPostedHide = true;
                    return;
                } else {
                    return;
                }
            case 1:
                LivePreviewFragment livePreviewFragment = (LivePreviewFragment) this.f$0;
                int i2 = LivePreviewFragment.$r8$clinit;
                FragmentActivity activity = livePreviewFragment.getActivity();
                if (activity != null) {
                    if (livePreviewFragment.mWallpaperSurfaceCallback.mHomeImageWallpaper != null) {
                        Integer num = null;
                        try {
                            num = livePreviewFragment.mPlaceholderColorFuture.get(50L, TimeUnit.MILLISECONDS);
                        } catch (InterruptedException | ExecutionException | TimeoutException e) {
                            Log.i("LivePreviewFragment", "Couldn't obtain placeholder color", e);
                        }
                        Asset thumbAsset = livePreviewFragment.mWallpaper.getThumbAsset(activity.getApplicationContext());
                        ImageView imageView = livePreviewFragment.mWallpaperSurfaceCallback.mHomeImageWallpaper;
                        if (num != null) {
                            i = num.intValue();
                        } else {
                            i = R$bool.getColorAttr(activity, 16842801);
                        }
                        thumbAsset.loadLowResDrawable(activity, imageView, i, livePreviewFragment.mPreviewBitmapTransformation);
                    }
                    livePreviewFragment.setUpLiveWallpaperPreview(livePreviewFragment.mWallpaper);
                    return;
                }
                return;
            default:
                r9.reparentWallpaperSurface(((WallpaperConnection) this.f$0).mSecondContainerView);
                return;
        }
    }
}
