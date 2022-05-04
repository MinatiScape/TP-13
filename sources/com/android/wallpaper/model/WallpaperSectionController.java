package com.android.wallpaper.model;

import android.animation.Animator;
import android.app.Activity;
import android.app.WallpaperColors;
import android.app.WallpaperInfo;
import android.app.WallpaperManager;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.SurfaceView;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import androidx.activity.ComponentActivity$$ExternalSyntheticLambda2;
import androidx.appcompat.R$bool;
import androidx.cardview.R$style;
import androidx.cardview.widget.CardView;
import androidx.core.widget.ContentLoadingProgressBar;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentViewLifecycleOwner;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleObserver;
import androidx.lifecycle.LifecycleOwner;
import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.OnLifecycleEvent;
import com.android.systemui.shared.R;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.android.wallpaper.asset.BitmapCachingAsset;
import com.android.wallpaper.model.CustomizationSectionController;
import com.android.wallpaper.module.CurrentWallpaperInfoFactory;
import com.android.wallpaper.module.DefaultCurrentWallpaperInfoFactory;
import com.android.wallpaper.module.UserEventLogger;
import com.android.wallpaper.picker.WallpaperSectionView;
import com.android.wallpaper.picker.WorkspaceSurfaceHolderCallback;
import com.android.wallpaper.util.WallpaperConnection;
import com.android.wallpaper.util.WallpaperSurfaceCallback;
import com.android.wallpaper.widget.LockScreenPreviewer;
import com.android.wallpaper.widget.LockScreenPreviewer$$ExternalSyntheticLambda1;
import com.android.wallpaper.widget.LockScreenPreviewer$$ExternalSyntheticLambda2;
import com.google.android.apps.wallpaper.module.CompositeUserEventLogger;
/* loaded from: classes.dex */
public class WallpaperSectionController implements CustomizationSectionController<WallpaperSectionView>, LifecycleObserver {
    public final Activity mActivity;
    public final Context mAppContext;
    public CardView mHomePreviewCard;
    public ContentLoadingProgressBar mHomePreviewProgress;
    public WallpaperInfo mHomePreviewWallpaperInfo;
    public SurfaceView mHomeWallpaperSurface;
    public WallpaperSurfaceCallback mHomeWallpaperSurfaceCallback;
    public final LifecycleOwner mLifecycleOwner;
    public ViewGroup mLockPreviewContainer;
    public WallpaperInfo mLockPreviewWallpaperInfo;
    public LockScreenPreviewer mLockScreenPreviewer;
    public SurfaceView mLockWallpaperSurface;
    public WallpaperSurfaceCallback mLockWallpaperSurfaceCallback;
    public CardView mLockscreenPreviewCard;
    public ContentLoadingProgressBar mLockscreenPreviewProgress;
    public final PermissionRequester mPermissionRequester;
    public final Bundle mSavedInstanceState;
    public final CustomizationSectionController.CustomizationSectionNavigationController mSectionNavigationController;
    public final WallpaperColorsViewModel mWallpaperColorsViewModel;
    public WallpaperConnection mWallpaperConnection;
    public final WallpaperPreviewNavigator mWallpaperPreviewNavigator;
    public SurfaceView mWorkspaceSurface;
    public WorkspaceSurfaceHolderCallback mWorkspaceSurfaceCallback;
    public final WorkspaceViewModel mWorkspaceViewModel;

    @Override // com.android.wallpaper.model.CustomizationSectionController
    public final boolean isAvailable(Context context) {
        return true;
    }

    public final void setupFade(CardView cardView, final ContentLoadingProgressBar contentLoadingProgressBar, int i) {
        cardView.setAlpha(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        long j = i;
        cardView.animate().alpha(1.0f).setDuration(j).setListener(new Animator.AnimatorListener() { // from class: com.android.wallpaper.model.WallpaperSectionController.3
            @Override // android.animation.Animator.AnimatorListener
            public final void onAnimationRepeat(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public final void onAnimationCancel(Animator animator) {
                contentLoadingProgressBar.hide();
                WallpaperSectionController.m26$$Nest$msetWallpaperPreviewsVisibility(WallpaperSectionController.this, 0);
            }

            @Override // android.animation.Animator.AnimatorListener
            public final void onAnimationEnd(Animator animator) {
                contentLoadingProgressBar.hide();
                WallpaperSectionController.m26$$Nest$msetWallpaperPreviewsVisibility(WallpaperSectionController.this, 0);
            }

            @Override // android.animation.Animator.AnimatorListener
            public final void onAnimationStart(Animator animator) {
                WallpaperSectionController.m26$$Nest$msetWallpaperPreviewsVisibility(WallpaperSectionController.this, 4);
            }
        });
        contentLoadingProgressBar.animate().alpha(1.0f).setDuration(i * 2).setStartDelay(j).withStartAction(new ComponentActivity$$ExternalSyntheticLambda2(contentLoadingProgressBar, 2)).withEndAction(new LockScreenPreviewer$$ExternalSyntheticLambda1(contentLoadingProgressBar, 2));
    }

    /* renamed from: -$$Nest$msetWallpaperPreviewsVisibility  reason: not valid java name */
    public static void m26$$Nest$msetWallpaperPreviewsVisibility(WallpaperSectionController wallpaperSectionController, int i) {
        SurfaceView surfaceView = wallpaperSectionController.mHomeWallpaperSurface;
        if (surfaceView != null) {
            surfaceView.setVisibility(i);
        }
        SurfaceView surfaceView2 = wallpaperSectionController.mLockWallpaperSurface;
        if (surfaceView2 != null) {
            surfaceView2.setVisibility(i);
        }
        SurfaceView surfaceView3 = wallpaperSectionController.mWorkspaceSurface;
        if (surfaceView3 != null) {
            surfaceView3.setVisibility(i);
        }
        ViewGroup viewGroup = wallpaperSectionController.mLockPreviewContainer;
        if (viewGroup != null) {
            viewGroup.setVisibility(i);
        }
    }

    public final boolean isActivityAlive() {
        if (this.mActivity.isDestroyed() || this.mActivity.isFinishing()) {
            return false;
        }
        return true;
    }

    public final void maybeLoadThumbnail(WallpaperInfo wallpaperInfo, WallpaperSurfaceCallback wallpaperSurfaceCallback) {
        ImageView imageView = wallpaperSurfaceCallback.mHomeImageWallpaper;
        Context context = this.mAppContext;
        BitmapCachingAsset bitmapCachingAsset = new BitmapCachingAsset(context, wallpaperInfo.getThumbAsset(context));
        if (imageView != null && imageView.getDrawable() == null) {
            Activity activity = this.mActivity;
            bitmapCachingAsset.loadPreviewImage(activity, imageView, R$bool.getColorAttr(activity, 16844080));
        }
    }

    public final void onHomeWallpaperColorsChanged(WallpaperColors wallpaperColors) {
        if (wallpaperColors != null) {
            Object obj = ((MutableLiveData) this.mWallpaperColorsViewModel.homeWallpaperColors$delegate.getValue()).mData;
            if (obj == LiveData.NOT_SET) {
                obj = null;
            }
            if (wallpaperColors.equals(obj)) {
                return;
            }
        }
        ((MutableLiveData) this.mWallpaperColorsViewModel.homeWallpaperColors$delegate.getValue()).setValue(wallpaperColors);
    }

    public final void onLockWallpaperColorsChanged(WallpaperColors wallpaperColors) {
        if (wallpaperColors != null) {
            Object obj = ((MutableLiveData) this.mWallpaperColorsViewModel.lockWallpaperColors$delegate.getValue()).mData;
            if (obj == LiveData.NOT_SET) {
                obj = null;
            }
            if (wallpaperColors.equals(obj)) {
                return;
            }
        }
        ((MutableLiveData) this.mWallpaperColorsViewModel.lockWallpaperColors$delegate.getValue()).setValue(wallpaperColors);
        LockScreenPreviewer lockScreenPreviewer = this.mLockScreenPreviewer;
        if (lockScreenPreviewer != null) {
            lockScreenPreviewer.setColor(wallpaperColors);
        }
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_PAUSE)
    public void onPause() {
        WallpaperConnection wallpaperConnection = this.mWallpaperConnection;
        if (wallpaperConnection != null) {
            wallpaperConnection.setVisibility(false);
        }
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_RESUME)
    public void onResume() {
        boolean z;
        if (this.mSavedInstanceState == null) {
            z = true;
        } else {
            z = false;
        }
        ((DefaultCurrentWallpaperInfoFactory) R$style.getInjector().getCurrentWallpaperFactory(this.mAppContext)).createCurrentWallpaperInfos(new CurrentWallpaperInfoFactory.WallpaperInfoCallback() { // from class: com.android.wallpaper.model.WallpaperSectionController$$ExternalSyntheticLambda4
            @Override // com.android.wallpaper.module.CurrentWallpaperInfoFactory.WallpaperInfoCallback
            public final void onWallpaperInfoCreated(WallpaperInfo wallpaperInfo, WallpaperInfo wallpaperInfo2) {
                WallpaperInfo wallpaperInfo3;
                WallpaperSectionController wallpaperSectionController = WallpaperSectionController.this;
                if (wallpaperSectionController.isActivityAlive()) {
                    wallpaperSectionController.mHomePreviewWallpaperInfo = wallpaperInfo;
                    if (wallpaperInfo2 == null) {
                        wallpaperInfo3 = wallpaperInfo;
                    } else {
                        wallpaperInfo3 = wallpaperInfo2;
                    }
                    wallpaperSectionController.mLockPreviewWallpaperInfo = wallpaperInfo3;
                    wallpaperInfo.computePlaceholderColor(wallpaperSectionController.mAppContext);
                    if (wallpaperInfo2 != null) {
                        wallpaperInfo2.computePlaceholderColor(wallpaperSectionController.mAppContext);
                    }
                    wallpaperSectionController.updatePreview(wallpaperSectionController.mHomePreviewWallpaperInfo, true);
                    wallpaperSectionController.updatePreview(wallpaperSectionController.mLockPreviewWallpaperInfo, false);
                    WallpaperManager wallpaperManager = WallpaperManager.getInstance(wallpaperSectionController.mAppContext);
                    WallpaperColors wallpaperColors = wallpaperManager.getWallpaperColors(1);
                    wallpaperSectionController.onHomeWallpaperColorsChanged(wallpaperColors);
                    if (wallpaperInfo2 != null) {
                        wallpaperColors = wallpaperManager.getWallpaperColors(2);
                    }
                    wallpaperSectionController.onLockWallpaperColorsChanged(wallpaperColors);
                }
            }
        }, z);
        WallpaperConnection wallpaperConnection = this.mWallpaperConnection;
        if (wallpaperConnection != null) {
            wallpaperConnection.setVisibility(true);
        }
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_STOP)
    public void onStop() {
        WallpaperConnection wallpaperConnection = this.mWallpaperConnection;
        if (wallpaperConnection != null) {
            wallpaperConnection.disconnect();
            this.mWallpaperConnection = null;
        }
    }

    @Override // com.android.wallpaper.model.CustomizationSectionController
    public final void onTransitionOut() {
        SurfaceView surfaceView = this.mHomeWallpaperSurface;
        if (surfaceView != null) {
            surfaceView.setUseAlpha();
            this.mHomeWallpaperSurface.setAlpha(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        }
        SurfaceView surfaceView2 = this.mLockWallpaperSurface;
        if (surfaceView2 != null) {
            surfaceView2.setUseAlpha();
            this.mLockWallpaperSurface.setAlpha(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        }
        SurfaceView surfaceView3 = this.mWorkspaceSurface;
        if (surfaceView3 != null) {
            surfaceView3.setUseAlpha();
            this.mWorkspaceSurface.setAlpha(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        }
        ViewGroup viewGroup = this.mLockPreviewContainer;
        if (viewGroup != null) {
            viewGroup.setAlpha(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
        }
    }

    @Override // com.android.wallpaper.model.CustomizationSectionController
    public final void release() {
        LockScreenPreviewer lockScreenPreviewer = this.mLockScreenPreviewer;
        if (lockScreenPreviewer != null) {
            lockScreenPreviewer.release();
            this.mLockScreenPreviewer = null;
        }
        WallpaperSurfaceCallback wallpaperSurfaceCallback = this.mHomeWallpaperSurfaceCallback;
        if (wallpaperSurfaceCallback != null) {
            wallpaperSurfaceCallback.cleanUp();
        }
        WallpaperSurfaceCallback wallpaperSurfaceCallback2 = this.mLockWallpaperSurfaceCallback;
        if (wallpaperSurfaceCallback2 != null) {
            wallpaperSurfaceCallback2.cleanUp();
        }
        WorkspaceSurfaceHolderCallback workspaceSurfaceHolderCallback = this.mWorkspaceSurfaceCallback;
        if (workspaceSurfaceHolderCallback != null) {
            workspaceSurfaceHolderCallback.cleanUp();
        }
        this.mLifecycleOwner.getLifecycle().removeObserver(this);
    }

    public final void updatePreview(final WallpaperInfo wallpaperInfo, final boolean z) {
        WallpaperSurfaceCallback wallpaperSurfaceCallback;
        CardView cardView;
        if (wallpaperInfo != null && isActivityAlive()) {
            final CompositeUserEventLogger userEventLogger = R$style.getInjector().getUserEventLogger(this.mAppContext);
            if (z) {
                wallpaperSurfaceCallback = this.mHomeWallpaperSurfaceCallback;
            } else {
                wallpaperSurfaceCallback = this.mLockWallpaperSurfaceCallback;
            }
            maybeLoadThumbnail(wallpaperInfo, wallpaperSurfaceCallback);
            if (z) {
                WallpaperConnection wallpaperConnection = this.mWallpaperConnection;
                SurfaceView surfaceView = null;
                if (wallpaperConnection != null) {
                    wallpaperConnection.disconnect();
                    this.mWallpaperConnection = null;
                }
                if ((wallpaperInfo instanceof LiveWallpaperInfo) && isActivityAlive() && WallpaperConnection.isPreviewAvailable()) {
                    final boolean z2 = this.mLockPreviewWallpaperInfo instanceof LiveWallpaperInfo;
                    WallpaperInfo wallpaperComponent = wallpaperInfo.getWallpaperComponent();
                    Intent className = new Intent("android.service.wallpaper.WallpaperService").setClassName(wallpaperComponent.getPackageName(), wallpaperComponent.getServiceName());
                    Activity activity = this.mActivity;
                    WallpaperConnection.WallpaperConnectionListener wallpaperConnectionListener = new WallpaperConnection.WallpaperConnectionListener() { // from class: com.android.wallpaper.model.WallpaperSectionController.2
                        @Override // com.android.wallpaper.util.WallpaperConnection.WallpaperConnectionListener
                        public final void onWallpaperColorsChanged(WallpaperColors wallpaperColors, int i) {
                            LockScreenPreviewer lockScreenPreviewer;
                            if (z2 && (lockScreenPreviewer = WallpaperSectionController.this.mLockScreenPreviewer) != null) {
                                lockScreenPreviewer.setColor(wallpaperColors);
                                WallpaperSectionController.this.onLockWallpaperColorsChanged(wallpaperColors);
                            }
                            WallpaperSectionController.this.onHomeWallpaperColorsChanged(wallpaperColors);
                        }
                    };
                    SurfaceView surfaceView2 = this.mHomeWallpaperSurface;
                    if (z2) {
                        surfaceView = this.mLockWallpaperSurface;
                    }
                    WallpaperConnection wallpaperConnection2 = new WallpaperConnection(className, activity, wallpaperConnectionListener, surfaceView2, surfaceView);
                    this.mWallpaperConnection = wallpaperConnection2;
                    wallpaperConnection2.setVisibility(true);
                    this.mHomeWallpaperSurface.post(new LockScreenPreviewer$$ExternalSyntheticLambda2(this, 2));
                }
            }
            if (z) {
                cardView = this.mHomePreviewCard;
            } else {
                cardView = this.mLockscreenPreviewCard;
            }
            cardView.setOnClickListener(new View.OnClickListener() { // from class: com.android.wallpaper.model.WallpaperSectionController$$ExternalSyntheticLambda2
                @Override // android.view.View.OnClickListener
                public final void onClick(View view) {
                    WallpaperSectionController wallpaperSectionController = WallpaperSectionController.this;
                    WallpaperInfo wallpaperInfo2 = wallpaperInfo;
                    boolean z3 = z;
                    UserEventLogger userEventLogger2 = userEventLogger;
                    wallpaperSectionController.mWallpaperPreviewNavigator.showViewOnlyPreview(wallpaperInfo2, z3);
                    userEventLogger2.logCurrentWallpaperPreviewed();
                }
            });
        }
    }

    public WallpaperSectionController(FragmentActivity fragmentActivity, FragmentViewLifecycleOwner fragmentViewLifecycleOwner, PermissionRequester permissionRequester, WallpaperColorsViewModel wallpaperColorsViewModel, WorkspaceViewModel workspaceViewModel, CustomizationSectionController.CustomizationSectionNavigationController customizationSectionNavigationController, WallpaperPreviewNavigator wallpaperPreviewNavigator, Bundle bundle) {
        this.mActivity = fragmentActivity;
        this.mLifecycleOwner = fragmentViewLifecycleOwner;
        this.mPermissionRequester = permissionRequester;
        this.mAppContext = fragmentActivity.getApplicationContext();
        this.mWallpaperColorsViewModel = wallpaperColorsViewModel;
        this.mWorkspaceViewModel = workspaceViewModel;
        this.mSectionNavigationController = customizationSectionNavigationController;
        this.mWallpaperPreviewNavigator = wallpaperPreviewNavigator;
        this.mSavedInstanceState = bundle;
    }

    public static void showCurrentWallpaper(View view, boolean z) {
        int i;
        int i2;
        View findViewById = view.findViewById(R.id.home_preview);
        int i3 = 0;
        if (z) {
            i = 0;
        } else {
            i = 8;
        }
        findViewById.setVisibility(i);
        View findViewById2 = view.findViewById(R.id.lock_preview);
        if (z) {
            i2 = 0;
        } else {
            i2 = 8;
        }
        findViewById2.setVisibility(i2);
        View findViewById3 = view.findViewById(R.id.permission_needed);
        if (z) {
            i3 = 8;
        }
        findViewById3.setVisibility(i3);
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x011a  */
    /* JADX WARN: Removed duplicated region for block: B:16:0x011e  */
    @Override // com.android.wallpaper.model.CustomizationSectionController
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final com.android.wallpaper.picker.WallpaperSectionView createView(android.content.Context r14) {
        /*
            Method dump skipped, instructions count: 461
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.wallpaper.model.WallpaperSectionController.createView(android.content.Context):com.android.wallpaper.picker.SectionView");
    }
}
