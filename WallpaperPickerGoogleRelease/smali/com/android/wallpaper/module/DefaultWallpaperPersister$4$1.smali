.class public Lcom/android/wallpaper/module/DefaultWallpaperPersister$4$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/asset/Asset$BitmapReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;->onDimensionsDecoded(Landroid/graphics/Point;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$1:Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4$1;->this$1:Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBitmapDecoded(Landroid/graphics/Bitmap;)V
    .locals 7

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4$1;->this$1:Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;

    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;->val$wallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object v6, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;->val$screenSize:Landroid/graphics/Point;

    iget-object v5, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$4;->val$callback:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

    .line 2
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    new-instance p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;

    const/4 v4, 0x2

    move-object v0, p0

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;-><init>(Lcom/android/wallpaper/module/DefaultWallpaperPersister;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/graphics/Bitmap;ILcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V

    .line 4
    iget-object p1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mFillSize:Landroid/graphics/Point;

    if-nez p1, :cond_0

    .line 5
    iput-object v6, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mStretchSize:Landroid/graphics/Point;

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Void;

    .line 6
    invoke-virtual {p0, p1}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void

    .line 7
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Can\'t pass a stretch size option if a fill size is already set."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
