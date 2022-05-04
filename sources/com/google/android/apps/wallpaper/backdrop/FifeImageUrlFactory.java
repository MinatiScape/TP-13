package com.google.android.apps.wallpaper.backdrop;

import android.content.Context;
import android.graphics.Point;
import android.net.Uri;
import android.util.Log;
import android.view.WindowManager;
import androidx.cardview.R$style;
import com.android.wallpaper.util.DiskBasedLogger;
import com.android.wallpaper.util.ScreenSizeCalculator;
import com.android.wallpaper.util.WallpaperCropUtils;
import com.google.android.libraries.imageurl.FifeImageUrlUtil;
/* loaded from: classes.dex */
public final class FifeImageUrlFactory {
    public static FifeImageUrlFactory sInstance;
    public FifeImageUrlUtil mFifeImageUrlUtil = new FifeImageUrlUtil();

    public static int calculateAndAddSize(Context context, FifeImageUrlUtil.Options options) {
        Point screenSize = ScreenSizeCalculator.getInstance().getScreenSize(((WindowManager) context.getSystemService("window")).getDefaultDisplay());
        int max = (int) (Math.max(screenSize.x, screenSize.y) * 1.5d);
        options.setSize(max);
        options.setQualityLevel();
        return max;
    }

    public static Uri createDesktopUri(Context context, String str) {
        Point screenSize = ScreenSizeCalculator.getInstance().getScreenSize(((WindowManager) context.getSystemService("window")).getDefaultDisplay());
        Uri parse = Uri.parse(str);
        FifeImageUrlUtil fifeImageUrlUtil = new FifeImageUrlUtil();
        if (FifeImageUrlUtil.isFifeHostedUri(parse)) {
            FifeImageUrlUtil.Options options = new FifeImageUrlUtil.Options();
            options.setWidth(screenSize.x);
            options.setHeight(screenSize.y);
            options.setCenterCrop();
            try {
                return fifeImageUrlUtil.mergeOptions(options, parse);
            } catch (FifeImageUrlUtil.InvalidUrlException unused) {
                DiskBasedLogger.e("FifeImageUrlFactory", "Unable to merge FIFE URL options for size " + screenSize + " on URL " + str, context);
            }
        }
        return parse;
    }

    public static Uri createRotatingWallpaperUri(Context context, String str) {
        Point defaultCropSurfaceSize = WallpaperCropUtils.getDefaultCropSurfaceSize(context.getResources(), ((WindowManager) context.getSystemService("window")).getDefaultDisplay());
        Uri parse = Uri.parse(str);
        FifeImageUrlUtil fifeImageUrlUtil = new FifeImageUrlUtil();
        if (FifeImageUrlUtil.isFifeHostedUri(parse)) {
            FifeImageUrlUtil.Options options = new FifeImageUrlUtil.Options();
            calculateAndAddSize(context, options);
            try {
                return fifeImageUrlUtil.mergeOptions(options, parse);
            } catch (FifeImageUrlUtil.InvalidUrlException unused) {
                DiskBasedLogger.e("FifeImageUrlFactory", "Unable to merge FIFE URL options for size " + defaultCropSurfaceSize + " on URL " + str, context);
            }
        }
        return parse;
    }

    public final Uri createFullSizedUri(Context context, String str) {
        Uri parse = Uri.parse(str);
        this.mFifeImageUrlUtil.getClass();
        if (FifeImageUrlUtil.isFifeHostedUri(parse)) {
            FifeImageUrlUtil.Options options = new FifeImageUrlUtil.Options();
            int calculateAndAddSize = calculateAndAddSize(context, options);
            try {
                return this.mFifeImageUrlUtil.mergeOptions(options, parse);
            } catch (FifeImageUrlUtil.InvalidUrlException unused) {
                DiskBasedLogger.e("FifeImageUrlFactory", "Unable to merge FIFE URL options for size " + calculateAndAddSize + " on URL " + str, context);
            }
        }
        return Uri.parse(str);
    }

    public final Uri createThumbUri(Context context, String str) {
        Uri parse = Uri.parse(str);
        this.mFifeImageUrlUtil.getClass();
        if (FifeImageUrlUtil.isFifeHostedUri(parse)) {
            FifeImageUrlUtil.Options options = new FifeImageUrlUtil.Options();
            Point suggestedThumbnailSize = R$style.getSuggestedThumbnailSize(context);
            int max = Math.max(suggestedThumbnailSize.x, suggestedThumbnailSize.y);
            options.setSize(max);
            options.setQualityBucket();
            try {
                return this.mFifeImageUrlUtil.mergeOptions(options, parse);
            } catch (FifeImageUrlUtil.InvalidUrlException unused) {
                DiskBasedLogger.e("FifeImageUrlFactory", "Unable to merge FIFE URL options for size " + max + " on URL " + str, context);
            }
        }
        return Uri.parse(str);
    }

    public final Uri createTinyUri(String str) {
        Uri parse = Uri.parse(str);
        this.mFifeImageUrlUtil.getClass();
        if (FifeImageUrlUtil.isFifeHostedUri(parse)) {
            FifeImageUrlUtil.Options options = new FifeImageUrlUtil.Options();
            options.setSize(50);
            options.setQualityBucket();
            try {
                return this.mFifeImageUrlUtil.mergeOptions(options, parse);
            } catch (FifeImageUrlUtil.InvalidUrlException unused) {
                Log.e("FifeImageUrlFactory", "Unable to merge FIFE URL options for size 50 on URL " + str);
            }
        }
        return Uri.parse(str);
    }
}
