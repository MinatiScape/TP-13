package com.android.wallpaper.picker;

import android.app.Activity;
import android.app.WallpaperManager;
import android.content.Context;
import android.content.Intent;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.view.View;
import androidx.transition.R$id;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.module.ExploreIntentChecker;
import com.android.wallpaper.picker.SetWallpaperDialogFragment;
import com.android.wallpaper.picker.TopLevelPickerActivity;
import com.android.wallpaper.util.WallpaperConnection$$ExternalSyntheticLambda1;
import com.google.android.apps.wallpaper.picker.MicropaperPreviewFragmentGoogle;
import java.util.Objects;
/* loaded from: classes.dex */
public final /* synthetic */ class TopLevelPickerActivity$4$$ExternalSyntheticLambda0 implements ExploreIntentChecker.IntentReceiver, SetWallpaperDialogFragment.Listener {
    public final /* synthetic */ Object f$0;
    public final /* synthetic */ Object f$1;
    public final /* synthetic */ Object f$2;

    public /* synthetic */ TopLevelPickerActivity$4$$ExternalSyntheticLambda0(TopLevelPickerActivity.AnonymousClass4 r1, WallpaperInfo wallpaperInfo, Context context) {
        this.f$0 = r1;
        this.f$1 = wallpaperInfo;
        this.f$2 = context;
    }

    public /* synthetic */ TopLevelPickerActivity$4$$ExternalSyntheticLambda0(MicropaperPreviewFragmentGoogle micropaperPreviewFragmentGoogle, Activity activity, WallpaperManager wallpaperManager) {
        this.f$0 = micropaperPreviewFragmentGoogle;
        this.f$1 = activity;
        this.f$2 = wallpaperManager;
    }

    @Override // com.android.wallpaper.module.ExploreIntentChecker.IntentReceiver
    public void onIntentReceived(final Intent intent) {
        final TopLevelPickerActivity.AnonymousClass4 r0 = (TopLevelPickerActivity.AnonymousClass4) this.f$0;
        final WallpaperInfo wallpaperInfo = (WallpaperInfo) this.f$1;
        final Context context = (Context) this.f$2;
        Objects.requireNonNull(r0);
        if (intent != null && !TopLevelPickerActivity.this.isDestroyed()) {
            Drawable mutate = TopLevelPickerActivity.this.getResources().getDrawable(wallpaperInfo.getActionIconRes(context)).getConstantState().newDrawable().mutate();
            mutate.setColorFilter(R$id.getColorAttr(TopLevelPickerActivity.this, 16843829), PorterDuff.Mode.SRC_IN);
            TopLevelPickerActivity.this.mCurrentWallpaperExploreButton.setCompoundDrawablesRelativeWithIntrinsicBounds(mutate, (Drawable) null, (Drawable) null, (Drawable) null);
            TopLevelPickerActivity topLevelPickerActivity = TopLevelPickerActivity.this;
            topLevelPickerActivity.mCurrentWallpaperExploreButton.setText(topLevelPickerActivity.getString(wallpaperInfo.getActionLabelRes(context)));
            TopLevelPickerActivity.this.mCurrentWallpaperExploreButton.setVisibility(0);
            TopLevelPickerActivity.this.mCurrentWallpaperExploreButton.setOnClickListener(new View.OnClickListener() { // from class: com.android.wallpaper.picker.TopLevelPickerActivity.4.1
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                    TopLevelPickerActivity.this.mUserEventLogger.logActionClicked(wallpaperInfo.getCollectionId(context), wallpaperInfo.getActionLabelRes(context));
                    TopLevelPickerActivity.this.startActivity(intent);
                }
            });
        }
    }

    @Override // com.android.wallpaper.picker.SetWallpaperDialogFragment.Listener
    public void onSet(int i) {
        ((MicropaperPreviewFragmentGoogle) this.f$0).mSetWallpaperExecutor.execute(new WallpaperConnection$$ExternalSyntheticLambda1(i, (Activity) this.f$1, (WallpaperManager) this.f$2));
    }
}
