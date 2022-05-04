package com.android.wallpaper.picker;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Point;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;
import androidx.appcompat.R$bool;
import androidx.cardview.R$style;
import androidx.cardview.widget.CardView;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.slice.view.R$dimen;
import com.android.customization.picker.grid.GridFragment$$ExternalSyntheticLambda0;
import com.android.systemui.shared.R;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.model.Category;
import com.android.wallpaper.model.CategoryProvider;
import com.android.wallpaper.model.ImageCategory;
import com.android.wallpaper.model.LiveWallpaperInfo;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.module.DefaultWallpaperPersister;
import com.android.wallpaper.picker.MyPhotosStarter;
import com.android.wallpaper.picker.PreviewActivity;
import com.android.wallpaper.util.DisplayMetricsRetriever;
import com.android.wallpaper.widget.WallpaperPickerRecyclerViewAccessibilityDelegate;
import com.bumptech.glide.Glide;
import com.google.android.apps.wallpaper.module.CompositeUserEventLogger;
import com.google.android.material.snackbar.BaseTransientBottomBar;
import com.google.android.material.snackbar.Snackbar;
import com.google.android.material.snackbar.SnackbarContentLayout;
import com.google.android.material.snackbar.SnackbarManager;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public class CategorySelectorFragment extends AppbarFragment {
    public static final /* synthetic */ int $r8$clinit = 0;
    public CategoryAdapter mAdapter;
    public boolean mAwaitingCategories;
    public ArrayList<Category> mCategories;
    public final CategoryProvider mCategoryProvider = R$style.getInjector().getCategoryProvider(getContext());
    public RecyclerView mImageGrid;
    public boolean mIsFeaturedCollectionAvailable;
    public Point mTileSizePx;

    /* loaded from: classes.dex */
    public class CategoryAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> implements MyPhotosStarter.PermissionChangedListener {
        public List<Category> mCategories;

        public CategoryAdapter(ArrayList arrayList) {
            this.mCategories = arrayList;
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public final int getItemCount() {
            int size = this.mCategories.size() + 0;
            if (CategorySelectorFragment.this.mAwaitingCategories) {
                return size + 1;
            }
            return size;
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public final int getItemViewType(int i) {
            if (CategorySelectorFragment.this.mAwaitingCategories && i == getItemCount() - 1) {
                return 4;
            }
            if (i == 0) {
                return 1;
            }
            if (!CategorySelectorFragment.this.mIsFeaturedCollectionAvailable) {
                return 3;
            }
            if (i == 1 || i == 2) {
                return 2;
            }
            return 3;
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public final RecyclerView.ViewHolder onCreateViewHolder(RecyclerView recyclerView, int i) {
            LayoutInflater from = LayoutInflater.from(CategorySelectorFragment.this.getActivity());
            if (i == 1) {
                return new MyPhotosCategoryHolder(CategorySelectorFragment.this, from.inflate(R.layout.grid_item_category, (ViewGroup) recyclerView, false));
            } else if (i == 2) {
                return new FeaturedCategoryHolder(CategorySelectorFragment.this, from.inflate(R.layout.grid_item_category, (ViewGroup) recyclerView, false));
            } else if (i == 3) {
                return new CategoryHolder(from.inflate(R.layout.grid_item_category, (ViewGroup) recyclerView, false));
            } else if (i != 4) {
                Log.e("CategorySelectorFragment", "Unsupported viewType " + i + " in CategoryAdapter");
                return null;
            } else {
                return new LoadingIndicatorHolder(CategorySelectorFragment.this, from.inflate(R.layout.grid_item_loading_indicator, (ViewGroup) recyclerView, false));
            }
        }

        @Override // com.android.wallpaper.picker.MyPhotosStarter.PermissionChangedListener
        public final void onPermissionsDenied(boolean z) {
            if (z) {
                new AlertDialog.Builder(CategorySelectorFragment.this.getActivity(), R.style.LightDialogTheme).setMessage(CategorySelectorFragment.this.getString(R.string.permission_needed_explanation_go_to_settings)).setPositiveButton(17039370, (DialogInterface.OnClickListener) null).setNegativeButton(R.string.settings_button_label, new DialogInterface.OnClickListener() { // from class: com.android.wallpaper.picker.CategorySelectorFragment$CategoryAdapter$$ExternalSyntheticLambda0
                    @Override // android.content.DialogInterface.OnClickListener
                    public final void onClick(DialogInterface dialogInterface, int i) {
                        CategorySelectorFragment.m27$$Nest$mstartSettings(CategorySelectorFragment.this);
                    }
                }).create().show();
            }
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public final void onBindViewHolder(RecyclerView.ViewHolder viewHolder, int i) {
            int itemViewType = getItemViewType(i);
            if (itemViewType == 1 || itemViewType == 2 || itemViewType == 3) {
                Category category = this.mCategories.get(i + 0);
                CategoryHolder categoryHolder = (CategoryHolder) viewHolder;
                categoryHolder.mCategory = category;
                categoryHolder.mTitleView.setText(category.mTitle);
                categoryHolder.drawThumbnailAndOverlayIcon();
            } else if (itemViewType != 4) {
                Log.e("CategorySelectorFragment", "Unsupported viewType " + itemViewType + " in CategoryAdapter");
            }
        }

        @Override // com.android.wallpaper.picker.MyPhotosStarter.PermissionChangedListener
        public final void onPermissionsGranted() {
            notifyDataSetChanged();
        }
    }

    /* loaded from: classes.dex */
    public class CategoryHolder extends RecyclerView.ViewHolder implements View.OnClickListener {
        public Category mCategory;
        public ImageView mImageView;
        public ImageView mOverlayIconView;
        public TextView mTitleView;

        public CategoryHolder(View view) {
            super(view);
            view.setOnClickListener(this);
            this.mImageView = (ImageView) view.findViewById(R.id.image);
            this.mOverlayIconView = (ImageView) view.findViewById(R.id.overlay_icon);
            this.mTitleView = (TextView) view.findViewById(R.id.category_title);
            CardView cardView = (CardView) view.findViewById(R.id.category);
            cardView.getLayoutParams().height = CategorySelectorFragment.this.mTileSizePx.y;
            cardView.setRadius(CategorySelectorFragment.this.getResources().getDimension(R.dimen.grid_item_all_radius_small));
        }

        public final void drawThumbnailAndOverlayIcon() {
            this.mOverlayIconView.setImageDrawable(this.mCategory.getOverlayIcon(CategorySelectorFragment.this.getActivity().getApplicationContext()));
            int overlayIconSizeDp = this.mCategory.getOverlayIconSizeDp();
            if (DisplayMetricsRetriever.sInstance == null) {
                DisplayMetricsRetriever.sInstance = new DisplayMetricsRetriever();
            }
            int i = (int) (overlayIconSizeDp * DisplayMetricsRetriever.sInstance.getDisplayMetrics(CategorySelectorFragment.this.getResources(), CategorySelectorFragment.this.getActivity().getWindowManager().getDefaultDisplay()).density);
            this.mOverlayIconView.getLayoutParams().width = i;
            this.mOverlayIconView.getLayoutParams().height = i;
            Asset thumbnail = this.mCategory.getThumbnail(CategorySelectorFragment.this.getActivity().getApplicationContext());
            if (thumbnail != null) {
                thumbnail.loadDrawable(CategorySelectorFragment.this.getActivity(), this.mImageView, 0);
                return;
            }
            FragmentActivity activity = CategorySelectorFragment.this.getActivity();
            Glide.getRetriever(activity).get(activity).asDrawable().loadGeneric(null).into(this.mImageView);
        }

        /* JADX WARN: Type inference failed for: r0v6, types: [com.android.wallpaper.picker.CategorySelectorFragment$CategoryHolder$1] */
        @Override // android.view.View.OnClickListener
        public final void onClick(View view) {
            int i;
            FragmentActivity activity = CategorySelectorFragment.this.getActivity();
            CompositeUserEventLogger userEventLogger = R$style.getInjector().getUserEventLogger(activity);
            userEventLogger.logCategorySelected(this.mCategory.mCollectionId);
            Category category = this.mCategory;
            category.getClass();
            if (category instanceof ImageCategory) {
                CategorySelectorFragment.this.getCategorySelectorFragmentHost().requestCustomPhotoPicker(new MyPhotosStarter.PermissionChangedListener() { // from class: com.android.wallpaper.picker.CategorySelectorFragment.CategoryHolder.1
                    /* JADX WARN: Type inference failed for: r0v7, types: [com.android.wallpaper.picker.CategorySelectorFragment$1] */
                    @Override // com.android.wallpaper.picker.MyPhotosStarter.PermissionChangedListener
                    public final void onPermissionsDenied(boolean z) {
                        ViewGroup viewGroup;
                        boolean z2;
                        int i2;
                        boolean z3;
                        if (z) {
                            final CategorySelectorFragment categorySelectorFragment = CategorySelectorFragment.this;
                            int i3 = CategorySelectorFragment.$r8$clinit;
                            View view2 = categorySelectorFragment.mView;
                            int[] iArr = Snackbar.SNACKBAR_CONTENT_STYLE_ATTRS;
                            CharSequence text = view2.getResources().getText(R.string.settings_snackbar_description);
                            ViewGroup viewGroup2 = null;
                            while (true) {
                                if (!(view2 instanceof CoordinatorLayout)) {
                                    if (view2 instanceof FrameLayout) {
                                        if (view2.getId() == 16908290) {
                                            viewGroup = (ViewGroup) view2;
                                            break;
                                        }
                                        viewGroup2 = (ViewGroup) view2;
                                    }
                                    ViewParent parent = view2.getParent();
                                    if (parent instanceof View) {
                                        view2 = (View) parent;
                                        continue;
                                    } else {
                                        view2 = null;
                                        continue;
                                    }
                                    if (view2 == null) {
                                        viewGroup = viewGroup2;
                                        break;
                                    }
                                } else {
                                    viewGroup = (ViewGroup) view2;
                                    break;
                                }
                            }
                            if (viewGroup != null) {
                                Context context = viewGroup.getContext();
                                LayoutInflater from = LayoutInflater.from(context);
                                TypedArray obtainStyledAttributes = context.obtainStyledAttributes(Snackbar.SNACKBAR_CONTENT_STYLE_ATTRS);
                                boolean z4 = false;
                                int resourceId = obtainStyledAttributes.getResourceId(0, -1);
                                int resourceId2 = obtainStyledAttributes.getResourceId(1, -1);
                                obtainStyledAttributes.recycle();
                                if (resourceId == -1 || resourceId2 == -1) {
                                    z2 = false;
                                } else {
                                    z2 = true;
                                }
                                if (z2) {
                                    i2 = R.layout.mtrl_layout_snackbar_include;
                                } else {
                                    i2 = R.layout.design_layout_snackbar_include;
                                }
                                SnackbarContentLayout snackbarContentLayout = (SnackbarContentLayout) from.inflate(i2, viewGroup, false);
                                final Snackbar snackbar = new Snackbar(context, viewGroup, snackbarContentLayout, snackbarContentLayout);
                                ((SnackbarContentLayout) snackbar.view.getChildAt(0)).messageView.setText(text);
                                snackbar.duration = 0;
                                Snackbar.SnackbarLayout snackbarLayout = (Snackbar.SnackbarLayout) snackbar.view;
                                snackbarLayout.setBackgroundResource(R.drawable.snackbar_background);
                                TypedArray obtainStyledAttributes2 = categorySelectorFragment.getContext().obtainStyledAttributes(new int[]{16842806, 17956901});
                                ((TextView) snackbarLayout.findViewById(R.id.snackbar_text)).setTextColor(obtainStyledAttributes2.getColor(0, 0));
                                ((SnackbarContentLayout) snackbar.view.getChildAt(0)).actionView.setTextColor(obtainStyledAttributes2.getColor(1, 0));
                                obtainStyledAttributes2.recycle();
                                String string = categorySelectorFragment.getContext().getString(R.string.settings_snackbar_enable);
                                final ?? r0 = new View.OnClickListener() { // from class: com.android.wallpaper.picker.CategorySelectorFragment.1
                                    @Override // android.view.View.OnClickListener
                                    public final void onClick(View view3) {
                                        CategorySelectorFragment.m27$$Nest$mstartSettings(CategorySelectorFragment.this);
                                    }
                                };
                                Button button = ((SnackbarContentLayout) snackbar.view.getChildAt(0)).actionView;
                                if (!TextUtils.isEmpty(string)) {
                                    snackbar.hasAction = true;
                                    button.setVisibility(0);
                                    button.setText(string);
                                    button.setOnClickListener(new View.OnClickListener() { // from class: com.google.android.material.snackbar.Snackbar.1
                                        @Override // android.view.View.OnClickListener
                                        public final void onClick(View view3) {
                                            r0.onClick(view3);
                                            Snackbar.this.dispatchDismiss(1);
                                        }
                                    });
                                } else {
                                    button.setVisibility(8);
                                    button.setOnClickListener(null);
                                    snackbar.hasAction = false;
                                }
                                SnackbarManager snackbarManager = SnackbarManager.getInstance();
                                int duration = snackbar.getDuration();
                                BaseTransientBottomBar.AnonymousClass5 r02 = snackbar.managerCallback;
                                synchronized (snackbarManager.lock) {
                                    if (snackbarManager.isCurrentSnackbarLocked(r02)) {
                                        SnackbarManager.SnackbarRecord snackbarRecord = snackbarManager.currentSnackbar;
                                        snackbarRecord.duration = duration;
                                        snackbarManager.handler.removeCallbacksAndMessages(snackbarRecord);
                                        snackbarManager.scheduleTimeoutLocked(snackbarManager.currentSnackbar);
                                        return;
                                    }
                                    SnackbarManager.SnackbarRecord snackbarRecord2 = snackbarManager.nextSnackbar;
                                    if (snackbarRecord2 != null) {
                                        if (r02 == null || snackbarRecord2.callback.get() != r02) {
                                            z3 = false;
                                        } else {
                                            z3 = true;
                                        }
                                        if (z3) {
                                            z4 = true;
                                        }
                                    }
                                    if (z4) {
                                        snackbarManager.nextSnackbar.duration = duration;
                                    } else {
                                        snackbarManager.nextSnackbar = new SnackbarManager.SnackbarRecord(duration, r02);
                                    }
                                    SnackbarManager.SnackbarRecord snackbarRecord3 = snackbarManager.currentSnackbar;
                                    if (snackbarRecord3 == null || !snackbarManager.cancelSnackbarLocked(snackbarRecord3, 4)) {
                                        snackbarManager.currentSnackbar = null;
                                        SnackbarManager.SnackbarRecord snackbarRecord4 = snackbarManager.nextSnackbar;
                                        if (snackbarRecord4 != null) {
                                            snackbarManager.currentSnackbar = snackbarRecord4;
                                            snackbarManager.nextSnackbar = null;
                                            SnackbarManager.Callback callback = snackbarRecord4.callback.get();
                                            if (callback != null) {
                                                callback.show();
                                            } else {
                                                snackbarManager.currentSnackbar = null;
                                            }
                                        }
                                        return;
                                    }
                                    return;
                                }
                            }
                            throw new IllegalArgumentException("No suitable parent found from the given view. Please provide a valid view.");
                        }
                    }

                    @Override // com.android.wallpaper.picker.MyPhotosStarter.PermissionChangedListener
                    public final void onPermissionsGranted() {
                        CategoryHolder.this.drawThumbnailAndOverlayIcon();
                    }
                });
            } else if (this.mCategory.isSingleWallpaperCategory()) {
                WallpaperInfo singleWallpaper = this.mCategory.getSingleWallpaper();
                userEventLogger.logIndividualWallpaperSelected(this.mCategory.mCollectionId);
                ((DefaultWallpaperPersister) R$style.getInjector().getWallpaperPersister(activity)).mWallpaperInfoInPreview = singleWallpaper;
                PreviewActivity.PreviewActivityIntentFactory previewActivityIntentFactory = new PreviewActivity.PreviewActivityIntentFactory();
                if (singleWallpaper instanceof LiveWallpaperInfo) {
                    i = 4;
                } else {
                    i = 1;
                }
                singleWallpaper.showPreview(activity, previewActivityIntentFactory, i);
            } else {
                CategorySelectorFragment.this.getCategorySelectorFragmentHost().show(this.mCategory);
            }
        }
    }

    /* loaded from: classes.dex */
    public interface CategorySelectorFragmentHost {
        void cleanUp();

        void fetchCategories();

        void isHostToolbarShown();

        void requestCustomPhotoPicker(CategoryHolder.AnonymousClass1 r1);

        void show(Category category);
    }

    /* loaded from: classes.dex */
    public class CategorySpanSizeLookup extends GridLayoutManager.SpanSizeLookup {
        public CategoryAdapter mAdapter;

        @Override // androidx.recyclerview.widget.GridLayoutManager.SpanSizeLookup
        public final int getSpanSize(int i) {
            if (i < 0 || this.mAdapter.getItemViewType(i) == 4 || this.mAdapter.getItemViewType(i) == 1) {
                CategorySelectorFragment categorySelectorFragment = CategorySelectorFragment.this;
                int i2 = CategorySelectorFragment.$r8$clinit;
                return categorySelectorFragment.getNumColumns() * 2;
            } else if (this.mAdapter.getItemViewType(i) == 2) {
                return (CategorySelectorFragment.this.getNumColumns() * 2) / 2;
            } else {
                return 2;
            }
        }

        public CategorySpanSizeLookup(CategoryAdapter categoryAdapter) {
            this.mAdapter = categoryAdapter;
        }
    }

    /* loaded from: classes.dex */
    public class GridPaddingDecoration extends RecyclerView.ItemDecoration {
        public final int mPadding;

        public GridPaddingDecoration(int i) {
            this.mPadding = i;
        }

        @Override // androidx.recyclerview.widget.RecyclerView.ItemDecoration
        public final void getItemOffsets(Rect rect, View view, RecyclerView recyclerView) {
            if (recyclerView.getChildAdapterPosition(view) + 0 >= 0) {
                int i = this.mPadding;
                rect.left = i;
                rect.right = i;
            }
            RecyclerView.ViewHolder childViewHolder = recyclerView.getChildViewHolder(view);
            if ((childViewHolder instanceof MyPhotosCategoryHolder) || (childViewHolder instanceof FeaturedCategoryHolder)) {
                rect.bottom = CategorySelectorFragment.this.getResources().getDimensionPixelSize(R.dimen.grid_item_featured_category_padding_bottom);
            } else {
                rect.bottom = CategorySelectorFragment.this.getResources().getDimensionPixelSize(R.dimen.grid_item_category_padding_bottom);
            }
        }
    }

    @Override // androidx.fragment.app.Fragment
    public final void onActivityResult(int i, int i2, Intent intent) {
        if (i == 1) {
            this.mAdapter.notifyDataSetChanged();
        }
    }

    /* loaded from: classes.dex */
    public class FeaturedCategoryHolder extends CategoryHolder {
        public FeaturedCategoryHolder(CategorySelectorFragment categorySelectorFragment, View view) {
            super(view);
            CardView cardView = (CardView) view.findViewById(R.id.category);
            cardView.getLayoutParams().height = R$style.getFeaturedCategoryTileSize(categorySelectorFragment.getActivity()).y;
            cardView.setRadius(categorySelectorFragment.getResources().getDimension(R.dimen.grid_item_all_radius));
        }
    }

    /* loaded from: classes.dex */
    public class LoadingIndicatorHolder extends RecyclerView.ViewHolder {
        public LoadingIndicatorHolder(CategorySelectorFragment categorySelectorFragment, View view) {
            super(view);
            ((ProgressBar) view.findViewById(R.id.loading_indicator)).getIndeterminateDrawable().setColorFilter(R$bool.getColorAttr(categorySelectorFragment.getActivity(), 16843829), PorterDuff.Mode.SRC_IN);
        }
    }

    /* loaded from: classes.dex */
    public class MyPhotosCategoryHolder extends CategoryHolder {
        public MyPhotosCategoryHolder(CategorySelectorFragment categorySelectorFragment, View view) {
            super(view);
            CardView cardView = (CardView) view.findViewById(R.id.category);
            int i = R$style.getFeaturedCategoryTileSize(categorySelectorFragment.getActivity()).y;
            cardView.getLayoutParams().height = i;
            cardView.setRadius(i);
        }
    }

    public final CategorySelectorFragmentHost getCategorySelectorFragmentHost() {
        Fragment fragment = this.mParentFragment;
        if (fragment != null) {
            return (CategorySelectorFragmentHost) fragment;
        }
        return (CategorySelectorFragmentHost) getActivity();
    }

    /* renamed from: -$$Nest$mstartSettings  reason: not valid java name */
    public static void m27$$Nest$mstartSettings(CategorySelectorFragment categorySelectorFragment) {
        FragmentActivity activity = categorySelectorFragment.getActivity();
        if (activity != null) {
            Intent intent = new Intent("android.settings.APPLICATION_DETAILS_SETTINGS");
            intent.setData(Uri.fromParts("package", activity.getPackageName(), null));
            categorySelectorFragment.startActivityForResult(intent, 1);
        }
    }

    public CategorySelectorFragment() {
        ArrayList<Category> arrayList = new ArrayList<>();
        this.mCategories = arrayList;
        this.mAdapter = new CategoryAdapter(arrayList);
    }

    public final int getNumColumns() {
        FragmentActivity activity = getActivity();
        if (activity == null) {
            return 1;
        }
        return R$style.getNumColumns(activity, R$style.getActivityWindowWidthPx(activity), 3, 3);
    }

    @Override // androidx.fragment.app.Fragment
    public final View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.fragment_category_selector, viewGroup, false);
        RecyclerView recyclerView = (RecyclerView) inflate.findViewById(R.id.category_grid);
        this.mImageGrid = recyclerView;
        recyclerView.addItemDecoration(new GridPaddingDecoration(getResources().getDimensionPixelSize(R.dimen.grid_item_category_padding_horizontal)));
        FragmentActivity activity = getActivity();
        Resources resources = activity.getResources();
        int activityWindowWidthPx = R$style.getActivityWindowWidthPx(activity);
        this.mTileSizePx = R$style.getSquareTileSize(R$style.getNumColumns(activity, activityWindowWidthPx, 3, 3), activityWindowWidthPx, resources.getDimensionPixelSize(R.dimen.grid_item_category_padding_horizontal), resources.getDimensionPixelSize(R.dimen.category_grid_edge_space));
        this.mImageGrid.setAdapter(this.mAdapter);
        getActivity();
        GridLayoutManager gridLayoutManager = new GridLayoutManager(getNumColumns() * 2);
        gridLayoutManager.mSpanSizeLookup = new CategorySpanSizeLookup(this.mAdapter);
        this.mImageGrid.setLayoutManager(gridLayoutManager);
        this.mImageGrid.setAccessibilityDelegateCompat(new WallpaperPickerRecyclerViewAccessibilityDelegate(this.mImageGrid, (WallpaperPickerRecyclerViewAccessibilityDelegate.BottomSheetHost) this.mParentFragment, getNumColumns()));
        getCategorySelectorFragmentHost().isHostToolbarShown();
        setUpToolbar(inflate, true);
        setTitle(getResources().getText(R.string.wallpaper_title));
        if (!R$dimen.isDeepLink(getActivity().getIntent())) {
            getCategorySelectorFragmentHost().fetchCategories();
        }
        this.mImageGrid.setOnApplyWindowInsetsListener(GridFragment$$ExternalSyntheticLambda0.INSTANCE$1);
        return inflate;
    }

    @Override // androidx.fragment.app.Fragment
    public final void onDestroyView() {
        getCategorySelectorFragmentHost().cleanUp();
        this.mCalled = true;
    }
}
