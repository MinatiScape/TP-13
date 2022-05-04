package com.android.wallpaper.picker;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.core.widget.NestedScrollView;
import androidx.fragment.app.BackStackRecord;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentManager;
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
import com.android.customization.picker.grid.GridFragment$$ExternalSyntheticLambda2;
import com.android.systemui.shared.R;
import com.android.wallpaper.model.CustomizationSectionController;
import com.android.wallpaper.model.PermissionRequester;
import com.android.wallpaper.model.WallpaperColorsViewModel;
import com.android.wallpaper.model.WallpaperPreviewNavigator;
import com.android.wallpaper.model.WallpaperSectionController;
import com.android.wallpaper.model.WorkspaceViewModel;
import com.android.wallpaper.module.CustomizationSections;
import com.android.wallpaper.module.GoogleCustomizationSections;
import com.android.wallpaper.module.InjectorProvider;
import com.android.wallpaper.module.WallpaperSetter$$ExternalSyntheticLambda1;
import com.android.wallpaper.util.ActivityUtils;
import com.android.wallpaper.widget.BottomActionBar$$ExternalSyntheticLambda4;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
/* loaded from: classes.dex */
public class CustomizationPickerFragment extends AppbarFragment implements CustomizationSectionController.CustomizationSectionNavigationController {
    public static final /* synthetic */ int $r8$clinit = 0;
    public Bundle mBackStackSavedInstanceState;
    public NestedScrollView mNestedScrollView;
    public final List<CustomizationSectionController<?>> mSectionControllers = new ArrayList();

    public List<CustomizationSectionController<?>> getAvailableSections(List<CustomizationSectionController<?>> list) {
        return (List) list.stream().filter(new GridFragment$$ExternalSyntheticLambda2(this)).collect(Collectors.toList());
    }

    @Override // com.android.wallpaper.picker.AppbarFragment
    public CharSequence getDefaultTitle() {
        return getString(R.string.app_name);
    }

    @Override // com.android.wallpaper.picker.AppbarFragment
    public int getToolbarColorId() {
        return 17170445;
    }

    @Override // com.android.wallpaper.picker.AppbarFragment
    public int getToolbarId() {
        return R.id.action_bar;
    }

    public void navigateTo(Fragment fragment) {
        FragmentManager supportFragmentManager = getActivity().getSupportFragmentManager();
        BackStackRecord backStackRecord = new BackStackRecord(supportFragmentManager);
        backStackRecord.replace(R.id.fragment_container, fragment);
        backStackRecord.addToBackStack(null);
        backStackRecord.commit();
        supportFragmentManager.executePendingTransactions();
    }

    @Override // com.android.wallpaper.picker.BottomActionBarFragment
    public boolean onBackPressed() {
        Intent intent = getActivity().getIntent();
        if (intent != null && intent.hasExtra(":settings:fragment_args_key")) {
            this.mSectionControllers.forEach(CustomizationPickerFragment$$ExternalSyntheticLambda1.INSTANCE);
        }
        return false;
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        Bundle bundle2;
        View inflate = layoutInflater.inflate(R.layout.collapsing_toolbar_base_layout, viewGroup, false);
        ViewGroup viewGroup2 = (ViewGroup) inflate.findViewById(R.id.content_frame);
        if (viewGroup2 != null) {
            viewGroup2.removeAllViews();
        }
        LayoutInflater.from(inflate.getContext()).inflate(R.layout.fragment_customization_picker, viewGroup2);
        setUpToolbar(inflate, ActivityUtils.isLaunchedFromSettingsRelated(getActivity().getIntent()));
        ViewGroup viewGroup3 = (ViewGroup) inflate.findViewById(R.id.section_container);
        viewGroup3.setOnApplyWindowInsetsListener(CustomizationPickerFragment$$ExternalSyntheticLambda0.INSTANCE);
        this.mNestedScrollView = (NestedScrollView) inflate.findViewById(R.id.scroll_container);
        Bundle bundle3 = this.mBackStackSavedInstanceState;
        if (bundle3 != null) {
            this.mBackStackSavedInstanceState = null;
            bundle2 = bundle3;
        } else {
            bundle2 = bundle;
        }
        this.mSectionControllers.forEach(CustomizationPickerFragment$$ExternalSyntheticLambda2.INSTANCE);
        this.mSectionControllers.clear();
        WallpaperColorsViewModel wallpaperColorsViewModel = (WallpaperColorsViewModel) new ViewModelProvider(getActivity()).get(WallpaperColorsViewModel.class);
        WorkspaceViewModel workspaceViewModel = (WorkspaceViewModel) new ViewModelProvider(getActivity()).get(WorkspaceViewModel.class);
        CustomizationSections customizationSections = InjectorProvider.getInjector().getCustomizationSections();
        FragmentActivity activity = getActivity();
        FragmentViewLifecycleOwner fragmentViewLifecycleOwner = this.mViewLifecycleOwner;
        if (fragmentViewLifecycleOwner != null) {
            Objects.requireNonNull((GoogleCustomizationSections) customizationSections);
            ArrayList arrayList = new ArrayList();
            arrayList.add(new WallpaperSectionController(activity, fragmentViewLifecycleOwner, (PermissionRequester) getActivity(), wallpaperColorsViewModel, workspaceViewModel, this, (WallpaperPreviewNavigator) getActivity(), bundle2));
            arrayList.add(new ColorSectionController(activity, wallpaperColorsViewModel, fragmentViewLifecycleOwner, bundle2));
            arrayList.add(new DarkModeSectionController(activity, fragmentViewLifecycleOwner.getLifecycle()));
            if (ThemedIconSwitchProvider.sThemedIconSwitchProvider == null) {
                Context applicationContext = activity.getApplicationContext();
                ThemedIconSwitchProvider.sThemedIconSwitchProvider = new ThemedIconSwitchProvider(applicationContext.getContentResolver(), new ThemedIconUtils(applicationContext, applicationContext.getString(R.string.themed_icon_metadata_key)), (CustomizationPreferences) InjectorProvider.getInjector().getPreferences(applicationContext));
            }
            arrayList.add(new ThemedIconSectionController(ThemedIconSwitchProvider.sThemedIconSwitchProvider, workspaceViewModel, bundle2));
            arrayList.add(new GridSectionController(GridOptionsManager.getInstance(activity), this));
            this.mSectionControllers.addAll(getAvailableSections(arrayList));
            this.mSectionControllers.forEach(new WallpaperSetter$$ExternalSyntheticLambda1(this, viewGroup3));
            this.mNestedScrollView.post(new ImagePreviewFragment$4$$ExternalSyntheticLambda0(this, bundle2));
            return inflate;
        }
        throw new IllegalStateException("Can't access the Fragment View's LifecycleOwner when getView() is null i.e., before onCreateView() or after onDestroyView()");
    }

    @Override // androidx.fragment.app.Fragment
    public void onDestroyView() {
        Bundle bundle = new Bundle();
        this.mBackStackSavedInstanceState = bundle;
        onSaveInstanceStateInternal(bundle);
        this.mSectionControllers.forEach(CustomizationPickerFragment$$ExternalSyntheticLambda2.INSTANCE);
        this.mSectionControllers.clear();
        this.mCalled = true;
    }

    @Override // androidx.fragment.app.Fragment
    public void onSaveInstanceState(Bundle bundle) {
        onSaveInstanceStateInternal(bundle);
    }

    public final void onSaveInstanceStateInternal(Bundle bundle) {
        NestedScrollView nestedScrollView = this.mNestedScrollView;
        if (nestedScrollView != null) {
            bundle.putInt("SCROLL_POSITION_Y", nestedScrollView.getScrollY());
        }
        this.mSectionControllers.forEach(new BottomActionBar$$ExternalSyntheticLambda4(bundle));
    }
}
