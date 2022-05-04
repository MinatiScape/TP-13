package com.android.customization.model.grid;

import android.content.Context;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.android.customization.model.CustomizationManager;
import com.android.customization.picker.grid.GridFragment;
import com.android.customization.picker.grid.GridSectionView;
import com.android.systemui.shared.R;
import com.android.wallpaper.model.CustomizationSectionController;
import com.android.wallpaper.picker.CustomizationPickerFragment;
import java.util.List;
import java.util.function.Predicate;
/* loaded from: classes.dex */
public final class GridSectionController implements CustomizationSectionController<GridSectionView> {
    public final GridOptionsManager mGridOptionsManager;
    public final CustomizationSectionController.CustomizationSectionNavigationController mSectionNavigationController;

    @Override // com.android.wallpaper.model.CustomizationSectionController
    public final boolean isAvailable(Context context) {
        if (this.mGridOptionsManager.mProvider.mPreviewUtils.mProviderInfo != null) {
            return true;
        }
        return false;
    }

    public GridSectionController(GridOptionsManager gridOptionsManager, CustomizationSectionController.CustomizationSectionNavigationController customizationSectionNavigationController) {
        this.mGridOptionsManager = gridOptionsManager;
        this.mSectionNavigationController = customizationSectionNavigationController;
    }

    @Override // com.android.wallpaper.model.CustomizationSectionController
    public final GridSectionView createView(Context context) {
        GridSectionView gridSectionView = (GridSectionView) LayoutInflater.from(context).inflate(R.layout.grid_section_view, (ViewGroup) null);
        final TextView textView = (TextView) gridSectionView.findViewById(R.id.grid_section_description);
        final View findViewById = gridSectionView.findViewById(R.id.grid_section_tile);
        GridOptionsManager gridOptionsManager = this.mGridOptionsManager;
        CustomizationManager.OptionsFetchedListener<GridOption> optionsFetchedListener = new CustomizationManager.OptionsFetchedListener<GridOption>() { // from class: com.android.customization.model.grid.GridSectionController.1
            @Override // com.android.customization.model.CustomizationManager.OptionsFetchedListener
            public final void onError(Throwable th) {
                if (th != null) {
                    Log.e("GridSectionController", "Error loading grid options", th);
                }
                textView.setText(R.string.something_went_wrong);
                findViewById.setVisibility(8);
            }

            @Override // com.android.customization.model.CustomizationManager.OptionsFetchedListener
            public final void onOptionsLoaded(List<GridOption> list) {
                TextView textView2 = textView;
                final GridSectionController gridSectionController = GridSectionController.this;
                gridSectionController.getClass();
                textView2.setText(list.stream().filter(new Predicate() { // from class: com.android.customization.model.grid.GridSectionController$$ExternalSyntheticLambda1
                    @Override // java.util.function.Predicate
                    public final boolean test(Object obj) {
                        GridSectionController.this.getClass();
                        return ((GridOption) obj).mIsCurrent;
                    }
                }).findAny().orElse(list.get(0)).mTitle);
            }
        };
        gridOptionsManager.getClass();
        GridOptionsManager.sExecutorService.submit(new GridOptionsManager$$ExternalSyntheticLambda1(gridOptionsManager, optionsFetchedListener));
        gridSectionView.setOnClickListener(new View.OnClickListener() { // from class: com.android.customization.model.grid.GridSectionController$$ExternalSyntheticLambda0
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                ((CustomizationPickerFragment) GridSectionController.this.mSectionNavigationController).navigateTo(new GridFragment());
            }
        });
        return gridSectionView;
    }
}
