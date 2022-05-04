.class public Lcom/android/customization/widget/OptionSelectorController$OptionSelectorAccessibilityDelegate;
.super Landroidx/recyclerview/widget/RecyclerViewAccessibilityDelegate;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/customization/widget/OptionSelectorController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "OptionSelectorAccessibilityDelegate"
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/customization/widget/OptionSelectorController;


# direct methods
.method public constructor <init>(Lcom/android/customization/widget/OptionSelectorController;Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/customization/widget/OptionSelectorController$OptionSelectorAccessibilityDelegate;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 2
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerViewAccessibilityDelegate;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method


# virtual methods
.method public onRequestSendAccessibilityEvent(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/customization/widget/OptionSelectorController$OptionSelectorAccessibilityDelegate;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 2
    iget-object v0, v0, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    .line 3
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/customization/widget/OptionSelectorController$OptionSelectorAccessibilityDelegate;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 4
    iget-object v0, v0, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    .line 5
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->canScrollHorizontally()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 6
    invoke-virtual {p3}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    move-result v0

    const v1, 0x8000

    if-ne v0, v1, :cond_3

    .line 7
    iget-object v0, p0, Lcom/android/customization/widget/OptionSelectorController$OptionSelectorAccessibilityDelegate;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 8
    iget-object v0, v0, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    .line 9
    invoke-virtual {v0, p2}, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I

    move-result v0

    .line 10
    iget-object v1, p0, Lcom/android/customization/widget/OptionSelectorController$OptionSelectorAccessibilityDelegate;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 11
    iget-object v1, v1, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    .line 12
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f07022b

    .line 13
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v1

    .line 14
    iget-object v2, p0, Lcom/android/customization/widget/OptionSelectorController$OptionSelectorAccessibilityDelegate;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 15
    iget-object v2, v2, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    .line 16
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f070227

    .line 17
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v2

    mul-int/lit8 v2, v2, 0x2

    add-int/2addr v2, v1

    .line 18
    iget-object v1, p0, Lcom/android/customization/widget/OptionSelectorController$OptionSelectorAccessibilityDelegate;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 19
    iget-object v1, v1, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    .line 20
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v1

    check-cast v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 21
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result v3

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    const/4 v5, -0x1

    const/4 v6, 0x0

    invoke-virtual {v1, v3, v5, v4, v6}, Landroidx/recyclerview/widget/LinearLayoutManager;->findOneVisibleChild(IIZZ)Landroid/view/View;

    move-result-object v3

    if-nez v3, :cond_0

    move v1, v5

    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {v1, v3}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    :goto_0
    if-lt v0, v1, :cond_1

    .line 23
    iget-object v0, p0, Lcom/android/customization/widget/OptionSelectorController$OptionSelectorAccessibilityDelegate;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 24
    iget-object v0, v0, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    .line 25
    invoke-virtual {v0, v2, v6}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    goto :goto_2

    .line 26
    :cond_1
    iget-object v1, p0, Lcom/android/customization/widget/OptionSelectorController$OptionSelectorAccessibilityDelegate;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 27
    iget-object v1, v1, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    .line 28
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v1

    check-cast v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 29
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result v3

    invoke-virtual {v1, v6, v3, v4, v6}, Landroidx/recyclerview/widget/LinearLayoutManager;->findOneVisibleChild(IIZZ)Landroid/view/View;

    move-result-object v3

    if-nez v3, :cond_2

    goto :goto_1

    .line 30
    :cond_2
    invoke-virtual {v1, v3}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v5

    :goto_1
    if-gt v0, v5, :cond_3

    if-eqz v0, :cond_3

    .line 31
    iget-object v0, p0, Lcom/android/customization/widget/OptionSelectorController$OptionSelectorAccessibilityDelegate;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 32
    iget-object v0, v0, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    neg-int v1, v2

    .line 33
    invoke-virtual {v0, v1, v6}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    .line 34
    :cond_3
    :goto_2
    iget-object p0, p0, Landroidx/core/view/AccessibilityDelegateCompat;->mOriginalDelegate:Landroid/view/View$AccessibilityDelegate;

    invoke-virtual {p0, p1, p2, p3}, Landroid/view/View$AccessibilityDelegate;->onRequestSendAccessibilityEvent(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result p0

    return p0
.end method
