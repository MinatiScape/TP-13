package com.android.wallpaper.picker;

import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.os.Handler;
import android.text.TextUtils;
import android.widget.ImageView;
import androidx.fragment.app.BackStackRecord;
import androidx.fragment.app.Fragment;
import com.android.systemui.shared.R;
import com.android.wallpaper.model.DownloadableLiveWallpaperInfo;
import com.android.wallpaper.model.LiveWallpaperInfo;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.module.DefaultWallpaperPersister;
import com.android.wallpaper.module.InjectorProvider;
import com.android.wallpaper.module.WallpaperPersister;
import com.android.wallpaper.util.ActivityUtils;
import com.android.wallpaper.util.DiskBasedLogger$$ExternalSyntheticLambda1;
import com.android.wallpaper.widget.BottomActionBar;
import com.google.android.material.tabs.TabLayout;
/* loaded from: classes.dex */
public class DownloadablePreviewFragment extends LivePreviewFragment {
    public static final /* synthetic */ int $r8$clinit = 0;
    public BroadcastReceiver mBroadcastReceiver = new BroadcastReceiver() { // from class: com.android.wallpaper.picker.DownloadablePreviewFragment.1
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            if (TextUtils.equals("com.google.pixel.livewallpaper.action.DOWNLOAD_STATE", intent.getAction())) {
                int intExtra = intent.getIntExtra("com.google.pixel.livewallpaper.download_state", 0);
                if (intExtra == 1) {
                    DownloadablePreviewFragment.this.showDownloadSuccess();
                } else if (intExtra == 3) {
                    DownloadablePreviewFragment.this.showDownloadFailed();
                }
                ((PreviewFragment) DownloadablePreviewFragment.this).mBottomActionBar.deselectAction(BottomActionBar.BottomAction.DOWNLOAD);
                ((PreviewFragment) DownloadablePreviewFragment.this).mBottomActionBar.enableActions();
                DownloadablePreviewFragment.this.mIsCancelingDownload = false;
            }
        }
    };
    public Context mContext;
    public boolean mIsCancelingDownload;
    public WallpaperPersister mWallpaperPersister;

    @Override // com.android.wallpaper.picker.AppbarFragment, androidx.fragment.app.Fragment
    public void onAttach(Context context) {
        super.onAttach(context);
        this.mContext = context;
        this.mContext.registerReceiver(this.mBroadcastReceiver, new IntentFilter("com.google.pixel.livewallpaper.action.DOWNLOAD_STATE"), "com.google.pixel.livewallpaper.permission.DOWNLOAD_LIVE_WALLPAPER", null);
    }

    @Override // com.android.wallpaper.picker.BottomActionBarFragment
    public boolean onBackPressed() {
        if (this.mIsCancelingDownload) {
            return true;
        }
        WallpaperInfo wallpaperInfo = this.mWallpaper;
        if (!(wallpaperInfo instanceof DownloadableLiveWallpaperInfo)) {
            return false;
        }
        this.mIsCancelingDownload = true;
        android.app.WallpaperInfo wallpaperComponent = wallpaperInfo.getWallpaperComponent();
        Intent intent = new Intent("com.google.pixel.livewallpaper.action.CANCEL_LIVE_WALLPAPER");
        intent.setComponent(new ComponentName("com.google.pixel.livewallpaper", "com.google.pixel.livewallpaper.split.FeatureActivity"));
        intent.addFlags(805306368);
        intent.putExtra("android.live_wallpaper.info", wallpaperComponent);
        ActivityUtils.startActivityForResultSafely(getActivity(), intent, 4);
        return false;
    }

    @Override // com.android.wallpaper.picker.LivePreviewFragment, com.android.wallpaper.picker.PreviewFragment, com.android.wallpaper.picker.AppbarFragment, com.android.wallpaper.picker.BottomActionBarFragment
    public void onBottomActionBarReady(BottomActionBar bottomActionBar) {
        super.onBottomActionBarReady(bottomActionBar);
        BottomActionBar bottomActionBar2 = ((PreviewFragment) this).mBottomActionBar;
        BottomActionBar.BottomAction bottomAction = BottomActionBar.BottomAction.DOWNLOAD;
        bottomActionBar2.showActionsOnly(BottomActionBar.BottomAction.INFORMATION, bottomAction);
        ((PreviewFragment) this).mBottomActionBar.setActionClickListener(bottomAction, new AppbarFragment$$ExternalSyntheticLambda0(this));
        ((PreviewFragment) this).mBottomActionBar.setVisibility(0);
        ((PreviewFragment) this).mBottomActionBar.enableActions();
    }

    @Override // com.android.wallpaper.picker.LivePreviewFragment, com.android.wallpaper.picker.PreviewFragment, androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mWallpaperPersister = InjectorProvider.getInjector().getWallpaperPersister(this.mContext);
    }

    @Override // androidx.fragment.app.Fragment
    public void onDetach() {
        this.mCalled = true;
        this.mContext.unregisterReceiver(this.mBroadcastReceiver);
    }

    @Override // com.android.wallpaper.picker.LivePreviewFragment
    public void previewLiveWallpaper(ImageView imageView) {
        Handler.getMain().post(new DiskBasedLogger$$ExternalSyntheticLambda1(this));
    }

    public void showDownloadFailed() {
        if (this.mWallpaper != null) {
            ((PreviewFragment) this).mBottomActionBar.showActions(BottomActionBar.BottomAction.DOWNLOAD);
        }
        ((PreviewFragment) this).mBottomActionBar.hideActions(BottomActionBar.BottomAction.PROGRESS);
    }

    public void showDownloadSuccess() {
        ((PreviewFragment) this).mBottomActionBar.hideActions(BottomActionBar.BottomAction.DOWNLOAD, BottomActionBar.BottomAction.PROGRESS);
        ((PreviewFragment) this).mBottomActionBar.showActions(BottomActionBar.BottomAction.DELETE, BottomActionBar.BottomAction.APPLY);
        LiveWallpaperInfo liveWallpaperInfo = new LiveWallpaperInfo(this.mWallpaper.getWallpaperComponent());
        ((DefaultWallpaperPersister) this.mWallpaperPersister).mWallpaperInfoInPreview = liveWallpaperInfo;
        Fragment previewFragment = InjectorProvider.getInjector().getPreviewFragment(this.mContext, liveWallpaperInfo, 1, ((TabLayout) this.mView.findViewById(R.id.separated_tabs)).getSelectedTabPosition() == 0, false, false);
        BackStackRecord backStackRecord = new BackStackRecord(this.mFragmentManager);
        backStackRecord.replace(R.id.fragment_container, previewFragment);
        backStackRecord.commitAllowingStateLoss();
    }

    public void startDownload(WallpaperInfo wallpaperInfo) {
        requireContext();
        android.app.WallpaperInfo wallpaperComponent = wallpaperInfo.getWallpaperComponent();
        Intent intent = new Intent("com.google.pixel.livewallpaper.action.DOWNLOAD_LIVE_WALLPAPER");
        intent.setComponent(new ComponentName("com.google.pixel.livewallpaper", "com.google.pixel.livewallpaper.split.FeatureActivity"));
        intent.addFlags(805306368);
        intent.putExtra("android.live_wallpaper.info", wallpaperComponent);
        ActivityUtils.startActivityForResultSafely(getActivity(), intent, 4);
    }
}
