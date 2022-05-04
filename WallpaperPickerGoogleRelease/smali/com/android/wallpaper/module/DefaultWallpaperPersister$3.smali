.class public Lcom/android/wallpaper/module/DefaultWallpaperPersister$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/BitmapCropper$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/module/DefaultWallpaperPersister;->setIndividualWallpaper(Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/asset/Asset;Landroid/graphics/Rect;FILcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

.field public final synthetic val$callback:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

.field public final synthetic val$destination:I

.field public final synthetic val$wallpaper:Lcom/android/wallpaper/model/WallpaperInfo;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/module/DefaultWallpaperPersister;Lcom/android/wallpaper/model/WallpaperInfo;ILcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$3;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    iput-object p2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$3;->val$wallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    iput p3, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$3;->val$destination:I

    iput-object p4, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$3;->val$callback:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBitmapCropped(Landroid/graphics/Bitmap;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$3;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$3;->val$wallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    iget v2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$3;->val$destination:I

    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$3;->val$callback:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

    .line 2
    invoke-virtual {v0, v1, p1, v2, p0}, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->setIndividualWallpaper(Lcom/android/wallpaper/model/WallpaperInfo;Landroid/graphics/Bitmap;ILcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V

    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$3;->val$callback:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;->onError(Ljava/lang/Throwable;)V

    return-void
.end method
