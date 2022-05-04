.class public final synthetic Lcom/android/wallpaper/util/FullScreenAnimation$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic f$0:Lcom/android/wallpaper/util/FullScreenAnimation;

.field public final synthetic f$1:F

.field public final synthetic f$2:F

.field public final synthetic f$3:F

.field public final synthetic f$4:F


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/util/FullScreenAnimation;FFFF)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/util/FullScreenAnimation$$ExternalSyntheticLambda2;->f$0:Lcom/android/wallpaper/util/FullScreenAnimation;

    iput p2, p0, Lcom/android/wallpaper/util/FullScreenAnimation$$ExternalSyntheticLambda2;->f$1:F

    iput p3, p0, Lcom/android/wallpaper/util/FullScreenAnimation$$ExternalSyntheticLambda2;->f$2:F

    iput p4, p0, Lcom/android/wallpaper/util/FullScreenAnimation$$ExternalSyntheticLambda2;->f$3:F

    iput p5, p0, Lcom/android/wallpaper/util/FullScreenAnimation$$ExternalSyntheticLambda2;->f$4:F

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 4

    iget-object v0, p0, Lcom/android/wallpaper/util/FullScreenAnimation$$ExternalSyntheticLambda2;->f$0:Lcom/android/wallpaper/util/FullScreenAnimation;

    iget v1, p0, Lcom/android/wallpaper/util/FullScreenAnimation$$ExternalSyntheticLambda2;->f$1:F

    iget v2, p0, Lcom/android/wallpaper/util/FullScreenAnimation$$ExternalSyntheticLambda2;->f$2:F

    iget v3, p0, Lcom/android/wallpaper/util/FullScreenAnimation$$ExternalSyntheticLambda2;->f$3:F

    iget p0, p0, Lcom/android/wallpaper/util/FullScreenAnimation$$ExternalSyntheticLambda2;->f$4:F

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-static {v2, v1, p1, v1}, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph$$ExternalSyntheticOutline0;->m(FFFF)F

    move-result v1

    invoke-static {p0, v3, p1, v3}, Landroidx/constraintlayout/solver/widgets/analyzer/DependencyGraph$$ExternalSyntheticOutline0;->m(FFFF)F

    move-result p0

    .line 2
    iget-object p1, v0, Lcom/android/wallpaper/util/FullScreenAnimation;->mWorkspaceSurface:Landroid/view/SurfaceView;

    new-instance v2, Landroid/graphics/Rect;

    iget v3, v0, Lcom/android/wallpaper/util/FullScreenAnimation;->mWorkspaceHeight:I

    int-to-float v3, v3

    mul-float/2addr v3, v1

    .line 3
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v1

    iget v3, v0, Lcom/android/wallpaper/util/FullScreenAnimation;->mWorkspaceWidth:I

    iget v0, v0, Lcom/android/wallpaper/util/FullScreenAnimation;->mWorkspaceHeight:I

    .line 4
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    add-int/2addr p0, v0

    const/4 v0, 0x0

    invoke-direct {v2, v0, v1, v3, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 5
    invoke-virtual {p1, v2}, Landroid/view/SurfaceView;->setClipBounds(Landroid/graphics/Rect;)V

    return-void
.end method
