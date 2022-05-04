.class public Lcom/google/android/material/snackbar/BaseTransientBottomBar$BehaviorDelegate;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/google/android/material/behavior/SwipeDismissBehavior;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/material/behavior/SwipeDismissBehavior<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p0, 0x0

    const v0, 0x3dcccccd    # 0.1f

    const/high16 v1, 0x3f800000    # 1.0f

    .line 2
    invoke-static {p0, v0, v1}, Lcom/google/android/material/behavior/SwipeDismissBehavior;->clamp(FFF)F

    move-result v0

    iput v0, p1, Lcom/google/android/material/behavior/SwipeDismissBehavior;->alphaStartSwipeDistance:F

    const v0, 0x3f19999a    # 0.6f

    .line 3
    invoke-static {p0, v0, v1}, Lcom/google/android/material/behavior/SwipeDismissBehavior;->clamp(FFF)F

    move-result p0

    iput p0, p1, Lcom/google/android/material/behavior/SwipeDismissBehavior;->alphaEndSwipeDistance:F

    const/4 p0, 0x0

    .line 4
    iput p0, p1, Lcom/google/android/material/behavior/SwipeDismissBehavior;->swipeDirection:I

    return-void
.end method
