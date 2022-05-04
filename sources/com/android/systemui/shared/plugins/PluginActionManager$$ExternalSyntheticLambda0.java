package com.android.systemui.shared.plugins;
/* loaded from: classes.dex */
public final /* synthetic */ class PluginActionManager$$ExternalSyntheticLambda0 implements Runnable {
    public final /* synthetic */ int $r8$classId;
    public final /* synthetic */ PluginActionManager f$0;
    public final /* synthetic */ PluginInstance f$1;

    public /* synthetic */ PluginActionManager$$ExternalSyntheticLambda0(PluginActionManager pluginActionManager, PluginInstance pluginInstance, int i) {
        this.$r8$classId = i;
        this.f$0 = pluginActionManager;
        this.f$1 = pluginInstance;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.$r8$classId) {
            case 0:
                this.f$0.lambda$destroy$0(this.f$1);
                return;
            default:
                this.f$0.lambda$removePkg$4(this.f$1);
                return;
        }
    }
}
