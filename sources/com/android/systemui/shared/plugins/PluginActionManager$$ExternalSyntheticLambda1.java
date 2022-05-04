package com.android.systemui.shared.plugins;

import com.android.wallpaper.model.ThirdPartyLiveWallpaperCategory;
import com.android.wallpaper.model.WallpaperReceiver;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
/* compiled from: R8$$SyntheticClass */
/* loaded from: classes.dex */
public final /* synthetic */ class PluginActionManager$$ExternalSyntheticLambda1 implements Runnable {
    public final /* synthetic */ int $r8$classId;
    public final /* synthetic */ Object f$0;
    public final /* synthetic */ Object f$1;

    public /* synthetic */ PluginActionManager$$ExternalSyntheticLambda1(Object obj, Object obj2, int i) {
        this.$r8$classId = i;
        this.f$0 = obj;
        this.f$1 = obj2;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.$r8$classId) {
            case 0:
                ((PluginActionManager) this.f$0).lambda$handleQueryPlugins$5((PluginInstance) this.f$1);
                return;
            default:
                ExecutorService executorService = ThirdPartyLiveWallpaperCategory.sExecutorService;
                ((WallpaperReceiver) this.f$0).onWallpapersReceived(new ArrayList((List) this.f$1));
                return;
        }
    }
}
