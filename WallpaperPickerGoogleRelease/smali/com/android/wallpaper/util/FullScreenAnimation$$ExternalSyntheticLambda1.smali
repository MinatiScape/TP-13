.class public final synthetic Lcom/android/wallpaper/util/FullScreenAnimation$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic f$0:Lcom/android/wallpaper/util/FullScreenAnimation;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/util/FullScreenAnimation;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/util/FullScreenAnimation$$ExternalSyntheticLambda1;->f$0:Lcom/android/wallpaper/util/FullScreenAnimation;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    iget-object p0, p0, Lcom/android/wallpaper/util/FullScreenAnimation$$ExternalSyntheticLambda1;->f$0:Lcom/android/wallpaper/util/FullScreenAnimation;

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/util/FullScreenAnimation;->mWorkspaceSurface:Landroid/view/SurfaceView;

    invoke-virtual {p0}, Landroid/view/SurfaceView;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroidx/cardview/widget/CardView;

    .line 2
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    .line 3
    invoke-virtual {p0, p1}, Landroidx/cardview/widget/CardView;->setRadius(F)V

    return-void
.end method
