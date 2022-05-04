package com.android.customization.picker.grid;

import android.graphics.Point;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.SurfaceView;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityManager;
import android.widget.ImageView;
import android.widget.Toast;
import androidx.cardview.R$style;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.constraintlayout.widget.ConstraintSet;
import androidx.core.widget.ContentLoadingProgressBar;
import androidx.core.widget.ContentLoadingProgressBar$$ExternalSyntheticLambda0;
import androidx.lifecycle.ViewModelProvider;
import androidx.recyclerview.widget.RecyclerView;
import com.android.customization.model.CustomizationManager;
import com.android.customization.model.CustomizationOption;
import com.android.customization.model.grid.GridOption;
import com.android.customization.model.grid.GridOptionViewModel;
import com.android.customization.model.grid.GridOptionsManager;
import com.android.customization.model.grid.GridOptionsManager$$ExternalSyntheticLambda1;
import com.android.customization.module.ThemesUserEventLogger;
import com.android.customization.picker.WallpaperPreviewer;
import com.android.customization.picker.grid.GridFragment;
import com.android.customization.picker.grid.GridOptionPreviewer;
import com.android.customization.widget.OptionSelectorController;
import com.android.systemui.shared.R;
import com.android.wallpaper.asset.Asset$$ExternalSyntheticLambda1;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.module.CurrentWallpaperInfoFactory;
import com.android.wallpaper.module.DefaultCurrentWallpaperInfoFactory;
import com.android.wallpaper.picker.AppbarFragment;
import com.android.wallpaper.picker.AppbarFragment$$ExternalSyntheticLambda0;
import com.android.wallpaper.util.LaunchUtils;
import com.android.wallpaper.util.ScreenSizeCalculator;
import com.android.wallpaper.widget.BottomActionBar;
import com.bumptech.glide.Glide;
import java.util.List;
import java.util.Locale;
import java.util.function.Predicate;
/* loaded from: classes.dex */
public class GridFragment extends AppbarFragment {
    public static final /* synthetic */ int $r8$clinit = 0;
    public final AnonymousClass1 mApplyGridCallback = new AnonymousClass1();
    public BottomActionBar mBottomActionBar;
    public ConstraintLayout mContent;
    public View mError;
    public ThemesUserEventLogger mEventLogger;
    public GridOptionsManager mGridManager;
    public GridOptionPreviewer mGridOptionPreviewer;
    public GridOptionViewModel mGridOptionViewModel;
    public ContentLoadingProgressBar mLoading;
    public RecyclerView mOptionsContainer;
    public OptionSelectorController<GridOption> mOptionsController;

    /* renamed from: com.android.customization.picker.grid.GridFragment$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass1 implements CustomizationManager.Callback {
        public AnonymousClass1() {
        }

        @Override // com.android.customization.model.CustomizationManager.Callback
        public final void onError() {
            GridFragment.this.mBottomActionBar.enableActions();
            GridFragment.this.mBottomActionBar.setVisibility(8);
            GridFragment.this.mGridOptionViewModel.mState.set("bottom_action_bar_visible", Boolean.FALSE);
        }

        @Override // com.android.customization.model.CustomizationManager.Callback
        public final void onSuccess() {
            Toast.makeText(GridFragment.this.getContext(), (int) R.string.applied_grid_msg, 0).show();
            GridFragment.this.getActivity().overridePendingTransition(R.anim.fade_in, R.anim.fade_out);
            GridFragment.this.getActivity().finish();
            LaunchUtils.launchHome(GridFragment.this.getContext());
        }
    }

    /* renamed from: com.android.customization.picker.grid.GridFragment$2  reason: invalid class name */
    /* loaded from: classes.dex */
    public final class AnonymousClass2 implements CustomizationManager.OptionsFetchedListener<GridOption> {
        public AnonymousClass2() {
        }

        @Override // com.android.customization.model.CustomizationManager.OptionsFetchedListener
        public final void onError(Throwable th) {
            if (th != null) {
                Log.e("GridFragment", "Error loading grid options", th);
            }
            GridFragment gridFragment = GridFragment.this;
            gridFragment.mLoading.hide();
            gridFragment.mContent.setVisibility(8);
            gridFragment.mError.setVisibility(0);
        }

        @Override // com.android.customization.model.CustomizationManager.OptionsFetchedListener
        public final void onOptionsLoaded(List<GridOption> list) {
            boolean z;
            GridFragment.this.mLoading.hide();
            GridFragment gridFragment = GridFragment.this;
            gridFragment.mOptionsController = new OptionSelectorController<>(gridFragment.mOptionsContainer, list, false, 3);
            GridFragment gridFragment2 = GridFragment.this;
            gridFragment2.mOptionsController.initOptions(gridFragment2.mGridManager);
            final GridOption selectedOption = GridFragment.this.mGridOptionViewModel.getSelectedOption();
            GridOption orElse = list.stream().filter(new Predicate() { // from class: com.android.customization.picker.grid.GridFragment$$ExternalSyntheticLambda2
                @Override // java.util.function.Predicate
                public final boolean test(Object obj) {
                    GridOption gridOption = GridOption.this;
                    int i = GridFragment.$r8$clinit;
                    return ((GridOption) obj).equals(gridOption);
                }
            }).findAny().orElse(null);
            final GridFragment gridFragment3 = GridFragment.this;
            GridOptionViewModel gridOptionViewModel = gridFragment3.mGridOptionViewModel;
            if (orElse == null) {
                orElse = list.stream().filter(new Predicate() { // from class: com.android.customization.picker.grid.GridFragment$$ExternalSyntheticLambda3
                    @Override // java.util.function.Predicate
                    public final boolean test(Object obj) {
                        GridFragment gridFragment4 = GridFragment.this;
                        int i = GridFragment.$r8$clinit;
                        gridFragment4.getClass();
                        return ((GridOption) obj).mIsCurrent;
                    }
                }).findAny().orElse(list.get(0));
            }
            gridOptionViewModel.mState.set("selected_option", orElse);
            GridFragment gridFragment4 = GridFragment.this;
            gridFragment4.mOptionsController.setSelectedOption(gridFragment4.mGridOptionViewModel.getSelectedOption());
            GridFragment gridFragment5 = GridFragment.this;
            GridFragment.m13$$Nest$monOptionSelected(gridFragment5, gridFragment5.mGridOptionViewModel.getSelectedOption());
            GridFragment gridFragment6 = GridFragment.this;
            GridOptionViewModel gridOptionViewModel2 = gridFragment6.mGridOptionViewModel;
            if (gridOptionViewModel2.mState.mRegular.containsKey("bottom_action_bar_visible")) {
                z = ((Boolean) gridOptionViewModel2.mState.mRegular.get("bottom_action_bar_visible")).booleanValue();
            } else {
                z = false;
            }
            if (z) {
                gridFragment6.mBottomActionBar.setVisibility(0);
            } else {
                gridFragment6.mBottomActionBar.setVisibility(8);
            }
            GridFragment.this.mOptionsController.mListeners.add(new OptionSelectorController.OptionSelectedListener() { // from class: com.android.customization.picker.grid.GridFragment$2$$ExternalSyntheticLambda0
                @Override // com.android.customization.widget.OptionSelectorController.OptionSelectedListener
                public final void onOptionSelected(CustomizationOption customizationOption) {
                    int i;
                    GridFragment.AnonymousClass2 r5 = GridFragment.AnonymousClass2.this;
                    r5.getClass();
                    String title = customizationOption.getTitle();
                    if (customizationOption.isActive(GridFragment.this.mGridManager)) {
                        i = R.string.option_applied_previewed_description;
                    } else {
                        i = R.string.option_previewed_description;
                    }
                    GridFragment.this.mOptionsContainer.announceForAccessibility(GridFragment.this.getContext().getString(i, title));
                    GridFragment.m13$$Nest$monOptionSelected(GridFragment.this, customizationOption);
                    GridFragment.this.mBottomActionBar.setVisibility(0);
                    GridFragment.this.mGridOptionViewModel.mState.set("bottom_action_bar_visible", Boolean.TRUE);
                }
            });
        }
    }

    @Override // androidx.fragment.app.Fragment
    public final void onDestroy() {
        this.mCalled = true;
        GridOptionPreviewer gridOptionPreviewer = this.mGridOptionPreviewer;
        if (gridOptionPreviewer != null) {
            if (gridOptionPreviewer.mGridOptionSurface != null) {
                gridOptionPreviewer.mSurfaceCallback.cleanUp();
                gridOptionPreviewer.mGridOptionSurface = null;
            }
            gridOptionPreviewer.mPreviewContainer.removeAllViews();
        }
    }

    /* renamed from: -$$Nest$monOptionSelected  reason: not valid java name */
    public static void m13$$Nest$monOptionSelected(GridFragment gridFragment, CustomizationOption customizationOption) {
        gridFragment.mGridOptionViewModel.mState.set("selected_option", (GridOption) customizationOption);
        gridFragment.mEventLogger.logGridSelected(gridFragment.mGridOptionViewModel.getSelectedOption());
        GridOptionPreviewer gridOptionPreviewer = gridFragment.mGridOptionPreviewer;
        GridOption selectedOption = gridFragment.mGridOptionViewModel.getSelectedOption();
        gridOptionPreviewer.mGridOption = selectedOption;
        if (selectedOption != null) {
            gridOptionPreviewer.mPreviewContainer.removeAllViews();
            GridOptionPreviewer.GridOptionSurfaceHolderCallback gridOptionSurfaceHolderCallback = gridOptionPreviewer.mSurfaceCallback;
            if (gridOptionSurfaceHolderCallback != null) {
                gridOptionSurfaceHolderCallback.cleanUp();
                gridOptionPreviewer.mSurfaceCallback.mLastSurface = null;
                SurfaceView surfaceView = gridOptionPreviewer.mGridOptionSurface;
                if (surfaceView != null) {
                    surfaceView.getHolder().removeCallback(gridOptionPreviewer.mSurfaceCallback);
                }
            }
            SurfaceView surfaceView2 = new SurfaceView(gridOptionPreviewer.mPreviewContainer.getContext());
            gridOptionPreviewer.mGridOptionSurface = surfaceView2;
            surfaceView2.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
            gridOptionPreviewer.mGridOptionSurface.setZOrderMediaOverlay(true);
            SurfaceView surfaceView3 = gridOptionPreviewer.mGridOptionSurface;
            gridOptionPreviewer.mSurfaceCallback = new GridOptionPreviewer.GridOptionSurfaceHolderCallback(surfaceView3, surfaceView3.getContext());
            gridOptionPreviewer.mGridOptionSurface.getHolder().addCallback(gridOptionPreviewer.mSurfaceCallback);
            gridOptionPreviewer.mPreviewContainer.addView(gridOptionPreviewer.mGridOptionSurface);
        }
    }

    @Override // com.android.wallpaper.picker.BottomActionBarFragment
    public final boolean onBackPressed() {
        this.mGridOptionViewModel.mState.set("selected_option", null);
        this.mGridOptionViewModel.mState.set("bottom_action_bar_visible", Boolean.FALSE);
        return false;
    }

    @Override // com.android.wallpaper.picker.AppbarFragment
    public final CharSequence getDefaultTitle() {
        return getString(R.string.grid_title);
    }

    @Override // com.android.wallpaper.picker.AppbarFragment, com.android.wallpaper.picker.BottomActionBarFragment
    public final void onBottomActionBarReady(BottomActionBar bottomActionBar) {
        super.onBottomActionBarReady(bottomActionBar);
        this.mBottomActionBar = bottomActionBar;
        BottomActionBar.BottomAction bottomAction = BottomActionBar.BottomAction.APPLY_TEXT;
        bottomActionBar.showActionsOnly(bottomAction);
        this.mBottomActionBar.setActionClickListener(bottomAction, new AppbarFragment$$ExternalSyntheticLambda0(this, 1));
        ((View) this.mBottomActionBar.mActionMap.get(bottomAction)).setAccessibilityTraversalAfter(this.mOptionsContainer.getId());
    }

    @Override // androidx.fragment.app.Fragment
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mGridOptionViewModel = (GridOptionViewModel) new ViewModelProvider(requireActivity()).get(GridOptionViewModel.class);
    }

    @Override // androidx.fragment.app.Fragment
    public final View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.fragment_grid_picker, viewGroup, false);
        setUpToolbar(inflate, true);
        this.mContent = (ConstraintLayout) inflate.findViewById(R.id.content_section);
        this.mOptionsContainer = (RecyclerView) inflate.findViewById(R.id.options_container);
        if (((AccessibilityManager) getContext().getSystemService("accessibility")).isEnabled()) {
            this.mOptionsContainer.setItemAnimator(null);
        }
        Point screenSize = ScreenSizeCalculator.getInstance().getScreenSize(requireActivity().getWindowManager().getDefaultDisplay());
        ConstraintSet constraintSet = new ConstraintSet();
        constraintSet.clone(this.mContent);
        constraintSet.get(R.id.preview_card_container).layout.dimensionRatio = String.format(Locale.US, "%d:%d", Integer.valueOf(screenSize.x), Integer.valueOf(screenSize.y));
        constraintSet.applyTo(this.mContent);
        this.mLoading = (ContentLoadingProgressBar) inflate.findViewById(R.id.loading_indicator);
        this.mError = inflate.findViewById(R.id.error_section);
        inflate.setOnApplyWindowInsetsListener(GridFragment$$ExternalSyntheticLambda0.INSTANCE);
        Glide.get(getContext()).clearMemory();
        this.mGridManager = GridOptionsManager.getInstance(getContext());
        this.mEventLogger = R$style.getInjector().getUserEventLogger(getContext());
        this.mContent.setVisibility(0);
        this.mError.setVisibility(8);
        ContentLoadingProgressBar contentLoadingProgressBar = this.mLoading;
        contentLoadingProgressBar.getClass();
        contentLoadingProgressBar.post(new ContentLoadingProgressBar$$ExternalSyntheticLambda0(contentLoadingProgressBar, 0));
        GridOptionsManager gridOptionsManager = this.mGridManager;
        AnonymousClass2 r8 = new AnonymousClass2();
        gridOptionsManager.getClass();
        GridOptionsManager.sExecutorService.submit(new GridOptionsManager$$ExternalSyntheticLambda1(gridOptionsManager, r8));
        final WallpaperPreviewer wallpaperPreviewer = new WallpaperPreviewer(this.mLifecycleRegistry, getActivity(), (ImageView) inflate.findViewById(R.id.wallpaper_preview_image), (SurfaceView) inflate.findViewById(R.id.wallpaper_preview_surface));
        ((DefaultCurrentWallpaperInfoFactory) R$style.getInjector().getCurrentWallpaperFactory(getContext().getApplicationContext())).createCurrentWallpaperInfos(new CurrentWallpaperInfoFactory.WallpaperInfoCallback() { // from class: com.android.customization.picker.grid.GridFragment$$ExternalSyntheticLambda1
            @Override // com.android.wallpaper.module.CurrentWallpaperInfoFactory.WallpaperInfoCallback
            public final void onWallpaperInfoCreated(WallpaperInfo wallpaperInfo, WallpaperInfo wallpaperInfo2) {
                GridFragment gridFragment = GridFragment.this;
                WallpaperPreviewer wallpaperPreviewer2 = wallpaperPreviewer;
                gridFragment.getClass();
                wallpaperPreviewer2.mWallpaper = wallpaperInfo;
                wallpaperPreviewer2.mWallpaperColorsListener = null;
                ImageView imageView = wallpaperPreviewer2.mWallpaperSurfaceCallback.mHomeImageWallpaper;
                if (wallpaperInfo != null && imageView != null) {
                    imageView.post(new Asset$$ExternalSyntheticLambda1(wallpaperPreviewer2, imageView, 1));
                }
            }
        }, false);
        this.mGridOptionPreviewer = new GridOptionPreviewer(this.mGridManager, (ViewGroup) inflate.findViewById(R.id.grid_preview_container));
        return inflate;
    }
}
