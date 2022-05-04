.class public Lcom/android/wallpaper/util/SurfaceViewUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static createSurfaceViewRequest(Landroid/view/SurfaceView;)Landroid/os/Bundle;
    .locals 3

    .line 1
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 2
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getHostToken()Landroid/os/IBinder;

    move-result-object v1

    const-string v2, "host_token"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBinder(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 3
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Display;->getDisplayId()I

    move-result v1

    const-string v2, "display_id"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 4
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getWidth()I

    move-result v1

    const-string v2, "width"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 5
    invoke-virtual {p0}, Landroid/view/SurfaceView;->getHeight()I

    move-result p0

    const-string v1, "height"

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    return-object v0
.end method
