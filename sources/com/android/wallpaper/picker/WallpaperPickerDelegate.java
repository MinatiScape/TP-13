package com.android.wallpaper.picker;

import android.content.Intent;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import com.android.systemui.shared.R;
import com.android.wallpaper.model.Category;
import com.android.wallpaper.model.CategoryProvider;
import com.android.wallpaper.model.CategoryReceiver;
import com.android.wallpaper.module.DefaultCategoryProvider;
import com.android.wallpaper.module.DefaultPackageStatusNotifier;
import com.android.wallpaper.module.Injector;
import com.android.wallpaper.module.PackageStatusNotifier;
import com.android.wallpaper.module.WallpaperPersister;
import com.android.wallpaper.module.WallpaperPreferences;
import com.android.wallpaper.picker.CategorySelectorFragment;
import com.android.wallpaper.picker.MyPhotosStarter;
import com.android.wallpaper.picker.PreviewActivity;
import com.android.wallpaper.picker.ViewOnlyPreviewActivity;
import com.google.android.apps.wallpaper.module.WallpaperCategoryProvider;
import com.google.android.apps.wallpaper.module.WallpaperCategoryProvider$$ExternalSyntheticLambda0;
import com.google.android.apps.wallpaper.module.WallpaperCategoryProvider$$ExternalSyntheticLambda1;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final class WallpaperPickerDelegate implements MyPhotosStarter {
    public final FragmentActivity mActivity;
    public CategoryProvider mCategoryProvider;
    public final WallpapersUiContainer mContainer;
    public LivePreviewFragment$$ExternalSyntheticLambda6 mDownloadableWallpaperStatusListener;
    public WallpaperPickerDelegate$$ExternalSyntheticLambda0 mLiveWallpaperStatusListener;
    public PackageStatusNotifier mPackageStatusNotifier;
    public WallpaperPreferences mPreferences;
    public WallpaperPickerDelegate$$ExternalSyntheticLambda1 mThirdPartyStatusListener;
    public WallpaperPersister mWallpaperPersister;
    public PreviewActivity.PreviewActivityIntentFactory mPreviewIntentFactory = new PreviewActivity.PreviewActivityIntentFactory();
    public ViewOnlyPreviewActivity.ViewOnlyPreviewActivityIntentFactory mViewOnlyPreviewIntentFactory = new ViewOnlyPreviewActivity.ViewOnlyPreviewActivityIntentFactory();
    public ArrayList mPermissionChangedListeners = new ArrayList();
    public String mDownloadableIntentAction = "com.google.pixel.livewallpaper.action.DOWNLOAD_LIVE_WALLPAPER";

    public final CategorySelectorFragment getCategorySelectorFragment() {
        Fragment findFragmentById = ((CustomizationPickerActivity) this.mContainer).getSupportFragmentManager().findFragmentById(R.id.fragment_container);
        if (findFragmentById instanceof CategorySelectorFragment) {
            return (CategorySelectorFragment) findFragmentById;
        }
        return null;
    }

    public final void requestCustomPhotoPicker(final MyPhotosStarter.PermissionChangedListener permissionChangedListener) {
        boolean z;
        if (this.mActivity.getPackageManager().checkPermission("android.permission.READ_EXTERNAL_STORAGE", this.mActivity.getPackageName()) == 0) {
            z = true;
        } else {
            z = false;
        }
        if (!z) {
            this.mPermissionChangedListeners.add(new MyPhotosStarter.PermissionChangedListener() { // from class: com.android.wallpaper.picker.WallpaperPickerDelegate.1
                @Override // com.android.wallpaper.picker.MyPhotosStarter.PermissionChangedListener
                public final void onPermissionsDenied(boolean z2) {
                    permissionChangedListener.onPermissionsDenied(z2);
                }

                @Override // com.android.wallpaper.picker.MyPhotosStarter.PermissionChangedListener
                public final void onPermissionsGranted() {
                    permissionChangedListener.onPermissionsGranted();
                    WallpaperPickerDelegate wallpaperPickerDelegate = WallpaperPickerDelegate.this;
                    wallpaperPickerDelegate.getClass();
                    Intent intent = new Intent("android.intent.action.PICK");
                    intent.setType("image/*");
                    wallpaperPickerDelegate.mActivity.startActivityForResult(intent, 0);
                }
            });
            this.mActivity.requestPermissions(new String[]{"android.permission.READ_EXTERNAL_STORAGE"}, 3);
            return;
        }
        Intent intent = new Intent("android.intent.action.PICK");
        intent.setType("image/*");
        this.mActivity.startActivityForResult(intent, 0);
    }

    public WallpaperPickerDelegate(WallpapersUiContainer wallpapersUiContainer, FragmentActivity fragmentActivity, Injector injector) {
        this.mContainer = wallpapersUiContainer;
        this.mActivity = fragmentActivity;
        this.mCategoryProvider = injector.getCategoryProvider(fragmentActivity);
        this.mPreferences = injector.getPreferences(fragmentActivity);
        this.mPackageStatusNotifier = injector.getPackageStatusNotifier(fragmentActivity);
        this.mWallpaperPersister = injector.getWallpaperPersister(fragmentActivity);
        injector.getDownloadableIntentAction();
    }

    public final void addCategory(Category category, boolean z) {
        CategorySelectorFragment categorySelectorFragment = getCategorySelectorFragment();
        if (categorySelectorFragment != null) {
            if (z && !categorySelectorFragment.mAwaitingCategories) {
                categorySelectorFragment.mAdapter.notifyItemChanged(categorySelectorFragment.getNumColumns());
                categorySelectorFragment.mAdapter.mObservable.notifyItemRangeInserted(categorySelectorFragment.getNumColumns());
                categorySelectorFragment.mAwaitingCategories = true;
            }
            if (categorySelectorFragment.mCategories.indexOf(category) >= 0) {
                int indexOf = categorySelectorFragment.mCategories.indexOf(category);
                if (indexOf >= 0) {
                    categorySelectorFragment.mCategories.remove(indexOf);
                    categorySelectorFragment.mCategories.add(indexOf, category);
                    categorySelectorFragment.mAdapter.notifyItemChanged(indexOf + 0);
                    return;
                }
                return;
            }
            int i = category.mPriority;
            int i2 = 0;
            while (i2 < categorySelectorFragment.mCategories.size() && i >= categorySelectorFragment.mCategories.get(i2).mPriority) {
                i2++;
            }
            categorySelectorFragment.mCategories.add(i2, category);
            CategorySelectorFragment.CategoryAdapter categoryAdapter = categorySelectorFragment.mAdapter;
            if (categoryAdapter != null) {
                categoryAdapter.mObservable.notifyItemRangeInserted(i2 + 0);
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0, types: [com.android.wallpaper.picker.WallpaperPickerDelegate$$ExternalSyntheticLambda1] */
    /* JADX WARN: Type inference failed for: r3v1, types: [com.android.wallpaper.module.PackageStatusNotifier$Listener, com.android.wallpaper.picker.WallpaperPickerDelegate$$ExternalSyntheticLambda0] */
    public final void initialize(boolean z) {
        populateCategories(z);
        ?? wallpaperPickerDelegate$$ExternalSyntheticLambda0 = new PackageStatusNotifier.Listener() { // from class: com.android.wallpaper.picker.WallpaperPickerDelegate$$ExternalSyntheticLambda0
            @Override // com.android.wallpaper.module.PackageStatusNotifier.Listener
            public final void onPackageChanged(String str, int i) {
                final WallpaperPickerDelegate wallpaperPickerDelegate = WallpaperPickerDelegate.this;
                final String string = wallpaperPickerDelegate.mActivity.getString(R.string.live_wallpaper_collection_id);
                final Category category = ((DefaultCategoryProvider) wallpaperPickerDelegate.mCategoryProvider).getCategory(string);
                if (i != 3 || (category != null && category.containsThirdParty(str))) {
                    ((DefaultCategoryProvider) wallpaperPickerDelegate.mCategoryProvider).fetchCategories(new CategoryReceiver() { // from class: com.android.wallpaper.picker.WallpaperPickerDelegate.4
                        @Override // com.android.wallpaper.model.CategoryReceiver
                        public final void onCategoryReceived(Category category2) {
                        }

                        @Override // com.android.wallpaper.model.CategoryReceiver
                        public final void doneFetchingCategories() {
                            int indexOf;
                            int indexOf2;
                            Category category2 = ((DefaultCategoryProvider) WallpaperPickerDelegate.this.mCategoryProvider).getCategory(string);
                            if (category2 == null) {
                                WallpaperPickerDelegate wallpaperPickerDelegate2 = WallpaperPickerDelegate.this;
                                Category category3 = category;
                                CategorySelectorFragment categorySelectorFragment = wallpaperPickerDelegate2.getCategorySelectorFragment();
                                if (categorySelectorFragment != null && (indexOf2 = categorySelectorFragment.mCategories.indexOf(category3)) >= 0) {
                                    categorySelectorFragment.mCategories.remove(indexOf2);
                                    categorySelectorFragment.mAdapter.mObservable.notifyItemRangeRemoved(indexOf2 + 0);
                                }
                            } else if (category != null) {
                                CategorySelectorFragment categorySelectorFragment2 = WallpaperPickerDelegate.this.getCategorySelectorFragment();
                                if (categorySelectorFragment2 != null && (indexOf = categorySelectorFragment2.mCategories.indexOf(category2)) >= 0) {
                                    categorySelectorFragment2.mCategories.remove(indexOf);
                                    categorySelectorFragment2.mCategories.add(indexOf, category2);
                                    categorySelectorFragment2.mAdapter.notifyItemChanged(indexOf + 0);
                                }
                            } else {
                                WallpaperPickerDelegate.this.addCategory(category2, false);
                            }
                        }
                    }, true);
                }
            }
        };
        this.mLiveWallpaperStatusListener = wallpaperPickerDelegate$$ExternalSyntheticLambda0;
        this.mThirdPartyStatusListener = new PackageStatusNotifier.Listener() { // from class: com.android.wallpaper.picker.WallpaperPickerDelegate$$ExternalSyntheticLambda1
            /* JADX WARN: Code restructure failed: missing block: B:22:0x0051, code lost:
                if (r1 == null) goto L33;
             */
            /* JADX WARN: Code restructure failed: missing block: B:23:0x0053, code lost:
                ((com.android.wallpaper.module.DefaultCategoryProvider) r4.mCategoryProvider).fetchCategories(new com.android.wallpaper.picker.WallpaperPickerDelegate.AnonymousClass3(), true);
             */
            /* JADX WARN: Code restructure failed: missing block: B:33:?, code lost:
                return;
             */
            /* JADX WARN: Code restructure failed: missing block: B:34:?, code lost:
                return;
             */
            @Override // com.android.wallpaper.module.PackageStatusNotifier.Listener
            /*
                Code decompiled incorrectly, please refer to instructions dump.
                To view partially-correct add '--show-bad-code' argument
            */
            public final void onPackageChanged(final java.lang.String r5, int r6) {
                /*
                    r4 = this;
                    com.android.wallpaper.picker.WallpaperPickerDelegate r4 = com.android.wallpaper.picker.WallpaperPickerDelegate.this
                    r0 = 1
                    if (r6 != r0) goto L12
                    com.android.wallpaper.model.CategoryProvider r6 = r4.mCategoryProvider
                    com.android.wallpaper.picker.WallpaperPickerDelegate$2 r1 = new com.android.wallpaper.picker.WallpaperPickerDelegate$2
                    r1.<init>()
                    com.android.wallpaper.module.DefaultCategoryProvider r6 = (com.android.wallpaper.module.DefaultCategoryProvider) r6
                    r6.fetchCategories(r1, r0)
                    goto L63
                L12:
                    r1 = 3
                    if (r6 != r1) goto L60
                    com.android.wallpaper.model.CategoryProvider r6 = r4.mCategoryProvider
                    com.android.wallpaper.module.DefaultCategoryProvider r6 = (com.android.wallpaper.module.DefaultCategoryProvider) r6
                    boolean r1 = r6.mFetchedCategories
                    r2 = 0
                    if (r1 == 0) goto L25
                    java.util.ArrayList<com.android.wallpaper.model.Category> r6 = r6.mCategories
                    int r6 = r6.size()
                    goto L26
                L25:
                    r6 = r2
                L26:
                    if (r2 >= r6) goto L50
                    com.android.wallpaper.model.CategoryProvider r1 = r4.mCategoryProvider
                    com.android.wallpaper.module.DefaultCategoryProvider r1 = (com.android.wallpaper.module.DefaultCategoryProvider) r1
                    boolean r3 = r1.mFetchedCategories
                    if (r3 == 0) goto L48
                    java.util.ArrayList<com.android.wallpaper.model.Category> r1 = r1.mCategories
                    java.lang.Object r1 = r1.get(r2)
                    com.android.wallpaper.model.Category r1 = (com.android.wallpaper.model.Category) r1
                    boolean r3 = r1.supportsThirdParty()
                    if (r3 == 0) goto L45
                    boolean r3 = r1.containsThirdParty(r5)
                    if (r3 == 0) goto L45
                    goto L51
                L45:
                    int r2 = r2 + 1
                    goto L26
                L48:
                    java.lang.IllegalStateException r4 = new java.lang.IllegalStateException
                    java.lang.String r5 = "Categories are not available"
                    r4.<init>(r5)
                    throw r4
                L50:
                    r1 = 0
                L51:
                    if (r1 == 0) goto L63
                    com.android.wallpaper.model.CategoryProvider r5 = r4.mCategoryProvider
                    com.android.wallpaper.picker.WallpaperPickerDelegate$3 r6 = new com.android.wallpaper.picker.WallpaperPickerDelegate$3
                    r6.<init>()
                    com.android.wallpaper.module.DefaultCategoryProvider r5 = (com.android.wallpaper.module.DefaultCategoryProvider) r5
                    r5.fetchCategories(r6, r0)
                    goto L63
                L60:
                    r4.populateCategories(r0)
                L63:
                    return
                */
                throw new UnsupportedOperationException("Method not decompiled: com.android.wallpaper.picker.WallpaperPickerDelegate$$ExternalSyntheticLambda1.onPackageChanged(java.lang.String, int):void");
            }
        };
        ((DefaultPackageStatusNotifier) this.mPackageStatusNotifier).addListener(wallpaperPickerDelegate$$ExternalSyntheticLambda0, "android.service.wallpaper.WallpaperService");
        ((DefaultPackageStatusNotifier) this.mPackageStatusNotifier).addListener(this.mThirdPartyStatusListener, "android.intent.action.SET_WALLPAPER");
        String str = this.mDownloadableIntentAction;
        if (str != null) {
            LivePreviewFragment$$ExternalSyntheticLambda6 livePreviewFragment$$ExternalSyntheticLambda6 = new LivePreviewFragment$$ExternalSyntheticLambda6(this);
            this.mDownloadableWallpaperStatusListener = livePreviewFragment$$ExternalSyntheticLambda6;
            ((DefaultPackageStatusNotifier) this.mPackageStatusNotifier).addListener(livePreviewFragment$$ExternalSyntheticLambda6, str);
        }
    }

    public final void populateCategories(boolean z) {
        CategorySelectorFragment categorySelectorFragment = getCategorySelectorFragment();
        if (z && categorySelectorFragment != null) {
            categorySelectorFragment.mCategories.clear();
            categorySelectorFragment.mAdapter.notifyDataSetChanged();
        }
        ((DefaultCategoryProvider) this.mCategoryProvider).fetchCategories(new CategoryReceiver() { // from class: com.android.wallpaper.picker.WallpaperPickerDelegate.6
            @Override // com.android.wallpaper.model.CategoryReceiver
            public final void doneFetchingCategories() {
                CategorySelectorFragment categorySelectorFragment2 = WallpaperPickerDelegate.this.getCategorySelectorFragment();
                if (categorySelectorFragment2 != null) {
                    boolean z2 = true;
                    if (categorySelectorFragment2.mAwaitingCategories) {
                        CategorySelectorFragment.CategoryAdapter categoryAdapter = categorySelectorFragment2.mAdapter;
                        categoryAdapter.mObservable.notifyItemRangeRemoved(categoryAdapter.getItemCount() - 1);
                        categorySelectorFragment2.mAwaitingCategories = false;
                    }
                    if (((WallpaperCategoryProvider) categorySelectorFragment2.mCategoryProvider).mCategories.stream().filter(WallpaperCategoryProvider$$ExternalSyntheticLambda0.INSTANCE).filter(WallpaperCategoryProvider$$ExternalSyntheticLambda1.INSTANCE).count() < 2) {
                        z2 = false;
                    }
                    categorySelectorFragment2.mIsFeaturedCollectionAvailable = z2;
                }
            }

            @Override // com.android.wallpaper.model.CategoryReceiver
            public final void onCategoryReceived(Category category) {
                WallpaperPickerDelegate.this.addCategory(category, true);
            }
        }, z);
    }
}
