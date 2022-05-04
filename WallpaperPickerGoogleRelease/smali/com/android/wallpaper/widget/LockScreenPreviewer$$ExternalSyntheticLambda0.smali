.class public final synthetic Lcom/android/wallpaper/widget/LockScreenPreviewer$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Lcom/android/wallpaper/widget/LockScreenPreviewer;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/widget/LockScreenPreviewer;I)V
    .locals 0

    iput p2, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer$$ExternalSyntheticLambda0;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/widget/LockScreenPreviewer;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    iget v0, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer$$ExternalSyntheticLambda0;->$r8$classId:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p0, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/widget/LockScreenPreviewer;

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer;->mContext:Landroid/content/Context;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer;->mTicker:Lcom/android/wallpaper/util/TimeUtils$TimeTicker;

    if-eqz v1, :cond_0

    .line 2
    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    .line 3
    iput-object v0, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer;->mTicker:Lcom/android/wallpaper/util/TimeUtils$TimeTicker;

    :cond_0
    return-void

    .line 4
    :goto_0
    iget-object p0, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/widget/LockScreenPreviewer;

    .line 5
    iget-object v0, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer;->mContext:Landroid/content/Context;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer;->mLifecycle:Landroidx/lifecycle/Lifecycle;

    check-cast v0, Landroidx/lifecycle/LifecycleRegistry;

    .line 6
    iget-object v0, v0, Landroidx/lifecycle/LifecycleRegistry;->mState:Landroidx/lifecycle/Lifecycle$State;

    .line 7
    sget-object v1, Landroidx/lifecycle/Lifecycle$State;->RESUMED:Landroidx/lifecycle/Lifecycle$State;

    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v0

    const/4 v1, 0x1

    if-ltz v0, :cond_1

    move v0, v1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_1
    if-eqz v0, :cond_2

    .line 9
    iget-object v0, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer;->mContext:Landroid/content/Context;

    new-instance v2, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda4;

    invoke-direct {v2, p0, v1}, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda4;-><init>(Lcom/android/wallpaper/widget/LockScreenPreviewer;I)V

    .line 10
    new-instance v1, Lcom/android/wallpaper/util/TimeUtils$TimeTicker;

    invoke-direct {v1, v2}, Lcom/android/wallpaper/util/TimeUtils$TimeTicker;-><init>(Lcom/android/wallpaper/util/TimeUtils$TimeTicker$TimeListener;)V

    .line 11
    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "android.intent.action.TIME_TICK"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 13
    iput-object v1, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer;->mTicker:Lcom/android/wallpaper/util/TimeUtils$TimeTicker;

    :cond_2
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
