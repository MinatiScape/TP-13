.class public final synthetic Lcom/android/systemui/shared/plugins/PluginActionManager$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Lcom/android/systemui/shared/plugins/PluginActionManager;

.field public final synthetic f$1:Lcom/android/systemui/shared/plugins/PluginInstance;


# direct methods
.method public synthetic constructor <init>(Lcom/android/systemui/shared/plugins/PluginActionManager;Lcom/android/systemui/shared/plugins/PluginInstance;I)V
    .locals 0

    iput p3, p0, Lcom/android/systemui/shared/plugins/PluginActionManager$$ExternalSyntheticLambda0;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/systemui/shared/plugins/PluginActionManager$$ExternalSyntheticLambda0;->f$0:Lcom/android/systemui/shared/plugins/PluginActionManager;

    iput-object p2, p0, Lcom/android/systemui/shared/plugins/PluginActionManager$$ExternalSyntheticLambda0;->f$1:Lcom/android/systemui/shared/plugins/PluginInstance;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget v0, p0, Lcom/android/systemui/shared/plugins/PluginActionManager$$ExternalSyntheticLambda0;->$r8$classId:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object v0, p0, Lcom/android/systemui/shared/plugins/PluginActionManager$$ExternalSyntheticLambda0;->f$0:Lcom/android/systemui/shared/plugins/PluginActionManager;

    iget-object p0, p0, Lcom/android/systemui/shared/plugins/PluginActionManager$$ExternalSyntheticLambda0;->f$1:Lcom/android/systemui/shared/plugins/PluginInstance;

    invoke-static {v0, p0}, Lcom/android/systemui/shared/plugins/PluginActionManager;->$r8$lambda$pBQrwk3hQN6yH77r52dt5cnCyVw(Lcom/android/systemui/shared/plugins/PluginActionManager;Lcom/android/systemui/shared/plugins/PluginInstance;)V

    return-void

    :goto_0
    iget-object v0, p0, Lcom/android/systemui/shared/plugins/PluginActionManager$$ExternalSyntheticLambda0;->f$0:Lcom/android/systemui/shared/plugins/PluginActionManager;

    iget-object p0, p0, Lcom/android/systemui/shared/plugins/PluginActionManager$$ExternalSyntheticLambda0;->f$1:Lcom/android/systemui/shared/plugins/PluginInstance;

    invoke-static {v0, p0}, Lcom/android/systemui/shared/plugins/PluginActionManager;->$r8$lambda$1J013yPjqW1h78J0FyIon-FoVCQ(Lcom/android/systemui/shared/plugins/PluginActionManager;Lcom/android/systemui/shared/plugins/PluginInstance;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
