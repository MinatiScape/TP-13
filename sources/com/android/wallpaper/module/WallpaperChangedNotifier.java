package com.android.wallpaper.module;

import java.util.ArrayList;
/* loaded from: classes.dex */
public final class WallpaperChangedNotifier {
    public static WallpaperChangedNotifier sInstance;
    public static final Object sInstanceLock = new Object();
    public ArrayList mListeners = new ArrayList();

    /* loaded from: classes.dex */
    public interface Listener {
        void onWallpaperChanged();
    }
}
