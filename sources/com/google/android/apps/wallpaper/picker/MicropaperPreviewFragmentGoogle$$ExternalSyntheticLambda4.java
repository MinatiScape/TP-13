package com.google.android.apps.wallpaper.picker;

import java.util.concurrent.ThreadFactory;
/* loaded from: classes.dex */
public final /* synthetic */ class MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda4 implements ThreadFactory {
    public static final /* synthetic */ MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda4 INSTANCE = new MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda4();

    @Override // java.util.concurrent.ThreadFactory
    public final Thread newThread(Runnable runnable) {
        int i = MicropaperPreviewFragmentGoogle.$r8$clinit;
        return new Thread(runnable, "set-wallpaper-executor");
    }
}
