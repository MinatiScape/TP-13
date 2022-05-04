package com.android.wallpaper.picker;

import android.app.WallpaperColors;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.SurfaceView;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import androidx.cardview.R$style;
import com.android.customization.picker.WallpaperPreviewer$$ExternalSyntheticLambda0;
import com.android.systemui.shared.R;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.android.wallpaper.model.SetWallpaperViewModel;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.picker.ImageEffectPreviewFragment;
import com.android.wallpaper.picker.PreviewFragment;
import com.android.wallpaper.picker.WallpaperEffectsView;
import com.android.wallpaper.util.FullScreenAnimation;
import com.android.wallpaper.util.WallpaperConnection;
import com.android.wallpaper.widget.BottomActionBar;
import com.android.wallpaper.widget.LockScreenPreviewer;
import com.google.android.apps.wallpaper.effects.CinematicEffectsController;
import com.google.android.apps.wallpaper.model.GoogleLiveWallpaperInfo;
/* loaded from: classes.dex */
public class ImageEffectPreviewFragment extends ImageWallpaperColorThemePreviewFragment implements WallpaperConnection.WallpaperConnectionListener {
    public static final /* synthetic */ int $r8$clinit = 0;
    public WallpaperInfo mCurrentWallpaper;
    public GoogleLiveWallpaperInfo mLiveWallpaperInfo;
    public SurfaceView mLiveWallpaperSurface;
    public WallpaperConnection mWallpaperConnection;
    public WallpaperEffectsContent mWallpaperEffectsContent;
    public boolean mIsLiveWallpaper = false;
    public boolean mIsCinematicOn = false;
    public AnonymousClass1 mWallpaperEffectsHost = new AnonymousClass1();

    /* renamed from: com.android.wallpaper.picker.ImageEffectPreviewFragment$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass1 implements WallpaperEffectsHost {
        public AnonymousClass1() {
        }
    }

    /* loaded from: classes.dex */
    public final class WallpaperEffectsContent extends BottomActionBar.BottomSheetContent<WallpaperEffectsView> {
        public CinematicEffectsController mEffectsController;
        public CinematicEffectsController.Effect mProcessingEffect = null;
        public WallpaperEffectsView mView;
        public WallpaperEffectsHost mWallpaperEffectsHost;

        @Override // com.android.wallpaper.widget.BottomActionBar.BottomSheetContent
        public final int getViewId() {
            return R.layout.wallpaper_effects_view;
        }

        public WallpaperEffectsContent(Context context, AnonymousClass1 r3) {
            super(context);
            this.mWallpaperEffectsHost = r3;
        }

        @Override // com.android.wallpaper.widget.BottomActionBar.BottomSheetContent
        public final void onViewCreated(WallpaperEffectsView wallpaperEffectsView) {
            final WallpaperEffectsView wallpaperEffectsView2 = wallpaperEffectsView;
            if (ImageEffectPreviewFragment.this.mWallpaper != null) {
                this.mEffectsController = R$style.getInjector().createEffectsController(ImageEffectPreviewFragment.this.getContext(), new WallpaperPreviewer$$ExternalSyntheticLambda0(this));
                R$style.getInjector().getWallpaperPersister(ImageEffectPreviewFragment.this.getContext());
                if (this.mEffectsController != null) {
                    this.mView = wallpaperEffectsView2;
                    wallpaperEffectsView2.mCinematicSwitch.setChecked(ImageEffectPreviewFragment.this.mIsCinematicOn);
                    wallpaperEffectsView2.mCinematicSwitch.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() { // from class: com.android.wallpaper.picker.WallpaperEffectsView$$ExternalSyntheticLambda0
                        @Override // android.widget.CompoundButton.OnCheckedChangeListener
                        public final void onCheckedChanged(CompoundButton compoundButton, boolean z) {
                            WallpaperEffectsView wallpaperEffectsView3 = WallpaperEffectsView.this;
                            CinematicEffectsController.Effect effect = CinematicEffectsController.Effect.CINEMATIC;
                            WallpaperEffectsView.EffectSwitchListener effectSwitchListener = wallpaperEffectsView3.mListener;
                            if (effectSwitchListener != null) {
                                ImageEffectPreviewFragment.WallpaperEffectsContent wallpaperEffectsContent = ((ImageEffectPreviewFragment$WallpaperEffectsContent$$ExternalSyntheticLambda0) effectSwitchListener).f$0;
                                BottomActionBar.BottomAction bottomAction = BottomActionBar.BottomAction.PROGRESS;
                                BottomActionBar.BottomAction bottomAction2 = BottomActionBar.BottomAction.APPLY;
                                if (z) {
                                    ImageEffectPreviewFragment.this.mIsCinematicOn = true;
                                    wallpaperEffectsContent.mProcessingEffect = effect;
                                    wallpaperEffectsContent.mView.mCinematicSwitch.setEnabled(false);
                                    CinematicEffectsController cinematicEffectsController = wallpaperEffectsContent.mEffectsController;
                                    CinematicEffectsController.Effect effect2 = wallpaperEffectsContent.mProcessingEffect;
                                    Uri uri = ImageEffectPreviewFragment.this.mWallpaper.getUri();
                                    cinematicEffectsController.getClass();
                                    cinematicEffectsController.onEffectGenerated(CinematicEffectsController.Effect.NONE, new Bundle(), 1);
                                    cinematicEffectsController.mEffect = effect2;
                                    cinematicEffectsController.mImageUri = uri;
                                    Intent intent = new Intent();
                                    intent.setComponent(new ComponentName("com.google.android.wallpaper.effects", "com.google.android.wallpaper.effects.WallpaperEffectsService"));
                                    intent.setData(cinematicEffectsController.mImageUri);
                                    intent.putExtra("com.google.android.wallpaper.effects.wallpaper.effect", effect2.ordinal());
                                    intent.setAction("com.google.android.wallpaper.effects.action.effect");
                                    intent.addFlags(1);
                                    cinematicEffectsController.mContext.grantUriPermission("com.google.android.wallpaper.effects", cinematicEffectsController.mImageUri, 1);
                                    cinematicEffectsController.mContext.bindService(intent, cinematicEffectsController.mEffectsServiceConnection, 1);
                                    ImageEffectPreviewFragment.WallpaperEffectsHost wallpaperEffectsHost = wallpaperEffectsContent.mWallpaperEffectsHost;
                                    if (wallpaperEffectsHost != null) {
                                        ImageEffectPreviewFragment.AnonymousClass1 r8 = (ImageEffectPreviewFragment.AnonymousClass1) wallpaperEffectsHost;
                                        ((PreviewFragment) ImageEffectPreviewFragment.this).mBottomActionBar.showActions(bottomAction);
                                        ((PreviewFragment) ImageEffectPreviewFragment.this).mBottomActionBar.hideActions(bottomAction2);
                                        return;
                                    }
                                    return;
                                }
                                ImageEffectPreviewFragment.this.mIsCinematicOn = false;
                                ImageEffectPreviewFragment.WallpaperEffectsHost wallpaperEffectsHost2 = wallpaperEffectsContent.mWallpaperEffectsHost;
                                if (wallpaperEffectsHost2 != null) {
                                    ImageEffectPreviewFragment.AnonymousClass1 r82 = (ImageEffectPreviewFragment.AnonymousClass1) wallpaperEffectsHost2;
                                    WallpaperConnection wallpaperConnection = ImageEffectPreviewFragment.this.mWallpaperConnection;
                                    if (wallpaperConnection != null) {
                                        wallpaperConnection.disconnect();
                                    }
                                    ImageEffectPreviewFragment imageEffectPreviewFragment = ImageEffectPreviewFragment.this;
                                    imageEffectPreviewFragment.mIsLiveWallpaper = false;
                                    imageEffectPreviewFragment.mCurrentWallpaper = imageEffectPreviewFragment.mWallpaper;
                                    ((PreviewFragment) imageEffectPreviewFragment).mBottomActionBar.showActions(bottomAction2);
                                    ((PreviewFragment) ImageEffectPreviewFragment.this).mBottomActionBar.hideActions(bottomAction);
                                }
                            }
                        }
                    });
                    this.mView.mListener = new ImageEffectPreviewFragment$WallpaperEffectsContent$$ExternalSyntheticLambda0(this);
                }
            }
        }
    }

    /* loaded from: classes.dex */
    public interface WallpaperEffectsHost {
    }

    @Override // com.android.wallpaper.picker.ImagePreviewFragment, com.android.wallpaper.picker.PreviewFragment
    public final int getLayoutResId() {
        return R.layout.fragment_image_preview;
    }

    @Override // androidx.fragment.app.Fragment
    public final void onDestroyView() {
        this.mCalled = true;
        WallpaperConnection wallpaperConnection = this.mWallpaperConnection;
        if (wallpaperConnection != null) {
            wallpaperConnection.disconnect();
            this.mWallpaperConnection = null;
        }
        LockScreenPreviewer lockScreenPreviewer = this.mLockScreenPreviewer;
        if (lockScreenPreviewer != null) {
            lockScreenPreviewer.release();
        }
    }

    @Override // androidx.fragment.app.Fragment
    public final void onPause() {
        this.mCalled = true;
        WallpaperConnection wallpaperConnection = this.mWallpaperConnection;
        if (wallpaperConnection != null) {
            wallpaperConnection.setVisibility(false);
        }
    }

    @Override // androidx.fragment.app.Fragment
    public final void onStop() {
        this.mCalled = true;
        WallpaperConnection wallpaperConnection = this.mWallpaperConnection;
        if (wallpaperConnection != null) {
            wallpaperConnection.disconnect();
            this.mWallpaperConnection = null;
        }
    }

    @Override // com.android.wallpaper.picker.ImagePreviewFragment, com.android.wallpaper.picker.PreviewFragment
    public final void setCurrentWallpaper(int i) {
        if (this.mIsLiveWallpaper) {
            this.mWallpaperSetter.setCurrentWallpaper(getActivity(), this.mLiveWallpaperInfo, null, i, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, null, ((ImageWallpaperColorThemePreviewFragment) this).mWallpaperColors, new SetWallpaperViewModel.AnonymousClass1());
        } else {
            super.setCurrentWallpaper(i);
        }
    }

    @Override // com.android.wallpaper.picker.ImagePreviewFragment
    public final void setupActionBar() {
        this.mWallpaperEffectsContent = new WallpaperEffectsContent(getContext(), this.mWallpaperEffectsHost);
        BottomActionBar bottomActionBar = ((PreviewFragment) this).mBottomActionBar;
        PreviewFragment.WallpaperInfoContent wallpaperInfoContent = new PreviewFragment.WallpaperInfoContent(getContext());
        BottomActionBar.BottomAction bottomAction = BottomActionBar.BottomAction.INFORMATION;
        bottomActionBar.bindBottomSheetContentWithAction(wallpaperInfoContent, bottomAction);
        BottomActionBar bottomActionBar2 = ((PreviewFragment) this).mBottomActionBar;
        BottomActionBar.BottomAction bottomAction2 = BottomActionBar.BottomAction.EFFECTS;
        BottomActionBar.BottomAction bottomAction3 = BottomActionBar.BottomAction.APPLY;
        bottomActionBar2.showActionsOnly(bottomAction, BottomActionBar.BottomAction.EDIT, bottomAction2, bottomAction3);
        ((PreviewFragment) this).mBottomActionBar.setActionClickListener(bottomAction3, new View.OnClickListener() { // from class: com.android.wallpaper.picker.ImageEffectPreviewFragment$$ExternalSyntheticLambda0
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                ImageEffectPreviewFragment imageEffectPreviewFragment = ImageEffectPreviewFragment.this;
                imageEffectPreviewFragment.onSetWallpaperClicked(imageEffectPreviewFragment.mCurrentWallpaper);
            }
        });
        ((PreviewFragment) this).mBottomActionBar.bindBottomSheetContentWithAction(this.mWallpaperEffectsContent, bottomAction2);
    }

    @Override // com.android.wallpaper.picker.ImageWallpaperColorThemePreviewFragment, com.android.wallpaper.picker.ImagePreviewFragment, com.android.wallpaper.picker.PreviewFragment, androidx.fragment.app.Fragment
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mCurrentWallpaper = this.mWallpaper;
    }

    @Override // com.android.wallpaper.picker.ImagePreviewFragment, com.android.wallpaper.picker.PreviewFragment, androidx.fragment.app.Fragment
    public final View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        boolean z;
        View onCreateView = super.onCreateView(layoutInflater, viewGroup, bundle);
        requireActivity();
        if (this.mLastSelectedTabPositionOptional.orElse(0).intValue() == 0) {
            z = true;
        } else {
            z = false;
        }
        updateScreenPreview(z);
        SurfaceView surfaceView = (SurfaceView) ((ImagePreviewFragment) this).mContainer.findViewById(R.id.wallpaper_surface_cinematic);
        this.mLiveWallpaperSurface = surfaceView;
        surfaceView.setVisibility(0);
        this.mLiveWallpaperSurface.setZOrderMediaOverlay(true);
        return onCreateView;
    }

    @Override // com.android.wallpaper.picker.ImagePreviewFragment, com.android.wallpaper.picker.PreviewFragment, androidx.fragment.app.Fragment
    public final void onDestroy() {
        super.onDestroy();
        WallpaperEffectsContent wallpaperEffectsContent = this.mWallpaperEffectsContent;
        if (wallpaperEffectsContent != null) {
            CinematicEffectsController cinematicEffectsController = wallpaperEffectsContent.mEffectsController;
            if (cinematicEffectsController != null) {
                cinematicEffectsController.onEffectGenerated(CinematicEffectsController.Effect.NONE, new Bundle(), 1);
            }
            wallpaperEffectsContent.mProcessingEffect = null;
        }
    }

    @Override // com.android.wallpaper.util.WallpaperConnection.WallpaperConnectionListener
    public final void onEngineShown() {
        BottomActionBar bottomActionBar;
        if (getActivity() != null && (bottomActionBar = ((PreviewFragment) this).mBottomActionBar) != null) {
            bottomActionBar.enableActions();
        }
    }

    @Override // com.android.wallpaper.picker.PreviewFragment, androidx.fragment.app.Fragment
    public final void onResume() {
        super.onResume();
        WallpaperConnection wallpaperConnection = this.mWallpaperConnection;
        if (wallpaperConnection != null) {
            wallpaperConnection.setVisibility(true);
        }
    }

    @Override // com.android.wallpaper.picker.ImagePreviewFragment, com.android.wallpaper.picker.PreviewFragment
    public final void updateScreenPreview(boolean z) {
        super.updateScreenPreview(z);
        FullScreenAnimation fullScreenAnimation = this.mFullScreenAnimation;
        if (fullScreenAnimation != null) {
            fullScreenAnimation.mIsHomeSelected = z;
        }
    }

    @Override // com.android.wallpaper.picker.ImagePreviewFragment, com.android.wallpaper.picker.BottomActionBarFragment, androidx.fragment.app.Fragment
    public final void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
    }

    @Override // com.android.wallpaper.util.WallpaperConnection.WallpaperConnectionListener
    public final void onWallpaperColorsChanged(WallpaperColors wallpaperColors, int i) {
        onWallpaperColorsChanged(wallpaperColors);
    }
}
