.class public final synthetic Lcom/android/customization/model/mode/DarkModeSectionController$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Lcom/android/customization/model/mode/DarkModeSectionController;


# direct methods
.method public synthetic constructor <init>(Lcom/android/customization/model/mode/DarkModeSectionController;I)V
    .locals 0

    iput p2, p0, Lcom/android/customization/model/mode/DarkModeSectionController$$ExternalSyntheticLambda0;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/customization/model/mode/DarkModeSectionController$$ExternalSyntheticLambda0;->f$0:Lcom/android/customization/model/mode/DarkModeSectionController;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget v0, p0, Lcom/android/customization/model/mode/DarkModeSectionController$$ExternalSyntheticLambda0;->$r8$classId:I

    packed-switch v0, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    iget-object p0, p0, Lcom/android/customization/model/mode/DarkModeSectionController$$ExternalSyntheticLambda0;->f$0:Lcom/android/customization/model/mode/DarkModeSectionController;

    .line 1
    iget-object v0, p0, Lcom/android/customization/model/mode/DarkModeSectionController;->mContext:Landroid/content/Context;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/customization/model/mode/DarkModeSectionController;->mLifecycle:Landroidx/lifecycle/Lifecycle;

    check-cast v0, Landroidx/lifecycle/LifecycleRegistry;

    .line 2
    iget-object v0, v0, Landroidx/lifecycle/LifecycleRegistry;->mState:Landroidx/lifecycle/Lifecycle$State;

    .line 3
    sget-object v1, Landroidx/lifecycle/Lifecycle$State;->STARTED:Landroidx/lifecycle/Lifecycle$State;

    .line 4
    invoke-virtual {v0, v1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 5
    iget-object v0, p0, Lcom/android/customization/model/mode/DarkModeSectionController;->mContext:Landroid/content/Context;

    iget-object p0, p0, Lcom/android/customization/model/mode/DarkModeSectionController;->mBatterySaverStateReceiver:Lcom/android/customization/model/mode/DarkModeSectionController$BatterySaverStateReceiver;

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.os.action.POWER_SAVE_MODE_CHANGED"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    :cond_1
    return-void

    .line 6
    :goto_1
    iget-object p0, p0, Lcom/android/customization/model/mode/DarkModeSectionController$$ExternalSyntheticLambda0;->f$0:Lcom/android/customization/model/mode/DarkModeSectionController;

    .line 7
    iget-object v0, p0, Lcom/android/customization/model/mode/DarkModeSectionController;->mContext:Landroid/content/Context;

    if-eqz v0, :cond_2

    iget-object p0, p0, Lcom/android/customization/model/mode/DarkModeSectionController;->mBatterySaverStateReceiver:Lcom/android/customization/model/mode/DarkModeSectionController$BatterySaverStateReceiver;

    if-eqz p0, :cond_2

    .line 8
    invoke-virtual {v0, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    :cond_2
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
