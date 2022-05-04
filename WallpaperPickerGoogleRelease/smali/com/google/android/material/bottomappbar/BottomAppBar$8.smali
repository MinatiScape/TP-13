.class public Lcom/google/android/material/bottomappbar/BottomAppBar$8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic this$0:Lcom/google/android/material/bottomappbar/BottomAppBar;

.field public final synthetic val$actionMenuView:Landroidx/appcompat/widget/ActionMenuView;

.field public final synthetic val$fabAlignmentMode:I

.field public final synthetic val$fabAttached:Z


# direct methods
.method public constructor <init>(Lcom/google/android/material/bottomappbar/BottomAppBar;Landroidx/appcompat/widget/ActionMenuView;IZ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$8;->this$0:Lcom/google/android/material/bottomappbar/BottomAppBar;

    iput-object p2, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$8;->val$actionMenuView:Landroidx/appcompat/widget/ActionMenuView;

    iput p3, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$8;->val$fabAlignmentMode:I

    iput-boolean p4, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$8;->val$fabAttached:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$8;->val$actionMenuView:Landroidx/appcompat/widget/ActionMenuView;

    iget-object v1, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$8;->this$0:Lcom/google/android/material/bottomappbar/BottomAppBar;

    iget v2, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$8;->val$fabAlignmentMode:I

    iget-boolean p0, p0, Lcom/google/android/material/bottomappbar/BottomAppBar$8;->val$fabAttached:Z

    .line 2
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne v2, v4, :cond_7

    if-nez p0, :cond_0

    goto :goto_5

    .line 3
    :cond_0
    invoke-static {v1}, Lcom/google/android/material/internal/ViewUtils;->isLayoutRtl(Landroid/view/View;)Z

    move-result p0

    if-eqz p0, :cond_1

    .line 4
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    move-result v2

    goto :goto_0

    :cond_1
    move v2, v3

    :goto_0
    move v5, v3

    .line 5
    :goto_1
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v6

    if-ge v5, v6, :cond_5

    .line 6
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 7
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    instance-of v7, v7, Landroidx/appcompat/widget/Toolbar$LayoutParams;

    if-eqz v7, :cond_2

    .line 8
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Landroidx/appcompat/widget/Toolbar$LayoutParams;

    iget v7, v7, Landroidx/appcompat/app/ActionBar$LayoutParams;->gravity:I

    const v8, 0x800007

    and-int/2addr v7, v8

    const v8, 0x800003

    if-ne v7, v8, :cond_2

    move v7, v4

    goto :goto_2

    :cond_2
    move v7, v3

    :goto_2
    if-eqz v7, :cond_4

    if-eqz p0, :cond_3

    .line 9
    invoke-virtual {v6}, Landroid/view/View;->getLeft()I

    move-result v6

    invoke-static {v2, v6}, Ljava/lang/Math;->min(II)I

    move-result v2

    goto :goto_3

    .line 10
    :cond_3
    invoke-virtual {v6}, Landroid/view/View;->getRight()I

    move-result v6

    invoke-static {v2, v6}, Ljava/lang/Math;->max(II)I

    move-result v2

    :cond_4
    :goto_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_5
    if-eqz p0, :cond_6

    .line 11
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getRight()I

    move-result p0

    goto :goto_4

    :cond_6
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLeft()I

    move-result p0

    :goto_4
    add-int/2addr p0, v3

    sub-int v3, v2, p0

    :cond_7
    :goto_5
    int-to-float p0, v3

    .line 12
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->setTranslationX(F)V

    return-void
.end method
