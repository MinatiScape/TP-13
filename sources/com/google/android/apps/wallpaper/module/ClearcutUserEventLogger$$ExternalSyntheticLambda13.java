package com.google.android.apps.wallpaper.module;

import com.google.wireless.android.apps.wallpaper.WallpaperLogProto$WallpaperEvent;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class ClearcutUserEventLogger$$ExternalSyntheticLambda13 implements Runnable {
    public final /* synthetic */ ClearcutUserEventLogger f$0;
    public final /* synthetic */ int f$1;
    public final /* synthetic */ String f$2;

    public /* synthetic */ ClearcutUserEventLogger$$ExternalSyntheticLambda13(ClearcutUserEventLogger clearcutUserEventLogger, int i, String str) {
        this.f$0 = clearcutUserEventLogger;
        this.f$1 = i;
        this.f$2 = str;
    }

    @Override // java.lang.Runnable
    public final void run() {
        ClearcutUserEventLogger clearcutUserEventLogger = this.f$0;
        int i = this.f$1;
        String str = this.f$2;
        clearcutUserEventLogger.getClass();
        WallpaperLogProto$WallpaperEvent.Builder newBuilder = WallpaperLogProto$WallpaperEvent.newBuilder();
        newBuilder.setType(WallpaperLogProto$WallpaperEvent.Type.forNumber(i));
        if (str != null) {
            newBuilder.copyOnWrite();
            WallpaperLogProto$WallpaperEvent.m66$$Nest$msetCategoryCollectionId((WallpaperLogProto$WallpaperEvent) newBuilder.instance, str);
        }
        clearcutUserEventLogger.log(newBuilder.build());
    }
}
