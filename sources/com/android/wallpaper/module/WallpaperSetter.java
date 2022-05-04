package com.android.wallpaper.module;

import android.app.Activity;
import android.app.ProgressDialog;
import android.app.WallpaperColors;
import android.app.WallpaperManager;
import android.graphics.Rect;
import androidx.fragment.app.FragmentManager;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleEventObserver;
import androidx.lifecycle.LifecycleOwner;
import androidx.lifecycle.runtime.R$id;
import com.android.systemui.shared.R;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.model.LiveWallpaperInfo;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.module.WallpaperPersister;
import com.android.wallpaper.picker.SetWallpaperDialogFragment;
import com.bumptech.glide.Glide;
import com.google.android.material.shape.EdgeTreatment;
import java.io.IOException;
import java.util.Optional;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
/* loaded from: classes.dex */
public class WallpaperSetter {
    public final WallpaperPreferences mPreferences;
    public ProgressDialog mProgressDialog;
    public final boolean mTestingModeEnabled;
    public final UserEventLogger mUserEventLogger;
    public final WallpaperPersister mWallpaperPersister;
    public final ExecutorService mSingleThreadExecutor = Executors.newSingleThreadExecutor();
    public Optional<Integer> mCurrentScreenOrientation = Optional.empty();

    public WallpaperSetter(WallpaperPersister wallpaperPersister, WallpaperPreferences wallpaperPreferences, UserEventLogger userEventLogger, boolean z) {
        this.mTestingModeEnabled = z;
        this.mWallpaperPersister = wallpaperPersister;
        this.mPreferences = wallpaperPreferences;
        this.mUserEventLogger = userEventLogger;
    }

    public void cleanUp() {
        ProgressDialog progressDialog = this.mProgressDialog;
        if (progressDialog != null) {
            progressDialog.dismiss();
            this.mProgressDialog = null;
        }
    }

    public final void onWallpaperApplied(WallpaperInfo wallpaperInfo, Activity activity) {
        this.mUserEventLogger.logWallpaperSet(wallpaperInfo.getCollectionId(activity), wallpaperInfo.getWallpaperId());
        this.mPreferences.setPendingWallpaperSetStatus(0);
        this.mUserEventLogger.logWallpaperSetResult(0);
        cleanUp();
        this.mCurrentScreenOrientation.ifPresent(new WallpaperSetter$$ExternalSyntheticLambda1(this, activity));
    }

    public final void onWallpaperApplyError(Throwable th, Activity activity) {
        this.mPreferences.setPendingWallpaperSetStatus(0);
        this.mUserEventLogger.logWallpaperSetResult(1);
        this.mUserEventLogger.logWallpaperSetFailureReason(R$id.isOOM(th) ? 1 : 0);
        cleanUp();
        this.mCurrentScreenOrientation.ifPresent(new WallpaperSetter$$ExternalSyntheticLambda1(this, activity));
    }

    public void requestDestination(final Activity activity, FragmentManager fragmentManager, final SetWallpaperDialogFragment.Listener listener, boolean z) {
        saveAndLockScreenOrientationIfNeeded(activity);
        SetWallpaperDialogFragment.Listener listener2 = new SetWallpaperDialogFragment.Listener() { // from class: com.android.wallpaper.module.WallpaperSetter.3
            @Override // com.android.wallpaper.picker.SetWallpaperDialogFragment.Listener
            public void onDialogDismissed(boolean z2) {
                if (!z2) {
                    WallpaperSetter wallpaperSetter = WallpaperSetter.this;
                    wallpaperSetter.mCurrentScreenOrientation.ifPresent(new WallpaperSetter$$ExternalSyntheticLambda1(wallpaperSetter, activity));
                }
                SetWallpaperDialogFragment.Listener listener3 = listener;
                if (listener3 != null) {
                    listener3.onDialogDismissed(z2);
                }
            }

            @Override // com.android.wallpaper.picker.SetWallpaperDialogFragment.Listener
            public void onSet(int i) {
                SetWallpaperDialogFragment.Listener listener3 = listener;
                if (listener3 != null) {
                    listener3.onSet(i);
                }
            }
        };
        EdgeTreatment wallpaperStatusChecker = InjectorProvider.getInjector().getWallpaperStatusChecker();
        boolean z2 = true;
        boolean z3 = WallpaperManager.getInstance(activity).getWallpaperInfo() != null;
        if (z3 || wallpaperStatusChecker.isHomeStaticWallpaperSet(activity)) {
            z2 = false;
        }
        SetWallpaperDialogFragment setWallpaperDialogFragment = new SetWallpaperDialogFragment();
        setWallpaperDialogFragment.mTitleResId = R.string.set_wallpaper_dialog_message;
        setWallpaperDialogFragment.mListener = listener2;
        if ((z3 || z2) && !wallpaperStatusChecker.isLockWallpaperSet(activity)) {
            if (z) {
                listener.onSet(2);
                this.mCurrentScreenOrientation.ifPresent(new WallpaperSetter$$ExternalSyntheticLambda1(this, activity));
                return;
            }
            setWallpaperDialogFragment.mHomeAvailable = false;
            setWallpaperDialogFragment.updateButtonsVisibility();
        }
        if (z) {
            setWallpaperDialogFragment.mLockAvailable = false;
            setWallpaperDialogFragment.updateButtonsVisibility();
        }
        setWallpaperDialogFragment.show(fragmentManager, "set_wallpaper_dialog");
    }

    public final void saveAndLockScreenOrientationIfNeeded(Activity activity) {
        if (!this.mCurrentScreenOrientation.isPresent()) {
            this.mCurrentScreenOrientation = Optional.of(Integer.valueOf(activity.getRequestedOrientation()));
            activity.setRequestedOrientation(14);
        }
    }

    public void setCurrentWallpaper(final Activity activity, final WallpaperInfo wallpaperInfo, Asset asset, int i, float f, Rect rect, final WallpaperColors wallpaperColors, final WallpaperPersister.SetWallpaperCallback setWallpaperCallback) {
        if (wallpaperInfo instanceof LiveWallpaperInfo) {
            final LiveWallpaperInfo liveWallpaperInfo = (LiveWallpaperInfo) wallpaperInfo;
            try {
                saveAndLockScreenOrientationIfNeeded(activity);
                if (i != 1) {
                    WallpaperManager wallpaperManager = WallpaperManager.getInstance(activity);
                    wallpaperManager.setWallpaperComponent(liveWallpaperInfo.mInfo.getComponent());
                    wallpaperManager.setWallpaperOffsetSteps(0.5f, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                    wallpaperManager.setWallpaperOffsets(activity.getWindow().getDecorView().getRootView().getWindowToken(), 0.5f, HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                    if (i == 2) {
                        wallpaperManager.clear(2);
                    }
                    this.mSingleThreadExecutor.execute(new Runnable() { // from class: com.android.wallpaper.module.WallpaperSetter$$ExternalSyntheticLambda0
                        @Override // java.lang.Runnable
                        public final void run() {
                            WallpaperSetter wallpaperSetter = WallpaperSetter.this;
                            LiveWallpaperInfo liveWallpaperInfo2 = liveWallpaperInfo;
                            WallpaperColors wallpaperColors2 = wallpaperColors;
                            Activity activity2 = activity;
                            WallpaperPreferences wallpaperPreferences = wallpaperSetter.mPreferences;
                            String wallpaperId = liveWallpaperInfo2.getWallpaperId();
                            if (wallpaperColors2 == null) {
                                wallpaperColors2 = WallpaperColors.fromBitmap(liveWallpaperInfo2.getThumbAsset(activity2).getLowResBitmap(activity2));
                            }
                            wallpaperPreferences.storeLatestHomeWallpaper(wallpaperId, liveWallpaperInfo2, wallpaperColors2);
                        }
                    });
                    onWallpaperApplied(liveWallpaperInfo, activity);
                    if (setWallpaperCallback != null) {
                        setWallpaperCallback.onSuccess(liveWallpaperInfo);
                        return;
                    }
                    return;
                }
                throw new IllegalArgumentException("Live wallpaper cannot be applied on lock screen only");
            } catch (IOException | RuntimeException e) {
                onWallpaperApplyError(e, activity);
                if (setWallpaperCallback != null) {
                    setWallpaperCallback.onError(e);
                }
            }
        } else {
            this.mPreferences.setPendingWallpaperSetStatus(1);
            saveAndLockScreenOrientationIfNeeded(activity);
            Glide.get(activity).clearMemory();
            if (!this.mTestingModeEnabled && !activity.isFinishing()) {
                ProgressDialog progressDialog = new ProgressDialog(activity, R.style.LightDialogTheme);
                this.mProgressDialog = progressDialog;
                progressDialog.setTitle((CharSequence) null);
                this.mProgressDialog.setMessage(activity.getString(R.string.set_wallpaper_progress_message));
                this.mProgressDialog.setIndeterminate(true);
                if (activity instanceof LifecycleOwner) {
                    ((LifecycleOwner) activity).getLifecycle().addObserver(new LifecycleEventObserver() { // from class: com.android.wallpaper.module.WallpaperSetter.1
                        @Override // androidx.lifecycle.LifecycleEventObserver
                        public void onStateChanged(LifecycleOwner lifecycleOwner, Lifecycle.Event event) {
                            ProgressDialog progressDialog2;
                            if (event == Lifecycle.Event.ON_DESTROY && (progressDialog2 = WallpaperSetter.this.mProgressDialog) != null) {
                                progressDialog2.dismiss();
                                WallpaperSetter.this.mProgressDialog = null;
                            }
                        }
                    });
                }
                this.mProgressDialog.show();
            }
            ((DefaultWallpaperPersister) this.mWallpaperPersister).setIndividualWallpaper(wallpaperInfo, asset, rect, f, i, new WallpaperPersister.SetWallpaperCallback() { // from class: com.android.wallpaper.module.WallpaperSetter.2
                @Override // com.android.wallpaper.module.WallpaperPersister.SetWallpaperCallback
                public void onError(Throwable th) {
                    WallpaperSetter.this.onWallpaperApplyError(th, activity);
                    WallpaperPersister.SetWallpaperCallback setWallpaperCallback2 = setWallpaperCallback;
                    if (setWallpaperCallback2 != null) {
                        setWallpaperCallback2.onError(th);
                    }
                }

                @Override // com.android.wallpaper.module.WallpaperPersister.SetWallpaperCallback
                public void onSuccess(WallpaperInfo wallpaperInfo2) {
                    WallpaperSetter.this.onWallpaperApplied(wallpaperInfo, activity);
                    WallpaperPersister.SetWallpaperCallback setWallpaperCallback2 = setWallpaperCallback;
                    if (setWallpaperCallback2 != null) {
                        setWallpaperCallback2.onSuccess(wallpaperInfo);
                    }
                }
            });
        }
    }
}
