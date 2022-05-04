package androidx.core.widget;

import androidx.appcompat.R$bool;
import androidx.fragment.app.FragmentActivity;
import com.android.wallpaper.picker.DownloadablePreviewFragment;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class ContentLoadingProgressBar$$ExternalSyntheticLambda1 implements Runnable {
    public final /* synthetic */ int $r8$classId;
    public final /* synthetic */ Object f$0;

    public /* synthetic */ ContentLoadingProgressBar$$ExternalSyntheticLambda1(Object obj, int i) {
        this.$r8$classId = i;
        this.f$0 = obj;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.$r8$classId) {
            case 0:
                ContentLoadingProgressBar contentLoadingProgressBar = (ContentLoadingProgressBar) this.f$0;
                contentLoadingProgressBar.mPostedShow = false;
                if (!contentLoadingProgressBar.mDismissed) {
                    contentLoadingProgressBar.mStartTime = System.currentTimeMillis();
                    contentLoadingProgressBar.setVisibility(0);
                    return;
                }
                return;
            default:
                DownloadablePreviewFragment downloadablePreviewFragment = (DownloadablePreviewFragment) this.f$0;
                int i = DownloadablePreviewFragment.$r8$clinit;
                FragmentActivity activity = downloadablePreviewFragment.getActivity();
                if (activity != null) {
                    if (downloadablePreviewFragment.mWallpaperSurfaceCallback.mHomeImageWallpaper != null) {
                        downloadablePreviewFragment.mWallpaper.getThumbAsset(activity.getApplicationContext()).loadPreviewImage(activity, downloadablePreviewFragment.mWallpaperSurfaceCallback.mHomeImageWallpaper, R$bool.getColorAttr(downloadablePreviewFragment.getActivity(), 16844080));
                    }
                    downloadablePreviewFragment.setUpLiveWallpaperPreview(downloadablePreviewFragment.mWallpaper);
                    return;
                }
                return;
        }
    }
}
