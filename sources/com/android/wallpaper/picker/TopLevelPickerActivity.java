package com.android.wallpaper.picker;

import android.app.ProgressDialog;
import android.app.WallpaperManager;
import android.content.Context;
import android.content.Intent;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.provider.Settings;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import androidx.appcompat.widget.Toolbar;
import androidx.fragment.app.BackStackRecord;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.transition.R$id;
import com.android.systemui.shared.R;
import com.android.systemui.shared.system.QuickStepContract;
import com.android.systemui.unfold.updates.hinge.HingeAngleProviderKt;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.model.Category;
import com.android.wallpaper.model.ImageWallpaperInfo;
import com.android.wallpaper.model.InlinePreviewIntentFactory;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.module.CurrentWallpaperInfoFactory;
import com.android.wallpaper.module.DailyLoggingAlarmScheduler;
import com.android.wallpaper.module.DefaultCategoryProvider;
import com.android.wallpaper.module.DefaultCurrentWallpaperInfoFactory;
import com.android.wallpaper.module.DefaultNetworkStatusNotifier;
import com.android.wallpaper.module.DefaultWallpaperPersister;
import com.android.wallpaper.module.Injector;
import com.android.wallpaper.module.InjectorProvider;
import com.android.wallpaper.module.NetworkStatusNotifier;
import com.android.wallpaper.module.UserEventLogger;
import com.android.wallpaper.module.WallpaperPersister;
import com.android.wallpaper.module.WallpaperPreferences;
import com.android.wallpaper.module.WallpaperRotationRefresher;
import com.android.wallpaper.picker.AppbarFragment;
import com.android.wallpaper.picker.CategoryFragment;
import com.android.wallpaper.picker.CurrentWallpaperBottomSheetPresenter;
import com.android.wallpaper.picker.MyPhotosStarter;
import com.android.wallpaper.picker.SetWallpaperErrorDialogFragment;
import com.android.wallpaper.picker.ViewOnlyPreviewActivity;
import com.android.wallpaper.picker.individual.IndividualPickerFragment;
import com.android.wallpaper.util.ActivityUtils;
import com.android.wallpaper.util.ScreenSizeCalculator;
import com.android.wallpaper.widget.PreviewPager$$ExternalSyntheticLambda1;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.google.android.material.tabs.TabLayout;
import java.util.Objects;
/* loaded from: classes.dex */
public class TopLevelPickerActivity extends BaseActivity implements WallpapersUiContainer, CurrentWallpaperBottomSheetPresenter, SetWallpaperErrorDialogFragment.Listener, MyPhotosStarter, AppbarFragment.AppbarFragmentHost, CategoryFragment.CategoryFragmentHost {
    public static final /* synthetic */ int $r8$clinit = 0;
    public LinearLayout mBottomSheet;
    public Button mCurrentWallpaperExploreButton;
    public ImageView mCurrentWallpaperImage;
    public TextView mCurrentWallpaperPresentationMode;
    public Button mCurrentWallpaperSkipWallpaperButton;
    public TextView mCurrentWallpaperSubtitle;
    public TextView mCurrentWallpaperTitle;
    public WallpaperPickerDelegate mDelegate;
    public FrameLayout mFragmentContainer;
    public int mLastSelectedCategoryTabIndex;
    public FrameLayout mLoadingIndicatorContainer;
    public NetworkStatusNotifier.Listener mNetworkStatusListener;
    public NetworkStatusNotifier mNetworkStatusNotifier;
    public WallpaperInfo mPendingSetWallpaperInfo;
    public ProgressDialog mRefreshWallpaperProgressDialog;
    public ProgressDialog mSetWallpaperProgressDialog;
    public SetWallpaperErrorDialogFragment mStagedSetWallpaperErrorDialogFragment;
    public UserEventLogger mUserEventLogger;
    public WallpaperPersister mWallpaperPersister;
    public LinearLayout mWallpaperPositionOptions;
    public WallpaperPreferences mWallpaperPreferences;

    /* renamed from: com.android.wallpaper.picker.TopLevelPickerActivity$4  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass4 implements CurrentWallpaperInfoFactory.WallpaperInfoCallback {
        public final /* synthetic */ Context val$appContext;
        public final /* synthetic */ Injector val$injector;
        public final /* synthetic */ CurrentWallpaperBottomSheetPresenter.RefreshListener val$refreshListener;

        public AnonymousClass4(Context context, CurrentWallpaperBottomSheetPresenter.RefreshListener refreshListener, Injector injector) {
            this.val$appContext = context;
            this.val$refreshListener = refreshListener;
            this.val$injector = injector;
        }

        /* JADX WARN: Removed duplicated region for block: B:39:0x0117  */
        /* JADX WARN: Removed duplicated region for block: B:40:0x0119  */
        /* JADX WARN: Removed duplicated region for block: B:42:0x011c  */
        /* JADX WARN: Removed duplicated region for block: B:43:0x0130  */
        /* JADX WARN: Removed duplicated region for block: B:46:0x013b  */
        /* JADX WARN: Removed duplicated region for block: B:48:? A[RETURN, SYNTHETIC] */
        @Override // com.android.wallpaper.module.CurrentWallpaperInfoFactory.WallpaperInfoCallback
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public void onWallpaperInfoCreated(com.android.wallpaper.model.WallpaperInfo r8, com.android.wallpaper.model.WallpaperInfo r9, int r10) {
            /*
                Method dump skipped, instructions count: 325
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: com.android.wallpaper.picker.TopLevelPickerActivity.AnonymousClass4.onWallpaperInfoCreated(com.android.wallpaper.model.WallpaperInfo, com.android.wallpaper.model.WallpaperInfo, int):void");
        }
    }

    /* renamed from: com.android.wallpaper.picker.TopLevelPickerActivity$5  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass5 implements WallpaperRotationRefresher.Listener {
        public AnonymousClass5() {
        }
    }

    /* loaded from: classes.dex */
    public interface AssetReceiver {
    }

    /* loaded from: classes.dex */
    public static class FetchThumbAssetTask extends AsyncTask<Void, Void, Asset> {
        public Context mAppContext;
        public AssetReceiver mReceiver;
        public WallpaperInfo mWallpaperInfo;

        public FetchThumbAssetTask(Context context, WallpaperInfo wallpaperInfo, AssetReceiver assetReceiver) {
            this.mAppContext = context;
            this.mWallpaperInfo = wallpaperInfo;
            this.mReceiver = assetReceiver;
        }

        @Override // android.os.AsyncTask
        public Asset doInBackground(Void[] voidArr) {
            return this.mWallpaperInfo.getThumbAsset(this.mAppContext);
        }

        @Override // android.os.AsyncTask
        public void onPostExecute(Asset asset) {
            TopLevelPickerActivity$4$$ExternalSyntheticLambda1 topLevelPickerActivity$4$$ExternalSyntheticLambda1 = (TopLevelPickerActivity$4$$ExternalSyntheticLambda1) this.mReceiver;
            AnonymousClass4 r10 = topLevelPickerActivity$4$$ExternalSyntheticLambda1.f$0;
            WallpaperInfo wallpaperInfo = topLevelPickerActivity$4$$ExternalSyntheticLambda1.f$1;
            Context context = topLevelPickerActivity$4$$ExternalSyntheticLambda1.f$2;
            CurrentWallpaperBottomSheetPresenter.RefreshListener refreshListener = topLevelPickerActivity$4$$ExternalSyntheticLambda1.f$3;
            if (!TopLevelPickerActivity.this.isDestroyed()) {
                Asset thumbAsset = wallpaperInfo.getThumbAsset(context);
                TopLevelPickerActivity topLevelPickerActivity = TopLevelPickerActivity.this;
                thumbAsset.loadDrawableWithTransition(topLevelPickerActivity, topLevelPickerActivity.mCurrentWallpaperImage, 200, new PreviewPager$$ExternalSyntheticLambda1(refreshListener), 0);
            }
        }
    }

    @Override // com.android.wallpaper.picker.CategoryFragment.CategoryFragmentHost, com.android.wallpaper.picker.CategorySelectorFragment.CategorySelectorFragmentHost
    public void cleanUp() {
        this.mDelegate.cleanUp();
    }

    @Override // com.android.wallpaper.picker.WallpapersUiContainer
    public void doneFetchingCategories() {
        int i = this.mLastSelectedCategoryTabIndex;
        TabLayout tabLayout = (TabLayout) findViewById(R.id.tab_layout);
        tabLayout.removeAllTabs();
        String homeWallpaperCollectionId = this.mDelegate.mPreferences.getHomeWallpaperCollectionId();
        TabLayout.Tab tab = null;
        TabLayout.Tab tab2 = null;
        int i2 = 0;
        while (true) {
            DefaultCategoryProvider defaultCategoryProvider = (DefaultCategoryProvider) this.mDelegate.mCategoryProvider;
            if (i2 >= (defaultCategoryProvider.mFetchedCategories ? defaultCategoryProvider.mCategories.size() : 0)) {
                break;
            }
            Category category = ((DefaultCategoryProvider) this.mDelegate.mCategoryProvider).getCategory(i2);
            TabLayout.Tab newTab = tabLayout.newTab();
            newTab.setText(category.mTitle);
            newTab.tag = category;
            tabLayout.addTab(newTab, tabLayout.tabs.size(), false);
            if (tab2 == null && category.isEnumerable()) {
                tab2 = newTab;
            }
            if (i2 == i || (i == -1 && tab == null && category.isEnumerable() && homeWallpaperCollectionId != null && homeWallpaperCollectionId.equals(category.mCollectionId))) {
                tab = newTab;
            }
            i2++;
        }
        if (tab == null) {
            tab = tab2;
        }
        if (tab != null) {
            tab.select();
        }
    }

    @Override // com.android.wallpaper.picker.CategoryFragment.CategoryFragmentHost, com.android.wallpaper.picker.CategorySelectorFragment.CategorySelectorFragmentHost
    public void fetchCategories() {
        WallpaperPickerDelegate wallpaperPickerDelegate = this.mDelegate;
        wallpaperPickerDelegate.initialize(!((DefaultCategoryProvider) wallpaperPickerDelegate.mCategoryProvider).mFetchedCategories);
    }

    @Override // com.android.wallpaper.picker.WallpapersUiContainer
    public CategorySelectorFragment getCategorySelectorFragment() {
        if (this.mDelegate.mFormFactor != 1) {
            return null;
        }
        return ((CategoryFragment) getSupportFragmentManager().findFragmentById(R.id.fragment_container)).mCategorySelectorFragment;
    }

    @Override // com.android.wallpaper.picker.MyPhotosStarter.MyPhotosStarterProvider
    public MyPhotosStarter getMyPhotosStarter() {
        return this;
    }

    public final int getTextColorForWallpaperPositionButton(boolean z) {
        return R$id.getColorAttr(this, z ? 16843829 : 16843282);
    }

    @Override // com.android.wallpaper.picker.CategoryFragment.CategoryFragmentHost
    public boolean isReadExternalStoragePermissionGranted() {
        return this.mDelegate.isReadExternalStoragePermissionGranted();
    }

    @Override // com.android.wallpaper.picker.AppbarFragment.AppbarFragmentHost
    public boolean isUpArrowSupported() {
        return !ActivityUtils.isSUWMode(getBaseContext());
    }

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, android.app.Activity
    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        if (i == 0 && i2 == -1 && this.mDelegate.mFormFactor == 0) {
            Uri data = intent == null ? null : intent.getData();
            if (data != null) {
                setCustomPhotoWallpaper(new ImageWallpaperInfo(data));
                return;
            }
        }
        if (this.mDelegate.handleActivityResult(i, i2, intent)) {
            overridePendingTransition(R.anim.fade_in, R.anim.fade_out);
            setResult(-1);
            finish();
        }
    }

    @Override // androidx.activity.ComponentActivity, android.app.Activity
    public void onBackPressed() {
        Fragment findFragmentById = getSupportFragmentManager().findFragmentById(R.id.fragment_container);
        if (findFragmentById == null || !findFragmentById.getChildFragmentManager().popBackStackImmediate()) {
            this.mOnBackPressedDispatcher.onBackPressed();
        }
    }

    @Override // com.android.wallpaper.picker.SetWallpaperErrorDialogFragment.Listener
    public void onClickTryAgain(int i) {
        WallpaperInfo wallpaperInfo = this.mPendingSetWallpaperInfo;
        if (wallpaperInfo != null) {
            setCustomPhotoWallpaper(wallpaperInfo);
        }
    }

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    public void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.mLastSelectedCategoryTabIndex = -1;
        Injector injector = InjectorProvider.getInjector();
        this.mDelegate = new WallpaperPickerDelegate(this, this, injector);
        this.mUserEventLogger = injector.getUserEventLogger(this);
        this.mNetworkStatusNotifier = injector.getNetworkStatusNotifier(this);
        this.mWallpaperPersister = injector.getWallpaperPersister(this);
        this.mWallpaperPreferences = injector.getPreferences(this);
        ((DefaultCategoryProvider) this.mDelegate.mCategoryProvider).resetIfNeeded();
        WallpaperManager wallpaperManager = WallpaperManager.getInstance(this.mDelegate.mActivity);
        int i = wallpaperManager.isWallpaperSupported() ? !wallpaperManager.isSetWallpaperAllowed() : 2;
        if (i != 0) {
            setContentView(R.layout.activity_top_level_picker);
            FragmentManager supportFragmentManager = getSupportFragmentManager();
            int i2 = WallpaperDisabledFragment.$r8$clinit;
            Bundle bundle2 = new Bundle();
            bundle2.putInt("wallpaper_support_level", i);
            WallpaperDisabledFragment wallpaperDisabledFragment = new WallpaperDisabledFragment();
            wallpaperDisabledFragment.setArguments(bundle2);
            BackStackRecord backStackRecord = new BackStackRecord(supportFragmentManager);
            backStackRecord.add(R.id.fragment_container, wallpaperDisabledFragment);
            backStackRecord.commit();
        } else if (this.mDelegate.mFormFactor == 1) {
            setContentView(R.layout.activity_top_level_picker);
            if (ActivityUtils.isSUWMode(getBaseContext())) {
                findViewById(R.id.fragment_main).setFitsSystemWindows(true);
            }
            getWindow().getDecorView().setSystemUiVisibility(getWindow().getDecorView().getSystemUiVisibility() | QuickStepContract.SYSUI_STATE_STATUS_BAR_KEYGUARD_SHOWING_OCCLUDED | 256);
            findViewById(R.id.fragment_container).setOnApplyWindowInsetsListener(TopLevelPickerActivity$$ExternalSyntheticLambda0.INSTANCE);
            getDelegate().setSupportActionBar((Toolbar) findViewById(R.id.toolbar));
            FragmentManager supportFragmentManager2 = getSupportFragmentManager();
            if (supportFragmentManager2.findFragmentById(R.id.fragment_container) == null) {
                this.mUserEventLogger.logAppLaunched(getIntent());
                this.mWallpaperPreferences.incrementAppLaunched();
                DailyLoggingAlarmScheduler.setAlarm(getApplicationContext());
                String string = getString(R.string.wallpaper_app_name);
                CategoryFragment categoryFragment = new CategoryFragment();
                Bundle bundle3 = new Bundle();
                bundle3.putCharSequence("ToolbarFragment.title", string);
                categoryFragment.setArguments(bundle3);
                BackStackRecord backStackRecord2 = new BackStackRecord(supportFragmentManager2);
                backStackRecord2.add(R.id.fragment_container, categoryFragment);
                backStackRecord2.commit();
            }
        } else {
            setContentView(R.layout.activity_top_level_desktop);
            LinearLayout linearLayout = (LinearLayout) findViewById(R.id.bottom_sheet);
            this.mBottomSheet = linearLayout;
            ImageView imageView = (ImageView) linearLayout.findViewById(R.id.current_wallpaper_image);
            this.mCurrentWallpaperImage = imageView;
            imageView.getLayoutParams().width = (int) (getResources().getDimensionPixelSize(R.dimen.current_wallpaper_bottom_sheet_thumb_height) / ScreenSizeCalculator.getInstance().getScreenAspectRatio(this));
            this.mCurrentWallpaperPresentationMode = (TextView) this.mBottomSheet.findViewById(R.id.current_wallpaper_presentation_mode);
            this.mCurrentWallpaperTitle = (TextView) findViewById(R.id.current_wallpaper_title);
            this.mCurrentWallpaperSubtitle = (TextView) findViewById(R.id.current_wallpaper_subtitle);
            this.mCurrentWallpaperExploreButton = (Button) findViewById(R.id.current_wallpaper_explore_button);
            this.mCurrentWallpaperSkipWallpaperButton = (Button) findViewById(R.id.current_wallpaper_skip_wallpaper_button);
            this.mFragmentContainer = (FrameLayout) findViewById(R.id.fragment_container);
            this.mLoadingIndicatorContainer = (FrameLayout) findViewById(R.id.loading_indicator_container);
            this.mWallpaperPositionOptions = (LinearLayout) findViewById(R.id.desktop_wallpaper_position_options);
            final TabLayout tabLayout = (TabLayout) findViewById(R.id.tab_layout);
            TabLayout.BaseOnTabSelectedListener baseOnTabSelectedListener = new TabLayout.BaseOnTabSelectedListener() { // from class: com.android.wallpaper.picker.TopLevelPickerActivity.1
                @Override // com.google.android.material.tabs.TabLayout.BaseOnTabSelectedListener
                public void onTabReselected(TabLayout.Tab tab) {
                    if (!((Category) tab.tag).isEnumerable()) {
                        onTabSelected(tab);
                    }
                }

                @Override // com.google.android.material.tabs.TabLayout.BaseOnTabSelectedListener
                public void onTabSelected(TabLayout.Tab tab) {
                    TopLevelPickerActivity topLevelPickerActivity = TopLevelPickerActivity.this;
                    String str = ((Category) tab.tag).mCollectionId;
                    Category category = ((DefaultCategoryProvider) topLevelPickerActivity.mDelegate.mCategoryProvider).getCategory(str);
                    if (category != null) {
                        if (category.isEnumerable()) {
                            FragmentManager supportFragmentManager3 = topLevelPickerActivity.getSupportFragmentManager();
                            Fragment findFragmentById = supportFragmentManager3.findFragmentById(R.id.fragment_container);
                            if (findFragmentById != null) {
                                BackStackRecord backStackRecord3 = new BackStackRecord(supportFragmentManager3);
                                backStackRecord3.remove(findFragmentById);
                                backStackRecord3.commit();
                            }
                            IndividualPickerFragment individualPickerFragment = InjectorProvider.getInjector().getIndividualPickerFragment(str);
                            BackStackRecord backStackRecord4 = new BackStackRecord(supportFragmentManager3);
                            backStackRecord4.add(R.id.fragment_container, individualPickerFragment);
                            backStackRecord4.commit();
                            individualPickerFragment.mCurrentWallpaperBottomSheetPresenter = topLevelPickerActivity;
                            individualPickerFragment.mWallpapersUiContainer = topLevelPickerActivity;
                        } else {
                            category.show(topLevelPickerActivity, topLevelPickerActivity.mDelegate.mPickerIntentFactory, 0);
                            TabLayout tabLayout2 = (TabLayout) topLevelPickerActivity.findViewById(R.id.tab_layout);
                            int i3 = topLevelPickerActivity.mLastSelectedCategoryTabIndex;
                            if (i3 > -1) {
                                TabLayout.Tab tabAt = tabLayout2.getTabAt(i3);
                                if (((Category) tabAt.tag).isEnumerable()) {
                                    tabAt.select();
                                }
                            }
                        }
                    }
                    TopLevelPickerActivity.this.mLastSelectedCategoryTabIndex = tabLayout.getSelectedTabPosition();
                }

                @Override // com.google.android.material.tabs.TabLayout.BaseOnTabSelectedListener
                public void onTabUnselected(TabLayout.Tab tab) {
                }
            };
            if (!tabLayout.selectedListeners.contains(baseOnTabSelectedListener)) {
                tabLayout.selectedListeners.add(baseOnTabSelectedListener);
            }
            if (getSupportFragmentManager().findFragmentById(R.id.fragment_container) == null) {
                this.mUserEventLogger.logAppLaunched(getIntent());
                this.mWallpaperPreferences.incrementAppLaunched();
                DailyLoggingAlarmScheduler.setAlarm(getApplicationContext());
            }
            NetworkStatusNotifier.Listener listener = new NetworkStatusNotifier.Listener() { // from class: com.android.wallpaper.picker.TopLevelPickerActivity.2
                @Override // com.android.wallpaper.module.NetworkStatusNotifier.Listener
                public void onNetworkChanged(int i3) {
                    final TopLevelPickerActivity topLevelPickerActivity = TopLevelPickerActivity.this;
                    Bundle bundle4 = bundle;
                    int i4 = TopLevelPickerActivity.$r8$clinit;
                    int i5 = -1;
                    if (i3 == 1) {
                        FragmentManager supportFragmentManager3 = topLevelPickerActivity.getSupportFragmentManager();
                        Fragment findFragmentById = supportFragmentManager3.findFragmentById(R.id.fragment_container);
                        boolean z = findFragmentById == null || (findFragmentById instanceof OfflineDesktopFragment);
                        if (findFragmentById != null) {
                            BackStackRecord backStackRecord3 = new BackStackRecord(supportFragmentManager3);
                            backStackRecord3.remove(findFragmentById);
                            backStackRecord3.commit();
                        }
                        if (bundle4 != null) {
                            i5 = bundle4.getInt("selected_category_tab");
                        }
                        topLevelPickerActivity.mLastSelectedCategoryTabIndex = i5;
                        topLevelPickerActivity.mDelegate.populateCategories(z);
                        topLevelPickerActivity.setDesktopLoading(true);
                        topLevelPickerActivity.mBottomSheet.setVisibility(0);
                        Drawable mutate = topLevelPickerActivity.getResources().getDrawable(R.drawable.ic_refresh_18px).getConstantState().newDrawable().mutate();
                        mutate.setColorFilter(R$id.getColorAttr(topLevelPickerActivity, 16843829), PorterDuff.Mode.SRC_IN);
                        topLevelPickerActivity.mCurrentWallpaperSkipWallpaperButton.setCompoundDrawablesRelativeWithIntrinsicBounds(mutate, (Drawable) null, (Drawable) null, (Drawable) null);
                        BottomSheetBehavior.from(topLevelPickerActivity.mBottomSheet).setBottomSheetCallback(new BottomSheetBehavior.BottomSheetCallback() { // from class: com.android.wallpaper.picker.TopLevelPickerActivity.3
                            @Override // com.google.android.material.bottomsheet.BottomSheetBehavior.BottomSheetCallback
                            public void onSlide(View view, float f) {
                                if (f < HingeAngleProviderKt.FULLY_CLOSED_DEGREES) {
                                    f = 1.0f - f;
                                }
                                ((LinearLayout) TopLevelPickerActivity.this.findViewById(R.id.bottom_sheet_contents)).setAlpha(f);
                            }

                            @Override // com.google.android.material.bottomsheet.BottomSheetBehavior.BottomSheetCallback
                            public void onStateChanged(View view, int i6) {
                            }
                        });
                        topLevelPickerActivity.refreshCurrentWallpapers(null);
                        return;
                    }
                    FragmentManager supportFragmentManager4 = topLevelPickerActivity.getSupportFragmentManager();
                    Fragment findFragmentById2 = supportFragmentManager4.findFragmentById(R.id.fragment_container);
                    if (findFragmentById2 != null) {
                        BackStackRecord backStackRecord4 = new BackStackRecord(supportFragmentManager4);
                        backStackRecord4.remove(findFragmentById2);
                        backStackRecord4.commit();
                    }
                    OfflineDesktopFragment offlineDesktopFragment = new OfflineDesktopFragment();
                    BackStackRecord backStackRecord5 = new BackStackRecord(supportFragmentManager4);
                    backStackRecord5.add(R.id.fragment_container, offlineDesktopFragment);
                    backStackRecord5.commit();
                    topLevelPickerActivity.mLastSelectedCategoryTabIndex = -1;
                    topLevelPickerActivity.mDelegate.populateCategories(true);
                    topLevelPickerActivity.setDesktopLoading(false);
                    topLevelPickerActivity.setCurrentWallpapersExpanded(false);
                }
            };
            this.mNetworkStatusListener = listener;
            ((DefaultNetworkStatusNotifier) this.mNetworkStatusNotifier).registerListener(listener);
        }
    }

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    public void onDestroy() {
        super.onDestroy();
        this.mDelegate.cleanUp();
        NetworkStatusNotifier.Listener listener = this.mNetworkStatusListener;
        if (listener != null) {
            ((DefaultNetworkStatusNotifier) this.mNetworkStatusNotifier).unregisterListener(listener);
        }
        ProgressDialog progressDialog = this.mRefreshWallpaperProgressDialog;
        if (progressDialog != null) {
            progressDialog.dismiss();
        }
        ProgressDialog progressDialog2 = this.mSetWallpaperProgressDialog;
        if (progressDialog2 != null) {
            progressDialog2.dismiss();
        }
    }

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, android.app.Activity
    public void onRequestPermissionsResult(int i, String[] strArr, int[] iArr) {
        this.mDelegate.onRequestPermissionsResult(i, strArr, iArr);
    }

    @Override // com.android.wallpaper.picker.BaseActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    public void onResume() {
        super.onResume();
        boolean z = false;
        if (Settings.Global.getInt(getContentResolver(), "device_provisioned", 0) != 0) {
            z = true;
        }
        this.mUserEventLogger.logResumed(z, true);
        SetWallpaperErrorDialogFragment setWallpaperErrorDialogFragment = this.mStagedSetWallpaperErrorDialogFragment;
        if (setWallpaperErrorDialogFragment != null) {
            setWallpaperErrorDialogFragment.show(getSupportFragmentManager(), "toplevel_set_wallpaper_error_dialog");
            this.mStagedSetWallpaperErrorDialogFragment = null;
        }
    }

    @Override // androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    public void onSaveInstanceState(Bundle bundle) {
        Objects.requireNonNull(InjectorProvider.getInjector().getFormFactorChecker(this));
        super.onSaveInstanceState(bundle);
    }

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    public void onStop() {
        this.mUserEventLogger.logStopped();
        super.onStop();
    }

    @Override // com.android.wallpaper.picker.AppbarFragment.AppbarFragmentHost
    public void onUpArrowPressed() {
        onBackPressed();
    }

    @Override // com.android.wallpaper.picker.WallpapersUiContainer
    public void onWallpapersReady() {
        setDesktopLoading(false);
        setCurrentWallpapersExpanded(true);
    }

    public void refreshCurrentWallpapers(CurrentWallpaperBottomSheetPresenter.RefreshListener refreshListener) {
        Injector injector = InjectorProvider.getInjector();
        Context applicationContext = getApplicationContext();
        ((DefaultCurrentWallpaperInfoFactory) injector.getCurrentWallpaperFactory(this)).createCurrentWallpaperInfos(new AnonymousClass4(applicationContext, refreshListener, injector), true);
    }

    @Override // com.android.wallpaper.picker.MyPhotosStarter
    public void requestCustomPhotoPicker(MyPhotosStarter.PermissionChangedListener permissionChangedListener) {
        this.mDelegate.requestCustomPhotoPicker(permissionChangedListener);
    }

    @Override // com.android.wallpaper.picker.CategoryFragment.CategoryFragmentHost, com.android.wallpaper.model.PermissionRequester
    public void requestExternalStoragePermission(MyPhotosStarter.PermissionChangedListener permissionChangedListener) {
        this.mDelegate.requestExternalStoragePermission(permissionChangedListener);
    }

    public final void setCenterCropWallpaperPositionButtonSelected(Button button, boolean z) {
        button.setCompoundDrawablesRelativeWithIntrinsicBounds(getDrawable(z ? R.drawable.center_crop_blue : R.drawable.center_crop_grey), (Drawable) null, (Drawable) null, (Drawable) null);
        button.setTextColor(getTextColorForWallpaperPositionButton(z));
    }

    public final void setCenterWallpaperPositionButtonSelected(Button button, boolean z) {
        button.setCompoundDrawablesRelativeWithIntrinsicBounds(getDrawable(z ? R.drawable.center_blue : R.drawable.center_grey), (Drawable) null, (Drawable) null, (Drawable) null);
        button.setTextColor(getTextColorForWallpaperPositionButton(z));
    }

    public void setCurrentWallpapersExpanded(boolean z) {
        BottomSheetBehavior.from(this.mBottomSheet).setState(z ? 3 : 4);
    }

    public final void setCustomPhotoWallpaper(final WallpaperInfo wallpaperInfo) {
        this.mPendingSetWallpaperInfo = wallpaperInfo;
        ProgressDialog progressDialog = new ProgressDialog(this, R.style.LightDialogTheme);
        this.mSetWallpaperProgressDialog = progressDialog;
        progressDialog.setTitle((CharSequence) null);
        this.mSetWallpaperProgressDialog.setMessage(getResources().getString(R.string.set_wallpaper_progress_message));
        this.mSetWallpaperProgressDialog.setIndeterminate(true);
        this.mSetWallpaperProgressDialog.show();
        ((DefaultWallpaperPersister) this.mWallpaperPersister).setIndividualWallpaperWithPosition(this, wallpaperInfo, 1, new WallpaperPersister.SetWallpaperCallback() { // from class: com.android.wallpaper.picker.TopLevelPickerActivity.6
            @Override // com.android.wallpaper.module.WallpaperPersister.SetWallpaperCallback
            public void onError(Throwable th) {
                ProgressDialog progressDialog2 = TopLevelPickerActivity.this.mSetWallpaperProgressDialog;
                if (progressDialog2 != null) {
                    progressDialog2.dismiss();
                }
                TopLevelPickerActivity topLevelPickerActivity = TopLevelPickerActivity.this;
                Objects.requireNonNull(topLevelPickerActivity);
                SetWallpaperErrorDialogFragment newInstance = SetWallpaperErrorDialogFragment.newInstance(R.string.set_wallpaper_error_message, 2);
                if (topLevelPickerActivity.mIsSafeToCommitFragmentTransaction) {
                    newInstance.show(topLevelPickerActivity.getSupportFragmentManager(), "toplevel_set_wallpaper_error_dialog");
                } else {
                    topLevelPickerActivity.mStagedSetWallpaperErrorDialogFragment = newInstance;
                }
                TopLevelPickerActivity.this.mDelegate.mPreferences.setPendingWallpaperSetStatus(0);
                TopLevelPickerActivity.this.mUserEventLogger.logWallpaperSetResult(1);
                TopLevelPickerActivity.this.mUserEventLogger.logWallpaperSetFailureReason(androidx.lifecycle.runtime.R$id.isOOM(th) ? 1 : 0);
                Log.e("TopLevelPicker", "Unable to set wallpaper from 'my photos'.");
            }

            @Override // com.android.wallpaper.module.WallpaperPersister.SetWallpaperCallback
            public void onSuccess(WallpaperInfo wallpaperInfo2) {
                ProgressDialog progressDialog2 = TopLevelPickerActivity.this.mSetWallpaperProgressDialog;
                if (progressDialog2 != null) {
                    progressDialog2.dismiss();
                }
                TopLevelPickerActivity.this.refreshCurrentWallpapers(null);
                TopLevelPickerActivity.this.mDelegate.mPreferences.setPendingWallpaperSetStatus(0);
                TopLevelPickerActivity topLevelPickerActivity = TopLevelPickerActivity.this;
                topLevelPickerActivity.mUserEventLogger.logWallpaperSet(wallpaperInfo.getCollectionId(topLevelPickerActivity.getApplicationContext()), wallpaperInfo.getWallpaperId());
                TopLevelPickerActivity.this.mUserEventLogger.logWallpaperSetResult(0);
                if (!TopLevelPickerActivity.this.isDestroyed()) {
                    TopLevelPickerActivity.this.mWallpaperPositionOptions.setVisibility(0);
                    Objects.requireNonNull(TopLevelPickerActivity.this);
                    Objects.requireNonNull(TopLevelPickerActivity.this);
                    final TopLevelPickerActivity topLevelPickerActivity2 = TopLevelPickerActivity.this;
                    final WallpaperInfo wallpaperInfo3 = wallpaperInfo;
                    final Button button = (Button) topLevelPickerActivity2.findViewById(R.id.wallpaper_position_option_center_crop);
                    final Button button2 = (Button) topLevelPickerActivity2.findViewById(R.id.wallpaper_position_option_stretched);
                    final Button button3 = (Button) topLevelPickerActivity2.findViewById(R.id.wallpaper_position_option_center);
                    topLevelPickerActivity2.setCenterCropWallpaperPositionButtonSelected(button, true);
                    button.setOnClickListener(new View.OnClickListener() { // from class: com.android.wallpaper.picker.TopLevelPickerActivity.7
                        @Override // android.view.View.OnClickListener
                        public void onClick(View view) {
                            TopLevelPickerActivity topLevelPickerActivity3 = TopLevelPickerActivity.this;
                            ((DefaultWallpaperPersister) topLevelPickerActivity3.mWallpaperPersister).setIndividualWallpaperWithPosition(topLevelPickerActivity3, wallpaperInfo3, 1, new WallpaperPersister.SetWallpaperCallback() { // from class: com.android.wallpaper.picker.TopLevelPickerActivity.7.1
                                @Override // com.android.wallpaper.module.WallpaperPersister.SetWallpaperCallback
                                public void onError(Throwable th) {
                                }

                                @Override // com.android.wallpaper.module.WallpaperPersister.SetWallpaperCallback
                                public void onSuccess(WallpaperInfo wallpaperInfo4) {
                                    if (!TopLevelPickerActivity.this.isDestroyed()) {
                                        TopLevelPickerActivity.this.refreshCurrentWallpapers(null);
                                        AnonymousClass7 r3 = AnonymousClass7.this;
                                        TopLevelPickerActivity.this.setCenterCropWallpaperPositionButtonSelected(button, true);
                                        AnonymousClass7 r32 = AnonymousClass7.this;
                                        TopLevelPickerActivity.this.setCenterWallpaperPositionButtonSelected(button3, false);
                                        AnonymousClass7 r33 = AnonymousClass7.this;
                                        TopLevelPickerActivity.this.setStretchWallpaperPositionButtonSelected(button2, false);
                                        Objects.requireNonNull(TopLevelPickerActivity.this);
                                    }
                                }
                            });
                        }
                    });
                    topLevelPickerActivity2.setStretchWallpaperPositionButtonSelected(button2, false);
                    button2.setOnClickListener(new View.OnClickListener() { // from class: com.android.wallpaper.picker.TopLevelPickerActivity.8
                        @Override // android.view.View.OnClickListener
                        public void onClick(View view) {
                            TopLevelPickerActivity topLevelPickerActivity3 = TopLevelPickerActivity.this;
                            ((DefaultWallpaperPersister) topLevelPickerActivity3.mWallpaperPersister).setIndividualWallpaperWithPosition(topLevelPickerActivity3, wallpaperInfo3, 2, new WallpaperPersister.SetWallpaperCallback() { // from class: com.android.wallpaper.picker.TopLevelPickerActivity.8.1
                                @Override // com.android.wallpaper.module.WallpaperPersister.SetWallpaperCallback
                                public void onError(Throwable th) {
                                }

                                @Override // com.android.wallpaper.module.WallpaperPersister.SetWallpaperCallback
                                public void onSuccess(WallpaperInfo wallpaperInfo4) {
                                    if (!TopLevelPickerActivity.this.isDestroyed()) {
                                        TopLevelPickerActivity.this.refreshCurrentWallpapers(null);
                                        AnonymousClass8 r3 = AnonymousClass8.this;
                                        TopLevelPickerActivity.this.setStretchWallpaperPositionButtonSelected(button2, true);
                                        AnonymousClass8 r32 = AnonymousClass8.this;
                                        TopLevelPickerActivity.this.setCenterCropWallpaperPositionButtonSelected(button, false);
                                        AnonymousClass8 r33 = AnonymousClass8.this;
                                        TopLevelPickerActivity.this.setCenterWallpaperPositionButtonSelected(button3, false);
                                        Objects.requireNonNull(TopLevelPickerActivity.this);
                                    }
                                }
                            });
                        }
                    });
                    topLevelPickerActivity2.setCenterWallpaperPositionButtonSelected(button3, false);
                    button3.setOnClickListener(new View.OnClickListener() { // from class: com.android.wallpaper.picker.TopLevelPickerActivity.9
                        @Override // android.view.View.OnClickListener
                        public void onClick(View view) {
                            TopLevelPickerActivity topLevelPickerActivity3 = TopLevelPickerActivity.this;
                            ((DefaultWallpaperPersister) topLevelPickerActivity3.mWallpaperPersister).setIndividualWallpaperWithPosition(topLevelPickerActivity3, wallpaperInfo3, 0, new WallpaperPersister.SetWallpaperCallback() { // from class: com.android.wallpaper.picker.TopLevelPickerActivity.9.1
                                @Override // com.android.wallpaper.module.WallpaperPersister.SetWallpaperCallback
                                public void onError(Throwable th) {
                                }

                                @Override // com.android.wallpaper.module.WallpaperPersister.SetWallpaperCallback
                                public void onSuccess(WallpaperInfo wallpaperInfo4) {
                                    if (!TopLevelPickerActivity.this.isDestroyed()) {
                                        TopLevelPickerActivity.this.refreshCurrentWallpapers(null);
                                        AnonymousClass9 r3 = AnonymousClass9.this;
                                        TopLevelPickerActivity.this.setCenterWallpaperPositionButtonSelected(button3, true);
                                        AnonymousClass9 r32 = AnonymousClass9.this;
                                        TopLevelPickerActivity.this.setCenterCropWallpaperPositionButtonSelected(button, false);
                                        AnonymousClass9 r33 = AnonymousClass9.this;
                                        TopLevelPickerActivity.this.setStretchWallpaperPositionButtonSelected(button2, false);
                                        Objects.requireNonNull(TopLevelPickerActivity.this);
                                    }
                                }
                            });
                        }
                    });
                }
            }
        });
    }

    public final void setDesktopLoading(boolean z) {
        if (z) {
            this.mLoadingIndicatorContainer.setVisibility(0);
            this.mFragmentContainer.setVisibility(8);
            return;
        }
        this.mLoadingIndicatorContainer.setVisibility(8);
        this.mFragmentContainer.setVisibility(0);
    }

    public final void setStretchWallpaperPositionButtonSelected(Button button, boolean z) {
        button.setCompoundDrawablesRelativeWithIntrinsicBounds(getDrawable(z ? R.drawable.stretch_blue : R.drawable.stretch_grey), (Drawable) null, (Drawable) null, (Drawable) null);
        button.setTextColor(getTextColorForWallpaperPositionButton(z));
    }

    @Override // com.android.wallpaper.picker.CategoryFragment.CategoryFragmentHost
    public void show(String str) {
        this.mDelegate.show(str);
    }

    @Override // com.android.wallpaper.picker.CategoryFragment.CategoryFragmentHost, com.android.wallpaper.model.WallpaperPreviewNavigator
    public void showViewOnlyPreview(WallpaperInfo wallpaperInfo, boolean z) {
        WallpaperPickerDelegate wallpaperPickerDelegate = this.mDelegate;
        InlinePreviewIntentFactory inlinePreviewIntentFactory = wallpaperPickerDelegate.mViewOnlyPreviewIntentFactory;
        ViewOnlyPreviewActivity.ViewOnlyPreviewActivityIntentFactory viewOnlyPreviewActivityIntentFactory = (ViewOnlyPreviewActivity.ViewOnlyPreviewActivityIntentFactory) inlinePreviewIntentFactory;
        viewOnlyPreviewActivityIntentFactory.mIsHomeAndLockPreviews = true;
        viewOnlyPreviewActivityIntentFactory.mIsViewAsHome = z;
        wallpaperInfo.showPreview(wallpaperPickerDelegate.mActivity, inlinePreviewIntentFactory, 2);
    }
}
