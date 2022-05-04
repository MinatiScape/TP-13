.class public Lcom/android/wallpaper/model/WallpaperSectionController$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/model/WallpaperSectionController;->setupFade(Landroidx/cardview/widget/CardView;Landroidx/core/widget/ContentLoadingProgressBar;IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/model/WallpaperSectionController;

.field public final synthetic val$progressBar:Landroidx/core/widget/ContentLoadingProgressBar;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/model/WallpaperSectionController;Landroidx/core/widget/ContentLoadingProgressBar;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/model/WallpaperSectionController$3;->this$0:Lcom/android/wallpaper/model/WallpaperSectionController;

    iput-object p2, p0, Lcom/android/wallpaper/model/WallpaperSectionController$3;->val$progressBar:Landroidx/core/widget/ContentLoadingProgressBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/model/WallpaperSectionController$3;->val$progressBar:Landroidx/core/widget/ContentLoadingProgressBar;

    invoke-virtual {p1}, Landroidx/core/widget/ContentLoadingProgressBar;->hide()V

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/model/WallpaperSectionController$3;->this$0:Lcom/android/wallpaper/model/WallpaperSectionController;

    const/4 p1, 0x0

    invoke-static {p0, p1}, Lcom/android/wallpaper/model/WallpaperSectionController;->access$300(Lcom/android/wallpaper/model/WallpaperSectionController;I)V

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/model/WallpaperSectionController$3;->val$progressBar:Landroidx/core/widget/ContentLoadingProgressBar;

    invoke-virtual {p1}, Landroidx/core/widget/ContentLoadingProgressBar;->hide()V

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/model/WallpaperSectionController$3;->this$0:Lcom/android/wallpaper/model/WallpaperSectionController;

    const/4 p1, 0x0

    invoke-static {p0, p1}, Lcom/android/wallpaper/model/WallpaperSectionController;->access$300(Lcom/android/wallpaper/model/WallpaperSectionController;I)V

    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/model/WallpaperSectionController$3;->this$0:Lcom/android/wallpaper/model/WallpaperSectionController;

    const/4 p1, 0x4

    invoke-static {p0, p1}, Lcom/android/wallpaper/model/WallpaperSectionController;->access$300(Lcom/android/wallpaper/model/WallpaperSectionController;I)V

    return-void
.end method
