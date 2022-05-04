.class public final synthetic Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/CurrentWallpaperInfoFactory$WallpaperInfoCallback;


# instance fields
.field public final synthetic f$0:Lcom/android/customization/picker/grid/GridFragment;

.field public final synthetic f$1:Lcom/android/customization/picker/WallpaperPreviewer;


# direct methods
.method public synthetic constructor <init>(Lcom/android/customization/picker/grid/GridFragment;Lcom/android/customization/picker/WallpaperPreviewer;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda1;->f$0:Lcom/android/customization/picker/grid/GridFragment;

    iput-object p2, p0, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda1;->f$1:Lcom/android/customization/picker/WallpaperPreviewer;

    return-void
.end method


# virtual methods
.method public final onWallpaperInfoCreated(Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/model/WallpaperInfo;I)V
    .locals 0

    iget-object p2, p0, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda1;->f$0:Lcom/android/customization/picker/grid/GridFragment;

    iget-object p0, p0, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda1;->f$1:Lcom/android/customization/picker/WallpaperPreviewer;

    .line 1
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    iput-object p1, p0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    const/4 p2, 0x0

    .line 3
    iput-object p2, p0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaperColorsListener:Lcom/android/customization/picker/WallpaperPreviewer$WallpaperColorsListener;

    .line 4
    iget-object p2, p0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaperSurfaceCallback:Lcom/android/wallpaper/util/WallpaperSurfaceCallback;

    .line 5
    iget-object p2, p2, Lcom/android/wallpaper/util/WallpaperSurfaceCallback;->mHomeImageWallpaper:Landroid/widget/ImageView;

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 6
    new-instance p1, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda1;

    invoke-direct {p1, p0, p2}, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda1;-><init>(Lcom/android/customization/picker/WallpaperPreviewer;Landroid/widget/ImageView;)V

    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method
