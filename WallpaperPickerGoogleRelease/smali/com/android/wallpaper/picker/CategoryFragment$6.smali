.class public Lcom/android/wallpaper/picker/CategoryFragment$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/util/WallpaperConnection$WallpaperConnectionListener;


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/CategoryFragment;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/CategoryFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment$6;->this$0:Lcom/android/wallpaper/picker/CategoryFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onWallpaperColorsChanged(Landroid/app/WallpaperColors;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment$6;->this$0:Lcom/android/wallpaper/picker/CategoryFragment;

    .line 2
    iget-object p2, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mLockPreviewWallpaperInfo:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 3
    instance-of p2, p2, Lcom/android/wallpaper/model/LiveWallpaperInfo;

    if-eqz p2, :cond_0

    .line 4
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mLockScreenPreviewer:Lcom/android/wallpaper/widget/LockScreenPreviewer;

    .line 5
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/widget/LockScreenPreviewer;->setColor(Landroid/app/WallpaperColors;)V

    :cond_0
    return-void
.end method
