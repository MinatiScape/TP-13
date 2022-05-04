.class public Landroidx/recyclerview/R$attr;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static createCornerTreatment(I)Lcom/google/android/material/shape/CornerTreatment;
    .locals 1

    if-eqz p0, :cond_1

    const/4 v0, 0x1

    if-eq p0, v0, :cond_0

    .line 1
    new-instance p0, Lcom/google/android/material/shape/RoundedCornerTreatment;

    invoke-direct {p0}, Lcom/google/android/material/shape/RoundedCornerTreatment;-><init>()V

    return-object p0

    .line 2
    :cond_0
    new-instance p0, Lcom/google/android/material/shape/CutCornerTreatment;

    invoke-direct {p0}, Lcom/google/android/material/shape/CutCornerTreatment;-><init>()V

    return-object p0

    .line 3
    :cond_1
    new-instance p0, Lcom/google/android/material/shape/RoundedCornerTreatment;

    invoke-direct {p0}, Lcom/google/android/material/shape/RoundedCornerTreatment;-><init>()V

    return-object p0
.end method

.method public static createDefaultEdgeTreatment()Lcom/google/android/material/shape/EdgeTreatment;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/material/shape/EdgeTreatment;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/material/shape/EdgeTreatment;-><init>(I)V

    return-object v0
.end method

.method public static setElevation(Landroid/view/View;F)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    .line 2
    instance-of v0, p0, Lcom/google/android/material/shape/MaterialShapeDrawable;

    if-eqz v0, :cond_0

    .line 3
    check-cast p0, Lcom/google/android/material/shape/MaterialShapeDrawable;

    .line 4
    iget-object v0, p0, Lcom/google/android/material/shape/MaterialShapeDrawable;->drawableState:Lcom/google/android/material/shape/MaterialShapeDrawable$MaterialShapeDrawableState;

    iget v1, v0, Lcom/google/android/material/shape/MaterialShapeDrawable$MaterialShapeDrawableState;->elevation:F

    cmpl-float v1, v1, p1

    if-eqz v1, :cond_0

    .line 5
    iput p1, v0, Lcom/google/android/material/shape/MaterialShapeDrawable$MaterialShapeDrawableState;->elevation:F

    .line 6
    invoke-virtual {p0}, Lcom/google/android/material/shape/MaterialShapeDrawable;->updateZ()V

    :cond_0
    return-void
.end method

.method public static setParentAbsoluteElevation(Landroid/view/View;Lcom/google/android/material/shape/MaterialShapeDrawable;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/google/android/material/shape/MaterialShapeDrawable;->drawableState:Lcom/google/android/material/shape/MaterialShapeDrawable$MaterialShapeDrawableState;

    iget-object v0, v0, Lcom/google/android/material/shape/MaterialShapeDrawable$MaterialShapeDrawableState;->elevationOverlayProvider:Lcom/google/android/material/elevation/ElevationOverlayProvider;

    if-eqz v0, :cond_0

    .line 2
    iget-boolean v0, v0, Lcom/google/android/material/elevation/ElevationOverlayProvider;->elevationOverlayEnabled:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_2

    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    const/4 v0, 0x0

    .line 4
    :goto_1
    instance-of v1, p0, Landroid/view/View;

    if-eqz v1, :cond_1

    .line 5
    move-object v1, p0

    check-cast v1, Landroid/view/View;

    sget-object v2, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 6
    invoke-virtual {v1}, Landroid/view/View;->getElevation()F

    move-result v1

    add-float/2addr v0, v1

    .line 7
    invoke-interface {p0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    goto :goto_1

    .line 8
    :cond_1
    iget-object p0, p1, Lcom/google/android/material/shape/MaterialShapeDrawable;->drawableState:Lcom/google/android/material/shape/MaterialShapeDrawable$MaterialShapeDrawableState;

    iget v1, p0, Lcom/google/android/material/shape/MaterialShapeDrawable$MaterialShapeDrawableState;->parentAbsoluteElevation:F

    cmpl-float v1, v1, v0

    if-eqz v1, :cond_2

    .line 9
    iput v0, p0, Lcom/google/android/material/shape/MaterialShapeDrawable$MaterialShapeDrawableState;->parentAbsoluteElevation:F

    .line 10
    invoke-virtual {p1}, Lcom/google/android/material/shape/MaterialShapeDrawable;->updateZ()V

    :cond_2
    return-void
.end method
