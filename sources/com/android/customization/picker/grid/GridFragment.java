package com.android.customization.picker.grid;

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
import androidx.core.widget.ContentLoadingProgressBar;
import androidx.lifecycle.ViewModelProvider;
import androidx.recyclerview.widget.RecyclerView;
import com.android.customization.model.CustomizationManager;
import com.android.customization.model.CustomizationOption;
import com.android.customization.model.grid.GridOption;
import com.android.customization.model.grid.GridOptionViewModel;
import com.android.customization.model.grid.GridOptionsManager;
import com.android.customization.module.ThemesUserEventLogger;
import com.android.customization.picker.WallpaperPreviewer;
import com.android.customization.picker.WallpaperPreviewer$$ExternalSyntheticLambda1;
import com.android.customization.picker.grid.GridOptionPreviewer;
import com.android.customization.widget.OptionSelectorController;
import com.android.systemui.shared.R;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.module.CurrentWallpaperInfoFactory;
import com.android.wallpaper.module.DefaultCurrentWallpaperInfoFactory;
import com.android.wallpaper.module.InjectorProvider;
import com.android.wallpaper.picker.AppbarFragment;
import com.android.wallpaper.picker.AppbarFragment$$ExternalSyntheticLambda0;
import com.android.wallpaper.widget.BottomActionBar;
import com.bumptech.glide.Glide;
import java.util.List;
import java.util.Objects;
/* loaded from: classes.dex */
public class GridFragment extends AppbarFragment {
    public static final /* synthetic */ int $r8$clinit = 0;
    public final CustomizationManager.Callback mApplyGridCallback = new CustomizationManager.Callback() { // from class: com.android.customization.picker.grid.GridFragment.1
        @Override // com.android.customization.model.CustomizationManager.Callback
        public void onError(Throwable th) {
            GridFragment.this.mBottomActionBar.enableActions();
            GridFragment.this.mBottomActionBar.setVisibility(8);
            GridFragment.this.mGridOptionViewModel.setBottomActionBarVisible(false);
        }

        @Override // com.android.customization.model.CustomizationManager.Callback
        public void onSuccess() {
            Toast.makeText(GridFragment.this.getContext(), (int) R.string.applied_grid_msg, 0).show();
            GridFragment.this.getActivity().overridePendingTransition(R.anim.fade_in, R.anim.fade_out);
            GridFragment.this.getActivity().finish();
            R$style.launchHome(GridFragment.this.getContext());
        }
    };
    public BottomActionBar mBottomActionBar;
    public View mContent;
    public View mError;
    public ThemesUserEventLogger mEventLogger;
    public GridOptionsManager mGridManager;
    public GridOptionPreviewer mGridOptionPreviewer;
    public GridOptionViewModel mGridOptionViewModel;
    public ContentLoadingProgressBar mLoading;
    public RecyclerView mOptionsContainer;
    public OptionSelectorController<GridOption> mOptionsController;

    /* renamed from: com.android.customization.picker.grid.GridFragment$2  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass2 implements CustomizationManager.OptionsFetchedListener<GridOption> {
        public AnonymousClass2() {
        }

        @Override // com.android.customization.model.CustomizationManager.OptionsFetchedListener
        public void onError(Throwable th) {
            if (th != null) {
                Log.e("GridFragment", "Error loading grid options", th);
            }
            GridFragment gridFragment = GridFragment.this;
            gridFragment.mLoading.hide();
            gridFragment.mContent.setVisibility(8);
            gridFragment.mError.setVisibility(0);
        }

        @Override // com.android.customization.model.CustomizationManager.OptionsFetchedListener
        public void onOptionsLoaded(List<GridOption> list) {
            GridFragment.this.mLoading.hide();
            GridFragment gridFragment = GridFragment.this;
            gridFragment.mOptionsController = new OptionSelectorController<>(gridFragment.mOptionsContainer, list, false, 3);
            GridFragment gridFragment2 = GridFragment.this;
            gridFragment2.mOptionsController.initOptions(gridFragment2.mGridManager);
            GridOption orElse = list.stream().filter(new GridFragment$$ExternalSyntheticLambda2(GridFragment.this.mGridOptionViewModel.getSelectedOption())).findAny().orElse(null);
            GridFragment gridFragment3 = GridFragment.this;
            GridOptionViewModel gridOptionViewModel = gridFragment3.mGridOptionViewModel;
            if (orElse == null) {
                orElse = list.stream().filter(new GridFragment$$ExternalSyntheticLambda2(gridFragment3)).findAny().orElse(list.get(0));
            }
            gridOptionViewModel.setSelectedOption(orElse);
            GridFragment gridFragment4 = GridFragment.this;
            gridFragment4.mOptionsController.setSelectedOption(gridFragment4.mGridOptionViewModel.getSelectedOption());
            GridFragment gridFragment5 = GridFragment.this;
            GridFragment.access$800(gridFragment5, gridFragment5.mGridOptionViewModel.getSelectedOption());
            GridFragment gridFragment6 = GridFragment.this;
            GridOptionViewModel gridOptionViewModel2 = gridFragment6.mGridOptionViewModel;
            if (gridOptionViewModel2.mState.mRegular.containsKey("bottom_action_bar_visible") ? ((Boolean) gridOptionViewModel2.mState.mRegular.get("bottom_action_bar_visible")).booleanValue() : false) {
                gridFragment6.mBottomActionBar.setVisibility(0);
            } else {
                gridFragment6.mBottomActionBar.setVisibility(8);
            }
            GridFragment.this.mOptionsController.mListeners.add(new GridFragment$2$$ExternalSyntheticLambda0(this));
        }
    }

    public static void access$800(GridFragment gridFragment, CustomizationOption customizationOption) {
        gridFragment.mGridOptionViewModel.setSelectedOption((GridOption) customizationOption);
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
            }
            if (gridOptionPreviewer.mGridOptionSurface == null) {
                SurfaceView surfaceView = new SurfaceView(gridOptionPreviewer.mPreviewContainer.getContext());
                gridOptionPreviewer.mGridOptionSurface = surfaceView;
                surfaceView.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
                gridOptionPreviewer.mGridOptionSurface.setZOrderMediaOverlay(true);
                SurfaceView surfaceView2 = gridOptionPreviewer.mGridOptionSurface;
                gridOptionPreviewer.mSurfaceCallback = new GridOptionPreviewer.GridOptionSurfaceHolderCallback(surfaceView2, surfaceView2.getContext(), null);
                gridOptionPreviewer.mGridOptionSurface.getHolder().addCallback(gridOptionPreviewer.mSurfaceCallback);
            }
            gridOptionPreviewer.mPreviewContainer.addView(gridOptionPreviewer.mGridOptionSurface);
        }
    }

    @Override // com.android.wallpaper.picker.AppbarFragment
    public CharSequence getDefaultTitle() {
        return getString(R.string.grid_title);
    }

    @Override // com.android.wallpaper.picker.BottomActionBarFragment
    public boolean onBackPressed() {
        this.mGridOptionViewModel.setSelectedOption(null);
        this.mGridOptionViewModel.setBottomActionBarVisible(false);
        return false;
    }

    @Override // com.android.wallpaper.picker.AppbarFragment, com.android.wallpaper.picker.BottomActionBarFragment
    public void onBottomActionBarReady(BottomActionBar bottomActionBar) {
        super.onBottomActionBarReady(bottomActionBar);
        this.mBottomActionBar = bottomActionBar;
        BottomActionBar.BottomAction bottomAction = BottomActionBar.BottomAction.APPLY_TEXT;
        bottomActionBar.showActionsOnly(bottomAction);
        this.mBottomActionBar.setActionClickListener(bottomAction, new AppbarFragment$$ExternalSyntheticLambda0(this));
    }

    @Override // androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mGridOptionViewModel = (GridOptionViewModel) new ViewModelProvider(requireActivity()).get(GridOptionViewModel.class);
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.fragment_grid_picker, viewGroup, false);
        setUpToolbar(inflate, true);
        this.mContent = inflate.findViewById(R.id.content_section);
        this.mOptionsContainer = (RecyclerView) inflate.findViewById(R.id.options_container);
        if (((AccessibilityManager) getContext().getSystemService("accessibility")).isEnabled()) {
            this.mOptionsContainer.setItemAnimator(null);
        }
        this.mLoading = (ContentLoadingProgressBar) inflate.findViewById(R.id.loading_indicator);
        this.mError = inflate.findViewById(R.id.error_section);
        inflate.setOnApplyWindowInsetsListener(GridFragment$$ExternalSyntheticLambda0.INSTANCE);
        Glide.get(getContext()).clearMemory();
        this.mGridManager = GridOptionsManager.getInstance(getContext());
        this.mEventLogger = (ThemesUserEventLogger) InjectorProvider.getInjector().getUserEventLogger(getContext());
        this.mContent.setVisibility(0);
        this.mError.setVisibility(8);
        this.mLoading.show();
        GridOptionsManager gridOptionsManager = this.mGridManager;
        AnonymousClass2 r2 = new AnonymousClass2();
        Objects.requireNonNull(gridOptionsManager);
        new GridOptionsManager.FetchTask(gridOptionsManager.mProvider, r2, true, null).execute(new Void[0]);
        final WallpaperPreviewer wallpaperPreviewer = new WallpaperPreviewer(this.mLifecycleRegistry, getActivity(), (ImageView) inflate.findViewById(R.id.wallpaper_preview_image), (SurfaceView) inflate.findViewById(R.id.wallpaper_preview_surface));
        ((DefaultCurrentWallpaperInfoFactory) InjectorProvider.getInjector().getCurrentWallpaperFactory(getContext().getApplicationContext())).createCurrentWallpaperInfos(new CurrentWallpaperInfoFactory.WallpaperInfoCallback() { // from class: com.android.customization.picker.grid.GridFragment$$ExternalSyntheticLambda1
            @Override // com.android.wallpaper.module.CurrentWallpaperInfoFactory.WallpaperInfoCallback
            public final void onWallpaperInfoCreated(WallpaperInfo wallpaperInfo, WallpaperInfo wallpaperInfo2, int i) {
                GridFragment gridFragment = GridFragment.this;
                WallpaperPreviewer wallpaperPreviewer2 = wallpaperPreviewer;
                Objects.requireNonNull(gridFragment);
                wallpaperPreviewer2.mWallpaper = wallpaperInfo;
                wallpaperPreviewer2.mWallpaperColorsListener = null;
                ImageView imageView = wallpaperPreviewer2.mWallpaperSurfaceCallback.mHomeImageWallpaper;
                if (wallpaperInfo != null && imageView != null) {
                    imageView.post(new WallpaperPreviewer$$ExternalSyntheticLambda1(wallpaperPreviewer2, imageView));
                }
            }
        }, false);
        this.mGridOptionPreviewer = new GridOptionPreviewer(this.mGridManager, (ViewGroup) inflate.findViewById(R.id.grid_preview_container));
        return inflate;
    }

    @Override // androidx.fragment.app.Fragment
    public void onDestroy() {
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
}
