package com.android.wallpaper.picker;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.app.WallpaperColors;
import android.database.Cursor;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.SurfaceControl;
import android.widget.ImageView;
import androidx.dynamicanimation.animation.AnimationHandler;
import androidx.fragment.app.Fragment;
import com.android.customization.model.color.ColorCustomizationManager$$ExternalSyntheticLambda0;
import com.android.customization.model.themedicon.ThemedIconSwitchProvider;
import com.android.systemui.shared.navigationbar.RegionSamplingHelper;
import com.android.systemui.shared.plugins.PluginActionManager;
import com.android.systemui.shared.plugins.PluginInstance;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.android.wallpaper.picker.ImagePreviewFragment;
import com.android.wallpaper.util.PreviewUtils$$ExternalSyntheticLambda0;
import com.google.android.apps.wallpaper.module.ClearcutUserEventLogger;
import com.google.android.gms.clearcut.Counters;
import java.util.Objects;
/* loaded from: classes.dex */
public final /* synthetic */ class ImagePreviewFragment$4$$ExternalSyntheticLambda0 implements Runnable {
    public final /* synthetic */ int $r8$classId = 1;
    public final /* synthetic */ Object f$0;
    public final /* synthetic */ Object f$1;

    public /* synthetic */ ImagePreviewFragment$4$$ExternalSyntheticLambda0(AnimationHandler.FrameCallbackScheduler14 frameCallbackScheduler14, Runnable runnable) {
        this.f$0 = frameCallbackScheduler14;
        this.f$1 = runnable;
    }

    public /* synthetic */ ImagePreviewFragment$4$$ExternalSyntheticLambda0(ThemedIconSwitchProvider themedIconSwitchProvider, ThemedIconSwitchProvider.FetchThemedIconEnabledCallback fetchThemedIconEnabledCallback) {
        this.f$0 = themedIconSwitchProvider;
        this.f$1 = fetchThemedIconEnabledCallback;
    }

    public /* synthetic */ ImagePreviewFragment$4$$ExternalSyntheticLambda0(RegionSamplingHelper regionSamplingHelper, SurfaceControl surfaceControl) {
        this.f$0 = regionSamplingHelper;
        this.f$1 = surfaceControl;
    }

    public /* synthetic */ ImagePreviewFragment$4$$ExternalSyntheticLambda0(PluginActionManager pluginActionManager, PluginInstance pluginInstance) {
        this.f$0 = pluginActionManager;
        this.f$1 = pluginInstance;
    }

    public /* synthetic */ ImagePreviewFragment$4$$ExternalSyntheticLambda0(PluginActionManager pluginActionManager, String str) {
        this.f$0 = pluginActionManager;
        this.f$1 = str;
    }

    public /* synthetic */ ImagePreviewFragment$4$$ExternalSyntheticLambda0(CustomizationPickerFragment customizationPickerFragment, Bundle bundle) {
        this.f$0 = customizationPickerFragment;
        this.f$1 = bundle;
    }

    public /* synthetic */ ImagePreviewFragment$4$$ExternalSyntheticLambda0(ImagePreviewFragment.AnonymousClass4 r2, WallpaperColors wallpaperColors) {
        this.f$0 = r2;
        this.f$1 = wallpaperColors;
    }

    public /* synthetic */ ImagePreviewFragment$4$$ExternalSyntheticLambda0(ClearcutUserEventLogger clearcutUserEventLogger, String str) {
        this.f$0 = clearcutUserEventLogger;
        this.f$1 = str;
    }

    @Override // java.lang.Runnable
    public final void run() {
        boolean z = true;
        switch (this.$r8$classId) {
            case 0:
                ImagePreviewFragment.AnonymousClass4 r0 = (ImagePreviewFragment.AnonymousClass4) this.f$0;
                ImagePreviewFragment.this.onWallpaperColorsChanged((WallpaperColors) this.f$1);
                if (ImagePreviewFragment.this.mFullResImageView.getAlpha() == HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                    final ImagePreviewFragment imagePreviewFragment = ImagePreviewFragment.this;
                    if (imagePreviewFragment.getActivity() != null) {
                        if (((Fragment) imagePreviewFragment).mHost == null || !imagePreviewFragment.mAdded) {
                            z = false;
                        }
                        if (z) {
                            imagePreviewFragment.mFullResImageView.setAlpha(HingeAngleProviderKt.FULLY_CLOSED_DEGREES);
                            imagePreviewFragment.mFullResImageView.animate().alpha(1.0f).setInterpolator(PreviewFragment.ALPHA_OUT).setDuration(imagePreviewFragment.getResources().getInteger(17694720)).setListener(new AnimatorListenerAdapter() { // from class: com.android.wallpaper.picker.ImagePreviewFragment.5
                                @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                                public void onAnimationEnd(Animator animator) {
                                    ImageView imageView = ImagePreviewFragment.this.mLowResImageView;
                                    if (imageView != null) {
                                        imageView.setImageBitmap(null);
                                    }
                                }
                            });
                            return;
                        }
                        return;
                    }
                    return;
                }
                return;
            case 1:
                AnimationHandler.FrameCallbackScheduler14 frameCallbackScheduler14 = (AnimationHandler.FrameCallbackScheduler14) this.f$0;
                Objects.requireNonNull(frameCallbackScheduler14);
                frameCallbackScheduler14.mLastFrameTime = SystemClock.uptimeMillis();
                ((Runnable) this.f$1).run();
                return;
            case 2:
                ThemedIconSwitchProvider themedIconSwitchProvider = (ThemedIconSwitchProvider) this.f$0;
                ThemedIconSwitchProvider.FetchThemedIconEnabledCallback fetchThemedIconEnabledCallback = (ThemedIconSwitchProvider.FetchThemedIconEnabledCallback) this.f$1;
                Cursor query = themedIconSwitchProvider.mContentResolver.query(themedIconSwitchProvider.mThemedIconUtils.getUriForPath("icon_themed"), null, null, null, null);
                if (query != null) {
                    try {
                        if (query.moveToNext()) {
                            if (query.getInt(query.getColumnIndex("boolean_value")) != 1) {
                                z = false;
                            }
                            if (themedIconSwitchProvider.mCustomizationPreferences.getThemedIconEnabled() != z) {
                                themedIconSwitchProvider.mCustomizationPreferences.setThemedIconEnabled(z);
                            }
                            if (fetchThemedIconEnabledCallback != null) {
                                new Handler(Looper.getMainLooper()).post(new ColorCustomizationManager$$ExternalSyntheticLambda0(fetchThemedIconEnabledCallback, z));
                            }
                            query.close();
                            return;
                        }
                    } catch (Throwable th) {
                        try {
                            query.close();
                        } catch (Throwable th2) {
                            th.addSuppressed(th2);
                        }
                        throw th;
                    }
                }
                if (query != null) {
                    query.close();
                }
                if (fetchThemedIconEnabledCallback != null) {
                    new Handler(Looper.getMainLooper()).post(new PreviewUtils$$ExternalSyntheticLambda0(themedIconSwitchProvider, fetchThemedIconEnabledCallback));
                    return;
                }
                return;
            case 3:
                ((RegionSamplingHelper) this.f$0).lambda$unregisterSamplingListener$1((SurfaceControl) this.f$1);
                return;
            case 4:
                PluginActionManager.$r8$lambda$nTrqaXNoyZ9Ewe_oMzlt3sqKZco((PluginActionManager) this.f$0, (String) this.f$1);
                return;
            case 5:
                PluginActionManager.$r8$lambda$8TM7K2rxqRKfAu55Vw3Zcf26ozs((PluginActionManager) this.f$0, (PluginInstance) this.f$1);
                return;
            case 6:
                CustomizationPickerFragment customizationPickerFragment = (CustomizationPickerFragment) this.f$0;
                Bundle bundle = (Bundle) this.f$1;
                int i = CustomizationPickerFragment.$r8$clinit;
                Objects.requireNonNull(customizationPickerFragment);
                if (bundle != null) {
                    customizationPickerFragment.mNestedScrollView.post(new PreviewUtils$$ExternalSyntheticLambda0(customizationPickerFragment, bundle));
                    return;
                }
                return;
            default:
                ClearcutUserEventLogger clearcutUserEventLogger = (ClearcutUserEventLogger) this.f$0;
                clearcutUserEventLogger.mCounters.getCounter((String) this.f$1).incrementBase(0L, 1L);
                Counters counters = clearcutUserEventLogger.mCounters;
                counters.logAllAsync(counters.zzf);
                return;
        }
    }
}
