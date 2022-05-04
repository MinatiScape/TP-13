package com.google.android.apps.wallpaper.module;

import com.android.customization.model.grid.GridOption;
import com.google.wireless.android.apps.wallpaper.WallpaperLogProto$WallpaperEvent;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class ClearcutUserEventLogger$$ExternalSyntheticLambda12 implements Runnable {
    public final /* synthetic */ ClearcutUserEventLogger f$0;
    public final /* synthetic */ int f$1;
    public final /* synthetic */ GridOption f$2;

    public /* synthetic */ ClearcutUserEventLogger$$ExternalSyntheticLambda12(ClearcutUserEventLogger clearcutUserEventLogger, int i, GridOption gridOption) {
        this.f$0 = clearcutUserEventLogger;
        this.f$1 = i;
        this.f$2 = gridOption;
    }

    @Override // java.lang.Runnable
    public final void run() {
        ClearcutUserEventLogger clearcutUserEventLogger = this.f$0;
        int i = this.f$1;
        GridOption gridOption = this.f$2;
        clearcutUserEventLogger.getClass();
        WallpaperLogProto$WallpaperEvent.Builder newBuilder = WallpaperLogProto$WallpaperEvent.newBuilder();
        newBuilder.setType(WallpaperLogProto$WallpaperEvent.Type.forNumber(i));
        int hashCode = gridOption.mTitle.hashCode();
        newBuilder.copyOnWrite();
        WallpaperLogProto$WallpaperEvent.m67$$Nest$msetGridnameHash((WallpaperLogProto$WallpaperEvent) newBuilder.instance, hashCode);
        clearcutUserEventLogger.log(newBuilder.build());
    }
}
