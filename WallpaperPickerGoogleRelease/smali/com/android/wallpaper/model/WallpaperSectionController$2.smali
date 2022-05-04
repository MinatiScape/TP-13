.class public Lcom/android/wallpaper/model/WallpaperSectionController$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/util/WallpaperConnection$WallpaperConnectionListener;


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/model/WallpaperSectionController;

.field public final synthetic val$isLockLive:Z


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/model/WallpaperSectionController;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/model/WallpaperSectionController$2;->this$0:Lcom/android/wallpaper/model/WallpaperSectionController;

    iput-boolean p2, p0, Lcom/android/wallpaper/model/WallpaperSectionController$2;->val$isLockLive:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onWallpaperColorsChanged(Landroid/app/WallpaperColors;I)V
    .locals 0

    .line 1
    iget-boolean p2, p0, Lcom/android/wallpaper/model/WallpaperSectionController$2;->val$isLockLive:Z

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/android/wallpaper/model/WallpaperSectionController$2;->this$0:Lcom/android/wallpaper/model/WallpaperSectionController;

    .line 2
    iget-object p2, p2, Lcom/android/wallpaper/model/WallpaperSectionController;->mLockScreenPreviewer:Lcom/android/wallpaper/widget/LockScreenPreviewer;

    if-eqz p2, :cond_0

    .line 3
    invoke-virtual {p2, p1}, Lcom/android/wallpaper/widget/LockScreenPreviewer;->setColor(Landroid/app/WallpaperColors;)V

    .line 4
    iget-object p2, p0, Lcom/android/wallpaper/model/WallpaperSectionController$2;->this$0:Lcom/android/wallpaper/model/WallpaperSectionController;

    .line 5
    invoke-virtual {p2, p1}, Lcom/android/wallpaper/model/WallpaperSectionController;->onLockWallpaperColorsChanged(Landroid/app/WallpaperColors;)V

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/model/WallpaperSectionController$2;->this$0:Lcom/android/wallpaper/model/WallpaperSectionController;

    .line 7
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/model/WallpaperSectionController;->onHomeWallpaperColorsChanged(Landroid/app/WallpaperColors;)V

    return-void
.end method
