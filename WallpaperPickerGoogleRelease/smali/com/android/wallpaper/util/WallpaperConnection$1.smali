.class public Lcom/android/wallpaper/util/WallpaperConnection$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/util/WallpaperConnection;->reparentWallpaperSurface(Landroid/view/SurfaceView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/util/WallpaperConnection;

.field public final synthetic val$parentSurface:Landroid/view/SurfaceView;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/util/WallpaperConnection;Landroid/view/SurfaceView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/util/WallpaperConnection$1;->this$0:Lcom/android/wallpaper/util/WallpaperConnection;

    iput-object p2, p0, Lcom/android/wallpaper/util/WallpaperConnection$1;->val$parentSurface:Landroid/view/SurfaceView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/util/WallpaperConnection$1;->this$0:Lcom/android/wallpaper/util/WallpaperConnection;

    iget-object v0, p0, Lcom/android/wallpaper/util/WallpaperConnection$1;->val$parentSurface:Landroid/view/SurfaceView;

    .line 2
    invoke-virtual {p1, v0}, Lcom/android/wallpaper/util/WallpaperConnection;->mirrorAndReparent(Landroid/view/SurfaceView;)V

    .line 3
    iget-object p1, p0, Lcom/android/wallpaper/util/WallpaperConnection$1;->val$parentSurface:Landroid/view/SurfaceView;

    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p1

    invoke-interface {p1, p0}, Landroid/view/SurfaceHolder;->removeCallback(Landroid/view/SurfaceHolder$Callback;)V

    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0

    return-void
.end method
