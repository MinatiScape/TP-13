.class public Lcom/android/wallpaper/widget/LockScreenPreviewer$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/widget/LockScreenPreviewer;-><init>(Landroidx/lifecycle/Lifecycle;Landroid/content/Context;Landroid/view/ViewGroup;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic val$contentView:Landroid/view/View;

.field public final synthetic val$directionLTR:Z

.field public final synthetic val$previewContainer:Landroid/view/ViewGroup;

.field public final synthetic val$rootView:Landroid/view/View;

.field public final synthetic val$screenSize:Landroid/graphics/Point;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/widget/LockScreenPreviewer;Landroid/view/ViewGroup;Landroid/view/View;Landroid/graphics/Point;ZLandroid/view/View;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer$1;->val$previewContainer:Landroid/view/ViewGroup;

    iput-object p3, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer$1;->val$contentView:Landroid/view/View;

    iput-object p4, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer$1;->val$screenSize:Landroid/graphics/Point;

    iput-boolean p5, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer$1;->val$directionLTR:Z

    iput-object p6, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer$1;->val$rootView:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer$1;->val$previewContainer:Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    move-result p1

    .line 2
    iget-object p2, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer$1;->val$previewContainer:Landroid/view/ViewGroup;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    move-result p2

    .line 3
    iget-object p3, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer$1;->val$contentView:Landroid/view/View;

    iget-object p4, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer$1;->val$screenSize:Landroid/graphics/Point;

    iget p4, p4, Landroid/graphics/Point;->x:I

    const/high16 p5, 0x40000000    # 2.0f

    .line 4
    invoke-static {p4, p5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p4

    iget-object p6, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer$1;->val$screenSize:Landroid/graphics/Point;

    iget p6, p6, Landroid/graphics/Point;->y:I

    .line 5
    invoke-static {p6, p5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p5

    .line 6
    invoke-virtual {p3, p4, p5}, Landroid/view/View;->measure(II)V

    .line 7
    iget-object p3, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer$1;->val$contentView:Landroid/view/View;

    iget-object p4, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer$1;->val$screenSize:Landroid/graphics/Point;

    iget p5, p4, Landroid/graphics/Point;->x:I

    iget p4, p4, Landroid/graphics/Point;->y:I

    const/4 p6, 0x0

    invoke-virtual {p3, p6, p6, p5, p4}, Landroid/view/View;->layout(IIII)V

    if-lez p1, :cond_0

    int-to-float p1, p1

    .line 8
    iget-object p2, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer$1;->val$screenSize:Landroid/graphics/Point;

    iget p2, p2, Landroid/graphics/Point;->y:I

    goto :goto_0

    :cond_0
    int-to-float p1, p2

    .line 9
    iget-object p2, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer$1;->val$screenSize:Landroid/graphics/Point;

    iget p2, p2, Landroid/graphics/Point;->x:I

    :goto_0
    int-to-float p2, p2

    div-float/2addr p1, p2

    .line 10
    iget-object p2, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer$1;->val$contentView:Landroid/view/View;

    invoke-virtual {p2, p1}, Landroid/view/View;->setScaleX(F)V

    .line 11
    iget-object p2, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer$1;->val$contentView:Landroid/view/View;

    invoke-virtual {p2, p1}, Landroid/view/View;->setScaleY(F)V

    .line 12
    iget-object p1, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer$1;->val$contentView:Landroid/view/View;

    iget-boolean p2, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer$1;->val$directionLTR:Z

    const/4 p3, 0x0

    if-eqz p2, :cond_1

    move p2, p3

    goto :goto_1

    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result p2

    int-to-float p2, p2

    :goto_1
    invoke-virtual {p1, p2}, Landroid/view/View;->setPivotX(F)V

    .line 13
    iget-object p1, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer$1;->val$contentView:Landroid/view/View;

    invoke-virtual {p1, p3}, Landroid/view/View;->setPivotY(F)V

    .line 14
    iget-object p1, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer$1;->val$previewContainer:Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 15
    iget-object p1, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer$1;->val$previewContainer:Landroid/view/ViewGroup;

    iget-object p2, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer$1;->val$contentView:Landroid/view/View;

    .line 16
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidth()I

    move-result p3

    iget-object p4, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer$1;->val$contentView:Landroid/view/View;

    .line 17
    invoke-virtual {p4}, Landroid/view/View;->getMeasuredHeight()I

    move-result p4

    .line 18
    invoke-virtual {p1, p2, p3, p4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 19
    iget-object p1, p0, Lcom/android/wallpaper/widget/LockScreenPreviewer$1;->val$rootView:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    return-void
.end method
