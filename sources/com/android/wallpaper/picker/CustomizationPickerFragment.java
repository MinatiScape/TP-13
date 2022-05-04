package com.android.wallpaper.picker;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.cardview.R$style;
import androidx.core.widget.NestedScrollView;
import androidx.fragment.app.BackStackRecord;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentManagerImpl;
import androidx.fragment.app.FragmentViewLifecycleOwner;
import androidx.lifecycle.ViewModelProvider;
import com.android.customization.model.color.ColorSectionController;
import com.android.customization.model.grid.GridOptionsManager;
import com.android.customization.model.grid.GridSectionController;
import com.android.customization.model.mode.DarkModeSectionController;
import com.android.customization.model.themedicon.ThemedIconSectionController;
import com.android.customization.model.themedicon.ThemedIconSwitchProvider;
import com.android.customization.model.themedicon.ThemedIconUtils;
import com.android.customization.module.CustomizationPreferences;
import com.android.systemui.shared.R;
import com.android.wallpaper.asset.StreamableAsset$$ExternalSyntheticLambda1;
import com.android.wallpaper.model.CustomizationSectionController;
import com.android.wallpaper.model.PermissionRequester;
import com.android.wallpaper.model.WallpaperColorsViewModel;
import com.android.wallpaper.model.WallpaperPreviewNavigator;
import com.android.wallpaper.model.WallpaperSectionController;
import com.android.wallpaper.model.WorkspaceViewModel;
import com.android.wallpaper.module.CustomizationSections;
import com.android.wallpaper.module.GoogleCustomizationSections;
import com.android.wallpaper.util.ActivityUtils;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;
import java.util.function.Predicate;
import java.util.stream.Collectors;
/* loaded from: classes.dex */
public class CustomizationPickerFragment extends AppbarFragment implements CustomizationSectionController.CustomizationSectionNavigationController {
    public static final /* synthetic */ int $r8$clinit = 0;
    public Bundle mBackStackSavedInstanceState;
    public NestedScrollView mNestedScrollView;
    public final ArrayList mSectionControllers = new ArrayList();

    @Override // com.android.wallpaper.picker.AppbarFragment
    public final int getToolbarColorId() {
        return 17170445;
    }

    @Override // com.android.wallpaper.picker.AppbarFragment
    public final int getToolbarId() {
        return R.id.action_bar;
    }

    @Override // androidx.fragment.app.Fragment
    public final View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        Bundle bundle2;
        View inflate = layoutInflater.inflate(R.layout.collapsing_toolbar_container_layout, viewGroup, false);
        ViewGroup viewGroup2 = (ViewGroup) inflate.findViewById(R.id.content_frame);
        if (viewGroup2 != null) {
            viewGroup2.removeAllViews();
        }
        LayoutInflater.from(inflate.getContext()).inflate(R.layout.fragment_customization_picker, viewGroup2);
        setUpToolbar(inflate, ActivityUtils.isLaunchedFromSettingsRelated(getActivity().getIntent()));
        final ViewGroup viewGroup3 = (ViewGroup) inflate.findViewById(R.id.section_container);
        viewGroup3.setOnApplyWindowInsetsListener(CustomizationPickerFragment$$ExternalSyntheticLambda0.INSTANCE);
        this.mNestedScrollView = (NestedScrollView) inflate.findViewById(R.id.scroll_container);
        Bundle bundle3 = this.mBackStackSavedInstanceState;
        if (bundle3 != null) {
            this.mBackStackSavedInstanceState = null;
            bundle2 = bundle3;
        } else {
            bundle2 = bundle;
        }
        this.mSectionControllers.forEach(CustomizationPickerFragment$$ExternalSyntheticLambda6.INSTANCE);
        this.mSectionControllers.clear();
        WallpaperColorsViewModel wallpaperColorsViewModel = (WallpaperColorsViewModel) new ViewModelProvider(getActivity()).get(WallpaperColorsViewModel.class);
        WorkspaceViewModel workspaceViewModel = (WorkspaceViewModel) new ViewModelProvider(getActivity()).get(WorkspaceViewModel.class);
        CustomizationSections customizationSections = R$style.getInjector().getCustomizationSections();
        FragmentActivity activity = getActivity();
        FragmentViewLifecycleOwner fragmentViewLifecycleOwner = this.mViewLifecycleOwner;
        if (fragmentViewLifecycleOwner != null) {
            ((GoogleCustomizationSections) customizationSections).getClass();
            ArrayList arrayList = new ArrayList();
            arrayList.add(new WallpaperSectionController(activity, fragmentViewLifecycleOwner, (PermissionRequester) getActivity(), wallpaperColorsViewModel, workspaceViewModel, this, (WallpaperPreviewNavigator) getActivity(), bundle2));
            arrayList.add(new ColorSectionController(activity, wallpaperColorsViewModel, fragmentViewLifecycleOwner, bundle2));
            fragmentViewLifecycleOwner.initialize();
            arrayList.add(new DarkModeSectionController(activity, fragmentViewLifecycleOwner.mLifecycleRegistry));
            if (ThemedIconSwitchProvider.sThemedIconSwitchProvider == null) {
                Context applicationContext = activity.getApplicationContext();
                ThemedIconSwitchProvider.sThemedIconSwitchProvider = new ThemedIconSwitchProvider(applicationContext.getContentResolver(), new ThemedIconUtils(applicationContext, applicationContext.getString(R.string.themed_icon_metadata_key)), (CustomizationPreferences) R$style.getInjector().getPreferences(applicationContext));
            }
            arrayList.add(new ThemedIconSectionController(ThemedIconSwitchProvider.sThemedIconSwitchProvider, workspaceViewModel, bundle2));
            arrayList.add(new GridSectionController(GridOptionsManager.getInstance(activity), this));
            this.mSectionControllers.addAll(getAvailableSections(arrayList));
            this.mSectionControllers.forEach(new Consumer() { // from class: com.android.wallpaper.picker.CustomizationPickerFragment$$ExternalSyntheticLambda4
                @Override // java.util.function.Consumer
                public final void accept(Object obj) {
                    final CustomizationPickerFragment customizationPickerFragment = CustomizationPickerFragment.this;
                    final ViewGroup viewGroup4 = viewGroup3;
                    final CustomizationSectionController customizationSectionController = (CustomizationSectionController) obj;
                    customizationPickerFragment.mNestedScrollView.post(new Runnable() { // from class: com.android.wallpaper.picker.CustomizationPickerFragment$$ExternalSyntheticLambda2
                        @Override // java.lang.Runnable
                        public final void run() {
                            CustomizationPickerFragment customizationPickerFragment2 = CustomizationPickerFragment.this;
                            ViewGroup viewGroup5 = viewGroup4;
                            CustomizationSectionController customizationSectionController2 = customizationSectionController;
                            int i = CustomizationPickerFragment.$r8$clinit;
                            Context context = customizationPickerFragment2.getContext();
                            if (context == null) {
                                Log.w("CustomizationPickerFragment", "Adding section views with null context");
                            } else {
                                viewGroup5.addView(customizationSectionController2.createView(context));
                            }
                        }
                    });
                }
            });
            this.mNestedScrollView.post(new StreamableAsset$$ExternalSyntheticLambda1(this, bundle2, 1));
            return inflate;
        }
        throw new IllegalStateException("Can't access the Fragment View's LifecycleOwner when getView() is null i.e., before onCreateView() or after onDestroyView()");
    }

    @Override // androidx.fragment.app.Fragment
    public final void onDestroyView() {
        Bundle bundle = new Bundle();
        this.mBackStackSavedInstanceState = bundle;
        NestedScrollView nestedScrollView = this.mNestedScrollView;
        if (nestedScrollView != null) {
            bundle.putInt("SCROLL_POSITION_Y", nestedScrollView.getScrollY());
        }
        this.mSectionControllers.forEach(new CustomizationPickerFragment$$ExternalSyntheticLambda3(bundle));
        this.mSectionControllers.forEach(CustomizationPickerFragment$$ExternalSyntheticLambda6.INSTANCE);
        this.mSectionControllers.clear();
        this.mCalled = true;
    }

    @Override // androidx.fragment.app.Fragment
    public final void onSaveInstanceState(Bundle bundle) {
        NestedScrollView nestedScrollView = this.mNestedScrollView;
        if (nestedScrollView != null) {
            bundle.putInt("SCROLL_POSITION_Y", nestedScrollView.getScrollY());
        }
        this.mSectionControllers.forEach(new CustomizationPickerFragment$$ExternalSyntheticLambda3(bundle));
    }

    public List<CustomizationSectionController<?>> getAvailableSections(List<CustomizationSectionController<?>> list) {
        return (List) list.stream().filter(new Predicate() { // from class: com.android.wallpaper.picker.CustomizationPickerFragment$$ExternalSyntheticLambda7
            @Override // java.util.function.Predicate
            public final boolean test(Object obj) {
                CustomizationPickerFragment customizationPickerFragment = CustomizationPickerFragment.this;
                CustomizationSectionController customizationSectionController = (CustomizationSectionController) obj;
                int i = CustomizationPickerFragment.$r8$clinit;
                if (customizationSectionController.isAvailable(customizationPickerFragment.getContext())) {
                    return true;
                }
                customizationSectionController.release();
                Log.d("CustomizationPickerFragment", "Section is not available: " + customizationSectionController);
                return false;
            }
        }).collect(Collectors.toList());
    }

    @Override // com.android.wallpaper.picker.AppbarFragment
    public CharSequence getDefaultTitle() {
        return getString(R.string.app_name);
    }

    public final void navigateTo(AppbarFragment appbarFragment) {
        FragmentManagerImpl supportFragmentManager = getActivity().getSupportFragmentManager();
        supportFragmentManager.getClass();
        BackStackRecord backStackRecord = new BackStackRecord(supportFragmentManager);
        backStackRecord.replace(R.id.fragment_container, appbarFragment);
        if (backStackRecord.mAllowAddToBackStack) {
            backStackRecord.mAddToBackStack = true;
            backStackRecord.mName = null;
            backStackRecord.commit();
            supportFragmentManager.execPendingActions(true);
            supportFragmentManager.forcePostponedTransactions();
            return;
        }
        throw new IllegalStateException("This FragmentTransaction is not allowed to be added to the back stack.");
    }

    @Override // com.android.wallpaper.picker.BottomActionBarFragment
    public final boolean onBackPressed() {
        boolean z;
        Intent intent = getActivity().getIntent();
        if (intent == null || !intent.hasExtra(":settings:fragment_args_key")) {
            z = false;
        } else {
            z = true;
        }
        if (z) {
            this.mSectionControllers.forEach(CustomizationPickerFragment$$ExternalSyntheticLambda5.INSTANCE);
        }
        return false;
    }
}
