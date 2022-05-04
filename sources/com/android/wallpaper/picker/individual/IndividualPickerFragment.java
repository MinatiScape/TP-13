package com.android.wallpaper.picker.individual;

import android.app.Activity;
import android.app.ProgressDialog;
import android.app.WallpaperManager;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Point;
import android.os.Bundle;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.text.TextUtils;
import android.util.ArraySet;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.Toast;
import android.widget.Toolbar;
import androidx.appcompat.R$bool;
import androidx.cardview.R$style;
import androidx.cardview.widget.CardView;
import androidx.core.widget.ContentLoadingProgressBar;
import androidx.core.widget.ContentLoadingProgressBar$$ExternalSyntheticLambda0;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.android.customization.picker.WallpaperPreviewer$$ExternalSyntheticLambda0;
import com.android.systemui.shared.R;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.model.Category;
import com.android.wallpaper.model.CategoryProvider;
import com.android.wallpaper.model.CategoryReceiver;
import com.android.wallpaper.model.ImageCategory;
import com.android.wallpaper.model.ThirdPartyLiveWallpaperCategory;
import com.android.wallpaper.model.WallpaperCategory;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.model.WallpaperReceiver;
import com.android.wallpaper.model.WallpaperRotationInitializer;
import com.android.wallpaper.module.DefaultCategoryProvider;
import com.android.wallpaper.module.DefaultPackageStatusNotifier;
import com.android.wallpaper.module.Injector;
import com.android.wallpaper.module.PackageStatusNotifier;
import com.android.wallpaper.picker.AppbarFragment;
import com.android.wallpaper.picker.FragmentTransactionChecker;
import com.android.wallpaper.picker.MyPhotosStarter;
import com.android.wallpaper.picker.RotationStarter;
import com.android.wallpaper.picker.StartRotationDialogFragment;
import com.android.wallpaper.picker.StartRotationErrorDialogFragment;
import com.android.wallpaper.util.DiskBasedLogger;
import com.android.wallpaper.widget.BottomActionBar$$ExternalSyntheticLambda0;
import com.android.wallpaper.widget.GridPaddingDecoration;
import com.android.wallpaper.widget.WallpaperPickerRecyclerViewAccessibilityDelegate;
import com.bumptech.glide.Glide;
import com.bumptech.glide.MemoryCategory;
import com.google.android.apps.wallpaper.module.GoogleWallpaperPreferences;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
/* loaded from: classes.dex */
public class IndividualPickerFragment extends AppbarFragment implements RotationStarter, StartRotationErrorDialogFragment.Listener, StartRotationDialogFragment.Listener {
    public static final /* synthetic */ int $r8$clinit = 0;
    public IndividualAdapter mAdapter;
    public PackageStatusNotifier.Listener mAppStatusListener;
    public ArraySet mAppliedWallpaperIds;
    public WallpaperCategory mCategory;
    public CategoryProvider mCategoryProvider;
    public RecyclerView mImageGrid;
    public boolean mIsWallpapersReceived;
    public ContentLoadingProgressBar mLoading;
    public PackageStatusNotifier mPackageStatusNotifier;
    public ProgressDialog mProgressDialog;
    public StartRotationErrorDialogFragment mStagedStartRotationErrorDialogFragment;
    public Point mTileSizePx;
    public WallpaperManager mWallpaperManager;
    public WallpaperRotationInitializer mWallpaperRotationInitializer;
    public ArrayList mWallpapers;

    /* renamed from: com.android.wallpaper.picker.individual.IndividualPickerFragment$3  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass3 implements WallpaperRotationInitializer.Listener {
        public final /* synthetic */ Context val$appContext;
        public final /* synthetic */ int val$networkPreference;

        public AnonymousClass3(Context context, int i) {
            this.val$appContext = context;
            this.val$networkPreference = i;
        }

        public final void onError() {
            ProgressDialog progressDialog = IndividualPickerFragment.this.mProgressDialog;
            if (progressDialog != null) {
                progressDialog.dismiss();
            }
            IndividualPickerFragment.m28$$Nest$mshowStartRotationErrorDialog(IndividualPickerFragment.this, this.val$networkPreference);
        }
    }

    /* loaded from: classes.dex */
    public class IndividualAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {
        public final List<WallpaperInfo> mWallpapers;

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public RecyclerView.ViewHolder onCreateViewHolder(RecyclerView recyclerView, int i) {
            if (i == 2) {
                return new PreviewIndividualHolder(IndividualPickerFragment.this.getActivity(), IndividualPickerFragment.this.mTileSizePx.y, LayoutInflater.from(IndividualPickerFragment.this.getActivity()).inflate(R.layout.grid_item_image, (ViewGroup) recyclerView, false));
            } else if (i != 3) {
                Log.e("IndividualPickerFrgmnt", "Unsupported viewType " + i + " in IndividualAdapter");
                return null;
            } else {
                return new MyPhotosViewHolder(IndividualPickerFragment.this.getActivity(), ((MyPhotosStarter.MyPhotosStarterProvider) IndividualPickerFragment.this.getActivity()).getMyPhotosStarter(), IndividualPickerFragment.this.mTileSizePx.y, LayoutInflater.from(IndividualPickerFragment.this.getActivity()).inflate(R.layout.grid_item_my_photos, (ViewGroup) recyclerView, false));
            }
        }

        public IndividualAdapter(List<WallpaperInfo> list) {
            this.mWallpapers = list;
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public final int getItemCount() {
            WallpaperCategory wallpaperCategory = IndividualPickerFragment.this.mCategory;
            wallpaperCategory.getClass();
            boolean z = wallpaperCategory instanceof ImageCategory;
            int size = this.mWallpapers.size();
            if (z) {
                return size + 1;
            }
            return size;
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public int getItemViewType(int i) {
            boolean z;
            WallpaperCategory wallpaperCategory = IndividualPickerFragment.this.mCategory;
            wallpaperCategory.getClass();
            if (!(wallpaperCategory instanceof ImageCategory)) {
                return 2;
            }
            if (IndividualPickerFragment.this.mWallpaperRotationInitializer != null) {
                z = true;
            } else {
                z = false;
            }
            if (z || i != 0) {
                return 2;
            }
            return 3;
        }

        public void onBindIndividualHolder(RecyclerView.ViewHolder viewHolder, int i) {
            String str;
            int i2;
            WallpaperCategory wallpaperCategory = IndividualPickerFragment.this.mCategory;
            wallpaperCategory.getClass();
            if (wallpaperCategory instanceof ImageCategory) {
                i--;
            }
            WallpaperInfo wallpaperInfo = this.mWallpapers.get(i);
            wallpaperInfo.computePlaceholderColor(viewHolder.itemView.getContext());
            IndividualHolder individualHolder = (IndividualHolder) viewHolder;
            individualHolder.mWallpaper = wallpaperInfo;
            String title = wallpaperInfo.getTitle(individualHolder.mActivity);
            List<String> attributions = wallpaperInfo.getAttributions(individualHolder.mActivity);
            if (attributions.size() > 0) {
                str = attributions.get(0);
            } else {
                str = null;
            }
            if (title != null) {
                individualHolder.mTitleView.setText(title);
                individualHolder.mTitleView.setVisibility(0);
                individualHolder.mTileLayout.setContentDescription(title);
            } else if (str != null) {
                individualHolder.mTileLayout.setContentDescription(str);
            }
            Asset thumbAsset = wallpaperInfo.getThumbAsset(individualHolder.mActivity.getApplicationContext());
            Activity activity = individualHolder.mActivity;
            thumbAsset.loadDrawable(activity, individualHolder.mThumbnailView, R$bool.getColorAttr(activity, 16844080));
            boolean contains = IndividualPickerFragment.this.mAppliedWallpaperIds.contains(wallpaperInfo.getWallpaperId());
            CardView cardView = (CardView) viewHolder.itemView.findViewById(R.id.wallpaper_container);
            if (IndividualPickerFragment.this.isFewerColumnLayout()) {
                i2 = R.dimen.grid_item_all_radius;
            } else {
                i2 = R.dimen.grid_item_all_radius_small;
            }
            cardView.setRadius(IndividualPickerFragment.this.getResources().getDimension(i2));
            showBadge(viewHolder, R.drawable.wallpaper_check_circle_24dp, contains);
        }

        public final void showBadge(RecyclerView.ViewHolder viewHolder, int i, boolean z) {
            float f;
            ImageView imageView = (ImageView) viewHolder.itemView.findViewById(R.id.indicator_icon);
            if (z) {
                if (IndividualPickerFragment.this.isFewerColumnLayout()) {
                    f = IndividualPickerFragment.this.getResources().getDimension(R.dimen.grid_item_badge_margin);
                } else {
                    f = IndividualPickerFragment.this.getResources().getDimension(R.dimen.grid_item_badge_margin_small);
                }
                RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) imageView.getLayoutParams();
                int i2 = (int) f;
                layoutParams.setMargins(i2, i2, i2, i2);
                imageView.setLayoutParams(layoutParams);
                imageView.setBackgroundResource(i);
                imageView.setVisibility(0);
                return;
            }
            imageView.setVisibility(8);
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public void onBindViewHolder(RecyclerView.ViewHolder viewHolder, int i) {
            int itemViewType = getItemViewType(i);
            if (itemViewType == 2) {
                onBindIndividualHolder(viewHolder, i);
            } else if (itemViewType != 3) {
                Log.e("IndividualPickerFrgmnt", "Unsupported viewType " + itemViewType + " in IndividualAdapter");
            } else {
                ((MyPhotosViewHolder) viewHolder).bind$1();
            }
        }
    }

    /* loaded from: classes.dex */
    public interface IndividualPickerFragmentHost {
        void isHostToolbarShown();

        void moveToPreviousFragment();

        void removeToolbarMenu();
    }

    @Override // androidx.fragment.app.Fragment
    public final void onDestroy() {
        this.mCalled = true;
        ProgressDialog progressDialog = this.mProgressDialog;
        if (progressDialog != null) {
            progressDialog.dismiss();
        }
        PackageStatusNotifier.Listener listener = this.mAppStatusListener;
        if (listener != null) {
            ((DefaultPackageStatusNotifier) this.mPackageStatusNotifier).removeListenerAndMaybeUnregisterCallback(listener);
        }
    }

    @Override // androidx.fragment.app.Fragment
    public final void onDestroyView() {
        this.mCalled = true;
        getIndividualPickerFragmentHost().removeToolbarMenu();
    }

    @Override // androidx.fragment.app.Fragment
    public final void onResume() {
        this.mCalled = true;
        R$style.getInjector().getPreferences(getActivity()).setLastAppActiveTimestamp(new Date().getTime());
        Glide.get(getActivity()).setMemoryCategory(MemoryCategory.NORMAL);
        StartRotationErrorDialogFragment startRotationErrorDialogFragment = this.mStagedStartRotationErrorDialogFragment;
        if (startRotationErrorDialogFragment != null) {
            startRotationErrorDialogFragment.show(this.mFragmentManager, "start_rotation_error_dialog");
            this.mStagedStartRotationErrorDialogFragment = null;
        }
    }

    @Override // com.android.wallpaper.picker.StartRotationDialogFragment.Listener
    public final void onStartRotationDialogDismiss() {
    }

    public void fetchWallpapers(boolean z) {
        this.mWallpapers.clear();
        this.mIsWallpapersReceived = false;
        updateLoading();
        this.mCategory.fetchWallpapers(getActivity().getApplicationContext(), new WallpaperReceiver() { // from class: com.android.wallpaper.picker.individual.IndividualPickerFragment.2
            @Override // com.android.wallpaper.model.WallpaperReceiver
            public final void onWallpapersReceived(List<WallpaperInfo> list) {
                FragmentActivity activity;
                IndividualPickerFragment individualPickerFragment = IndividualPickerFragment.this;
                individualPickerFragment.mIsWallpapersReceived = true;
                individualPickerFragment.updateLoading();
                for (WallpaperInfo wallpaperInfo : list) {
                    IndividualPickerFragment.this.mWallpapers.add(wallpaperInfo);
                }
                IndividualPickerFragment.this.maybeSetUpImageGrid();
                IndividualAdapter individualAdapter = IndividualPickerFragment.this.mAdapter;
                if (individualAdapter != null) {
                    individualAdapter.notifyDataSetChanged();
                }
                if (list.isEmpty() && (activity = IndividualPickerFragment.this.getActivity()) != null) {
                    activity.finish();
                }
            }
        }, z);
    }

    public final IndividualPickerFragmentHost getIndividualPickerFragmentHost() {
        Fragment fragment = this.mParentFragment;
        if (fragment != null) {
            return (IndividualPickerFragmentHost) fragment;
        }
        return (IndividualPickerFragmentHost) getActivity();
    }

    public boolean isFewerColumnLayout() {
        ArrayList arrayList = this.mWallpapers;
        if (arrayList == null || arrayList.size() > 8) {
            return false;
        }
        return true;
    }

    public final void maybeSetUpImageGrid() {
        boolean z;
        int i;
        int i2;
        int i3;
        Point point;
        if (!(this.mImageGrid == null || this.mCategory == null || getContext() == null)) {
            GridLayoutManager gridLayoutManager = (GridLayoutManager) this.mImageGrid.getLayoutManager();
            if (gridLayoutManager == null || gridLayoutManager.mSpanCount == getNumColumns()) {
                z = false;
            } else {
                z = true;
            }
            if (this.mAdapter == null || z) {
                int itemDecorationCount = this.mImageGrid.getItemDecorationCount();
                for (int i4 = 0; i4 < itemDecorationCount; i4++) {
                    this.mImageGrid.removeItemDecorationAt(i4);
                }
                RecyclerView recyclerView = this.mImageGrid;
                if (isFewerColumnLayout()) {
                    i = getResources().getDimensionPixelSize(R.dimen.grid_item_featured_individual_padding_horizontal);
                } else {
                    i = getResources().getDimensionPixelSize(R.dimen.grid_item_individual_padding_horizontal);
                }
                if (isFewerColumnLayout()) {
                    i2 = getResources().getDimensionPixelSize(R.dimen.grid_item_featured_individual_padding_bottom);
                } else {
                    i2 = getResources().getDimensionPixelSize(R.dimen.grid_item_individual_padding_bottom);
                }
                recyclerView.addItemDecoration(new GridPaddingDecoration(i, i2));
                if (isFewerColumnLayout()) {
                    i3 = getResources().getDimensionPixelSize(R.dimen.featured_wallpaper_grid_edge_space);
                } else {
                    i3 = getResources().getDimensionPixelSize(R.dimen.wallpaper_grid_edge_space);
                }
                RecyclerView recyclerView2 = this.mImageGrid;
                recyclerView2.setPadding(i3, recyclerView2.getPaddingTop(), i3, this.mImageGrid.getPaddingBottom());
                if (isFewerColumnLayout()) {
                    FragmentActivity activity = getActivity();
                    Resources resources = activity.getResources();
                    int activityWindowWidthPx = R$style.getActivityWindowWidthPx(activity);
                    point = R$style.getSquareTileSize(R$style.getNumColumns(activity, activityWindowWidthPx, 2, 2), activityWindowWidthPx, resources.getDimensionPixelSize(R.dimen.grid_item_featured_individual_padding_horizontal), resources.getDimensionPixelSize(R.dimen.featured_wallpaper_grid_edge_space));
                } else {
                    FragmentActivity activity2 = getActivity();
                    Resources resources2 = activity2.getResources();
                    int activityWindowWidthPx2 = R$style.getActivityWindowWidthPx(activity2);
                    point = R$style.getSquareTileSize(R$style.getNumColumns(activity2, activityWindowWidthPx2, 3, 4), activityWindowWidthPx2, resources2.getDimensionPixelSize(R.dimen.grid_item_individual_padding_horizontal), resources2.getDimensionPixelSize(R.dimen.wallpaper_grid_edge_space));
                }
                this.mTileSizePx = point;
                setUpImageGrid();
                this.mImageGrid.setAccessibilityDelegateCompat(new WallpaperPickerRecyclerViewAccessibilityDelegate(this.mImageGrid, (WallpaperPickerRecyclerViewAccessibilityDelegate.BottomSheetHost) this.mParentFragment, getNumColumns()));
            }
        }
    }

    public void setUpImageGrid() {
        IndividualAdapter individualAdapter = new IndividualAdapter(this.mWallpapers);
        this.mAdapter = individualAdapter;
        this.mImageGrid.setAdapter(individualAdapter);
        RecyclerView recyclerView = this.mImageGrid;
        getActivity();
        recyclerView.setLayoutManager(new GridLayoutManager(getNumColumns()));
    }

    @Override // com.android.wallpaper.picker.RotationStarter
    public final void startRotation(int i) {
        boolean z;
        if (this.mWallpaperRotationInitializer != null) {
            z = true;
        } else {
            z = false;
        }
        if (!z) {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Rotation is not enabled for this category ");
            m.append(this.mCategory.mTitle);
            Log.e("IndividualPickerFrgmnt", m.toString());
            return;
        }
        ProgressDialog progressDialog = new ProgressDialog(getActivity(), R.style.LightDialogTheme);
        this.mProgressDialog = progressDialog;
        progressDialog.setTitle((CharSequence) null);
        this.mProgressDialog.setMessage(getResources().getString(R.string.start_rotation_progress_message));
        this.mProgressDialog.setIndeterminate(true);
        this.mProgressDialog.show();
        Context applicationContext = getActivity().getApplicationContext();
        this.mWallpaperRotationInitializer.setFirstWallpaperInRotation(applicationContext, i, new AnonymousClass3(applicationContext, i));
    }

    public final void updateLoading() {
        ContentLoadingProgressBar contentLoadingProgressBar = this.mLoading;
        if (contentLoadingProgressBar != null) {
            if (this.mIsWallpapersReceived) {
                contentLoadingProgressBar.hide();
            } else {
                contentLoadingProgressBar.post(new ContentLoadingProgressBar$$ExternalSyntheticLambda0(contentLoadingProgressBar, 0));
            }
        }
    }

    /* renamed from: -$$Nest$mshowStartRotationErrorDialog  reason: not valid java name */
    public static void m28$$Nest$mshowStartRotationErrorDialog(IndividualPickerFragment individualPickerFragment, int i) {
        FragmentTransactionChecker fragmentTransactionChecker = (FragmentTransactionChecker) individualPickerFragment.getActivity();
        if (fragmentTransactionChecker != null) {
            StartRotationErrorDialogFragment startRotationErrorDialogFragment = new StartRotationErrorDialogFragment();
            Bundle bundle = new Bundle();
            bundle.putInt("network_preference", i);
            startRotationErrorDialogFragment.setArguments(bundle);
            startRotationErrorDialogFragment.setTargetFragment(individualPickerFragment);
            if (fragmentTransactionChecker.isSafeToCommitFragmentTransaction()) {
                startRotationErrorDialogFragment.show(individualPickerFragment.mFragmentManager, "start_rotation_error_dialog");
            } else {
                individualPickerFragment.mStagedStartRotationErrorDialogFragment = startRotationErrorDialogFragment;
            }
        }
    }

    public final int getNumColumns() {
        FragmentActivity activity = getActivity();
        if (activity == null) {
            return 1;
        }
        if (isFewerColumnLayout()) {
            return R$style.getNumColumns(activity, R$style.getActivityWindowWidthPx(activity), 2, 2);
        }
        return R$style.getNumColumns(activity, R$style.getActivityWindowWidthPx(activity), 3, 4);
    }

    public void onCategoryLoaded() {
        boolean z;
        if (getIndividualPickerFragmentHost() != null) {
            getIndividualPickerFragmentHost().isHostToolbarShown();
            setTitle(this.mCategory.mTitle);
            WallpaperRotationInitializer wallpaperRotationInitializer = this.mCategory.getWallpaperRotationInitializer();
            this.mWallpaperRotationInitializer = wallpaperRotationInitializer;
            Toolbar toolbar = this.mToolbar;
            if (toolbar != null) {
                if (wallpaperRotationInitializer != null) {
                    z = true;
                } else {
                    z = false;
                }
                if (z) {
                    toolbar.inflateMenu(R.menu.individual_picker_menu);
                    this.mToolbar.setOnMenuItemClickListener(this);
                }
            }
            fetchWallpapers(false);
            WallpaperCategory wallpaperCategory = this.mCategory;
            wallpaperCategory.getClass();
            if (wallpaperCategory instanceof ThirdPartyLiveWallpaperCategory) {
                WallpaperPreviewer$$ExternalSyntheticLambda0 wallpaperPreviewer$$ExternalSyntheticLambda0 = new WallpaperPreviewer$$ExternalSyntheticLambda0(this);
                this.mAppStatusListener = wallpaperPreviewer$$ExternalSyntheticLambda0;
                ((DefaultPackageStatusNotifier) this.mPackageStatusNotifier).addListener(wallpaperPreviewer$$ExternalSyntheticLambda0, "android.service.wallpaper.WallpaperService");
            }
        }
    }

    @Override // androidx.fragment.app.Fragment
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Injector injector = R$style.getInjector();
        Context applicationContext = getContext().getApplicationContext();
        this.mWallpaperManager = WallpaperManager.getInstance(applicationContext);
        this.mPackageStatusNotifier = injector.getPackageStatusNotifier(applicationContext);
        this.mWallpapers = new ArrayList();
        if (!(bundle == null || bundle.getInt("IndividualPickerFragment.NIGHT_MODE") == (getResources().getConfiguration().uiMode & 48))) {
            Glide.get(getContext()).clearMemory();
        }
        CategoryProvider categoryProvider = injector.getCategoryProvider(applicationContext);
        this.mCategoryProvider = categoryProvider;
        ((DefaultCategoryProvider) categoryProvider).fetchCategories(new CategoryReceiver() { // from class: com.android.wallpaper.picker.individual.IndividualPickerFragment.1
            @Override // com.android.wallpaper.model.CategoryReceiver
            public final void onCategoryReceived(Category category) {
            }

            @Override // com.android.wallpaper.model.CategoryReceiver
            public final void doneFetchingCategories() {
                IndividualPickerFragment individualPickerFragment = IndividualPickerFragment.this;
                Category category = ((DefaultCategoryProvider) individualPickerFragment.mCategoryProvider).getCategory(individualPickerFragment.mArguments.getString("category_collection_id"));
                if (category == null || (category instanceof WallpaperCategory)) {
                    IndividualPickerFragment individualPickerFragment2 = IndividualPickerFragment.this;
                    WallpaperCategory wallpaperCategory = (WallpaperCategory) category;
                    individualPickerFragment2.mCategory = wallpaperCategory;
                    if (wallpaperCategory == null) {
                        DiskBasedLogger.e("IndividualPickerFrgmnt", "Failed to find the category.", individualPickerFragment2.getContext());
                        IndividualPickerFragment.this.getIndividualPickerFragmentHost().moveToPreviousFragment();
                        Toast.makeText(IndividualPickerFragment.this.getContext(), (int) R.string.collection_not_exist_msg, 0).show();
                        return;
                    }
                    individualPickerFragment2.onCategoryLoaded();
                }
            }
        }, false);
    }

    @Override // androidx.fragment.app.Fragment
    public final View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        boolean z;
        String str;
        boolean z2 = false;
        View inflate = layoutInflater.inflate(R.layout.fragment_individual_picker, viewGroup, false);
        getIndividualPickerFragmentHost().isHostToolbarShown();
        setUpToolbar(inflate, true);
        if (this.mWallpaperRotationInitializer != null) {
            z = true;
        } else {
            z = false;
        }
        if (z) {
            this.mToolbar.inflateMenu(R.menu.individual_picker_menu);
            this.mToolbar.setOnMenuItemClickListener(this);
        }
        WallpaperCategory wallpaperCategory = this.mCategory;
        if (wallpaperCategory != null) {
            setTitle(wallpaperCategory.mTitle);
        }
        GoogleWallpaperPreferences preferences = R$style.getInjector().getPreferences(getContext());
        android.app.WallpaperInfo wallpaperInfo = this.mWallpaperManager.getWallpaperInfo();
        ArraySet arraySet = new ArraySet();
        if (wallpaperInfo != null) {
            str = wallpaperInfo.getServiceName();
        } else {
            str = preferences.getHomeWallpaperRemoteId();
        }
        if (!TextUtils.isEmpty(str)) {
            arraySet.add(str);
        }
        if (this.mWallpaperManager.getWallpaperId(2) >= 0) {
            z2 = true;
        }
        String lockWallpaperRemoteId = preferences.getLockWallpaperRemoteId();
        if (z2 && !TextUtils.isEmpty(lockWallpaperRemoteId)) {
            arraySet.add(lockWallpaperRemoteId);
        }
        this.mAppliedWallpaperIds = arraySet;
        this.mImageGrid = (RecyclerView) inflate.findViewById(R.id.wallpaper_grid);
        this.mLoading = (ContentLoadingProgressBar) inflate.findViewById(R.id.loading_indicator);
        updateLoading();
        maybeSetUpImageGrid();
        this.mImageGrid.setOnApplyWindowInsetsListener(BottomActionBar$$ExternalSyntheticLambda0.INSTANCE$1);
        return inflate;
    }

    @Override // com.android.wallpaper.picker.AppbarFragment, android.widget.Toolbar.OnMenuItemClickListener
    public final boolean onMenuItemClick(MenuItem menuItem) {
        if (menuItem.getItemId() != R.id.daily_rotation) {
            return false;
        }
        StartRotationDialogFragment startRotationDialogFragment = new StartRotationDialogFragment();
        startRotationDialogFragment.setTargetFragment(this);
        startRotationDialogFragment.show(this.mFragmentManager, "start_rotation_dialog");
        return true;
    }

    @Override // androidx.fragment.app.Fragment
    public final void onSaveInstanceState(Bundle bundle) {
        bundle.putInt("IndividualPickerFragment.NIGHT_MODE", getResources().getConfiguration().uiMode & 48);
    }

    @Override // com.android.wallpaper.picker.StartRotationErrorDialogFragment.Listener
    public final void retryStartRotation(int i) {
        startRotation(i);
    }
}
