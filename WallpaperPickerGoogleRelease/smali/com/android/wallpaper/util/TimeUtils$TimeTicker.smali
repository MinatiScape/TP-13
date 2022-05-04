.class public Lcom/android/wallpaper/util/TimeUtils$TimeTicker;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/util/TimeUtils$TimeTicker$TimeListener;
    }
.end annotation


# instance fields
.field public mListener:Lcom/android/wallpaper/util/TimeUtils$TimeTicker$TimeListener;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/util/TimeUtils$TimeTicker$TimeListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/util/TimeUtils$TimeTicker;->mListener:Lcom/android/wallpaper/util/TimeUtils$TimeTicker$TimeListener;

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/util/TimeUtils$TimeTicker;->mListener:Lcom/android/wallpaper/util/TimeUtils$TimeTicker$TimeListener;

    if-eqz p0, :cond_0

    .line 2
    check-cast p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda4;

    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda4;->f$0:Lcom/android/wallpaper/widget/LockScreenPreviewer;

    sget-object p1, Lcom/android/wallpaper/widget/LockScreenPreviewer;->sExecutorService:Ljava/util/concurrent/ExecutorService;

    invoke-virtual {p0}, Lcom/android/wallpaper/widget/LockScreenPreviewer;->updateDateTime()V

    :cond_0
    return-void
.end method
