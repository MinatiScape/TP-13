package com.android.customization.picker;

import android.app.WallpaperColors;
import android.app.WallpaperInfo;
import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.os.Bundle;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.Log;
import androidx.cardview.R$style;
import androidx.dynamicanimation.animation.AnimationHandler$$ExternalSyntheticLambda0;
import com.android.customization.picker.WallpaperPreviewer;
import com.android.systemui.shared.R;
import com.android.wallpaper.effects.EffectsController;
import com.android.wallpaper.module.DefaultWallpaperPersister;
import com.android.wallpaper.module.PackageStatusNotifier;
import com.android.wallpaper.module.WallpaperPersister;
import com.android.wallpaper.picker.EffectsErrorDialogFragment;
import com.android.wallpaper.picker.ImageEffectPreviewFragment;
import com.android.wallpaper.picker.PreviewFragment;
import com.android.wallpaper.picker.WallpaperEffectsView;
import com.android.wallpaper.picker.individual.IndividualPickerFragment;
import com.android.wallpaper.widget.BottomActionBar;
import com.android.wallpaper.widget.WallpaperColorsLoader;
import com.google.android.apps.wallpaper.model.GoogleLiveWallpaperInfo;
import java.io.IOException;
import java.util.List;
import org.xmlpull.v1.XmlPullParserException;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class WallpaperPreviewer$$ExternalSyntheticLambda0 implements WallpaperColorsLoader.Callback, EffectsController.EffectsServiceListener, PackageStatusNotifier.Listener {
    public final /* synthetic */ Object f$0;

    @Override // com.android.wallpaper.widget.WallpaperColorsLoader.Callback
    public final void onLoaded(WallpaperColors wallpaperColors) {
        ((WallpaperPreviewer.WallpaperColorsListener) this.f$0).onWallpaperColorsChanged();
    }

    public /* synthetic */ WallpaperPreviewer$$ExternalSyntheticLambda0(Object obj) {
        this.f$0 = obj;
    }

    public final void onEffectFinished(Bundle bundle, int i) {
        boolean z;
        ImageEffectPreviewFragment.WallpaperEffectsContent wallpaperEffectsContent = (ImageEffectPreviewFragment.WallpaperEffectsContent) this.f$0;
        WallpaperEffectsView wallpaperEffectsView = wallpaperEffectsContent.mView;
        if (wallpaperEffectsView != null) {
            if (i == 1) {
                z = true;
            } else {
                z = false;
            }
            wallpaperEffectsView.mCinematicSwitch.setEnabled(true);
            wallpaperEffectsView.mCinematicSwitch.setChecked(!z);
        }
        if (wallpaperEffectsContent.mProcessingEffect != null) {
            wallpaperEffectsContent.mProcessingEffect = null;
            if (i == 1) {
                EffectsErrorDialogFragment effectsErrorDialogFragment = new EffectsErrorDialogFragment();
                effectsErrorDialogFragment.mTitleResId = R.string.effect_error_dialog_title;
                effectsErrorDialogFragment.mBodyResId = R.string.effect_error_dialog_body;
                effectsErrorDialogFragment.show(ImageEffectPreviewFragment.this.mFragmentManager, "effect_error_dialog");
            } else if (bundle.containsKey("LIVE_WALLPAPER_COMPONENT")) {
                ComponentName componentName = (ComponentName) bundle.getParcelable("LIVE_WALLPAPER_COMPONENT");
                ImageEffectPreviewFragment.AnonymousClass1 r7 = (ImageEffectPreviewFragment.AnonymousClass1) wallpaperEffectsContent.mWallpaperEffectsHost;
                ImageEffectPreviewFragment imageEffectPreviewFragment = ImageEffectPreviewFragment.this;
                int i2 = ImageEffectPreviewFragment.$r8$clinit;
                imageEffectPreviewFragment.getClass();
                WallpaperPersister wallpaperPersister = R$style.getInjector().getWallpaperPersister(imageEffectPreviewFragment.getContext());
                Intent intent = new Intent("android.service.wallpaper.WallpaperService");
                intent.setClassName(componentName.getPackageName(), componentName.getClassName());
                List<ResolveInfo> queryIntentServices = imageEffectPreviewFragment.getContext().getPackageManager().queryIntentServices(intent, 128);
                if (queryIntentServices.isEmpty()) {
                    StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Couldn't find live wallpaper for ");
                    m.append(componentName.getClassName());
                    Log.w("ImageEffectPreviewFragment", m.toString());
                } else {
                    try {
                        GoogleLiveWallpaperInfo googleLiveWallpaperInfo = new GoogleLiveWallpaperInfo(new WallpaperInfo(imageEffectPreviewFragment.getContext(), queryIntentServices.get(0)));
                        imageEffectPreviewFragment.mLiveWallpaperInfo = googleLiveWallpaperInfo;
                        ((DefaultWallpaperPersister) wallpaperPersister).mWallpaperInfoInPreview = googleLiveWallpaperInfo;
                        imageEffectPreviewFragment.mLiveWallpaperInfo.computePlaceholderColor(imageEffectPreviewFragment.getContext());
                        imageEffectPreviewFragment.mLiveWallpaperSurface.post(new AnimationHandler$$ExternalSyntheticLambda0(imageEffectPreviewFragment, 1));
                    } catch (IOException | XmlPullParserException e) {
                        StringBuilder m2 = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Skipping wallpaper ");
                        m2.append(queryIntentServices.get(0).serviceInfo);
                        Log.w("ImageEffectPreviewFragment", m2.toString(), e);
                    }
                }
                ImageEffectPreviewFragment imageEffectPreviewFragment2 = ImageEffectPreviewFragment.this;
                imageEffectPreviewFragment2.mIsLiveWallpaper = true;
                imageEffectPreviewFragment2.mCurrentWallpaper = imageEffectPreviewFragment2.mLiveWallpaperInfo;
                ((PreviewFragment) imageEffectPreviewFragment2).mBottomActionBar.showActions(BottomActionBar.BottomAction.APPLY);
                ((PreviewFragment) ImageEffectPreviewFragment.this).mBottomActionBar.hideActions(BottomActionBar.BottomAction.PROGRESS);
            }
        }
    }

    @Override // com.android.wallpaper.module.PackageStatusNotifier.Listener
    public final void onPackageChanged(String str, int i) {
        IndividualPickerFragment individualPickerFragment = (IndividualPickerFragment) this.f$0;
        if (i != 3) {
            int i2 = IndividualPickerFragment.$r8$clinit;
        } else if (!individualPickerFragment.mCategory.containsThirdParty(str)) {
            return;
        }
        individualPickerFragment.fetchWallpapers(true);
    }
}
