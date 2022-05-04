package com.android.wallpaper.picker.individual;

import android.app.Activity;
import android.content.Context;
import android.os.Parcel;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.cardview.R$style;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.android.systemui.shared.R;
import com.android.wallpaper.asset.Asset;
import com.android.wallpaper.model.Category;
import com.android.wallpaper.model.CategoryProvider;
import com.android.wallpaper.model.CategoryReceiver;
import com.android.wallpaper.model.DownloadableLiveWallpaperInfo;
import com.android.wallpaper.model.ImageCategory;
import com.android.wallpaper.model.InlinePreviewIntentFactory;
import com.android.wallpaper.model.WallpaperCategory;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.model.WallpaperReceiver;
import com.android.wallpaper.module.DefaultCategoryProvider;
import com.android.wallpaper.module.DefaultPackageStatusNotifier;
import com.android.wallpaper.module.Injector;
import com.android.wallpaper.picker.ImagePreviewFragment$$ExternalSyntheticLambda2;
import com.android.wallpaper.picker.individual.IndividualPickerFragment;
import com.android.wallpaper.picker.individual.IndividualPickerUnlockableFragment;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.function.Predicate;
/* loaded from: classes.dex */
public class IndividualPickerUnlockableFragment extends IndividualPickerFragment {
    public static final /* synthetic */ int $r8$clinit = 0;
    public CategoryProvider mCategoryProvider;
    public ArrayList mDownloadableWallpapers = new ArrayList();
    public Injector mInjector;

    /* renamed from: com.android.wallpaper.picker.individual.IndividualPickerUnlockableFragment$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass1 implements CategoryReceiver {
        public final /* synthetic */ boolean val$forceReload;

        @Override // com.android.wallpaper.model.CategoryReceiver
        public final void doneFetchingCategories() {
        }

        public AnonymousClass1(boolean z) {
            this.val$forceReload = z;
        }

        @Override // com.android.wallpaper.model.CategoryReceiver
        public final void onCategoryReceived(Category category) {
            if (TextUtils.equals(category.mCollectionId, IndividualPickerUnlockableFragment.this.mCategory.mCollectionId) && (category instanceof WallpaperCategory)) {
                IndividualPickerUnlockableFragment.this.mWallpapers.clear();
                IndividualPickerUnlockableFragment.this.mDownloadableWallpapers.clear();
                IndividualPickerUnlockableFragment individualPickerUnlockableFragment = IndividualPickerUnlockableFragment.this;
                individualPickerUnlockableFragment.mIsWallpapersReceived = false;
                individualPickerUnlockableFragment.updateLoading();
                ((WallpaperCategory) category).fetchWallpapers(IndividualPickerUnlockableFragment.this.getContext(), new WallpaperReceiver() { // from class: com.android.wallpaper.picker.individual.IndividualPickerUnlockableFragment$1$$ExternalSyntheticLambda0
                    @Override // com.android.wallpaper.model.WallpaperReceiver
                    public final void onWallpapersReceived(List list) {
                        IndividualPickerUnlockableFragment.AnonymousClass1 r2 = IndividualPickerUnlockableFragment.AnonymousClass1.this;
                        IndividualPickerUnlockableFragment individualPickerUnlockableFragment2 = IndividualPickerUnlockableFragment.this;
                        individualPickerUnlockableFragment2.mIsWallpapersReceived = true;
                        individualPickerUnlockableFragment2.updateLoading();
                        Iterator it = list.iterator();
                        while (it.hasNext()) {
                            WallpaperInfo wallpaperInfo = (WallpaperInfo) it.next();
                            if (wallpaperInfo == null || !(wallpaperInfo instanceof DownloadableLiveWallpaperInfo)) {
                                IndividualPickerUnlockableFragment.this.mWallpapers.add(wallpaperInfo);
                            } else {
                                IndividualPickerUnlockableFragment.this.mDownloadableWallpapers.add(wallpaperInfo);
                            }
                        }
                        if (IndividualPickerUnlockableFragment.this.mDownloadableWallpapers.size() > 0) {
                            IndividualPickerUnlockableFragment.this.mWallpapers.add(new WallpaperInfo() { // from class: com.android.wallpaper.picker.individual.IndividualPickerUnlockableFragment.2
                                public final /* synthetic */ String val$collectionIdHeader = "unlock_additionals_header";

                                @Override // com.android.wallpaper.model.WallpaperInfo
                                public final Asset getAsset(Context context) {
                                    return null;
                                }

                                @Override // com.android.wallpaper.model.WallpaperInfo
                                public final List<String> getAttributions(Context context) {
                                    return null;
                                }

                                @Override // com.android.wallpaper.model.WallpaperInfo
                                public final Asset getThumbAsset(Context context) {
                                    return null;
                                }

                                @Override // com.android.wallpaper.model.WallpaperInfo
                                public final void showPreview(Activity activity, InlinePreviewIntentFactory inlinePreviewIntentFactory, int i) {
                                }

                                @Override // com.android.wallpaper.model.WallpaperInfo, android.os.Parcelable
                                public final void writeToParcel(Parcel parcel, int i) {
                                }

                                @Override // com.android.wallpaper.model.WallpaperInfo
                                public final String getCollectionId(Context context) {
                                    return this.val$collectionIdHeader;
                                }
                            });
                            IndividualPickerUnlockableFragment individualPickerUnlockableFragment3 = IndividualPickerUnlockableFragment.this;
                            individualPickerUnlockableFragment3.mWallpapers.addAll(individualPickerUnlockableFragment3.mDownloadableWallpapers);
                        }
                        IndividualPickerUnlockableFragment.this.maybeSetUpImageGrid();
                        IndividualPickerFragment.IndividualAdapter individualAdapter = IndividualPickerUnlockableFragment.this.mAdapter;
                        if (individualAdapter != null) {
                            individualAdapter.notifyDataSetChanged();
                        }
                    }
                }, this.val$forceReload);
            }
        }
    }

    /* loaded from: classes.dex */
    public class IndividualUnlockAdapter extends IndividualPickerFragment.IndividualAdapter {
        public IndividualUnlockAdapter(List<WallpaperInfo> list) {
            super(list);
        }

        public final UnlockAdditionalsHeaderHolder createTitleHolder(RecyclerView recyclerView, boolean z) {
            View inflate = LayoutInflater.from(IndividualPickerUnlockableFragment.this.getActivity()).inflate(R.layout.grid_item_unlock_additionals_header, (ViewGroup) recyclerView, false);
            if (z) {
                inflate.setPadding(inflate.getPaddingStart(), 0, inflate.getPaddingEnd(), inflate.getPaddingBottom());
            }
            return new UnlockAdditionalsHeaderHolder(inflate);
        }

        @Override // com.android.wallpaper.picker.individual.IndividualPickerFragment.IndividualAdapter, androidx.recyclerview.widget.RecyclerView.Adapter
        public final int getItemViewType(int i) {
            int itemViewType = super.getItemViewType(i);
            if (i >= IndividualPickerUnlockableFragment.this.mWallpapers.size() || !TextUtils.equals("unlock_additionals_header", ((WallpaperInfo) IndividualPickerUnlockableFragment.this.mWallpapers.get(i)).getCollectionId(IndividualPickerUnlockableFragment.this.getContext()))) {
                return itemViewType;
            }
            if (i == 0) {
                return 5;
            }
            return 4;
        }

        @Override // com.android.wallpaper.picker.individual.IndividualPickerFragment.IndividualAdapter
        public final void onBindIndividualHolder(RecyclerView.ViewHolder viewHolder, int i) {
            super.onBindIndividualHolder(viewHolder, i);
            WallpaperCategory wallpaperCategory = IndividualPickerUnlockableFragment.this.mCategory;
            wallpaperCategory.getClass();
            if (wallpaperCategory instanceof ImageCategory) {
                i--;
            }
            WallpaperInfo wallpaperInfo = (WallpaperInfo) IndividualPickerUnlockableFragment.this.mWallpapers.get(i);
            if (!IndividualPickerFragment.this.mAppliedWallpaperIds.contains(wallpaperInfo.getWallpaperId())) {
                showBadge(viewHolder, R.drawable.ic_download_badge, wallpaperInfo instanceof DownloadableLiveWallpaperInfo);
            }
        }

        @Override // com.android.wallpaper.picker.individual.IndividualPickerFragment.IndividualAdapter, androidx.recyclerview.widget.RecyclerView.Adapter
        public final void onBindViewHolder(RecyclerView.ViewHolder viewHolder, int i) {
            int itemViewType = getItemViewType(i);
            if (itemViewType == 2) {
                onBindIndividualHolder(viewHolder, i);
            } else if (itemViewType == 3) {
                ((MyPhotosViewHolder) viewHolder).bind$1();
            } else if (itemViewType != 4 && itemViewType != 5) {
                Log.e("IndividualPickerUnlockableFrgmnt", "Unsupported viewType " + itemViewType + " in IndividualAdapter");
            }
        }

        @Override // com.android.wallpaper.picker.individual.IndividualPickerFragment.IndividualAdapter, androidx.recyclerview.widget.RecyclerView.Adapter
        public final RecyclerView.ViewHolder onCreateViewHolder(RecyclerView recyclerView, int i) {
            RecyclerView.ViewHolder onCreateViewHolder = super.onCreateViewHolder(recyclerView, i);
            if (onCreateViewHolder == null) {
                if (i == 4) {
                    return createTitleHolder(recyclerView, false);
                }
                if (i == 5) {
                    return createTitleHolder(recyclerView, true);
                }
                Log.e("IndividualPickerUnlockableFrgmnt", "Unsupported viewType " + i + " in IndividualAdapter");
            }
            return onCreateViewHolder;
        }
    }

    @Override // com.android.wallpaper.picker.individual.IndividualPickerFragment
    public final void fetchWallpapers(boolean z) {
        CategoryProvider categoryProvider = this.mCategoryProvider;
        if (categoryProvider == null) {
            Log.w("IndividualPickerUnlockableFrgmnt", "fetchWallpapers with null category provider");
            return;
        }
        ((DefaultCategoryProvider) categoryProvider).fetchCategories(new AnonymousClass1(z), z);
    }

    @Override // com.android.wallpaper.picker.individual.IndividualPickerFragment
    public final boolean isFewerColumnLayout() {
        final Context context;
        if (this.mWallpapers == null || (context = getContext()) == null || this.mWallpapers.stream().filter(new Predicate() { // from class: com.android.wallpaper.picker.individual.IndividualPickerUnlockableFragment$$ExternalSyntheticLambda0
            @Override // java.util.function.Predicate
            public final boolean test(Object obj) {
                Context context2 = context;
                int i = IndividualPickerUnlockableFragment.$r8$clinit;
                return !TextUtils.equals("unlock_additionals_header", ((WallpaperInfo) obj).getCollectionId(context2));
            }
        }).count() > 8) {
            return false;
        }
        return true;
    }

    @Override // com.android.wallpaper.picker.individual.IndividualPickerFragment
    public final void setUpImageGrid() {
        IndividualUnlockAdapter individualUnlockAdapter = new IndividualUnlockAdapter(this.mWallpapers);
        this.mAdapter = individualUnlockAdapter;
        this.mImageGrid.setAdapter(individualUnlockAdapter);
        getActivity();
        final GridLayoutManager gridLayoutManager = new GridLayoutManager(getNumColumns());
        gridLayoutManager.mSpanSizeLookup = new GridLayoutManager.SpanSizeLookup() { // from class: com.android.wallpaper.picker.individual.IndividualPickerUnlockableFragment.3
            @Override // androidx.recyclerview.widget.GridLayoutManager.SpanSizeLookup
            public final int getSpanSize(int i) {
                int itemViewType = IndividualPickerUnlockableFragment.this.mAdapter.getItemViewType(i);
                if (itemViewType == 2 || itemViewType == 3) {
                    return 1;
                }
                if (itemViewType == 4 || itemViewType == 5) {
                    return gridLayoutManager.mSpanCount;
                }
                return -1;
            }
        };
        this.mImageGrid.setLayoutManager(gridLayoutManager);
    }

    @Override // com.android.wallpaper.picker.AppbarFragment, androidx.fragment.app.Fragment
    public final void onAttach(Context context) {
        super.onAttach(context);
        this.mCategoryProvider = R$style.getInjector().getCategoryProvider(getActivity());
    }

    @Override // com.android.wallpaper.picker.individual.IndividualPickerFragment
    public final void onCategoryLoaded() {
        super.onCategoryLoaded();
        String str = this.mCategory.mCollectionId;
        if (str != null && str.contains("nexus_live_category")) {
            ImagePreviewFragment$$ExternalSyntheticLambda2 imagePreviewFragment$$ExternalSyntheticLambda2 = new ImagePreviewFragment$$ExternalSyntheticLambda2(this);
            this.mAppStatusListener = imagePreviewFragment$$ExternalSyntheticLambda2;
            ((DefaultPackageStatusNotifier) this.mPackageStatusNotifier).addListener(imagePreviewFragment$$ExternalSyntheticLambda2, "android.service.wallpaper.WallpaperService");
            ((DefaultPackageStatusNotifier) this.mPackageStatusNotifier).addListener(this.mAppStatusListener, "com.google.pixel.livewallpaper.action.DOWNLOAD_LIVE_WALLPAPER");
        }
    }

    /* loaded from: classes.dex */
    public static class UnlockAdditionalsHeaderHolder extends RecyclerView.ViewHolder {
        public UnlockAdditionalsHeaderHolder(View view) {
            super(view);
        }
    }
}
