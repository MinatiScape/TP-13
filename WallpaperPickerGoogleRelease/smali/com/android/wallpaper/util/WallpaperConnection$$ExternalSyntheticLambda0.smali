.class public final synthetic Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Lcom/android/wallpaper/util/WallpaperConnection;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/util/WallpaperConnection;I)V
    .locals 1

    iput p2, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda0;->$r8$classId:I

    const/4 v0, 0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/util/WallpaperConnection;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget v0, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda0;->$r8$classId:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p0, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/util/WallpaperConnection;

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mSecondContainerView:Landroid/view/SurfaceView;

    invoke-virtual {p0, v0}, Lcom/android/wallpaper/util/WallpaperConnection;->reparentWallpaperSurface(Landroid/view/SurfaceView;)V

    return-void

    .line 2
    :pswitch_1
    iget-object p0, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/util/WallpaperConnection;

    .line 3
    iget-object v0, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mContainerView:Landroid/view/SurfaceView;

    invoke-virtual {p0, v0}, Lcom/android/wallpaper/util/WallpaperConnection;->reparentWallpaperSurface(Landroid/view/SurfaceView;)V

    return-void

    .line 4
    :goto_0
    iget-object p0, p0, Lcom/android/wallpaper/util/WallpaperConnection$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/util/WallpaperConnection;

    .line 5
    iget-object p0, p0, Lcom/android/wallpaper/util/WallpaperConnection;->mListener:Lcom/android/wallpaper/util/WallpaperConnection$WallpaperConnectionListener;

    if-eqz p0, :cond_0

    .line 6
    invoke-interface {p0}, Lcom/android/wallpaper/util/WallpaperConnection$WallpaperConnectionListener;->onEngineShown()V

    :cond_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
