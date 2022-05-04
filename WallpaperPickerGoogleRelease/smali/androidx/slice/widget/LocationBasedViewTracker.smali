.class public Landroidx/slice/widget/LocationBasedViewTracker;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/slice/widget/LocationBasedViewTracker$SelectionLogic;
    }
.end annotation


# static fields
.field public static final A11Y_FOCUS:Landroidx/slice/widget/LocationBasedViewTracker$SelectionLogic;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation
.end field

.field public static final INPUT_FOCUS:Landroidx/slice/widget/LocationBasedViewTracker$SelectionLogic;


# instance fields
.field public final mFocusRect:Landroid/graphics/Rect;

.field public final mParent:Landroid/view/ViewGroup;

.field public final mSelectionLogic:Landroidx/slice/widget/LocationBasedViewTracker$SelectionLogic;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroidx/slice/widget/LocationBasedViewTracker$1;

    invoke-direct {v0}, Landroidx/slice/widget/LocationBasedViewTracker$1;-><init>()V

    sput-object v0, Landroidx/slice/widget/LocationBasedViewTracker;->INPUT_FOCUS:Landroidx/slice/widget/LocationBasedViewTracker$SelectionLogic;

    .line 2
    new-instance v0, Landroidx/slice/widget/LocationBasedViewTracker$2;

    invoke-direct {v0}, Landroidx/slice/widget/LocationBasedViewTracker$2;-><init>()V

    sput-object v0, Landroidx/slice/widget/LocationBasedViewTracker;->A11Y_FOCUS:Landroidx/slice/widget/LocationBasedViewTracker$SelectionLogic;

    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup;Landroid/view/View;Landroidx/slice/widget/LocationBasedViewTracker$SelectionLogic;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "parent",
            "selected",
            "selectionLogic"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroidx/slice/widget/LocationBasedViewTracker;->mFocusRect:Landroid/graphics/Rect;

    .line 3
    iput-object p1, p0, Landroidx/slice/widget/LocationBasedViewTracker;->mParent:Landroid/view/ViewGroup;

    .line 4
    iput-object p3, p0, Landroidx/slice/widget/LocationBasedViewTracker;->mSelectionLogic:Landroidx/slice/widget/LocationBasedViewTracker$SelectionLogic;

    .line 5
    invoke-virtual {p2, v0}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 6
    invoke-virtual {p1, p2, v0}, Landroid/view/ViewGroup;->offsetDescendantRectToMyCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 7
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 8
    invoke-virtual {p1}, Landroid/view/ViewGroup;->requestLayout()V

    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "v",
            "left",
            "top",
            "right",
            "bottom",
            "oldLeft",
            "oldTop",
            "oldRight",
            "oldBottom"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Landroidx/slice/widget/LocationBasedViewTracker;->mParent:Landroid/view/ViewGroup;

    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 2
    iget-object p1, p0, Landroidx/slice/widget/LocationBasedViewTracker;->mParent:Landroid/view/ViewGroup;

    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public run()V
    .locals 8

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2
    iget-object v1, p0, Landroidx/slice/widget/LocationBasedViewTracker;->mParent:Landroid/view/ViewGroup;

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v2, v3}, Landroid/view/ViewGroup;->addFocusables(Ljava/util/ArrayList;II)V

    .line 3
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 4
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const v2, 0x7fffffff

    const/4 v3, 0x0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    .line 5
    invoke-virtual {v4, v1}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 6
    iget-object v5, p0, Landroidx/slice/widget/LocationBasedViewTracker;->mParent:Landroid/view/ViewGroup;

    invoke-virtual {v5, v4, v1}, Landroid/view/ViewGroup;->offsetDescendantRectToMyCoords(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 7
    iget-object v5, p0, Landroidx/slice/widget/LocationBasedViewTracker;->mFocusRect:Landroid/graphics/Rect;

    invoke-virtual {v5, v1}, Landroid/graphics/Rect;->intersect(Landroid/graphics/Rect;)Z

    move-result v5

    if-nez v5, :cond_1

    goto :goto_0

    .line 8
    :cond_1
    iget-object v5, p0, Landroidx/slice/widget/LocationBasedViewTracker;->mFocusRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->left:I

    iget v6, v1, Landroid/graphics/Rect;->left:I

    sub-int/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    iget-object v6, p0, Landroidx/slice/widget/LocationBasedViewTracker;->mFocusRect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->right:I

    iget v7, v1, Landroid/graphics/Rect;->right:I

    sub-int/2addr v6, v7

    .line 9
    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result v6

    add-int/2addr v6, v5

    iget-object v5, p0, Landroidx/slice/widget/LocationBasedViewTracker;->mFocusRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->top:I

    iget v7, v1, Landroid/graphics/Rect;->top:I

    sub-int/2addr v5, v7

    .line 10
    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    add-int/2addr v5, v6

    iget-object v6, p0, Landroidx/slice/widget/LocationBasedViewTracker;->mFocusRect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    iget v7, v1, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v6, v7

    .line 11
    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result v6

    add-int/2addr v6, v5

    if-le v2, v6, :cond_0

    move-object v3, v4

    move v2, v6

    goto :goto_0

    :cond_2
    if-eqz v3, :cond_3

    .line 12
    iget-object p0, p0, Landroidx/slice/widget/LocationBasedViewTracker;->mSelectionLogic:Landroidx/slice/widget/LocationBasedViewTracker$SelectionLogic;

    invoke-interface {p0, v3}, Landroidx/slice/widget/LocationBasedViewTracker$SelectionLogic;->selectView(Landroid/view/View;)V

    :cond_3
    return-void
.end method
