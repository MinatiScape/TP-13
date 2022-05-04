.class public Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/WallpaperRefresher$RefreshListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService;->onStartJob(Landroid/app/job/JobParameters;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService;

.field public final synthetic val$appContext:Landroid/content/Context;

.field public final synthetic val$params:Landroid/app/job/JobParameters;


# direct methods
.method public constructor <init>(Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService;Landroid/app/job/JobParameters;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService$1;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService;

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService$1;->val$params:Landroid/app/job/JobParameters;

    iput-object p3, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService$1;->val$appContext:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRefreshed(Lcom/android/wallpaper/model/WallpaperMetadata;Lcom/android/wallpaper/model/WallpaperMetadata;I)V
    .locals 4

    const/4 p1, 0x1

    if-ne p3, p1, :cond_0

    const-string p1, "BackdropRotationJob"

    const-string p2, "Wallpaper presentation mode is static, cutting task short."

    .line 1
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService$1;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService;

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService$1;->val$params:Landroid/app/job/JobParameters;

    const/4 p2, 0x0

    invoke-virtual {p1, p0, p2}, Landroid/app/job/JobService;->jobFinished(Landroid/app/job/JobParameters;Z)V

    return-void

    .line 3
    :cond_0
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService$1;->this$0:Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService;

    iget-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService$1;->val$appContext:Landroid/content/Context;

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService$1;->val$params:Landroid/app/job/JobParameters;

    sget p3, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService;->$r8$clinit:I

    .line 4
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    invoke-static {p2}, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;->getInstance(Landroid/content/Context;)Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;

    move-result-object p3

    .line 6
    invoke-virtual {p3}, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;->getCollectionId()Ljava/lang/String;

    move-result-object v0

    .line 7
    invoke-virtual {p3}, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;->getCollectionName()Ljava/lang/String;

    move-result-object v1

    .line 8
    invoke-virtual {p3}, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;->getResumeToken()Ljava/lang/String;

    move-result-object v2

    .line 9
    new-instance v3, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService$2;

    invoke-direct {v3, p1, p0, p2, p3}, Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService$2;-><init>(Lcom/google/android/apps/wallpaper/backdrop/BackdropRotationJobService;Landroid/app/job/JobParameters;Landroid/content/Context;Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;)V

    invoke-static {p2, v0, v1, v2, v3}, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator;->updateWallpaper(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$RotationListener;)V

    return-void
.end method
