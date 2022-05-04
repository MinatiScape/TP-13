.class public final Lcom/google/android/material/internal/ViewUtils$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/core/view/OnApplyWindowInsetsListener;


# instance fields
.field public final synthetic val$initialPadding:Lcom/google/android/material/internal/ViewUtils$RelativePadding;

.field public final synthetic val$listener:Lcom/google/android/material/internal/ViewUtils$OnApplyWindowInsetsListener;


# direct methods
.method public constructor <init>(Lcom/google/android/material/internal/ViewUtils$OnApplyWindowInsetsListener;Lcom/google/android/material/internal/ViewUtils$RelativePadding;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/internal/ViewUtils$3;->val$listener:Lcom/google/android/material/internal/ViewUtils$OnApplyWindowInsetsListener;

    iput-object p2, p0, Lcom/google/android/material/internal/ViewUtils$3;->val$initialPadding:Lcom/google/android/material/internal/ViewUtils$RelativePadding;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onApplyWindowInsets(Landroid/view/View;Landroidx/core/view/WindowInsetsCompat;)Landroidx/core/view/WindowInsetsCompat;
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/google/android/material/internal/ViewUtils$3;->val$listener:Lcom/google/android/material/internal/ViewUtils$OnApplyWindowInsetsListener;

    iget-object p0, p0, Lcom/google/android/material/internal/ViewUtils$3;->val$initialPadding:Lcom/google/android/material/internal/ViewUtils$RelativePadding;

    .line 2
    iget v1, p0, Lcom/google/android/material/internal/ViewUtils$RelativePadding;->start:I

    .line 3
    iget v2, p0, Lcom/google/android/material/internal/ViewUtils$RelativePadding;->end:I

    .line 4
    iget p0, p0, Lcom/google/android/material/internal/ViewUtils$RelativePadding;->bottom:I

    .line 5
    check-cast v0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$4;

    .line 6
    iget-object v3, v0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$4;->this$0:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    invoke-virtual {p2}, Landroidx/core/view/WindowInsetsCompat;->getSystemWindowInsetTop()I

    move-result v4

    .line 7
    iput v4, v3, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->insetTop:I

    .line 8
    invoke-static {p1}, Lcom/google/android/material/internal/ViewUtils;->isLayoutRtl(Landroid/view/View;)Z

    move-result v3

    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    move-result v4

    .line 10
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result v5

    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    move-result v6

    .line 12
    iget-object v7, v0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$4;->this$0:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 13
    iget-boolean v8, v7, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->paddingBottomSystemWindowInsets:Z

    if-eqz v8, :cond_0

    .line 14
    invoke-virtual {p2}, Landroidx/core/view/WindowInsetsCompat;->getSystemWindowInsetBottom()I

    move-result v4

    .line 15
    iput v4, v7, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->insetBottom:I

    .line 16
    iget-object v4, v0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$4;->this$0:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 17
    iget v4, v4, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->insetBottom:I

    add-int/2addr v4, p0

    .line 18
    :cond_0
    iget-object p0, v0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$4;->this$0:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 19
    iget-boolean p0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->paddingLeftSystemWindowInsets:Z

    if-eqz p0, :cond_2

    if-eqz v3, :cond_1

    move p0, v2

    goto :goto_0

    :cond_1
    move p0, v1

    .line 20
    :goto_0
    invoke-virtual {p2}, Landroidx/core/view/WindowInsetsCompat;->getSystemWindowInsetLeft()I

    move-result v5

    add-int/2addr v5, p0

    .line 21
    :cond_2
    iget-object p0, v0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$4;->this$0:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 22
    iget-boolean p0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->paddingRightSystemWindowInsets:Z

    if-eqz p0, :cond_4

    if-eqz v3, :cond_3

    goto :goto_1

    :cond_3
    move v1, v2

    .line 23
    :goto_1
    invoke-virtual {p2}, Landroidx/core/view/WindowInsetsCompat;->getSystemWindowInsetRight()I

    move-result p0

    add-int v6, p0, v1

    .line 24
    :cond_4
    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    move-result p0

    invoke-virtual {p1, v5, p0, v6, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 25
    iget-boolean p0, v0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$4;->val$shouldHandleGestureInsets:Z

    if-eqz p0, :cond_5

    .line 26
    iget-object p0, v0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$4;->this$0:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 27
    iget-object p1, p2, Landroidx/core/view/WindowInsetsCompat;->mImpl:Landroidx/core/view/WindowInsetsCompat$Impl;

    invoke-virtual {p1}, Landroidx/core/view/WindowInsetsCompat$Impl;->getMandatorySystemGestureInsets()Landroidx/core/graphics/Insets;

    move-result-object p1

    .line 28
    iget p1, p1, Landroidx/core/graphics/Insets;->bottom:I

    .line 29
    iput p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->gestureInsetBottom:I

    .line 30
    :cond_5
    iget-object p0, v0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$4;->this$0:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 31
    iget-boolean p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->paddingBottomSystemWindowInsets:Z

    if-nez p1, :cond_6

    .line 32
    iget-boolean p1, v0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$4;->val$shouldHandleGestureInsets:Z

    if-eqz p1, :cond_7

    :cond_6
    const/4 p1, 0x0

    .line 33
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->updatePeekHeight(Z)V

    :cond_7
    return-object p2
.end method
