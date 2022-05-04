package com.android.wallpaper.module;

import android.app.Activity;
import android.app.ProgressDialog;
import android.app.WallpaperColors;
import android.app.WallpaperManager;
import android.graphics.Rect;
import androidx.fragment.app.FragmentActivity;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleEventObserver;
import androidx.lifecycle.LifecycleOwner;
import com.android.systemui.shared.R;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.model.LiveWallpaperInfo;
import com.android.wallpaper.model.SetWallpaperViewModel;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.module.WallpaperPersister;
import com.bumptech.glide.Glide;
import java.io.IOException;
import java.util.Optional;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
/* loaded from: classes.dex */
public final class WallpaperSetter {
    public final WallpaperPreferences mPreferences;
    public ProgressDialog mProgressDialog;
    public final boolean mTestingModeEnabled;
    public final UserEventLogger mUserEventLogger;
    public final WallpaperPersister mWallpaperPersister;
    public final ExecutorService mSingleThreadExecutor = Executors.newSingleThreadExecutor();
    public Optional<Integer> mCurrentScreenOrientation = Optional.empty();

    public final void onWallpaperApplied(WallpaperInfo wallpaperInfo, Activity activity) {
        this.mUserEventLogger.logWallpaperSet(wallpaperInfo.getCollectionId(activity), wallpaperInfo.getWallpaperId());
        this.mPreferences.setPendingWallpaperSetStatus(0);
        this.mUserEventLogger.logWallpaperSetResult(0);
        ProgressDialog progressDialog = this.mProgressDialog;
        if (progressDialog != null) {
            progressDialog.dismiss();
            this.mProgressDialog = null;
        }
        this.mCurrentScreenOrientation.ifPresent(new WallpaperSetter$$ExternalSyntheticLambda1(this, activity));
    }

    public final void saveAndLockScreenOrientationIfNeeded(FragmentActivity fragmentActivity) {
        if (!this.mCurrentScreenOrientation.isPresent()) {
            this.mCurrentScreenOrientation = Optional.of(Integer.valueOf(fragmentActivity.getRequestedOrientation()));
            fragmentActivity.setRequestedOrientation(14);
        }
    }

    public final void setCurrentWallpaper(final FragmentActivity fragmentActivity, final WallpaperInfo wallpaperInfo, Asset asset, int i, float f, Rect rect, final WallpaperColors wallpaperColors, final SetWallpaperViewModel.AnonymousClass1 r15) {
        int i2 = 1;
        if (wallpaperInfo instanceof LiveWallpaperInfo) {
            final LiveWallpaperInfo liveWallpaperInfo = (LiveWallpaperInfo) wallpaperInfo;
            try {
                saveAndLockScreenOrientationIfNeeded(fragmentActivity);
                if (i != 1) {
                    WallpaperManager wallpaperManager = WallpaperManager.getInstance(fragmentActivity);
                    wallpaperManager.setWallpaperComponent(liveWallpaperInfo.mInfo.getComponent());
                    wallpaperManager.setWallpaperOffsetSteps(0.5f, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                    wallpaperManager.setWallpaperOffsets(fragmentActivity.getWindow().getDecorView().getRootView().getWindowToken(), 0.5f, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                    if (i == 2) {
                        wallpaperManager.clear(2);
                    }
                    this.mSingleThreadExecutor.execute(new Runnable() { // from class: com.android.wallpaper.module.WallpaperSetter$$ExternalSyntheticLambda0
                        @Override // java.lang.Runnable
                        public final void run() {
                            WallpaperSetter wallpaperSetter = WallpaperSetter.this;
                            LiveWallpaperInfo liveWallpaperInfo2 = liveWallpaperInfo;
                            WallpaperColors wallpaperColors2 = wallpaperColors;
                            Activity activity = fragmentActivity;
                            WallpaperPreferences wallpaperPreferences = wallpaperSetter.mPreferences;
                            String wallpaperId = liveWallpaperInfo2.getWallpaperId();
                            if (wallpaperColors2 == null) {
                                wallpaperColors2 = WallpaperColors.fromBitmap(liveWallpaperInfo2.getThumbAsset(activity).getLowResBitmap(activity));
                            }
                            wallpaperPreferences.storeLatestHomeWallpaper(wallpaperId, liveWallpaperInfo2, wallpaperColors2);
                        }
                    });
                    onWallpaperApplied(liveWallpaperInfo, fragmentActivity);
                    r15.onSuccess(liveWallpaperInfo);
                    return;
                }
                throw new IllegalArgumentException("Live wallpaper cannot be applied on lock screen only");
            } catch (IOException | RuntimeException e) {
                this.mPreferences.setPendingWallpaperSetStatus(0);
                this.mUserEventLogger.logWallpaperSetResult(1);
                Throwable th = e;
                while (true) {
                    if (th == null) {
                        i2 = 0;
                        break;
                    } else if (th instanceof OutOfMemoryError) {
                        break;
                    } else {
                        th = th.getCause();
                    }
                }
                this.mUserEventLogger.logWallpaperSetFailureReason(i2);
                ProgressDialog progressDialog = this.mProgressDialog;
                if (progressDialog != null) {
                    progressDialog.dismiss();
                    this.mProgressDialog = null;
                }
                this.mCurrentScreenOrientation.ifPresent(new WallpaperSetter$$ExternalSyntheticLambda1(this, fragmentActivity));
                r15.onError(e);
            }
        } else {
            this.mPreferences.setPendingWallpaperSetStatus(1);
            saveAndLockScreenOrientationIfNeeded(fragmentActivity);
            Glide.get(fragmentActivity).clearMemory();
            if (!this.mTestingModeEnabled && !fragmentActivity.isFinishing()) {
                ProgressDialog progressDialog2 = new ProgressDialog(fragmentActivity, R.style.LightDialogTheme);
                this.mProgressDialog = progressDialog2;
                progressDialog2.setTitle((CharSequence) null);
                this.mProgressDialog.setMessage(fragmentActivity.getString(R.string.set_wallpaper_progress_message));
                this.mProgressDialog.setIndeterminate(true);
                fragmentActivity.getLifecycle().addObserver(new LifecycleEventObserver() { // from class: com.android.wallpaper.module.WallpaperSetter.1
                    @Override // androidx.lifecycle.LifecycleEventObserver
                    public final void onStateChanged(LifecycleOwner lifecycleOwner, Lifecycle.Event event) {
                        ProgressDialog progressDialog3;
                        if (event == Lifecycle.Event.ON_DESTROY && (progressDialog3 = WallpaperSetter.this.mProgressDialog) != null) {
                            progressDialog3.dismiss();
                            WallpaperSetter.this.mProgressDialog = null;
                        }
                    }
                });
                this.mProgressDialog.show();
            }
            ((DefaultWallpaperPersister) this.mWallpaperPersister).setIndividualWallpaper(wallpaperInfo, asset, rect, f, i, new WallpaperPersister.SetWallpaperCallback() { // from class: com.android.wallpaper.module.WallpaperSetter.2
                @Override // com.android.wallpaper.module.WallpaperPersister.SetWallpaperCallback
                public final void onError(Throwable th2) {
                    WallpaperSetter wallpaperSetter = WallpaperSetter.this;
                    Activity activity = fragmentActivity;
                    int i3 = 0;
                    wallpaperSetter.mPreferences.setPendingWallpaperSetStatus(0);
                    wallpaperSetter.mUserEventLogger.logWallpaperSetResult(1);
                    Throwable th3 = th2;
                    while (true) {
                        if (th3 == null) {
                            break;
                        } else if (th3 instanceof OutOfMemoryError) {
                            i3 = 1;
                            break;
                        } else {
                            th3 = th3.getCause();
                        }
                    }
                    wallpaperSetter.mUserEventLogger.logWallpaperSetFailureReason(i3);
                    ProgressDialog progressDialog3 = wallpaperSetter.mProgressDialog;
                    if (progressDialog3 != null) {
                        progressDialog3.dismiss();
                        wallpaperSetter.mProgressDialog = null;
                    }
                    wallpaperSetter.mCurrentScreenOrientation.ifPresent(new WallpaperSetter$$ExternalSyntheticLambda1(wallpaperSetter, activity));
                    WallpaperPersister.SetWallpaperCallback setWallpaperCallback = r15;
                    if (setWallpaperCallback != null) {
                        setWallpaperCallback.onError(th2);
                    }
                }

                @Override // com.android.wallpaper.module.WallpaperPersister.SetWallpaperCallback
                public final void onSuccess(WallpaperInfo wallpaperInfo2) {
                    WallpaperSetter.this.onWallpaperApplied(wallpaperInfo, fragmentActivity);
                    WallpaperPersister.SetWallpaperCallback setWallpaperCallback = r15;
                    if (setWallpaperCallback != null) {
                        setWallpaperCallback.onSuccess(wallpaperInfo);
                    }
                }
            });
        }
    }

    public WallpaperSetter(WallpaperPersister wallpaperPersister, WallpaperPreferences wallpaperPreferences, UserEventLogger userEventLogger, boolean z) {
        this.mTestingModeEnabled = z;
        this.mWallpaperPersister = wallpaperPersister;
        this.mPreferences = wallpaperPreferences;
        this.mUserEventLogger = userEventLogger;
    }

    /* JADX WARN: Code restructure failed: missing block: B:8:0x0028, code lost:
        if (com.google.android.gms.common.util.zzh.isHomeStaticWallpaperSet(r8) == false) goto L10;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void requestDestination(final androidx.fragment.app.FragmentActivity r8, androidx.fragment.app.FragmentManager r9, final com.android.wallpaper.picker.SetWallpaperDialogFragment.Listener r10, boolean r11) {
        /*
            r7 = this;
            r7.saveAndLockScreenOrientationIfNeeded(r8)
            com.android.wallpaper.module.WallpaperSetter$3 r0 = new com.android.wallpaper.module.WallpaperSetter$3
            r0.<init>()
            com.android.wallpaper.module.Injector r1 = androidx.cardview.R$style.getInjector()
            com.google.android.gms.common.util.zzh r1 = r1.getWallpaperStatusChecker()
            android.app.WallpaperManager r2 = android.app.WallpaperManager.getInstance(r8)
            android.app.WallpaperInfo r2 = r2.getWallpaperInfo()
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L1e
            r2 = r3
            goto L1f
        L1e:
            r2 = r4
        L1f:
            if (r2 != 0) goto L2b
            r1.getClass()
            boolean r5 = com.google.android.gms.common.util.zzh.isHomeStaticWallpaperSet(r8)
            if (r5 != 0) goto L2b
            goto L2c
        L2b:
            r3 = r4
        L2c:
            com.android.wallpaper.picker.SetWallpaperDialogFragment r5 = new com.android.wallpaper.picker.SetWallpaperDialogFragment
            r5.<init>()
            r6 = 2131820843(0x7f11012b, float:1.9274412E38)
            r5.mTitleResId = r6
            r5.mListener = r0
            if (r2 != 0) goto L3c
            if (r3 == 0) goto L5b
        L3c:
            r1.getClass()
            boolean r0 = com.google.android.gms.common.util.zzh.isLockWallpaperSet(r8)
            if (r0 != 0) goto L5b
            if (r11 == 0) goto L56
            r9 = 2
            r10.onSet(r9)
            java.util.Optional<java.lang.Integer> r9 = r7.mCurrentScreenOrientation
            com.android.wallpaper.module.WallpaperSetter$$ExternalSyntheticLambda1 r10 = new com.android.wallpaper.module.WallpaperSetter$$ExternalSyntheticLambda1
            r10.<init>(r7, r8)
            r9.ifPresent(r10)
            goto L67
        L56:
            r5.mHomeAvailable = r4
            r5.updateButtonsVisibility()
        L5b:
            if (r11 == 0) goto L62
            r5.mLockAvailable = r4
            r5.updateButtonsVisibility()
        L62:
            java.lang.String r7 = "set_wallpaper_dialog"
            r5.show(r9, r7)
        L67:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.wallpaper.module.WallpaperSetter.requestDestination(androidx.fragment.app.FragmentActivity, androidx.fragment.app.FragmentManager, com.android.wallpaper.picker.SetWallpaperDialogFragment$Listener, boolean):void");
    }
}
