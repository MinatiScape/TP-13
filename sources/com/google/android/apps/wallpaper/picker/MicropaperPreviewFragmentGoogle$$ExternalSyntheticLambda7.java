package com.google.android.apps.wallpaper.picker;

import java.util.concurrent.ThreadFactory;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda7 implements ThreadFactory {
    public static final /* synthetic */ MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda7 INSTANCE = new MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda7();

    @Override // java.util.concurrent.ThreadFactory
    public final Thread newThread(Runnable runnable) {
        int i = MicropaperPreviewFragmentGoogle.$r8$clinit;
        return new Thread(runnable, "set-wallpaper-executor");
    }
}
