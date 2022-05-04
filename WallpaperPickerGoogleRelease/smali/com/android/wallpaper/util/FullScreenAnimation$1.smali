.class public Lcom/android/wallpaper/util/FullScreenAnimation$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/util/FullScreenAnimation;->startAnimation(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/util/FullScreenAnimation;

.field public final synthetic val$toFullScreen:Z


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/util/FullScreenAnimation;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/util/FullScreenAnimation$1;->this$0:Lcom/android/wallpaper/util/FullScreenAnimation;

    iput-boolean p2, p0, Lcom/android/wallpaper/util/FullScreenAnimation$1;->val$toFullScreen:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/util/FullScreenAnimation$1;->this$0:Lcom/android/wallpaper/util/FullScreenAnimation;

    .line 2
    iget-object p1, p1, Lcom/android/wallpaper/util/FullScreenAnimation;->mFullScreenStatusListener:Lcom/android/wallpaper/util/FullScreenAnimation$FullScreenStatusListener;

    if-eqz p1, :cond_0

    .line 3
    iget-boolean p0, p0, Lcom/android/wallpaper/util/FullScreenAnimation$1;->val$toFullScreen:Z

    invoke-interface {p1, p0}, Lcom/android/wallpaper/util/FullScreenAnimation$FullScreenStatusListener;->onFullScreenStatusChange(Z)V

    :cond_0
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method
