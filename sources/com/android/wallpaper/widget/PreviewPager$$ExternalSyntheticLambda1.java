package com.android.wallpaper.widget;

import android.app.UiModeManager;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.view.animation.Interpolator;
import android.widget.ImageView;
import android.widget.Switch;
import android.widget.Toast;
import androidx.lifecycle.Observer;
import androidx.slice.SliceViewManager;
import androidx.slice.widget.SliceLiveData;
import androidx.viewpager.widget.ViewPager;
import com.android.customization.model.mode.DarkModeSectionController;
import com.android.customization.picker.WallpaperPreviewer;
import com.android.customization.picker.WallpaperPreviewer$$ExternalSyntheticLambda1;
import com.android.systemui.shared.R;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.model.SetWallpaperViewModel;
import com.android.wallpaper.module.PackageStatusNotifier;
import com.android.wallpaper.picker.BasePreviewActivity;
import com.android.wallpaper.picker.CurrentWallpaperBottomSheetPresenter;
import com.android.wallpaper.picker.ImagePreviewFragment;
import com.android.wallpaper.picker.PreviewFragment;
import com.android.wallpaper.picker.PreviewFragment$$ExternalSyntheticLambda2;
import com.android.wallpaper.picker.SectionView;
import com.android.wallpaper.picker.SetWallpaperErrorDialogFragment;
import com.android.wallpaper.picker.TopLevelPickerActivity;
import com.android.wallpaper.picker.WorkspaceSurfaceHolderCallback;
import com.android.wallpaper.picker.individual.IndividualPickerFragment;
import com.android.wallpaper.picker.individual.IndividualPickerUnlockableFragment;
import com.android.wallpaper.util.FullScreenAnimation;
import com.android.wallpaper.util.PreviewUtils;
import com.android.wallpaper.util.WallpaperSurfaceCallback;
import com.android.wallpaper.widget.BottomActionBar;
import java.util.Objects;
import java.util.concurrent.ExecutorService;
/* loaded from: classes.dex */
public final /* synthetic */ class PreviewPager$$ExternalSyntheticLambda1 implements ViewPager.PageTransformer, SliceViewManager.SliceCallback, SectionView.SectionViewListener, WallpaperSurfaceCallback.SurfaceListener, FullScreenAnimation.FullScreenStatusListener, Observer, Asset.DrawableLoadedListener, WorkspaceSurfaceHolderCallback.WorkspaceRenderListener, PreviewUtils.WorkspacePreviewCallback, PackageStatusNotifier.Listener {
    public final /* synthetic */ int $r8$classId = 8;
    public final /* synthetic */ Object f$0;

    public /* synthetic */ PreviewPager$$ExternalSyntheticLambda1(SliceLiveData.SliceLiveDataImpl sliceLiveDataImpl) {
        this.f$0 = sliceLiveDataImpl;
    }

    public /* synthetic */ PreviewPager$$ExternalSyntheticLambda1(DarkModeSectionController darkModeSectionController) {
        this.f$0 = darkModeSectionController;
    }

    public /* synthetic */ PreviewPager$$ExternalSyntheticLambda1(WallpaperPreviewer wallpaperPreviewer) {
        this.f$0 = wallpaperPreviewer;
    }

    public /* synthetic */ PreviewPager$$ExternalSyntheticLambda1(ImagePreviewFragment imagePreviewFragment) {
        this.f$0 = imagePreviewFragment;
    }

    public /* synthetic */ PreviewPager$$ExternalSyntheticLambda1(PreviewFragment previewFragment) {
        this.f$0 = previewFragment;
    }

    public /* synthetic */ PreviewPager$$ExternalSyntheticLambda1(WorkspaceSurfaceHolderCallback workspaceSurfaceHolderCallback) {
        this.f$0 = workspaceSurfaceHolderCallback;
    }

    public /* synthetic */ PreviewPager$$ExternalSyntheticLambda1(IndividualPickerFragment individualPickerFragment) {
        this.f$0 = individualPickerFragment;
    }

    public /* synthetic */ PreviewPager$$ExternalSyntheticLambda1(WallpaperSurfaceCallback wallpaperSurfaceCallback) {
        this.f$0 = wallpaperSurfaceCallback;
    }

    public /* synthetic */ PreviewPager$$ExternalSyntheticLambda1(PreviewPager previewPager) {
        this.f$0 = previewPager;
    }

    @Override // androidx.lifecycle.Observer
    public void onChanged(Object obj) {
        PreviewFragment previewFragment = (PreviewFragment) this.f$0;
        Interpolator interpolator = PreviewFragment.ALPHA_OUT;
        Objects.requireNonNull(previewFragment);
        int ordinal = ((SetWallpaperViewModel.SetWallpaperStatus) obj).ordinal();
        if (ordinal == 2) {
            Handler.getMain().postDelayed(new PreviewFragment$$ExternalSyntheticLambda2(previewFragment, 1), 300L);
        } else if (ordinal == 3) {
            SetWallpaperErrorDialogFragment newInstance = SetWallpaperErrorDialogFragment.newInstance(R.string.set_wallpaper_error_message, previewFragment.mSetWallpaperViewModel.mDestination);
            newInstance.setTargetFragment(previewFragment, 1);
            if (((BasePreviewActivity) previewFragment.requireActivity()).mIsSafeToCommitFragmentTransaction) {
                newInstance.show(previewFragment.getParentFragmentManager(), "set_wallpaper_error_dialog");
            } else {
                previewFragment.mStagedSetWallpaperErrorDialogFragment = newInstance;
            }
        }
    }

    @Override // com.android.wallpaper.asset.Asset.DrawableLoadedListener
    public void onDrawableLoaded() {
        CurrentWallpaperBottomSheetPresenter.RefreshListener refreshListener = (CurrentWallpaperBottomSheetPresenter.RefreshListener) this.f$0;
        if (refreshListener != null) {
            ((TopLevelPickerActivity) ((IndividualPickerFragment) refreshListener).mCurrentWallpaperBottomSheetPresenter).setCurrentWallpapersExpanded(true);
        }
    }

    @Override // com.android.wallpaper.util.FullScreenAnimation.FullScreenStatusListener
    public void onFullScreenStatusChange(boolean z) {
        ImagePreviewFragment imagePreviewFragment = (ImagePreviewFragment) this.f$0;
        imagePreviewFragment.mLockScreenPreviewer.setDateViewVisibility(!z);
        if (!z) {
            BottomActionBar bottomActionBar = ((PreviewFragment) imagePreviewFragment).mBottomActionBar;
            bottomActionBar.mActionMap.get(BottomActionBar.BottomAction.EDIT).sendAccessibilityEvent(8);
        }
    }

    @Override // com.android.wallpaper.module.PackageStatusNotifier.Listener
    public void onPackageChanged(String str, int i) {
        switch (this.$r8$classId) {
            case 10:
                IndividualPickerFragment individualPickerFragment = (IndividualPickerFragment) this.f$0;
                int i2 = IndividualPickerFragment.$r8$clinit;
                if (i != 3 || individualPickerFragment.mCategory.containsThirdParty(str)) {
                    individualPickerFragment.fetchWallpapers(true);
                    return;
                }
                return;
            case 11:
                IndividualPickerUnlockableFragment individualPickerUnlockableFragment = (IndividualPickerUnlockableFragment) this.f$0;
                int i3 = IndividualPickerUnlockableFragment.$r8$clinit;
                if (i != 3 || individualPickerUnlockableFragment.mCategory.containsThirdParty(str)) {
                    individualPickerUnlockableFragment.fetchWallpapers(true);
                    return;
                }
                return;
            default:
                WallpaperSurfaceCallback wallpaperSurfaceCallback = (WallpaperSurfaceCallback) this.f$0;
                Objects.requireNonNull(wallpaperSurfaceCallback);
                if (i != 3 && !wallpaperSurfaceCallback.mSurfaceCreated && wallpaperSurfaceCallback.mHost != null) {
                    wallpaperSurfaceCallback.setupSurfaceWallpaper(false);
                    return;
                }
                return;
        }
    }

    @Override // com.android.wallpaper.util.WallpaperSurfaceCallback.SurfaceListener
    public void onSurfaceCreated() {
        WallpaperPreviewer wallpaperPreviewer = (WallpaperPreviewer) this.f$0;
        ImageView imageView = wallpaperPreviewer.mWallpaperSurfaceCallback.mHomeImageWallpaper;
        if (wallpaperPreviewer.mWallpaper != null && imageView != null) {
            imageView.post(new WallpaperPreviewer$$ExternalSyntheticLambda1(wallpaperPreviewer, imageView));
        }
    }

    @Override // com.android.wallpaper.picker.SectionView.SectionViewListener
    public void onViewActivated(final Context context, final boolean z) {
        final DarkModeSectionController darkModeSectionController = (DarkModeSectionController) this.f$0;
        ExecutorService executorService = DarkModeSectionController.sExecutorService;
        Objects.requireNonNull(darkModeSectionController);
        if (context != null) {
            if (!((Switch) darkModeSectionController.mDarkModeSectionView.findViewById(R.id.dark_mode_toggle)).isEnabled()) {
                Context context2 = darkModeSectionController.mContext;
                Toast.makeText(context2, context2.getString(R.string.mode_disabled_msg), 0).show();
                return;
            }
            final UiModeManager uiModeManager = (UiModeManager) context.getSystemService(UiModeManager.class);
            new Handler(Looper.getMainLooper()).postDelayed(new Runnable() { // from class: com.android.customization.model.mode.DarkModeSectionController$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    DarkModeSectionController darkModeSectionController2 = DarkModeSectionController.this;
                    Context context3 = context;
                    UiModeManager uiModeManager2 = uiModeManager;
                    boolean z2 = z;
                    darkModeSectionController2.mDarkModeSectionView.announceForAccessibility(context3.getString(R.string.mode_changed));
                    uiModeManager2.setNightModeActivated(z2);
                }
            }, context.getResources().getInteger(17694720));
        }
    }
}
