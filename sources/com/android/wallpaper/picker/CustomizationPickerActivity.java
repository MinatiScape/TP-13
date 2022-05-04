package com.android.wallpaper.picker;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.provider.Settings;
import android.text.TextUtils;
import android.util.Log;
import androidx.cardview.R$style;
import androidx.core.R$id;
import androidx.fragment.app.BackStackRecord;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentManagerImpl;
import androidx.slice.SliceSpecs;
import androidx.slice.view.R$dimen;
import com.android.systemui.shared.R;
import com.android.wallpaper.model.Category;
import com.android.wallpaper.model.DownloadableLiveWallpaperInfo;
import com.android.wallpaper.model.PermissionRequester;
import com.android.wallpaper.model.WallpaperCategory;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.model.WallpaperPreviewNavigator;
import com.android.wallpaper.model.WallpaperSectionController;
import com.android.wallpaper.module.DefaultCategoryProvider;
import com.android.wallpaper.module.DefaultNetworkStatusNotifier;
import com.android.wallpaper.module.DefaultPackageStatusNotifier;
import com.android.wallpaper.module.Injector;
import com.android.wallpaper.module.LargeScreenMultiPanesChecker;
import com.android.wallpaper.module.NetworkStatusNotifier;
import com.android.wallpaper.module.PackageStatusNotifier;
import com.android.wallpaper.module.UserEventLogger;
import com.android.wallpaper.picker.AppbarFragment;
import com.android.wallpaper.picker.CategorySelectorFragment;
import com.android.wallpaper.picker.MyPhotosStarter;
import com.android.wallpaper.picker.ViewOnlyPreviewActivity;
import com.android.wallpaper.picker.individual.IndividualPickerFragment;
import com.android.wallpaper.util.ActivityUtils;
import com.android.wallpaper.widget.BottomActionBar;
import com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences;
import com.google.android.apps.wallpaper.module.WallpaperCategoryProvider;
import java.util.Iterator;
/* loaded from: classes.dex */
public class CustomizationPickerActivity extends FragmentActivity implements AppbarFragment.AppbarFragmentHost, WallpapersUiContainer, BottomActionBar.BottomActionBarHost, FragmentTransactionChecker, PermissionRequester, CategorySelectorFragment.CategorySelectorFragmentHost, IndividualPickerFragment.IndividualPickerFragmentHost, WallpaperPreviewNavigator {
    public BottomActionBar mBottomActionBar;
    public WallpaperPickerDelegate mDelegate;
    public boolean mIsSafeToCommitFragmentTransaction;
    public int mNetworkStatus;
    public CustomizationPickerActivity$$ExternalSyntheticLambda0 mNetworkStatusListener;
    public NetworkStatusNotifier mNetworkStatusNotifier;
    public UserEventLogger mUserEventLogger;

    @Override // com.android.wallpaper.picker.CategorySelectorFragment.CategorySelectorFragmentHost, com.android.wallpaper.picker.individual.IndividualPickerFragment.IndividualPickerFragmentHost
    public final void isHostToolbarShown() {
    }

    @Override // com.android.wallpaper.picker.individual.IndividualPickerFragment.IndividualPickerFragmentHost
    public final void removeToolbarMenu() {
    }

    @Override // com.android.wallpaper.picker.CategorySelectorFragment.CategorySelectorFragmentHost
    public final void cleanUp() {
        WallpaperPickerDelegate wallpaperPickerDelegate = this.mDelegate;
        PackageStatusNotifier packageStatusNotifier = wallpaperPickerDelegate.mPackageStatusNotifier;
        if (packageStatusNotifier != null) {
            ((DefaultPackageStatusNotifier) packageStatusNotifier).removeListenerAndMaybeUnregisterCallback(wallpaperPickerDelegate.mLiveWallpaperStatusListener);
            ((DefaultPackageStatusNotifier) wallpaperPickerDelegate.mPackageStatusNotifier).removeListenerAndMaybeUnregisterCallback(wallpaperPickerDelegate.mThirdPartyStatusListener);
            ((DefaultPackageStatusNotifier) wallpaperPickerDelegate.mPackageStatusNotifier).removeListenerAndMaybeUnregisterCallback(wallpaperPickerDelegate.mDownloadableWallpaperStatusListener);
        }
    }

    @Override // com.android.wallpaper.picker.CategorySelectorFragment.CategorySelectorFragmentHost
    public final void fetchCategories() {
        boolean z;
        WallpaperPickerDelegate wallpaperPickerDelegate = this.mDelegate;
        WallpaperCategoryProvider wallpaperCategoryProvider = (WallpaperCategoryProvider) wallpaperPickerDelegate.mCategoryProvider;
        wallpaperCategoryProvider.getClass();
        String obj = DownloadableLiveWallpaperInfo.getToBeInstalledComponent(this).toString();
        GoogleWallpaperPreferences preferences = R$style.getInjector().getPreferences(this);
        boolean z2 = true;
        if (!TextUtils.equals(preferences.getLastToBeInstalled(), obj)) {
            preferences.setLastToBeInstalled(obj);
            z = true;
        } else {
            z = false;
        }
        if (!z) {
            z2 = true ^ wallpaperCategoryProvider.mFetchedCategories;
        }
        wallpaperPickerDelegate.initialize(z2);
    }

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, android.app.Activity
    public final void onRequestPermissionsResult(int i, String[] strArr, int[] iArr) {
        WallpaperPickerDelegate wallpaperPickerDelegate = this.mDelegate;
        if (i == 3) {
            wallpaperPickerDelegate.getClass();
            if (strArr.length > 0 && strArr[0].equals("android.permission.READ_EXTERNAL_STORAGE") && iArr.length > 0) {
                if (iArr[0] == 0) {
                    Iterator it = wallpaperPickerDelegate.mPermissionChangedListeners.iterator();
                    while (it.hasNext()) {
                        ((MyPhotosStarter.PermissionChangedListener) it.next()).onPermissionsGranted();
                    }
                } else if (!wallpaperPickerDelegate.mActivity.shouldShowRequestPermissionRationale("android.permission.READ_EXTERNAL_STORAGE")) {
                    Iterator it2 = wallpaperPickerDelegate.mPermissionChangedListeners.iterator();
                    while (it2.hasNext()) {
                        ((MyPhotosStarter.PermissionChangedListener) it2.next()).onPermissionsDenied(true);
                    }
                } else {
                    Iterator it3 = wallpaperPickerDelegate.mPermissionChangedListeners.iterator();
                    while (it3.hasNext()) {
                        ((MyPhotosStarter.PermissionChangedListener) it3.next()).onPermissionsDenied(false);
                    }
                }
            }
        }
        wallpaperPickerDelegate.mPermissionChangedListeners.clear();
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    public final void onStop() {
        DefaultNetworkStatusNotifier.AnonymousClass1 r0;
        this.mUserEventLogger.logStopped();
        CustomizationPickerActivity$$ExternalSyntheticLambda0 customizationPickerActivity$$ExternalSyntheticLambda0 = this.mNetworkStatusListener;
        if (customizationPickerActivity$$ExternalSyntheticLambda0 != null) {
            DefaultNetworkStatusNotifier defaultNetworkStatusNotifier = (DefaultNetworkStatusNotifier) this.mNetworkStatusNotifier;
            defaultNetworkStatusNotifier.mListeners.remove(customizationPickerActivity$$ExternalSyntheticLambda0);
            if (defaultNetworkStatusNotifier.mListeners.isEmpty() && (r0 = defaultNetworkStatusNotifier.mReceiver) != null) {
                defaultNetworkStatusNotifier.mAppContext.unregisterReceiver(r0);
                defaultNetworkStatusNotifier.mReceiver = null;
            }
            this.mNetworkStatusListener = null;
        }
        super.onStop();
    }

    @Override // com.android.wallpaper.picker.CategorySelectorFragment.CategorySelectorFragmentHost
    public final void requestCustomPhotoPicker(CategorySelectorFragment.CategoryHolder.AnonymousClass1 r1) {
        this.mDelegate.requestCustomPhotoPicker(r1);
    }

    @Override // com.android.wallpaper.model.PermissionRequester
    public final void requestExternalStoragePermission(WallpaperSectionController.AnonymousClass1 r2) {
        WallpaperPickerDelegate wallpaperPickerDelegate = this.mDelegate;
        wallpaperPickerDelegate.mPermissionChangedListeners.add(r2);
        wallpaperPickerDelegate.mActivity.requestPermissions(new String[]{"android.permission.READ_EXTERNAL_STORAGE"}, 3);
    }

    @Override // com.android.wallpaper.picker.CategorySelectorFragment.CategorySelectorFragmentHost
    public final void show(Category category) {
        if (!(category instanceof WallpaperCategory)) {
            WallpaperPickerDelegate wallpaperPickerDelegate = this.mDelegate;
            Category category2 = ((DefaultCategoryProvider) wallpaperPickerDelegate.mCategoryProvider).getCategory(category.mCollectionId);
            if (category2 != null) {
                category2.show(wallpaperPickerDelegate.mActivity);
                return;
            }
            return;
        }
        switchFragmentWithBackStack(R$style.getInjector().getIndividualPickerFragment(category.mCollectionId));
    }

    @Override // com.android.wallpaper.model.WallpaperPreviewNavigator
    public final void showViewOnlyPreview(WallpaperInfo wallpaperInfo, boolean z) {
        WallpaperPickerDelegate wallpaperPickerDelegate = this.mDelegate;
        ViewOnlyPreviewActivity.ViewOnlyPreviewActivityIntentFactory viewOnlyPreviewActivityIntentFactory = wallpaperPickerDelegate.mViewOnlyPreviewIntentFactory;
        viewOnlyPreviewActivityIntentFactory.mIsHomeAndLockPreviews = true;
        viewOnlyPreviewActivityIntentFactory.mIsViewAsHome = z;
        wallpaperInfo.showPreview(wallpaperPickerDelegate.mActivity, viewOnlyPreviewActivityIntentFactory, 2);
    }

    @Override // com.android.wallpaper.picker.AppbarFragment.AppbarFragmentHost
    public final boolean isUpArrowSupported() {
        return !ActivityUtils.isSUWMode(this);
    }

    @Override // com.android.wallpaper.picker.individual.IndividualPickerFragment.IndividualPickerFragmentHost
    public final void moveToPreviousFragment() {
        FragmentManagerImpl supportFragmentManager = getSupportFragmentManager();
        supportFragmentManager.getClass();
        supportFragmentManager.enqueueAction(new FragmentManager.PopBackStackState(-1, 0), false);
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0044  */
    /* JADX WARN: Removed duplicated region for block: B:24:? A[RETURN, SYNTHETIC] */
    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, android.app.Activity
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void onActivityResult(int r4, int r5, android.content.Intent r6) {
        /*
            r3 = this;
            super.onActivityResult(r4, r5, r6)
            com.android.wallpaper.picker.WallpaperPickerDelegate r0 = r3.mDelegate
            r0.getClass()
            r1 = -1
            r2 = 0
            if (r5 == r1) goto Ld
            goto L41
        Ld:
            r5 = 1
            if (r4 == 0) goto L24
            if (r4 == r5) goto L42
            r6 = 2
            if (r4 == r6) goto L42
            r6 = 4
            if (r4 == r6) goto L19
            goto L41
        L19:
            com.android.wallpaper.module.WallpaperPersister r4 = r0.mWallpaperPersister
            com.android.wallpaper.module.DefaultWallpaperPersister r4 = (com.android.wallpaper.module.DefaultWallpaperPersister) r4
            r4.onLiveWallpaperSet()
            r0.populateCategories(r5)
            goto L42
        L24:
            if (r6 != 0) goto L28
            r4 = 0
            goto L2c
        L28:
            android.net.Uri r4 = r6.getData()
        L2c:
            if (r4 != 0) goto L2f
            goto L42
        L2f:
            com.android.wallpaper.model.ImageWallpaperInfo r6 = new com.android.wallpaper.model.ImageWallpaperInfo
            r6.<init>(r4)
            com.android.wallpaper.module.WallpaperPersister r4 = r0.mWallpaperPersister
            com.android.wallpaper.module.DefaultWallpaperPersister r4 = (com.android.wallpaper.module.DefaultWallpaperPersister) r4
            r4.mWallpaperInfoInPreview = r6
            androidx.fragment.app.FragmentActivity r4 = r0.mActivity
            com.android.wallpaper.picker.PreviewActivity$PreviewActivityIntentFactory r0 = r0.mPreviewIntentFactory
            r6.showPreview(r4, r0, r5)
        L41:
            r5 = r2
        L42:
            if (r5 == 0) goto L66
            boolean r4 = com.android.wallpaper.util.ActivityUtils.isSUWMode(r3)
            r5 = 2130771997(0x7f01001d, float:1.71471E38)
            r6 = 2130771996(0x7f01001c, float:1.7147098E38)
            if (r4 == 0) goto L5a
            r3.overridePendingTransition(r6, r5)
            r3.setResult(r2)
            r3.finish()
            goto L66
        L5a:
            r3.overridePendingTransition(r6, r5)
            r3.setResult(r1)
            r3.finish()
            com.android.wallpaper.util.LaunchUtils.launchHome(r3)
        L66:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.wallpaper.picker.CustomizationPickerActivity.onActivityResult(int, int, android.content.Intent):void");
    }

    @Override // androidx.activity.ComponentActivity, android.app.Activity
    public final void onBackPressed() {
        Fragment findFragmentById = getSupportFragmentManager().findFragmentById(R.id.fragment_container);
        if ((!(findFragmentById instanceof BottomActionBarFragment) || !((BottomActionBarFragment) findFragmentById).onBackPressed()) && !getSupportFragmentManager().popBackStackImmediate$1() && !moveTaskToBack(false)) {
            super.onBackPressed();
        }
    }

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    public final void onCreate(Bundle bundle) {
        String str;
        Fragment fragment;
        boolean z;
        Injector injector = R$style.getInjector();
        this.mDelegate = new WallpaperPickerDelegate(this, this, injector);
        this.mUserEventLogger = injector.getUserEventLogger(this);
        NetworkStatusNotifier networkStatusNotifier = injector.getNetworkStatusNotifier(this);
        this.mNetworkStatusNotifier = networkStatusNotifier;
        this.mNetworkStatus = ((DefaultNetworkStatusNotifier) networkStatusNotifier).getNetworkStatus();
        super.onCreate(bundle);
        LargeScreenMultiPanesChecker largeScreenMultiPanesChecker = new LargeScreenMultiPanesChecker();
        boolean z2 = true;
        if (largeScreenMultiPanesChecker.isMultiPanesEnabled(this)) {
            Intent intent = getIntent();
            if (intent == null || !intent.getBooleanExtra("is_from_settings_homepage", false)) {
                z = false;
            } else {
                z = true;
            }
            if (!z && !ActivityUtils.isLaunchedFromSettingsRelated(intent)) {
                ActivityUtils.startActivityForResultSafely(this, largeScreenMultiPanesChecker.getMultiPanesIntent(intent), 0);
                finish();
            }
        }
        setContentView(R.layout.activity_customization_picker);
        this.mBottomActionBar = (BottomActionBar) findViewById(R.id.bottom_actionbar);
        getWindow().setDecorFitsSystemWindows(ActivityUtils.isSUWMode(this));
        if (getSupportFragmentManager().findFragmentById(R.id.fragment_container) == null) {
            if (getIntent() != null) {
                this.mUserEventLogger.logAppLaunched(getIntent());
            }
            injector.getPreferences(this).incrementAppLaunched();
            R$id.setAlarm(getApplicationContext());
            if ("wallpaper_only".equals(getIntent().getStringExtra("com.android.launcher3.WALLPAPER_FLAVOR"))) {
                fragment = new WallpaperOnlyFragment();
            } else {
                fragment = new CustomizationPickerFragment();
            }
            FragmentManagerImpl supportFragmentManager = getSupportFragmentManager();
            supportFragmentManager.getClass();
            BackStackRecord backStackRecord = new BackStackRecord(supportFragmentManager);
            backStackRecord.replace(R.id.fragment_container, fragment);
            if (!backStackRecord.mAddToBackStack) {
                backStackRecord.mAllowAddToBackStack = false;
                backStackRecord.mManager.execSingleAction(backStackRecord, false);
            } else {
                throw new IllegalStateException("This transaction is already being added to the back stack");
            }
        }
        Intent intent2 = getIntent();
        if (R$dimen.isDeepLink(intent2)) {
            str = intent2.getData().getQueryParameter("collection_id");
        } else {
            str = null;
        }
        if (!TextUtils.isEmpty(str)) {
            switchFragmentWithBackStack(new CategorySelectorFragment());
            switchFragmentWithBackStack(R$style.getInjector().getIndividualPickerFragment(str));
            intent2.setData(null);
        }
        WallpaperPickerDelegate wallpaperPickerDelegate = this.mDelegate;
        DefaultCategoryProvider defaultCategoryProvider = (DefaultCategoryProvider) wallpaperPickerDelegate.mCategoryProvider;
        if (defaultCategoryProvider.mNetworkStatus == ((DefaultNetworkStatusNotifier) defaultCategoryProvider.mNetworkStatusNotifier).getNetworkStatus() && defaultCategoryProvider.mLocale == defaultCategoryProvider.mAppContext.getResources().getConfiguration().getLocales().get(0)) {
            z2 = false;
        } else {
            defaultCategoryProvider.mCategories.clear();
            defaultCategoryProvider.mFetchedCategories = false;
        }
        ((DefaultCategoryProvider) wallpaperPickerDelegate.mCategoryProvider).fetchCategories(new SliceSpecs(), z2);
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    public final void onPause() {
        super.onPause();
        this.mIsSafeToCommitFragmentTransaction = false;
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    public final void onResume() {
        super.onResume();
        boolean z = true;
        this.mIsSafeToCommitFragmentTransaction = true;
        boolean equals = "wallpaper_only".equals(getIntent().getStringExtra("com.android.launcher3.WALLPAPER_FLAVOR"));
        if (Settings.Global.getInt(getContentResolver(), "device_provisioned", 0) == 0) {
            z = false;
        }
        this.mUserEventLogger.logResumed(z, equals);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v1, types: [com.android.wallpaper.picker.CustomizationPickerActivity$$ExternalSyntheticLambda0, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r1v3, types: [com.android.wallpaper.module.DefaultNetworkStatusNotifier$1] */
    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    public final void onStart() {
        super.onStart();
        if (this.mNetworkStatusListener == null) {
            ?? customizationPickerActivity$$ExternalSyntheticLambda0 = new NetworkStatusNotifier.Listener() { // from class: com.android.wallpaper.picker.CustomizationPickerActivity$$ExternalSyntheticLambda0
                @Override // com.android.wallpaper.module.NetworkStatusNotifier.Listener
                public final void onNetworkChanged(int i) {
                    CustomizationPickerActivity customizationPickerActivity = CustomizationPickerActivity.this;
                    if (i != customizationPickerActivity.mNetworkStatus) {
                        Log.i("CustomizationPickerActivity", "Network status changes, refresh wallpaper categories.");
                        customizationPickerActivity.mNetworkStatus = i;
                        customizationPickerActivity.mDelegate.initialize(true);
                    }
                }
            };
            this.mNetworkStatusListener = customizationPickerActivity$$ExternalSyntheticLambda0;
            final DefaultNetworkStatusNotifier defaultNetworkStatusNotifier = (DefaultNetworkStatusNotifier) this.mNetworkStatusNotifier;
            if (defaultNetworkStatusNotifier.mReceiver == null) {
                defaultNetworkStatusNotifier.mReceiver = new BroadcastReceiver() { // from class: com.android.wallpaper.module.DefaultNetworkStatusNotifier.1
                    @Override // android.content.BroadcastReceiver
                    public final void onReceive(Context context, Intent intent) {
                        int networkStatus = defaultNetworkStatusNotifier.getNetworkStatus();
                        for (int i = 0; i < defaultNetworkStatusNotifier.mListeners.size(); i++) {
                            ((NetworkStatusNotifier.Listener) defaultNetworkStatusNotifier.mListeners.get(i)).onNetworkChanged(networkStatus);
                        }
                    }
                };
                IntentFilter intentFilter = new IntentFilter();
                intentFilter.addAction("android.net.conn.CONNECTIVITY_CHANGE");
                if (!defaultNetworkStatusNotifier.mListeners.contains(customizationPickerActivity$$ExternalSyntheticLambda0)) {
                    defaultNetworkStatusNotifier.mListeners.add(customizationPickerActivity$$ExternalSyntheticLambda0);
                }
                defaultNetworkStatusNotifier.mAppContext.registerReceiver(defaultNetworkStatusNotifier.mReceiver, intentFilter);
            } else if (!defaultNetworkStatusNotifier.mListeners.contains(customizationPickerActivity$$ExternalSyntheticLambda0)) {
                defaultNetworkStatusNotifier.mListeners.add(customizationPickerActivity$$ExternalSyntheticLambda0);
            }
        }
    }

    public final void switchFragmentWithBackStack(AppbarFragment appbarFragment) {
        FragmentManagerImpl supportFragmentManager = getSupportFragmentManager();
        supportFragmentManager.getClass();
        BackStackRecord backStackRecord = new BackStackRecord(supportFragmentManager);
        backStackRecord.replace(R.id.fragment_container, appbarFragment);
        if (backStackRecord.mAllowAddToBackStack) {
            backStackRecord.mAddToBackStack = true;
            backStackRecord.mName = null;
            backStackRecord.commit();
            FragmentManagerImpl supportFragmentManager2 = getSupportFragmentManager();
            supportFragmentManager2.execPendingActions(true);
            supportFragmentManager2.forcePostponedTransactions();
            return;
        }
        throw new IllegalStateException("This FragmentTransaction is not allowed to be added to the back stack.");
    }

    @Override // com.android.wallpaper.widget.BottomActionBar.BottomActionBarHost
    public final BottomActionBar getBottomActionBar() {
        return this.mBottomActionBar;
    }

    @Override // com.android.wallpaper.picker.FragmentTransactionChecker
    public final boolean isSafeToCommitFragmentTransaction() {
        return this.mIsSafeToCommitFragmentTransaction;
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    public final void onDestroy() {
        super.onDestroy();
    }

    @Override // com.android.wallpaper.picker.AppbarFragment.AppbarFragmentHost
    public final void onUpArrowPressed() {
        onBackPressed();
    }
}
