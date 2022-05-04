.class public Lcom/android/wallpaper/util/DiskBasedLogger$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/util/DiskBasedLogger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    sget-object p0, Lcom/android/wallpaper/util/DiskBasedLogger;->sLoggerThread:Landroid/os/HandlerThread;

    if-eqz p0, :cond_3

    .line 2
    invoke-virtual {p0}, Landroid/os/HandlerThread;->isAlive()Z

    move-result p0

    if-eqz p0, :cond_3

    .line 3
    sget p0, Lcom/android/wallpaper/compat/BuildCompat;->sSdk:I

    const/16 v0, 0x12

    if-lt p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    if-eqz p0, :cond_1

    .line 4
    sget-object p0, Lcom/android/wallpaper/util/DiskBasedLogger;->sLoggerThread:Landroid/os/HandlerThread;

    .line 5
    invoke-virtual {p0}, Landroid/os/HandlerThread;->quitSafely()Z

    move-result p0

    goto :goto_1

    .line 6
    :cond_1
    sget-object p0, Lcom/android/wallpaper/util/DiskBasedLogger;->sLoggerThread:Landroid/os/HandlerThread;

    .line 7
    invoke-virtual {p0}, Landroid/os/HandlerThread;->quit()Z

    move-result p0

    :goto_1
    if-nez p0, :cond_2

    const-string p0, "DiskBasedLogger"

    const-string v0, "Unable to quit disk-based logger HandlerThread"

    .line 8
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    const/4 p0, 0x0

    .line 9
    sput-object p0, Lcom/android/wallpaper/util/DiskBasedLogger;->sLoggerThread:Landroid/os/HandlerThread;

    .line 10
    sput-object p0, Lcom/android/wallpaper/util/DiskBasedLogger;->sHandler:Landroid/os/Handler;

    :cond_3
    return-void
.end method
