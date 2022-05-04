package com.android.wallpaper.util;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Point;
import android.support.media.ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;
import android.util.Log;
import android.view.Display;
import android.view.WindowManager;
/* loaded from: classes.dex */
public class ScreenSizeCalculator {
    public static ScreenSizeCalculator sInstance;
    public Point mLandscapeScreenSize;
    public Point mPortraitScreenSize;

    public static ScreenSizeCalculator getInstance() {
        if (sInstance == null) {
            sInstance = new ScreenSizeCalculator();
        }
        return sInstance;
    }

    public final Point getPortraitScreenSize(Display display) {
        if (this.mPortraitScreenSize == null) {
            this.mPortraitScreenSize = new Point();
        }
        display.getRealSize(this.mPortraitScreenSize);
        return new Point(this.mPortraitScreenSize);
    }

    public float getScreenAspectRatio(Context context) {
        Point screenSize = getScreenSize(((WindowManager) context.getSystemService(WindowManager.class)).getDefaultDisplay());
        return screenSize.y / screenSize.x;
    }

    public Point getScreenSize(Display display) {
        int i = Resources.getSystem().getConfiguration().orientation;
        if (i == 1) {
            return getPortraitScreenSize(display);
        }
        if (i != 2) {
            StringBuilder m = ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0.m("Unknown device orientation: ");
            m.append(Resources.getSystem().getConfiguration().orientation);
            Log.e("ScreenSizeCalculator", m.toString());
            return getPortraitScreenSize(display);
        }
        if (this.mLandscapeScreenSize == null) {
            this.mLandscapeScreenSize = new Point();
        }
        display.getRealSize(this.mLandscapeScreenSize);
        return new Point(this.mLandscapeScreenSize);
    }
}
