.class public final synthetic Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$Listener;


# instance fields
.field public final synthetic f$0:Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;

.field public final synthetic f$1:Landroid/app/Activity;

.field public final synthetic f$2:Lcom/android/wallpaper/module/WallpaperPersister;

.field public final synthetic f$3:Lcom/android/wallpaper/model/WallpaperInfo;

.field public final synthetic f$4:Lcom/android/wallpaper/asset/Asset;

.field public final synthetic f$5:Landroid/graphics/Rect;

.field public final synthetic f$6:F


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;Landroid/app/Activity;Lcom/android/wallpaper/module/WallpaperPersister;Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/asset/Asset;Landroid/graphics/Rect;F)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda2;->f$0:Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda2;->f$1:Landroid/app/Activity;

    iput-object p3, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda2;->f$2:Lcom/android/wallpaper/module/WallpaperPersister;

    iput-object p4, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda2;->f$3:Lcom/android/wallpaper/model/WallpaperInfo;

    iput-object p5, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda2;->f$4:Lcom/android/wallpaper/asset/Asset;

    iput-object p6, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda2;->f$5:Landroid/graphics/Rect;

    iput p7, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda2;->f$6:F

    return-void
.end method


# virtual methods
.method public final onSet(I)V
    .locals 9

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda2;->f$0:Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;

    iget-object v2, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda2;->f$1:Landroid/app/Activity;

    iget-object v3, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda2;->f$2:Lcom/android/wallpaper/module/WallpaperPersister;

    iget-object v4, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda2;->f$3:Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object v5, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda2;->f$4:Lcom/android/wallpaper/asset/Asset;

    iget-object v7, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda2;->f$5:Landroid/graphics/Rect;

    iget v8, p0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda2;->f$6:F

    .line 1
    iget-object p0, v0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle;->mSetWallpaperExecutor:Ljava/util/concurrent/Executor;

    new-instance v0, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda3;

    move-object v1, v0

    move v6, p1

    invoke-direct/range {v1 .. v8}, Lcom/google/android/apps/wallpaper/picker/MicropaperPreviewFragmentGoogle$$ExternalSyntheticLambda3;-><init>(Landroid/app/Activity;Lcom/android/wallpaper/module/WallpaperPersister;Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/asset/Asset;ILandroid/graphics/Rect;F)V

    invoke-interface {p0, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
