package com.android.wallpaper.picker;

import android.app.ActivityOptions;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RippleDrawable;
import android.util.Pair;
import android.view.View;
import android.view.animation.Interpolator;
import android.widget.Button;
import androidx.fragment.app.FragmentActivity;
import androidx.transition.R$id;
import com.android.systemui.shared.R;
import com.android.systemui.shared.system.QuickStepContract;
import com.android.wallpaper.model.LiveWallpaperInfo;
import com.android.wallpaper.model.WallpaperInfo;
import com.android.wallpaper.util.FullScreenAnimation;
import com.android.wallpaper.widget.BottomActionBar;
import kotlin.jvm.internal.Intrinsics;
/* loaded from: classes.dex */
public final /* synthetic */ class PreviewFragment$$ExternalSyntheticLambda1 implements View.OnClickListener {
    public final /* synthetic */ int $r8$classId;
    public final /* synthetic */ PreviewFragment f$0;

    public /* synthetic */ PreviewFragment$$ExternalSyntheticLambda1(PreviewFragment previewFragment, int i) {
        this.$r8$classId = i;
        if (i == 1 || i != 2) {
        }
        this.f$0 = previewFragment;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        ActivityInfo activityInfo;
        String str;
        int i;
        switch (this.$r8$classId) {
            case 0:
                PreviewFragment previewFragment = this.f$0;
                Interpolator interpolator = PreviewFragment.ALPHA_OUT;
                Context context = previewFragment.getContext();
                Intrinsics.checkNotNullParameter(context, "context");
                PackageManager packageManager = context.getPackageManager();
                Intent intent = new Intent("android.intent.action.SET_WALLPAPER").setPackage(context.getPackageName());
                Intrinsics.checkNotNullExpressionValue(intent, "Intent(ACTION_SET_WALLPAPER).setPackage(context.packageName)");
                Intent intent2 = new Intent("android.settings.SETTINGS_EMBED_DEEP_LINK_ACTIVITY");
                intent2.putExtra("android.provider.extra.SETTINGS_EMBEDDED_DEEP_LINK_HIGHLIGHT_MENU_KEY", "top_level_wallpaper");
                boolean z = true;
                intent2.putExtra("android.provider.extra.SETTINGS_EMBEDDED_DEEP_LINK_INTENT_URI", intent.toUri(1));
                ResolveInfo resolveActivity = packageManager.resolveActivity(intent2, QuickStepContract.SYSUI_STATE_ONE_HANDED_ACTIVE);
                Boolean bool = null;
                if (!(resolveActivity == null || (activityInfo = resolveActivity.activityInfo) == null)) {
                    bool = Boolean.valueOf(activityInfo.enabled);
                }
                if (bool != null) {
                    WallpaperInfo wallpaperInfo = previewFragment.mWallpaper;
                    if (wallpaperInfo != null) {
                        FragmentActivity activity = previewFragment.getActivity();
                        if (previewFragment.mLastSelectedTabPositionOptional.orElse(0).intValue() != 0) {
                            z = false;
                        }
                        int i2 = FullPreviewActivity.$r8$clinit;
                        Intent intent3 = new Intent(activity, FullPreviewActivity.class);
                        intent3.setFlags(268435456);
                        intent3.putExtra("com.android.wallpaper.picker.wallpaper_info", wallpaperInfo);
                        previewFragment.startActivity(intent3.putExtra("com.android.wallpaper.picker.view_as_home", z), ActivityOptions.makeSceneTransitionAnimation(previewFragment.getActivity(), new Pair[0]).toBundle());
                    }
                } else {
                    previewFragment.mFullScreenAnimation.startAnimation(true);
                }
                previewFragment.mBottomActionBar.deselectAction(BottomActionBar.BottomAction.EDIT);
                return;
            case 1:
                PreviewFragment previewFragment2 = this.f$0;
                boolean z2 = previewFragment2.mFullScreenAnimation.mWorkspaceVisibility;
                ((Button) view).setText(z2 ? R.string.show_ui_preview_text : R.string.hide_ui_preview_text);
                previewFragment2.mFullScreenAnimation.setWorkspaceVisibility(!z2);
                if (z2) {
                    str = previewFragment2.getString(R.string.hint_hide_ui_preview);
                } else {
                    str = previewFragment2.getString(R.string.hint_show_ui_preview);
                }
                view.announceForAccessibility(str);
                return;
            case 2:
                this.f$0.onSetWallpaperClicked(view);
                return;
            case 3:
                PreviewFragment previewFragment3 = this.f$0;
                FullScreenAnimation fullScreenAnimation = previewFragment3.mFullScreenAnimation;
                boolean z3 = fullScreenAnimation.mWorkspaceVisibility;
                fullScreenAnimation.setWorkspaceVisibility(!z3);
                Drawable drawable = ((LayerDrawable) ((RippleDrawable) view.findViewById(R.id.hide_ui_view).getBackground()).getDrawable(0)).getDrawable(0);
                if (!z3) {
                    i = R$id.getColorAttr(previewFragment3.getActivity(), 17956902);
                } else {
                    i = R$id.getColorAttr(previewFragment3.getActivity(), 17956900);
                }
                drawable.setTint(i);
                return;
            default:
                PreviewFragment previewFragment4 = this.f$0;
                previewFragment4.mWallpaperSetter.requestDestination(previewFragment4.getActivity(), previewFragment4.mFragmentManager, previewFragment4, previewFragment4.mWallpaper instanceof LiveWallpaperInfo);
                return;
        }
    }
}
