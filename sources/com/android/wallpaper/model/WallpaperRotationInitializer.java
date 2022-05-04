package com.android.wallpaper.model;

import android.content.Context;
import android.os.Parcelable;
import com.android.wallpaper.picker.individual.IndividualPickerFragment;
/* loaded from: classes.dex */
public interface WallpaperRotationInitializer extends Parcelable {

    /* loaded from: classes.dex */
    public interface Listener {
    }

    void setFirstWallpaperInRotation(Context context, int i, IndividualPickerFragment.AnonymousClass3 r3);

    void startRotation(Context context);
}
