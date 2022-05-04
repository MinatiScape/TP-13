package com.android.customization.model.color;

import android.app.WallpaperColors;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.cardview.R$style;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentViewLifecycleOwner;
import androidx.lifecycle.LifecycleOwner;
import androidx.lifecycle.MutableLiveData;
import androidx.recyclerview.widget.RecyclerView;
import androidx.viewpager2.widget.ViewPager2;
import com.android.customization.model.CustomizationManager;
import com.android.customization.model.CustomizationOption;
import com.android.customization.model.theme.OverlayManagerCompat;
import com.android.customization.module.CustomizationInjector;
import com.android.customization.module.ThemesUserEventLogger;
import com.android.customization.picker.color.ColorSectionView;
import com.android.customization.widget.OptionSelectorController;
import com.android.systemui.shared.R;
import com.android.systemui.shared.plugins.PluginActionManager$$ExternalSyntheticLambda0;
import com.android.wallpaper.model.CustomizationSectionController;
import com.android.wallpaper.model.WallpaperColorsViewModel;
import com.android.wallpaper.picker.LivePreviewFragment$$ExternalSyntheticLambda6;
import com.android.wallpaper.picker.PreviewFragment$$ExternalSyntheticLambda7;
import com.android.wallpaper.util.WallpaperSurfaceCallback$$ExternalSyntheticLambda0;
import com.android.wallpaper.widget.PageIndicator;
import com.android.wallpaper.widget.SeparatedTabLayout;
import com.google.common.collect.FluentIterable;
import com.google.common.collect.Iterators;
import com.google.common.collect.Lists;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.BuildersKt;
/* loaded from: classes.dex */
public final class ColorSectionController implements CustomizationSectionController<ColorSectionView> {
    public final ColorCustomizationManager mColorManager;
    public ColorSectionView mColorSectionView;
    public ViewPager2 mColorSectionViewPager;
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
    public final ColorSectionAdapter mColorSectionAdapter = new ColorSectionAdapter();
    public final ArrayList mWallpaperColorOptions = new ArrayList();
    public final ArrayList mPresetColorOptions = new ArrayList();
    public long mLastColorApplyingTime = 0;

    /* renamed from: com.android.customization.model.color.ColorSectionController$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public final class AnonymousClass1 implements CustomizationManager.OptionsFetchedListener<ColorOption> {
        public AnonymousClass1() {
        }

        @Override // com.android.customization.model.CustomizationManager.OptionsFetchedListener
        public final void onError(Throwable th) {
            if (th != null) {
                Log.e("ColorSectionController", "Error loading theme bundles", th);
            }
        }

        @Override // com.android.customization.model.CustomizationManager.OptionsFetchedListener
        public final void onOptionsLoaded(List<ColorOption> list) {
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
            ArrayList arrayList = colorSectionController.mWallpaperColorOptions;
            ArrayList arrayList2 = colorSectionController.mPresetColorOptions;
            final Iterable[] iterableArr = {arrayList, arrayList2};
            for (int i = 0; i < 2; i++) {
                iterableArr[i].getClass();
            }
            Iterator it = Lists.newArrayList(new FluentIterable<Object>() { // from class: com.google.common.collect.FluentIterable.3
                /* JADX WARN: Type inference failed for: r0v0, types: [com.google.common.collect.FluentIterable$3$1] */
                @Override // java.lang.Iterable
                public final Iterator<Object> iterator() {
                    return new Iterators.ConcatenatedIterator(new AbstractIndexedListIterator<Iterator<Object>>(iterableArr.length) { // from class: com.google.common.collect.FluentIterable.3.1
                        {
                            AnonymousClass3.this = this;
                        }

                        @Override // com.google.common.collect.AbstractIndexedListIterator
                        public final Iterator<Object> get(int i2) {
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
                if (arrayList.isEmpty()) {
                    colorOption2 = (ColorOption) arrayList2.get(0);
                } else {
                    colorOption2 = (ColorOption) arrayList.get(0);
                }
                colorOption = colorOption2;
            }
            colorSectionController.mSelectedColor = colorOption;
            ColorSectionController.this.mTabLayout.post(new PreviewFragment$$ExternalSyntheticLambda7(this, 1));
        }
    }

    /* loaded from: classes.dex */
    public class ColorPageAdapter extends RecyclerView.Adapter<ColorOptionViewHolder> {
        public final List<ColorOption> mColorOptions;
        public final int mColorsPerPage;
        public final boolean mPageEnabled = true;

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public final int getItemViewType(int i) {
            return R.layout.color_options_view;
        }

        /* loaded from: classes.dex */
        public class ColorOptionViewHolder extends RecyclerView.ViewHolder {
            public RecyclerView mContainer;

            public ColorOptionViewHolder(View view) {
                super(view);
                this.mContainer = (RecyclerView) view.findViewById(R.id.color_option_container);
            }
        }

        public ColorPageAdapter(ArrayList arrayList, int i) {
            this.mColorOptions = arrayList;
            this.mColorsPerPage = i;
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public final int getItemCount() {
            if (!this.mPageEnabled) {
                return 1;
            }
            return (int) Math.ceil(this.mColorOptions.size() / this.mColorsPerPage);
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public final void onBindViewHolder(ColorOptionViewHolder colorOptionViewHolder, int i) {
            final ColorSectionController colorSectionController = ColorSectionController.this;
            RecyclerView recyclerView = colorOptionViewHolder.mContainer;
            List<ColorOption> list = this.mColorOptions;
            boolean z = this.mPageEnabled;
            int i2 = this.mColorsPerPage;
            colorSectionController.getClass();
            int size = list.size();
            if (size != 0) {
                if (z) {
                    list = list.subList(i2 * i, Math.min((i + 1) * i2, size));
                }
                OptionSelectorController optionSelectorController = new OptionSelectorController(recyclerView, list, true, 2);
                optionSelectorController.initOptions(colorSectionController.mColorManager);
                ColorOption colorOption = colorSectionController.mSelectedColor;
                if (colorOption != null && optionSelectorController.mOptions.contains(colorOption)) {
                    optionSelectorController.setSelectedOption(colorSectionController.mSelectedColor);
                }
                optionSelectorController.mListeners.add(new OptionSelectorController.OptionSelectedListener() { // from class: com.android.customization.model.color.ColorSectionController$$ExternalSyntheticLambda0
                    @Override // com.android.customization.widget.OptionSelectorController.OptionSelectedListener
                    public final void onOptionSelected(CustomizationOption customizationOption) {
                        ColorSectionController colorSectionController2 = ColorSectionController.this;
                        colorSectionController2.getClass();
                        ColorOption colorOption2 = (ColorOption) customizationOption;
                        if (!colorSectionController2.mSelectedColor.equals(colorOption2)) {
                            colorSectionController2.mSelectedColor = colorOption2;
                            new Handler().postDelayed(new PluginActionManager$$ExternalSyntheticLambda0(colorSectionController2, 1), 100L);
                        }
                    }
                });
            }
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public final RecyclerView.ViewHolder onCreateViewHolder(RecyclerView recyclerView, int i) {
            return new ColorOptionViewHolder(LayoutInflater.from(recyclerView.getContext()).inflate(i, (ViewGroup) recyclerView, false));
        }
    }

    /* loaded from: classes.dex */
    public class ColorSectionAdapter extends RecyclerView.Adapter<ColorPageViewHolder> {
        public final int mItemCounts = 2;
        public int mNumColors;

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public final int getItemViewType(int i) {
            return R.layout.color_pages_view;
        }

        /* loaded from: classes.dex */
        public class ColorPageViewHolder extends RecyclerView.ViewHolder {
            public ViewPager2 mContainer;
            public PageIndicator mPageIndicator;

            public ColorPageViewHolder(View view) {
                super(view);
                this.mContainer = (ViewPager2) view.findViewById(R.id.color_page_container);
                PageIndicator pageIndicator = (PageIndicator) view.findViewById(R.id.color_page_indicator);
                this.mPageIndicator = pageIndicator;
                pageIndicator.setVisibility(0);
            }
        }

        public ColorSectionAdapter() {
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public final void onBindViewHolder(ColorPageViewHolder colorPageViewHolder, int i) {
            ColorPageViewHolder colorPageViewHolder2 = colorPageViewHolder;
            if (i == 0) {
                ColorSectionController colorSectionController = ColorSectionController.this;
                ViewPager2 viewPager2 = colorPageViewHolder2.mContainer;
                int i2 = this.mNumColors;
                final PageIndicator pageIndicator = colorPageViewHolder2.mPageIndicator;
                viewPager2.setAdapter(new ColorPageAdapter(colorSectionController.mWallpaperColorOptions, i2));
                int indexOf = colorSectionController.mWallpaperColorOptions.indexOf(colorSectionController.mSelectedColor);
                if (indexOf >= 0 && i2 != 0) {
                    viewPager2.setCurrentItem(indexOf / i2, false);
                }
                pageIndicator.setNumPages((int) Math.ceil(colorSectionController.mWallpaperColorOptions.size() / i2));
                viewPager2.mExternalPageChangeCallbacks.mCallbacks.add(new ViewPager2.OnPageChangeCallback() { // from class: com.android.customization.model.color.ColorSectionController.2
                    @Override // androidx.viewpager2.widget.ViewPager2.OnPageChangeCallback
                    public final void onPageScrolled(int i3, float f, int i4) {
                        PageIndicator.this.setLocation(i3);
                    }

                    @Override // androidx.viewpager2.widget.ViewPager2.OnPageChangeCallback
                    public final void onPageSelected(int i3) {
                        PageIndicator.this.setLocation(i3);
                    }
                });
            } else if (i == 1) {
                ColorSectionController colorSectionController2 = ColorSectionController.this;
                ViewPager2 viewPager22 = colorPageViewHolder2.mContainer;
                int i3 = this.mNumColors;
                final PageIndicator pageIndicator2 = colorPageViewHolder2.mPageIndicator;
                viewPager22.setAdapter(new ColorPageAdapter(colorSectionController2.mPresetColorOptions, i3));
                int indexOf2 = colorSectionController2.mPresetColorOptions.indexOf(colorSectionController2.mSelectedColor);
                if (indexOf2 >= 0 && i3 != 0) {
                    viewPager22.setCurrentItem(indexOf2 / i3, false);
                }
                pageIndicator2.setNumPages((int) Math.ceil(colorSectionController2.mPresetColorOptions.size() / i3));
                viewPager22.mExternalPageChangeCallbacks.mCallbacks.add(new ViewPager2.OnPageChangeCallback() { // from class: com.android.customization.model.color.ColorSectionController.2
                    @Override // androidx.viewpager2.widget.ViewPager2.OnPageChangeCallback
                    public final void onPageScrolled(int i32, float f, int i4) {
                        PageIndicator.this.setLocation(i32);
                    }

                    @Override // androidx.viewpager2.widget.ViewPager2.OnPageChangeCallback
                    public final void onPageSelected(int i32) {
                        PageIndicator.this.setLocation(i32);
                    }
                });
            }
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public final RecyclerView.ViewHolder onCreateViewHolder(RecyclerView recyclerView, int i) {
            return new ColorPageViewHolder(LayoutInflater.from(recyclerView.getContext()).inflate(i, (ViewGroup) recyclerView, false));
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public final int getItemCount() {
            return this.mItemCounts;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0031  */
    /* JADX WARN: Removed duplicated region for block: B:28:? A[RETURN, SYNTHETIC] */
    @Override // com.android.wallpaper.model.CustomizationSectionController
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean isAvailable(android.content.Context r3) {
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
        WallpaperColors wallpaperColors;
        boolean z;
        if (this.mHomeWallpaperColorsReady && this.mLockWallpaperColorsReady) {
            ColorCustomizationManager colorCustomizationManager = this.mColorManager;
            WallpaperColors wallpaperColors2 = this.mHomeWallpaperColors;
            WallpaperColors wallpaperColors3 = this.mLockWallpaperColors;
            colorCustomizationManager.mHomeWallpaperColors = wallpaperColors2;
            colorCustomizationManager.mLockWallpaperColors = wallpaperColors3;
            AnonymousClass1 r9 = new AnonymousClass1();
            if (wallpaperColors3 == null || !wallpaperColors3.equals(wallpaperColors2)) {
                wallpaperColors = wallpaperColors3;
            } else {
                wallpaperColors = null;
            }
            ColorOptionsProvider colorOptionsProvider = colorCustomizationManager.mProvider;
            WallpaperColors wallpaperColors4 = colorCustomizationManager.mHomeWallpaperColors;
            ColorProvider colorProvider = (ColorProvider) colorOptionsProvider;
            if (!Intrinsics.areEqual(colorProvider.homeWallpaperColors, wallpaperColors4) || !Intrinsics.areEqual(colorProvider.lockWallpaperColors, wallpaperColors)) {
                z = true;
            } else {
                z = false;
            }
            boolean z2 = z;
            if (z2) {
                colorProvider.homeWallpaperColors = wallpaperColors4;
                colorProvider.lockWallpaperColors = wallpaperColors;
            }
            List<? extends ColorOption> list = colorProvider.colorBundles;
            if (list == null || z2) {
                BuildersKt.launch$default(colorProvider.scope, null, new ColorProvider$fetch$1(colorProvider, false, z2, wallpaperColors4, wallpaperColors, r9, null), 3);
            } else {
                r9.onOptionsLoaded(list);
            }
        }
    }

    @Override // com.android.wallpaper.model.CustomizationSectionController
    public final void onSaveInstanceState(Bundle bundle) {
        ViewPager2 viewPager2 = this.mColorSectionViewPager;
        if (viewPager2 != null) {
            bundle.putInt("COLOR_TAB_POSITION", viewPager2.mCurrentItem);
        }
    }

    public ColorSectionController(FragmentActivity fragmentActivity, WallpaperColorsViewModel wallpaperColorsViewModel, FragmentViewLifecycleOwner fragmentViewLifecycleOwner, Bundle bundle) {
        this.mTabPositionToRestore = Optional.empty();
        this.mEventLogger = ((CustomizationInjector) R$style.getInjector()).getUserEventLogger(fragmentActivity);
        this.mColorManager = ColorCustomizationManager.getInstance(fragmentActivity, new OverlayManagerCompat(fragmentActivity));
        this.mWallpaperColorsViewModel = wallpaperColorsViewModel;
        this.mLifecycleOwner = fragmentViewLifecycleOwner;
        if (bundle != null && bundle.containsKey("COLOR_TAB_POSITION")) {
            this.mTabPositionToRestore = Optional.of(Integer.valueOf(bundle.getInt("COLOR_TAB_POSITION")));
        }
    }

    @Override // com.android.wallpaper.model.CustomizationSectionController
    public final ColorSectionView createView(Context context) {
        ColorSectionView colorSectionView = (ColorSectionView) LayoutInflater.from(context).inflate(R.layout.color_section_view, (ViewGroup) null);
        this.mColorSectionView = colorSectionView;
        ViewPager2 viewPager2 = (ViewPager2) colorSectionView.findViewById(R.id.color_section_view_pager);
        this.mColorSectionViewPager = viewPager2;
        viewPager2.setAdapter(this.mColorSectionAdapter);
        ViewPager2 viewPager22 = this.mColorSectionViewPager;
        viewPager22.mUserInputEnabled = false;
        viewPager22.mAccessibilityProvider.updatePageAccessibilityActions();
        this.mColorSectionViewPager.setImportantForAccessibility(2);
        this.mTabLayout = (SeparatedTabLayout) this.mColorSectionView.findViewById(R.id.separated_tabs);
        this.mColorSectionAdapter.mNumColors = context.getResources().getInteger(R.integer.options_grid_num_columns);
        SeparatedTabLayout separatedTabLayout = this.mTabLayout;
        ViewPager2 viewPager23 = this.mColorSectionViewPager;
        separatedTabLayout.getClass();
        viewPager23.mExternalPageChangeCallbacks.mCallbacks.add(new SeparatedTabLayout.SeparatedTabLayoutOnPageChangeCallback(separatedTabLayout));
        separatedTabLayout.addOnTabSelectedListener(new SeparatedTabLayout.SeparatedTabLayoutOnTabSelectedListener(viewPager23));
        ((MutableLiveData) this.mWallpaperColorsViewModel.homeWallpaperColors$delegate.getValue()).observe(this.mLifecycleOwner, new LivePreviewFragment$$ExternalSyntheticLambda6(this));
        ((MutableLiveData) this.mWallpaperColorsViewModel.lockWallpaperColors$delegate.getValue()).observe(this.mLifecycleOwner, new WallpaperSurfaceCallback$$ExternalSyntheticLambda0(this));
        return this.mColorSectionView;
    }
}
