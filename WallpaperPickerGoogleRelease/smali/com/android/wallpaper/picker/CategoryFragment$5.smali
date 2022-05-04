.class public Lcom/android/wallpaper/picker/CategoryFragment$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/CurrentWallpaperInfoFactory$WallpaperInfoCallback;


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/CategoryFragment;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/CategoryFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment$5;->this$0:Lcom/android/wallpaper/picker/CategoryFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onWallpaperInfoCreated(Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/model/WallpaperInfo;I)V
    .locals 1

    .line 1
    new-instance p3, Landroid/os/Handler;

    invoke-direct {p3}, Landroid/os/Handler;-><init>()V

    new-instance v0, Lcom/android/wallpaper/picker/CategoryFragment$5$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/android/wallpaper/picker/CategoryFragment$5$1;-><init>(Lcom/android/wallpaper/picker/CategoryFragment$5;Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/model/WallpaperInfo;)V

    invoke-virtual {p3, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
