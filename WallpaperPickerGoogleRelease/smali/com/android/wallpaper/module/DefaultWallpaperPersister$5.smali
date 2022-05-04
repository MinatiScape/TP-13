.class public Lcom/android/wallpaper/module/DefaultWallpaperPersister$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/asset/Asset$BitmapReceiver;


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

.field public final synthetic val$callback:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

.field public final synthetic val$screenSize:Landroid/graphics/Point;

.field public final synthetic val$wallpaper:Lcom/android/wallpaper/model/WallpaperInfo;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/module/DefaultWallpaperPersister;Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/graphics/Point;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$5;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    iput-object p2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$5;->val$callback:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

    iput-object p3, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$5;->val$wallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    iput-object p4, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$5;->val$screenSize:Landroid/graphics/Point;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBitmapDecoded(Landroid/graphics/Bitmap;)V
    .locals 7

    if-nez p1, :cond_0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$5;->val$callback:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

    const/4 p1, 0x0

    invoke-interface {p0, p1}, Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;->onError(Ljava/lang/Throwable;)V

    return-void

    .line 2
    :cond_0
    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$5;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$5;->val$wallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object v6, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$5;->val$screenSize:Landroid/graphics/Point;

    const/4 v4, 0x2

    iget-object v5, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$5;->val$callback:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

    .line 3
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    new-instance p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;

    move-object v0, p0

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;-><init>(Lcom/android/wallpaper/module/DefaultWallpaperPersister;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/graphics/Bitmap;ILcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V

    .line 5
    iget-object p1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mStretchSize:Landroid/graphics/Point;

    if-nez p1, :cond_1

    .line 6
    iput-object v6, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mFillSize:Landroid/graphics/Point;

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Void;

    .line 7
    invoke-virtual {p0, p1}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void

    .line 8
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Can\'t pass a fill size option if a stretch size is already set."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
