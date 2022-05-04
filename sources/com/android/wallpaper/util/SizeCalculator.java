package com.android.wallpaper.util;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.Point;
import android.util.TypedValue;
import android.view.Display;
import android.view.View;
import android.view.WindowManager;
import androidx.core.graphics.ColorUtils;
import com.android.systemui.shared.R;
import com.android.systemui.shared.system.QuickStepContract;
import com.android.wallpaper.module.InjectorProvider;
import com.google.android.gms.internal.zzfit;
import com.google.android.material.resources.MaterialAttributes;
import java.util.Objects;
/* loaded from: classes.dex */
public class SizeCalculator {
    public static int getActivityWindowWidthPx(Activity activity) {
        Display defaultDisplay = activity.getWindowManager().getDefaultDisplay();
        Point point = new Point();
        defaultDisplay.getSize(point);
        return point.x;
    }

    public static int getColor(View view, int i) {
        return MaterialAttributes.resolveOrThrow(view.getContext(), i, view.getClass().getCanonicalName());
    }

    public static Point getFeaturedCategoryTileSize(Activity activity) {
        Resources resources = activity.getResources();
        int activityWindowWidthPx = getActivityWindowWidthPx(activity);
        return getSquareTileSize(getNumColumns(activity, activityWindowWidthPx, 2, 2), activityWindowWidthPx, resources.getDimensionPixelSize(R.dimen.grid_item_category_padding_horizontal), resources.getDimensionPixelSize(R.dimen.category_grid_edge_space));
    }

    public static int getNumColumns(Context context, int i, int i2, int i3) {
        return ((int) (((float) i) / zzfit.getInstance().getDisplayMetrics(context.getResources(), ((WindowManager) context.getSystemService("window")).getDefaultDisplay()).density)) < 732 ? i2 : i3;
    }

    public static float getPreviewCornerRadius(Activity activity, int i) {
        return QuickStepContract.getWindowCornerRadius(activity) / (ScreenSizeCalculator.getInstance().getScreenSize(activity.getWindowManager().getDefaultDisplay()).x / i);
    }

    public static Point getSquareTileSize(int i, int i2, int i3, int i4) {
        int round = Math.round(((i2 - ((i3 * 2) * i)) - (i4 * 2)) / i);
        return new Point(round, round);
    }

    public static Point getSuggestedThumbnailSize(Context context) {
        Display defaultDisplay = ((WindowManager) context.getSystemService("window")).getDefaultDisplay();
        Point point = new Point();
        defaultDisplay.getSize(point);
        int i = point.x;
        int numColumns = getNumColumns(context, i, 3, 4);
        ScreenSizeCalculator.getInstance().getScreenSize(((WindowManager) context.getSystemService("window")).getDefaultDisplay());
        Objects.requireNonNull(InjectorProvider.getInjector().getFormFactorChecker(context));
        Resources resources = context.getResources();
        float dimensionPixelSize = (i - ((numColumns + 1) * resources.getDimensionPixelSize(R.dimen.grid_padding))) / numColumns;
        return new Point(Math.round(dimensionPixelSize), Math.round((dimensionPixelSize * resources.getDimensionPixelSize(R.dimen.grid_tile_aspect_height)) / resources.getDimensionPixelSize(R.dimen.grid_tile_aspect_width)));
    }

    public static int layer(int i, int i2, float f) {
        return ColorUtils.compositeColors(ColorUtils.setAlphaComponent(i2, Math.round(Color.alpha(i2) * f)), i);
    }

    public static int getColor(Context context, int i, int i2) {
        TypedValue resolve = MaterialAttributes.resolve(context, i);
        return resolve != null ? resolve.data : i2;
    }
}
