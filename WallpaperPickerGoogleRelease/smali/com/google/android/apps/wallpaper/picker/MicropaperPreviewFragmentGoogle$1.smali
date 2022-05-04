.class public Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;


# instance fields
.field public final synthetic val$activity:Landroid/app/Activity;

.field public final synthetic val$destination:I

.field public final synthetic val$inputStream:Ljava/io/ByteArrayInputStream;

.field public final synthetic val$shouldCopyToBackingFile:Z


# direct methods
.method public constructor <init>(Landroid/app/Activity;ZILjava/io/ByteArrayInputStream;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$1;->val$activity:Landroid/app/Activity;

    iput-boolean p2, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$1;->val$shouldCopyToBackingFile:Z

    iput p3, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$1;->val$destination:I

    iput-object p4, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$1;->val$inputStream:Ljava/io/ByteArrayInputStream;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;->$r8$clinit:I

    const-string p0, "MicropaperPreviewFragmentGoogle"

    const-string v0, "onError"

    invoke-static {p0, v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method public onSuccess(Lcom/android/wallpaper/model/WallpaperInfo;)V
    .locals 4

    .line 1
    sget p1, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;->$r8$clinit:I

    const-string p1, "MicropaperPreviewFragmentGoogle"

    const-string v0, "onSuccess"

    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$1;->val$activity:Landroid/app/Activity;

    invoke-interface {p1, v0}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object p1

    .line 3
    iget-boolean v0, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$1;->val$shouldCopyToBackingFile:Z

    if-eqz v0, :cond_3

    .line 4
    iget v0, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$1;->val$destination:I

    const/4 v1, 0x2

    if-eqz v0, :cond_0

    if-ne v0, v1, :cond_1

    .line 5
    :cond_0
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$1;->val$inputStream:Ljava/io/ByteArrayInputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayInputStream;->reset()V

    .line 6
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$1;->val$activity:Landroid/app/Activity;

    iget-object v2, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$1;->val$inputStream:Ljava/io/ByteArrayInputStream;

    const-string v3, "micropaper_backing_home"

    invoke-static {v0, v2, v3}, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;->access$100(Landroid/content/Context;Ljava/io/InputStream;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 7
    invoke-interface {p1, v3}, Lcom/android/wallpaper/module/WallpaperPreferences;->setHomeWallpaperBackingFileName(Ljava/lang/String;)V

    .line 8
    :cond_1
    iget v0, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$1;->val$destination:I

    const/4 v2, 0x1

    if-eq v0, v2, :cond_2

    if-ne v0, v1, :cond_3

    .line 9
    :cond_2
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$1;->val$inputStream:Ljava/io/ByteArrayInputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayInputStream;->reset()V

    .line 10
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$1;->val$activity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$1;->val$inputStream:Ljava/io/ByteArrayInputStream;

    const-string v2, "micropaper_backing_lock"

    invoke-static {v0, v1, v2}, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;->access$100(Landroid/content/Context;Ljava/io/InputStream;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 11
    invoke-interface {p1, v2}, Lcom/android/wallpaper/module/WallpaperPreferences;->setHomeWallpaperBackingFileName(Ljava/lang/String;)V

    .line 12
    :cond_3
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$1;->val$activity:Landroid/app/Activity;

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Landroid/app/Activity;->setResult(I)V

    .line 13
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$1;->val$activity:Landroid/app/Activity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method
