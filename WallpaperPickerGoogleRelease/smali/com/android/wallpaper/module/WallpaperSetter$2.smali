.class public Lcom/android/wallpaper/module/WallpaperSetter$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/module/WallpaperSetter;->setCurrentWallpaper(Landroid/app/Activity;Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/asset/Asset;IFLandroid/graphics/Rect;Landroid/app/WallpaperColors;Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/module/WallpaperSetter;

.field public final synthetic val$callback:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

.field public final synthetic val$containerActivity:Landroid/app/Activity;

.field public final synthetic val$wallpaper:Lcom/android/wallpaper/model/WallpaperInfo;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/module/WallpaperSetter;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/app/Activity;Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/module/WallpaperSetter$2;->this$0:Lcom/android/wallpaper/module/WallpaperSetter;

    iput-object p2, p0, Lcom/android/wallpaper/module/WallpaperSetter$2;->val$wallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    iput-object p3, p0, Lcom/android/wallpaper/module/WallpaperSetter$2;->val$containerActivity:Landroid/app/Activity;

    iput-object p4, p0, Lcom/android/wallpaper/module/WallpaperSetter$2;->val$callback:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/WallpaperSetter$2;->this$0:Lcom/android/wallpaper/module/WallpaperSetter;

    iget-object v1, p0, Lcom/android/wallpaper/module/WallpaperSetter$2;->val$containerActivity:Landroid/app/Activity;

    .line 2
    invoke-virtual {v0, p1, v1}, Lcom/android/wallpaper/module/WallpaperSetter;->onWallpaperApplyError(Ljava/lang/Throwable;Landroid/app/Activity;)V

    .line 3
    iget-object p0, p0, Lcom/android/wallpaper/module/WallpaperSetter$2;->val$callback:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

    if-eqz p0, :cond_0

    .line 4
    invoke-interface {p0, p1}, Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;->onError(Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public onSuccess(Lcom/android/wallpaper/model/WallpaperInfo;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/module/WallpaperSetter$2;->this$0:Lcom/android/wallpaper/module/WallpaperSetter;

    iget-object v0, p0, Lcom/android/wallpaper/module/WallpaperSetter$2;->val$wallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object v1, p0, Lcom/android/wallpaper/module/WallpaperSetter$2;->val$containerActivity:Landroid/app/Activity;

    .line 2
    invoke-virtual {p1, v0, v1}, Lcom/android/wallpaper/module/WallpaperSetter;->onWallpaperApplied(Lcom/android/wallpaper/model/WallpaperInfo;Landroid/app/Activity;)V

    .line 3
    iget-object p1, p0, Lcom/android/wallpaper/module/WallpaperSetter$2;->val$callback:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

    if-eqz p1, :cond_0

    .line 4
    iget-object p0, p0, Lcom/android/wallpaper/module/WallpaperSetter$2;->val$wallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    invoke-interface {p1, p0}, Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;->onSuccess(Lcom/android/wallpaper/model/WallpaperInfo;)V

    :cond_0
    return-void
.end method
