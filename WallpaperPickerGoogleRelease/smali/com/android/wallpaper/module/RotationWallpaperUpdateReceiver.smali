.class public Lcom/android/wallpaper/module/RotationWallpaperUpdateReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# static fields
.field public static final synthetic $r8$clinit:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 2
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.MY_PACKAGE_REPLACED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 3
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    const-string v0, "android.intent.action.BOOT_COMPLETED"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 4
    :cond_0
    invoke-static {}, Lcom/android/wallpaper/compat/BuildCompat;->isAtLeastN()Z

    move-result p2

    if-eqz p2, :cond_1

    .line 5
    invoke-virtual {p0}, Landroid/content/BroadcastReceiver;->goAsync()Landroid/content/BroadcastReceiver$PendingResult;

    move-result-object p2

    .line 6
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1, p2}, Lcom/android/wallpaper/util/PreviewUtils$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/module/RotationWallpaperUpdateReceiver;Landroid/content/Context;Landroid/content/BroadcastReceiver$PendingResult;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 7
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void

    :cond_1
    const-string p0, "RotationWallpaperUpdateReceiver"

    const-string p2, "Unexpected action or Android version!"

    .line 8
    invoke-static {p0, p2, p1}, Lcom/android/wallpaper/util/DiskBasedLogger;->e(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 9
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Unexpected broadcast action or unsupported Android version"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
