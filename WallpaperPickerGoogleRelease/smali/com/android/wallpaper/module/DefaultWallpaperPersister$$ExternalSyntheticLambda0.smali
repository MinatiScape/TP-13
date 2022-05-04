.class public final synthetic Lcom/android/wallpaper/module/DefaultWallpaperPersister$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/asset/Asset$BitmapReceiver;


# instance fields
.field public final synthetic f$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

.field public final synthetic f$1:Lcom/android/wallpaper/model/WallpaperInfo;

.field public final synthetic f$2:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/module/DefaultWallpaperPersister;Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    iput-object p2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$$ExternalSyntheticLambda0;->f$1:Lcom/android/wallpaper/model/WallpaperInfo;

    iput-object p3, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$$ExternalSyntheticLambda0;->f$2:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

    return-void
.end method


# virtual methods
.method public final onBitmapDecoded(Landroid/graphics/Bitmap;)V
    .locals 3

    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$$ExternalSyntheticLambda0;->f$1:Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$$ExternalSyntheticLambda0;->f$2:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

    const/4 v2, 0x2

    .line 1
    invoke-virtual {v0, v1, p1, v2, p0}, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->setIndividualWallpaper(Lcom/android/wallpaper/model/WallpaperInfo;Landroid/graphics/Bitmap;ILcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V

    return-void
.end method
