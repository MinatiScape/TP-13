package com.android.customization.model.color;

import android.app.Activity;
import android.app.WallpaperColors;
import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.lifecycle.LifecycleOwner;
import androidx.lifecycle.Observer;
import androidx.recyclerview.widget.RecyclerView;
import androidx.viewpager2.widget.ViewPager2;
import com.android.customization.model.CustomizationManager;
import com.android.customization.model.theme.OverlayManagerCompat;
import com.android.customization.module.CustomizationInjector;
import com.android.customization.module.ThemesUserEventLogger;
import com.android.customization.picker.color.ColorSectionView;
import com.android.customization.picker.grid.GridFragment$2$$ExternalSyntheticLambda0;
import com.android.customization.widget.OptionSelectorController;
import com.android.systemui.shared.R;
import com.android.wallpaper.model.CustomizationSectionController;
import com.android.wallpaper.model.WallpaperColorsViewModel;
import com.android.wallpaper.module.InjectorProvider;
import com.android.wallpaper.util.DiskBasedLogger$$ExternalSyntheticLambda1;
import com.android.wallpaper.widget.SeparatedTabLayout;
import com.google.common.collect.FluentIterable;
import com.google.common.collect.Iterators;
import com.google.common.collect.Lists;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.BuildersKt;
/* loaded from: classes.dex */
public class ColorSectionController implements CustomizationSectionController<ColorSectionView> {
    public final ColorCustomizationManager mColorManager;
    public ColorSectionView mColorSectionView;
    public ViewPager2 mColorViewPager;
    public final ThemesUserEventLogger mEventLogger;
    public WallpaperColors mHomeWallpaperColors;
    public boolean mHomeWallpaperColorsReady;
    public final LifecycleOwner mLifecycleOwner;
    public WallpaperColors mLockWallpaperColors;
    public boolean mLockWallpaperColorsReady;
    public ColorOption mSelectedColor;
    public SeparatedTabLayout mTabLayout;
    public Optional<Integer> mTabPositionToRestore;
    public final WallpaperColorsViewModel mWallpaperColorsViewModel;
    public final ColorSectionAdapter mColorSectionAdapter = new ColorSectionAdapter(null);
    public final List<ColorOption> mWallpaperColorOptions = new ArrayList();
    public final List<ColorOption> mPresetColorOptions = new ArrayList();
    public long mLastColorApplyingTime = 0;

    /* renamed from: com.android.customization.model.color.ColorSectionController$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass1 implements CustomizationManager.OptionsFetchedListener<ColorOption> {
        public AnonymousClass1() {
        }

        @Override // com.android.customization.model.CustomizationManager.OptionsFetchedListener
        public void onError(Throwable th) {
            if (th != null) {
                Log.e("ColorSectionController", "Error loading theme bundles", th);
            }
        }

        @Override // com.android.customization.model.CustomizationManager.OptionsFetchedListener
        public void onOptionsLoaded(List<ColorOption> list) {
            ColorOption colorOption;
            ColorOption colorOption2;
            ColorSectionController.this.mWallpaperColorOptions.clear();
            ColorSectionController.this.mPresetColorOptions.clear();
            for (ColorOption colorOption3 : list) {
                if (colorOption3 instanceof ColorSeedOption) {
                    ColorSectionController.this.mWallpaperColorOptions.add(colorOption3);
                } else if (colorOption3 instanceof ColorBundle) {
                    ColorSectionController.this.mPresetColorOptions.add(colorOption3);
                }
            }
            ColorSectionController colorSectionController = ColorSectionController.this;
            List<ColorOption> list2 = colorSectionController.mWallpaperColorOptions;
            List<ColorOption> list3 = colorSectionController.mPresetColorOptions;
            Objects.requireNonNull(colorSectionController);
            final Iterable[] iterableArr = {list2, list3};
            for (int i = 0; i < 2; i++) {
                Objects.requireNonNull(iterableArr[i]);
            }
            Iterator it = Lists.newArrayList(new FluentIterable<?>() { // from class: com.google.common.collect.FluentIterable.3
                @Override // java.lang.Iterable
                public Iterator<?> iterator() {
                    return new Iterators.ConcatenatedIterator(new AbstractIndexedListIterator<Iterator<?>>(iterableArr.length) { // from class: com.google.common.collect.FluentIterable.3.1
                        {
                            AnonymousClass3.this = this;
                        }

                        @Override // com.google.common.collect.AbstractIndexedListIterator
                        public Iterator<?> get(int i2) {
                            return iterableArr[i2].iterator();
                        }
                    });
                }
            }).iterator();
            while (true) {
                if (!it.hasNext()) {
                    colorOption = null;
                    break;
                }
                colorOption = (ColorOption) it.next();
                if (colorOption.isActive(colorSectionController.mColorManager)) {
                    break;
                }
            }
            if (colorOption == null) {
                if (list2.isEmpty()) {
                    colorOption2 = list3.get(0);
                } else {
                    colorOption2 = list2.get(0);
                }
                colorOption = colorOption2;
            }
            colorSectionController.mSelectedColor = colorOption;
            ColorSectionController.this.mTabLayout.post(new DiskBasedLogger$$ExternalSyntheticLambda1(this));
        }
    }

    /* loaded from: classes.dex */
    public class ColorSectionAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {
        public final int mItemCounts = 2;

        /* loaded from: classes.dex */
        public class ColorOptionsViewHolder extends RecyclerView.ViewHolder {
            public ColorOptionsViewHolder(ColorSectionAdapter colorSectionAdapter, View view) {
                super(view);
            }
        }

        public ColorSectionAdapter(AnonymousClass1 r2) {
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public int getItemCount() {
            return this.mItemCounts;
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public int getItemViewType(int i) {
            return R.layout.color_options_view;
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public void onBindViewHolder(RecyclerView.ViewHolder viewHolder, int i) {
            View view = viewHolder.itemView;
            if (!(view instanceof RecyclerView)) {
                return;
            }
            if (i == 0) {
                ColorSectionController colorSectionController = ColorSectionController.this;
                OptionSelectorController<ColorOption> optionSelectorController = new OptionSelectorController<>((RecyclerView) view, colorSectionController.mWallpaperColorOptions, true, 2);
                optionSelectorController.initOptions(colorSectionController.mColorManager);
                colorSectionController.setUpColorOptionsController(optionSelectorController);
            } else if (i == 1) {
                ColorSectionController colorSectionController2 = ColorSectionController.this;
                OptionSelectorController<ColorOption> optionSelectorController2 = new OptionSelectorController<>((RecyclerView) view, colorSectionController2.mPresetColorOptions, true, 2);
                optionSelectorController2.initOptions(colorSectionController2.mColorManager);
                colorSectionController2.setUpColorOptionsController(optionSelectorController2);
            }
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
            return new ColorOptionsViewHolder(this, LayoutInflater.from(viewGroup.getContext()).inflate(i, viewGroup, false));
        }
    }

    public ColorSectionController(Activity activity, WallpaperColorsViewModel wallpaperColorsViewModel, LifecycleOwner lifecycleOwner, Bundle bundle) {
        this.mTabPositionToRestore = Optional.empty();
        this.mEventLogger = (ThemesUserEventLogger) ((CustomizationInjector) InjectorProvider.getInjector()).getUserEventLogger(activity);
        this.mColorManager = ColorCustomizationManager.getInstance(activity, new OverlayManagerCompat(activity));
        this.mWallpaperColorsViewModel = wallpaperColorsViewModel;
        this.mLifecycleOwner = lifecycleOwner;
        if (bundle != null && bundle.containsKey("COLOR_TAB_POSITION")) {
            this.mTabPositionToRestore = Optional.of(Integer.valueOf(bundle.getInt("COLOR_TAB_POSITION")));
        }
    }

    @Override // com.android.wallpaper.model.CustomizationSectionController
    public ColorSectionView createView(Context context) {
        ColorSectionView colorSectionView = (ColorSectionView) LayoutInflater.from(context).inflate(R.layout.color_section_view, (ViewGroup) null);
        this.mColorSectionView = colorSectionView;
        ViewPager2 viewPager2 = (ViewPager2) colorSectionView.findViewById(R.id.color_view_pager);
        this.mColorViewPager = viewPager2;
        ColorSectionAdapter colorSectionAdapter = this.mColorSectionAdapter;
        RecyclerView.Adapter<?> adapter = viewPager2.mRecyclerView.getAdapter();
        viewPager2.mAccessibilityProvider.onDetachAdapter(adapter);
        if (adapter != null) {
            adapter.mObservable.unregisterObserver(viewPager2.mCurrentItemDataSetChangeObserver);
        }
        viewPager2.mRecyclerView.setAdapter(colorSectionAdapter);
        viewPager2.mCurrentItem = 0;
        viewPager2.restorePendingState();
        viewPager2.mAccessibilityProvider.onAttachAdapter(colorSectionAdapter);
        if (colorSectionAdapter != null) {
            colorSectionAdapter.mObservable.registerObserver(viewPager2.mCurrentItemDataSetChangeObserver);
        }
        ViewPager2 viewPager22 = this.mColorViewPager;
        viewPager22.mUserInputEnabled = false;
        ((ViewPager2.PageAwareAccessibilityProvider) viewPager22.mAccessibilityProvider).updatePageAccessibilityActions();
        SeparatedTabLayout separatedTabLayout = (SeparatedTabLayout) this.mColorSectionView.findViewById(R.id.separated_tabs);
        this.mTabLayout = separatedTabLayout;
        ViewPager2 viewPager23 = this.mColorViewPager;
        Objects.requireNonNull(separatedTabLayout);
        viewPager23.mExternalPageChangeCallbacks.mCallbacks.add(new SeparatedTabLayout.SeparatedTabLayoutOnPageChangeCallback(separatedTabLayout, null));
        SeparatedTabLayout.SeparatedTabLayoutOnTabSelectedListener separatedTabLayoutOnTabSelectedListener = new SeparatedTabLayout.SeparatedTabLayoutOnTabSelectedListener(viewPager23, null);
        if (!separatedTabLayout.selectedListeners.contains(separatedTabLayoutOnTabSelectedListener)) {
            separatedTabLayout.selectedListeners.add(separatedTabLayoutOnTabSelectedListener);
        }
        this.mWallpaperColorsViewModel.getHomeWallpaperColors().observe(this.mLifecycleOwner, new Observer(this) { // from class: com.android.customization.model.color.ColorSectionController$$ExternalSyntheticLambda0
            public final /* synthetic */ ColorSectionController f$0;

            {
                this.f$0 = this;
            }

            @Override // androidx.lifecycle.Observer
            public final void onChanged(Object obj) {
                switch (r2) {
                    case 0:
                        ColorSectionController colorSectionController = this.f$0;
                        colorSectionController.mHomeWallpaperColors = (WallpaperColors) obj;
                        colorSectionController.mHomeWallpaperColorsReady = true;
                        colorSectionController.maybeLoadColors();
                        return;
                    default:
                        ColorSectionController colorSectionController2 = this.f$0;
                        colorSectionController2.mLockWallpaperColors = (WallpaperColors) obj;
                        colorSectionController2.mLockWallpaperColorsReady = true;
                        colorSectionController2.maybeLoadColors();
                        return;
                }
            }
        });
        this.mWallpaperColorsViewModel.getLockWallpaperColors().observe(this.mLifecycleOwner, new Observer(this) { // from class: com.android.customization.model.color.ColorSectionController$$ExternalSyntheticLambda0
            public final /* synthetic */ ColorSectionController f$0;

            {
                this.f$0 = this;
            }

            @Override // androidx.lifecycle.Observer
            public final void onChanged(Object obj) {
                switch (r2) {
                    case 0:
                        ColorSectionController colorSectionController = this.f$0;
                        colorSectionController.mHomeWallpaperColors = (WallpaperColors) obj;
                        colorSectionController.mHomeWallpaperColorsReady = true;
                        colorSectionController.maybeLoadColors();
                        return;
                    default:
                        ColorSectionController colorSectionController2 = this.f$0;
                        colorSectionController2.mLockWallpaperColors = (WallpaperColors) obj;
                        colorSectionController2.mLockWallpaperColorsReady = true;
                        colorSectionController2.maybeLoadColors();
                        return;
                }
            }
        });
        return this.mColorSectionView;
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0031  */
    /* JADX WARN: Removed duplicated region for block: B:28:? A[RETURN, SYNTHETIC] */
    @Override // com.android.wallpaper.model.CustomizationSectionController
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean isAvailable(android.content.Context r3) {
        /*
            r2 = this;
            r0 = 1
            r1 = 0
            if (r3 == 0) goto L37
            boolean r3 = com.android.customization.model.color.ColorUtils.isMonetEnabled(r3)
            if (r3 == 0) goto L37
            com.android.customization.model.color.ColorCustomizationManager r2 = r2.mColorManager
            com.android.customization.model.theme.OverlayManagerCompat r3 = r2.mOverlayManagerCompat
            android.content.om.OverlayManager r3 = r3.mOverlayManager
            if (r3 == 0) goto L14
            r3 = r0
            goto L15
        L14:
            r3 = r1
        L15:
            if (r3 == 0) goto L33
            com.android.customization.model.color.ColorOptionsProvider r2 = r2.mProvider
            com.android.customization.model.color.ColorProvider r2 = (com.android.customization.model.color.ColorProvider) r2
            boolean r3 = r2.monetEnabled
            if (r3 == 0) goto L2e
            android.content.res.Resources r3 = r2.mStubApkResources
            if (r3 == 0) goto L25
            r3 = r0
            goto L26
        L25:
            r3 = r1
        L26:
            if (r3 == 0) goto L2e
            boolean r2 = r2.colorsAvailable
            if (r2 == 0) goto L2e
            r2 = r0
            goto L2f
        L2e:
            r2 = r1
        L2f:
            if (r2 == 0) goto L33
            r2 = r0
            goto L34
        L33:
            r2 = r1
        L34:
            if (r2 == 0) goto L37
            goto L38
        L37:
            r0 = r1
        L38:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.customization.model.color.ColorSectionController.isAvailable(android.content.Context):boolean");
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void maybeLoadColors() {
        if (this.mHomeWallpaperColorsReady && this.mLockWallpaperColorsReady) {
            ColorCustomizationManager colorCustomizationManager = this.mColorManager;
            WallpaperColors wallpaperColors = this.mHomeWallpaperColors;
            WallpaperColors wallpaperColors2 = this.mLockWallpaperColors;
            colorCustomizationManager.mHomeWallpaperColors = wallpaperColors;
            colorCustomizationManager.mLockWallpaperColors = wallpaperColors2;
            AnonymousClass1 r10 = new AnonymousClass1();
            if (wallpaperColors2 != null && wallpaperColors2.equals(wallpaperColors)) {
                wallpaperColors2 = null;
            }
            WallpaperColors wallpaperColors3 = wallpaperColors2;
            ColorOptionsProvider colorOptionsProvider = colorCustomizationManager.mProvider;
            WallpaperColors wallpaperColors4 = colorCustomizationManager.mHomeWallpaperColors;
            ColorProvider colorProvider = (ColorProvider) colorOptionsProvider;
            boolean z = !Intrinsics.areEqual(colorProvider.homeWallpaperColors, wallpaperColors4) || !Intrinsics.areEqual(colorProvider.lockWallpaperColors, wallpaperColors3);
            if (z) {
                colorProvider.homeWallpaperColors = wallpaperColors4;
                colorProvider.lockWallpaperColors = wallpaperColors3;
            }
            List<? extends ColorOption> list = colorProvider.colorBundles;
            if (list == null || z) {
                BuildersKt.launch$default(colorProvider.scope, null, null, new ColorProvider$fetch$1(colorProvider, false, z, wallpaperColors4, wallpaperColors3, r10, null), 3, null);
            } else {
                r10.onOptionsLoaded(list);
            }
        }
    }

    @Override // com.android.wallpaper.model.CustomizationSectionController
    public void onSaveInstanceState(Bundle bundle) {
        ViewPager2 viewPager2 = this.mColorViewPager;
        if (viewPager2 != null) {
            bundle.putInt("COLOR_TAB_POSITION", viewPager2.mCurrentItem);
        }
    }

    public final void setUpColorOptionsController(OptionSelectorController<ColorOption> optionSelectorController) {
        ColorOption colorOption = this.mSelectedColor;
        if (colorOption != null && optionSelectorController.mOptions.contains(colorOption)) {
            optionSelectorController.setSelectedOption(this.mSelectedColor);
        }
        optionSelectorController.mListeners.add(new GridFragment$2$$ExternalSyntheticLambda0(this));
    }
}
