package com.android.wallpaper.picker;

import android.app.ActivityOptions;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Insets;
import android.os.Bundle;
import android.util.Log;
import android.util.Pair;
import android.view.LayoutInflater;
import android.view.SurfaceView;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.view.animation.PathInterpolator;
import android.widget.Button;
import android.widget.Toast;
import androidx.activity.OnBackPressedCallback;
import androidx.cardview.R$style;
import androidx.fragment.app.FragmentActivity;
import androidx.lifecycle.ViewModelProvider;
import com.android.customization.picker.mode.DarkModeSectionView$$ExternalSyntheticLambda0;
import com.android.systemui.shared.R;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.android.wallpaper.model.LiveWallpaperInfo;
import com.android.wallpaper.model.SetWallpaperViewModel;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.module.Injector;
import com.android.wallpaper.module.LargeScreenMultiPanesChecker;
import com.android.wallpaper.module.UserEventLogger;
import com.android.wallpaper.module.WallpaperSetter;
import com.android.wallpaper.picker.LoadWallpaperErrorDialogFragment;
import com.android.wallpaper.picker.SetWallpaperDialogFragment;
import com.android.wallpaper.picker.SetWallpaperErrorDialogFragment;
import com.android.wallpaper.util.ActivityUtils;
import com.android.wallpaper.util.FullScreenAnimation;
import com.android.wallpaper.widget.BottomActionBar;
import com.android.wallpaper.widget.WallpaperInfoView;
import com.google.android.material.tabs.TabLayout;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.function.Supplier;
/* loaded from: classes.dex */
public abstract class PreviewFragment extends AppbarFragment implements SetWallpaperDialogFragment.Listener, SetWallpaperErrorDialogFragment.Listener, LoadWallpaperErrorDialogFragment.Listener {
    public static final PathInterpolator ALPHA_OUT = new PathInterpolator(HingeAngleProviderKt.FULLY_CLOSED_DEGREES, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, 0.8f, 1.0f);
    public BottomActionBar mBottomActionBar;
    public FullScreenAnimation mFullScreenAnimation;
    public Optional<Integer> mLastSelectedTabPositionOptional = Optional.empty();
    public AnonymousClass1 mOnBackPressedCallback;
    public WallpaperPreviewBitmapTransformation mPreviewBitmapTransformation;
    public View mRootView;
    public SetWallpaperViewModel mSetWallpaperViewModel;
    public boolean mShowInFullScreen;
    public LoadWallpaperErrorDialogFragment mStagedLoadWallpaperErrorDialogFragment;
    public SetWallpaperErrorDialogFragment mStagedSetWallpaperErrorDialogFragment;
    public boolean mTestingModeEnabled;
    public UserEventLogger mUserEventLogger;
    public boolean mViewAsHome;
    public ViewModelProvider mViewModelProvider;
    public WallpaperInfo mWallpaper;
    public WallpaperSetter mWallpaperSetter;

    /* loaded from: classes.dex */
    public final class WallpaperInfoContent extends BottomActionBar.BottomSheetContent<WallpaperInfoView> {
        public CharSequence mActionLabel;
        public Intent mExploreIntent;

        @Override // com.android.wallpaper.widget.BottomActionBar.BottomSheetContent
        public final int getViewId() {
            return R.layout.wallpaper_info_view;
        }

        public WallpaperInfoContent(Context context) {
            super(context);
        }

        /* JADX WARN: Removed duplicated region for block: B:15:0x0042  */
        /* JADX WARN: Removed duplicated region for block: B:27:0x00a5  */
        /* JADX WARN: Removed duplicated region for block: B:36:? A[RETURN, SYNTHETIC] */
        /* JADX WARN: Type inference failed for: r1v2, types: [com.android.wallpaper.picker.PreviewFragment$WallpaperInfoContent$$ExternalSyntheticLambda1] */
        @Override // com.android.wallpaper.widget.BottomActionBar.BottomSheetContent
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final void onViewCreated(com.android.wallpaper.widget.WallpaperInfoView r6) {
            /*
                r5 = this;
                com.android.wallpaper.widget.WallpaperInfoView r6 = (com.android.wallpaper.widget.WallpaperInfoView) r6
                com.android.wallpaper.picker.PreviewFragment r0 = com.android.wallpaper.picker.PreviewFragment.this
                com.android.wallpaper.model.WallpaperInfo r1 = r0.mWallpaper
                if (r1 != 0) goto La
                goto Lac
            La:
                java.lang.CharSequence r1 = r5.mActionLabel
                if (r1 != 0) goto La9
                com.android.wallpaper.picker.PreviewFragment$WallpaperInfoContent$$ExternalSyntheticLambda1 r1 = new com.android.wallpaper.picker.PreviewFragment$WallpaperInfoContent$$ExternalSyntheticLambda1
                r1.<init>()
                android.content.Context r6 = r0.getContext()
                if (r6 != 0) goto L1b
                goto Lac
            L1b:
                com.android.wallpaper.picker.PreviewFragment r0 = com.android.wallpaper.picker.PreviewFragment.this
                com.android.wallpaper.model.WallpaperInfo r0 = r0.mWallpaper
                com.android.wallpaper.picker.PreviewFragment$WallpaperInfoContent$$ExternalSyntheticLambda0 r2 = new com.android.wallpaper.picker.PreviewFragment$WallpaperInfoContent$$ExternalSyntheticLambda0
                r2.<init>(r5, r1)
                java.lang.String r5 = r0.getActionUrl(r6)
                boolean r1 = r0 instanceof com.android.wallpaper.model.LiveWallpaperInfo
                r3 = 0
                if (r1 == 0) goto L3b
                r1 = r0
                com.android.wallpaper.model.LiveWallpaperInfo r1 = (com.android.wallpaper.model.LiveWallpaperInfo) r1
                android.app.WallpaperInfo r1 = r1.mInfo     // Catch: android.content.res.Resources.NotFoundException -> L3b
                android.content.pm.PackageManager r4 = r6.getPackageManager()     // Catch: android.content.res.Resources.NotFoundException -> L3b
                java.lang.CharSequence r1 = r1.loadContextDescription(r4)     // Catch: android.content.res.Resources.NotFoundException -> L3b
                goto L3c
            L3b:
                r1 = r3
            L3c:
                boolean r4 = android.text.TextUtils.isEmpty(r1)
                if (r4 == 0) goto L4a
                int r1 = r0.getActionLabelRes()
                java.lang.String r1 = r6.getString(r1)
            L4a:
                if (r5 == 0) goto L9b
                boolean r5 = r5.isEmpty()
                if (r5 != 0) goto L9b
                java.lang.String r5 = r0.getActionUrl(r6)
                android.net.Uri r5 = android.net.Uri.parse(r5)
                com.android.wallpaper.module.Injector r0 = androidx.cardview.R$style.getInjector()
                com.android.wallpaper.module.ExploreIntentChecker r6 = r0.getExploreIntentChecker(r6)
                com.android.wallpaper.picker.WallpaperInfoHelper$$ExternalSyntheticLambda0 r0 = new com.android.wallpaper.picker.WallpaperInfoHelper$$ExternalSyntheticLambda0
                r0.<init>(r2, r1)
                com.android.wallpaper.module.DefaultExploreIntentChecker r6 = (com.android.wallpaper.module.DefaultExploreIntentChecker) r6
                java.util.HashMap r3 = r6.mUriToActionViewIntentMap
                boolean r3 = r3.containsKey(r5)
                if (r3 == 0) goto L8d
                java.util.HashMap r6 = r6.mUriToActionViewIntentMap
                java.lang.Object r5 = r6.get(r5)
                android.content.Intent r5 = (android.content.Intent) r5
                com.android.wallpaper.picker.WallpaperInfoHelper$ExploreIntentReceiver r2 = (com.android.wallpaper.picker.WallpaperInfoHelper$ExploreIntentReceiver) r2
                java.lang.CharSequence r1 = (java.lang.CharSequence) r1
                com.android.wallpaper.picker.PreviewFragment$WallpaperInfoContent$$ExternalSyntheticLambda0 r2 = (com.android.wallpaper.picker.PreviewFragment$WallpaperInfoContent$$ExternalSyntheticLambda0) r2
                com.android.wallpaper.picker.PreviewFragment$WallpaperInfoContent r6 = r2.f$0
                java.lang.Runnable r0 = r2.f$1
                r6.mActionLabel = r1
                r6.mExploreIntent = r5
                if (r0 == 0) goto Lac
                r0.run()
                goto Lac
            L8d:
                com.android.wallpaper.module.DefaultExploreIntentChecker$FetchActionViewIntentTask r1 = new com.android.wallpaper.module.DefaultExploreIntentChecker$FetchActionViewIntentTask
                android.content.Context r2 = r6.mAppContext
                r1.<init>(r2, r5, r0)
                r5 = 0
                java.lang.Void[] r5 = new java.lang.Void[r5]
                r1.execute(r5)
                goto Lac
            L9b:
                com.android.wallpaper.picker.PreviewFragment$WallpaperInfoContent r5 = r2.f$0
                java.lang.Runnable r6 = r2.f$1
                r5.mActionLabel = r1
                r5.mExploreIntent = r3
                if (r6 == 0) goto Lac
                r6.run()
                goto Lac
            La9:
                r5.populateWallpaperInfo(r6)
            Lac:
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: com.android.wallpaper.picker.PreviewFragment.WallpaperInfoContent.onViewCreated(android.view.View):void");
        }

        public final void populateWallpaperInfo(WallpaperInfoView wallpaperInfoView) {
            boolean z;
            boolean z2;
            PreviewFragment previewFragment = PreviewFragment.this;
            WallpaperInfo wallpaperInfo = previewFragment.mWallpaper;
            CharSequence charSequence = this.mActionLabel;
            Context context = previewFragment.getContext();
            if (this.mExploreIntent == null || ActivityUtils.isSUWMode(context)) {
                z = false;
            } else {
                z = true;
            }
            DarkModeSectionView$$ExternalSyntheticLambda0 darkModeSectionView$$ExternalSyntheticLambda0 = new DarkModeSectionView$$ExternalSyntheticLambda0(this, 1);
            List<String> attributions = wallpaperInfo.getAttributions(wallpaperInfoView.getContext());
            wallpaperInfoView.mTitle.setText((CharSequence) null);
            wallpaperInfoView.mSubtitle1.setText((CharSequence) null);
            wallpaperInfoView.mSubtitle1.setVisibility(8);
            wallpaperInfoView.mSubtitle2.setText((CharSequence) null);
            wallpaperInfoView.mSubtitle2.setVisibility(8);
            wallpaperInfoView.mExploreButton.setText((CharSequence) null);
            wallpaperInfoView.mExploreButton.setOnClickListener(null);
            wallpaperInfoView.mExploreButton.setVisibility(8);
            if (attributions.size() > 0 && attributions.get(0) != null) {
                wallpaperInfoView.mTitle.setText(attributions.get(0));
            }
            android.app.WallpaperInfo wallpaperComponent = wallpaperInfo.getWallpaperComponent();
            if (wallpaperComponent == null || wallpaperComponent.getShowMetadataInPreview()) {
                z2 = true;
            } else {
                z2 = false;
            }
            if (z2) {
                if (attributions.size() > 1 && attributions.get(1) != null) {
                    wallpaperInfoView.mSubtitle1.setVisibility(0);
                    wallpaperInfoView.mSubtitle1.setText(attributions.get(1));
                }
                if (attributions.size() > 2 && attributions.get(2) != null) {
                    wallpaperInfoView.mSubtitle2.setVisibility(0);
                    wallpaperInfoView.mSubtitle2.setText(attributions.get(2));
                }
                if (z) {
                    wallpaperInfoView.mExploreButton.setVisibility(0);
                    wallpaperInfoView.mExploreButton.setText(charSequence);
                    wallpaperInfoView.mExploreButton.setOnClickListener(darkModeSectionView$$ExternalSyntheticLambda0);
                }
            }
        }
    }

    public abstract int getLayoutResId();

    @Override // com.android.wallpaper.picker.AppbarFragment
    public final int getToolbarColorId() {
        return 17170445;
    }

    @Override // androidx.fragment.app.Fragment
    public void onDestroy() {
        this.mCalled = true;
        WallpaperSetter wallpaperSetter = this.mWallpaperSetter;
        ProgressDialog progressDialog = wallpaperSetter.mProgressDialog;
        if (progressDialog != null) {
            progressDialog.dismiss();
            wallpaperSetter.mProgressDialog = null;
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onResume() {
        this.mCalled = true;
        R$style.getInjector().getPreferences(getActivity()).setLastAppActiveTimestamp(new Date().getTime());
        LoadWallpaperErrorDialogFragment loadWallpaperErrorDialogFragment = this.mStagedLoadWallpaperErrorDialogFragment;
        if (loadWallpaperErrorDialogFragment != null) {
            loadWallpaperErrorDialogFragment.show(getParentFragmentManager(), "load_wallpaper_error_dialog");
            this.mStagedLoadWallpaperErrorDialogFragment = null;
        }
        SetWallpaperErrorDialogFragment setWallpaperErrorDialogFragment = this.mStagedSetWallpaperErrorDialogFragment;
        if (setWallpaperErrorDialogFragment != null) {
            setWallpaperErrorDialogFragment.show(getParentFragmentManager(), "set_wallpaper_error_dialog");
            this.mStagedSetWallpaperErrorDialogFragment = null;
        }
        this.mSetWallpaperViewModel.mStatus.observe(requireActivity(), new PreviewFragment$$ExternalSyntheticLambda6(this, 0));
    }

    public abstract void setCurrentWallpaper(int i);

    public abstract void updateScreenPreview(boolean z);

    public WorkspaceSurfaceHolderCallback createWorkspaceSurfaceCallback(SurfaceView surfaceView) {
        return new WorkspaceSurfaceHolderCallback(surfaceView, getContext(), false);
    }

    public List getAttributions(FragmentActivity fragmentActivity) {
        return this.mWallpaper.getAttributions(fragmentActivity);
    }

    @Override // com.android.wallpaper.picker.SetWallpaperErrorDialogFragment.Listener
    public final void onClickTryAgain(int i) {
        this.mSetWallpaperViewModel.mDestination = i;
        setCurrentWallpaper(i);
    }

    @Override // com.android.wallpaper.picker.SetWallpaperDialogFragment.Listener
    public final void onDialogDismissed(boolean z) {
        this.mBottomActionBar.deselectAction(BottomActionBar.BottomAction.APPLY);
    }

    @Override // com.android.wallpaper.picker.SetWallpaperDialogFragment.Listener
    public final void onSet(int i) {
        this.mSetWallpaperViewModel.mDestination = i;
        setCurrentWallpaper(i);
    }

    public void onSetWallpaperClicked(WallpaperInfo wallpaperInfo) {
        this.mWallpaperSetter.requestDestination(getActivity(), this.mFragmentManager, this, wallpaperInfo instanceof LiveWallpaperInfo);
    }

    public final void setFullScreenActions(View view) {
        float f;
        int i;
        if (!this.mShowInFullScreen) {
            Button button = (Button) view.findViewById(R.id.hide_ui_preview_button);
            if (this.mFullScreenAnimation.mWorkspaceVisibility) {
                i = R.string.hide_ui_preview_text;
            } else {
                i = R.string.show_ui_preview_text;
            }
            button.setText(i);
            button.setOnClickListener(new PreviewFragment$$ExternalSyntheticLambda1(this, 0));
            view.findViewById(R.id.set_as_wallpaper_button).setOnClickListener(new View.OnClickListener() { // from class: com.android.wallpaper.picker.PreviewFragment$$ExternalSyntheticLambda4
                @Override // android.view.View.OnClickListener
                public final void onClick(View view2) {
                    PreviewFragment previewFragment = PreviewFragment.this;
                    previewFragment.onSetWallpaperClicked(previewFragment.mWallpaper);
                }
            });
        } else {
            view.findViewById(R.id.hide_ui_preview_button).setVisibility(8);
            view.findViewById(R.id.set_as_wallpaper_button).setVisibility(8);
            this.mToolbar.inflateMenu(R.menu.fullpreview_menu);
            this.mToolbar.setOnMenuItemClickListener(this);
            this.mToolbar.getMenu().findItem(R.id.action_hide_ui).getActionView().setOnClickListener(new PreviewFragment$$ExternalSyntheticLambda3(this, 0));
            this.mToolbar.getMenu().findItem(R.id.action_set_wallpaper).getActionView().setOnClickListener(new PreviewFragment$$ExternalSyntheticLambda2(this, 0));
        }
        FullScreenAnimation fullScreenAnimation = this.mFullScreenAnimation;
        if (fullScreenAnimation.mIsFullScreen) {
            f = fullScreenAnimation.mBottomActionBarTranslation;
        } else {
            f = HingeAngleProviderKt.FULLY_CLOSED_DEGREES;
        }
        fullScreenAnimation.mView.findViewById(R.id.bottom_actionbar).setTranslationY(f);
    }

    public final void showLoadWallpaperErrorDialog() {
        LoadWallpaperErrorDialogFragment loadWallpaperErrorDialogFragment = new LoadWallpaperErrorDialogFragment();
        loadWallpaperErrorDialogFragment.setTargetFragment(this);
        BasePreviewActivity basePreviewActivity = (BasePreviewActivity) getActivity();
        if (basePreviewActivity == null || !basePreviewActivity.mIsSafeToCommitFragmentTransaction) {
            this.mStagedLoadWallpaperErrorDialogFragment = loadWallpaperErrorDialogFragment;
        } else {
            loadWallpaperErrorDialogFragment.show(getParentFragmentManager(), "load_wallpaper_error_dialog");
        }
    }

    public final void finishActivity(boolean z) {
        FragmentActivity activity = getActivity();
        if (activity != null) {
            if (z) {
                try {
                    Toast.makeText(activity, (int) R.string.wallpaper_set_successfully_message, 0).show();
                } catch (Resources.NotFoundException e) {
                    Log.e("PreviewFragment", "Could not show toast " + e);
                }
                activity.setResult(-1);
            }
            activity.finish();
            activity.overridePendingTransition(R.anim.fade_in, R.anim.fade_out);
        }
    }

    @Override // com.android.wallpaper.picker.AppbarFragment
    public final CharSequence getDefaultTitle() {
        return getContext().getString(R.string.preview);
    }

    /* JADX WARN: Type inference failed for: r3v4, types: [com.android.wallpaper.picker.PreviewFragment$1] */
    @Override // com.android.wallpaper.picker.AppbarFragment, com.android.wallpaper.picker.BottomActionBarFragment
    public void onBottomActionBarReady(BottomActionBar bottomActionBar) {
        super.onBottomActionBarReady(bottomActionBar);
        this.mBottomActionBar = bottomActionBar;
        if (!this.mShowInFullScreen) {
            bottomActionBar.setActionClickListener(BottomActionBar.BottomAction.EDIT, new View.OnClickListener() { // from class: com.android.wallpaper.picker.PreviewFragment$$ExternalSyntheticLambda5
                @Override // android.view.View.OnClickListener
                public final void onClick(View view) {
                    PreviewFragment previewFragment = PreviewFragment.this;
                    PathInterpolator pathInterpolator = PreviewFragment.ALPHA_OUT;
                    boolean z = true;
                    if (new LargeScreenMultiPanesChecker().isMultiPanesEnabled(previewFragment.getContext())) {
                        WallpaperInfo wallpaperInfo = previewFragment.mWallpaper;
                        if (wallpaperInfo != null) {
                            FragmentActivity activity = previewFragment.getActivity();
                            if (previewFragment.mLastSelectedTabPositionOptional.orElse(0).intValue() != 0) {
                                z = false;
                            }
                            int i = FullPreviewActivity.$r8$clinit;
                            Intent intent = new Intent(activity, FullPreviewActivity.class);
                            intent.setFlags(268435456);
                            intent.putExtra("com.android.wallpaper.picker.wallpaper_info", wallpaperInfo);
                            previewFragment.startActivity(intent.putExtra("com.android.wallpaper.picker.view_as_home", z), ActivityOptions.makeSceneTransitionAnimation(previewFragment.getActivity(), new Pair[0]).toBundle());
                        }
                    } else {
                        previewFragment.mFullScreenAnimation.startAnimation(true);
                    }
                    previewFragment.mBottomActionBar.deselectAction(BottomActionBar.BottomAction.EDIT);
                }
            });
        } else {
            bottomActionBar.post(new PreviewFragment$$ExternalSyntheticLambda7(this, 0));
        }
        setFullScreenActions(this.mRootView.findViewById(R.id.fullscreen_buttons_container));
        if (this.mOnBackPressedCallback == null) {
            this.mOnBackPressedCallback = new OnBackPressedCallback() { // from class: com.android.wallpaper.picker.PreviewFragment.1
                @Override // androidx.activity.OnBackPressedCallback
                public final void handleOnBackPressed() {
                    PreviewFragment previewFragment = PreviewFragment.this;
                    FullScreenAnimation fullScreenAnimation = previewFragment.mFullScreenAnimation;
                    boolean z = false;
                    if (!fullScreenAnimation.mIsFullScreen || previewFragment.mShowInFullScreen) {
                        BottomActionBar bottomActionBar2 = previewFragment.mBottomActionBar;
                        if (bottomActionBar2 != null) {
                            if (bottomActionBar2.mBottomSheetBehavior.state == 4) {
                                z = true;
                            }
                            if (!z) {
                                bottomActionBar2.hideBottomSheetAndDeselectButtonIfExpanded();
                                return;
                            }
                        }
                        previewFragment.getActivity().finish();
                        return;
                    }
                    fullScreenAnimation.startAnimation(false);
                }
            };
            getActivity().mOnBackPressedDispatcher.addCallback(this, this.mOnBackPressedCallback);
        }
    }

    public void onClickOk() {
        FragmentActivity activity = getActivity();
        if (activity != null) {
            activity.finish();
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Context applicationContext = getContext().getApplicationContext();
        Injector injector = R$style.getInjector();
        this.mUserEventLogger = injector.getUserEventLogger(applicationContext);
        this.mWallpaper = (WallpaperInfo) this.mArguments.getParcelable("wallpaper");
        boolean z = true;
        if (getResources().getConfiguration().getLayoutDirection() != 1) {
            z = false;
        }
        this.mPreviewBitmapTransformation = new WallpaperPreviewBitmapTransformation(applicationContext, z);
        this.mArguments.getInt("preview_mode");
        this.mViewAsHome = this.mArguments.getBoolean("view_as_home");
        this.mShowInFullScreen = this.mArguments.getBoolean("view_full_screen");
        this.mTestingModeEnabled = this.mArguments.getBoolean("testing_mode_enabled");
        this.mWallpaperSetter = new WallpaperSetter(injector.getWallpaperPersister(applicationContext), injector.getPreferences(applicationContext), this.mUserEventLogger, this.mTestingModeEnabled);
        ViewModelProvider viewModelProvider = new ViewModelProvider(requireActivity());
        this.mViewModelProvider = viewModelProvider;
        this.mSetWallpaperViewModel = (SetWallpaperViewModel) viewModelProvider.get(SetWallpaperViewModel.class);
        FragmentActivity activity = getActivity();
        List attributions = getAttributions(activity);
        if (attributions.size() > 0 && attributions.get(0) != null) {
            activity.setTitle((CharSequence) attributions.get(0));
        }
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(getLayoutResId(), viewGroup, false);
        setUpToolbar(inflate, true);
        this.mRootView = inflate;
        FullScreenAnimation fullScreenAnimation = new FullScreenAnimation(inflate);
        this.mFullScreenAnimation = fullScreenAnimation;
        fullScreenAnimation.mShowInFullScreen = this.mShowInFullScreen;
        getActivity().getWindow().getDecorView().setOnApplyWindowInsetsListener(new View.OnApplyWindowInsetsListener() { // from class: com.android.wallpaper.picker.PreviewFragment$$ExternalSyntheticLambda0
            @Override // android.view.View.OnApplyWindowInsetsListener
            public final WindowInsets onApplyWindowInsets(View view, WindowInsets windowInsets) {
                PreviewFragment previewFragment = PreviewFragment.this;
                PathInterpolator pathInterpolator = PreviewFragment.ALPHA_OUT;
                previewFragment.getClass();
                view.setPadding(view.getPaddingLeft(), 0, view.getPaddingRight(), 0);
                FullScreenAnimation fullScreenAnimation2 = previewFragment.mFullScreenAnimation;
                fullScreenAnimation2.getClass();
                Insets insetsIgnoringVisibility = windowInsets.getInsetsIgnoringVisibility(WindowInsets.Type.systemBars());
                fullScreenAnimation2.mStatusBarHeight = insetsIgnoringVisibility.top;
                fullScreenAnimation2.mNavigationBarHeight = insetsIgnoringVisibility.bottom;
                FullScreenAnimation fullScreenAnimation3 = previewFragment.mFullScreenAnimation;
                fullScreenAnimation3.setViewMargins(R.id.screen_preview_layout, fullScreenAnimation3.mStatusBarHeight + fullScreenAnimation3.mView.findViewById(R.id.preview_header).getPaddingBottom(), fullScreenAnimation3.mView.getResources().getDimension(R.dimen.separated_tabs_height) + fullScreenAnimation3.mView.getResources().getDimension(R.dimen.bottom_actions_height) + fullScreenAnimation3.mNavigationBarHeight, false);
                fullScreenAnimation3.setViewMargins(R.id.bottom_action_bar_container, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, fullScreenAnimation3.mNavigationBarHeight, false);
                fullScreenAnimation3.setViewMargins(R.id.separated_tabs_container, HingeAngleProviderKt.FULLY_CLOSED_DEGREES, fullScreenAnimation3.mView.getResources().getDimension(R.dimen.bottom_actions_height) + fullScreenAnimation3.mNavigationBarHeight, true);
                fullScreenAnimation3.ensureToolbarIsCorrectlyLocated();
                View findViewById = view.findViewById(R.id.preview_header);
                findViewById.setPadding(findViewById.getPaddingLeft(), previewFragment.mFullScreenAnimation.mStatusBarHeight, findViewById.getPaddingRight(), findViewById.getPaddingBottom());
                return windowInsets.consumeSystemWindowInsets();
            }
        });
        return inflate;
    }

    public final void setUpTabs(TabLayout tabLayout) {
        boolean z;
        TabLayout.Tab newTab = tabLayout.newTab();
        newTab.setText(R.string.home_screen_message);
        tabLayout.addTab(newTab, tabLayout.tabs.size(), tabLayout.tabs.isEmpty());
        TabLayout.Tab newTab2 = tabLayout.newTab();
        newTab2.setText(R.string.lock_screen_message);
        tabLayout.addTab(newTab2, tabLayout.tabs.size(), tabLayout.tabs.isEmpty());
        tabLayout.addOnTabSelectedListener(new TabLayout.OnTabSelectedListener() { // from class: com.android.wallpaper.picker.PreviewFragment.2
            @Override // com.google.android.material.tabs.TabLayout.BaseOnTabSelectedListener
            public final void onTabReselected() {
            }

            @Override // com.google.android.material.tabs.TabLayout.BaseOnTabSelectedListener
            public final void onTabUnselected() {
            }

            @Override // com.google.android.material.tabs.TabLayout.BaseOnTabSelectedListener
            public final void onTabSelected(TabLayout.Tab tab) {
                boolean z2;
                PreviewFragment.this.mLastSelectedTabPositionOptional = Optional.of(Integer.valueOf(tab.position));
                PreviewFragment previewFragment = PreviewFragment.this;
                if (tab.position == 0) {
                    z2 = true;
                } else {
                    z2 = false;
                }
                previewFragment.updateScreenPreview(z2);
            }
        });
        int intValue = this.mLastSelectedTabPositionOptional.orElseGet(new Supplier() { // from class: com.android.wallpaper.picker.PreviewFragment$$ExternalSyntheticLambda9
            @Override // java.util.function.Supplier
            public final Object get() {
                return Integer.valueOf(!PreviewFragment.this.mViewAsHome ? 1 : 0);
            }
        }).intValue();
        tabLayout.getTabAt(intValue).select();
        if (intValue == 0) {
            z = true;
        } else {
            z = false;
        }
        updateScreenPreview(z);
    }

    public final void updatePreviewHeader(View view) {
        view.findViewById(R.id.preview_header).setBackgroundColor(getContext().getColor(R.color.toolbar_color));
    }
}
