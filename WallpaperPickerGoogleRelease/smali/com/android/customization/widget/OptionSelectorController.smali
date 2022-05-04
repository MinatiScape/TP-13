.class public Lcom/android/customization/widget/OptionSelectorController;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/customization/widget/OptionSelectorController$ItemEndHorizontalSpaceItemDecoration;,
        Lcom/android/customization/widget/OptionSelectorController$OptionSelectorAccessibilityDelegate;,
        Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;,
        Lcom/android/customization/widget/OptionSelectorController$OptionSelectedListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/android/customization/model/CustomizationOption<",
        "TT;>;>",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
            "Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;",
            ">;"
        }
    .end annotation
.end field

.field public mAppliedOption:Lcom/android/customization/model/CustomizationOption;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public final mCheckmarkStyle:I

.field public final mContainer:Landroidx/recyclerview/widget/RecyclerView;

.field public final mListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/android/customization/widget/OptionSelectorController$OptionSelectedListener;",
            ">;"
        }
    .end annotation
.end field

.field public final mOptions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation
.end field

.field public mSelectedOption:Lcom/android/customization/model/CustomizationOption;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public final mUseGrid:Z


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Ljava/util/List;ZI)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/recyclerview/widget/RecyclerView;",
            "Ljava/util/List<",
            "TT;>;ZI)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/android/customization/widget/OptionSelectorController;->mListeners:Ljava/util/Set;

    .line 3
    iput-object p1, p0, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    .line 4
    iput-object p2, p0, Lcom/android/customization/widget/OptionSelectorController;->mOptions:Ljava/util/List;

    .line 5
    iput-boolean p3, p0, Lcom/android/customization/widget/OptionSelectorController;->mUseGrid:Z

    .line 6
    iput p4, p0, Lcom/android/customization/widget/OptionSelectorController;->mCheckmarkStyle:I

    return-void
.end method


# virtual methods
.method public initOptions(Lcom/android/customization/model/CustomizationManager;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/customization/model/CustomizationManager<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v1, Lcom/android/customization/widget/OptionSelectorController$OptionSelectorAccessibilityDelegate;

    iget-object v2, p0, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    invoke-direct {v1, p0, v2}, Lcom/android/customization/widget/OptionSelectorController$OptionSelectorAccessibilityDelegate;-><init>(Lcom/android/customization/widget/OptionSelectorController;Landroidx/recyclerview/widget/RecyclerView;)V

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAccessibilityDelegateCompat(Landroidx/recyclerview/widget/RecyclerViewAccessibilityDelegate;)V

    .line 2
    new-instance v0, Lcom/android/customization/widget/OptionSelectorController$1;

    invoke-direct {v0, p0, p1}, Lcom/android/customization/widget/OptionSelectorController$1;-><init>(Lcom/android/customization/widget/OptionSelectorController;Lcom/android/customization/model/CustomizationManager;)V

    iput-object v0, p0, Lcom/android/customization/widget/OptionSelectorController;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 3
    iget-object p1, p0, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    .line 4
    iget-boolean v0, p0, Lcom/android/customization/widget/OptionSelectorController;->mUseGrid:Z

    const v1, 0x7f0b001b

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 5
    iget-object v0, p0, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v3, Landroidx/recyclerview/widget/GridLayoutManager;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v4

    .line 6
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v5

    invoke-direct {v3, v4, v5}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 7
    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v3, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    invoke-direct {v3, v2, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(IZ)V

    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 9
    :goto_0
    iget-object v0, p0, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v3, p0, Lcom/android/customization/widget/OptionSelectorController;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 10
    iget-object v0, p0, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v2, v2}, Landroid/view/ViewGroup;->measure(II)V

    const v0, 0x7f07022f

    .line 11
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    if-nez v0, :cond_1

    .line 12
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 13
    iget-object v2, p0, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Landroid/view/WindowManager;

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/WindowManager;

    .line 14
    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 15
    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 16
    :cond_1
    iget-object v2, p0, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    move-result v2

    const v3, 0x7f07022b

    .line 17
    invoke-virtual {p1, v3}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v3

    .line 18
    iget-boolean v4, p0, Lcom/android/customization/widget/OptionSelectorController;->mUseGrid:Z

    if-eqz v4, :cond_4

    .line 19
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    :goto_1
    mul-int v1, v3, p1

    sub-int v1, v0, v1

    if-gez v1, :cond_2

    add-int/lit8 p1, p1, -0x1

    goto :goto_1

    .line 20
    :cond_2
    iget-object v0, p0, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 21
    iget-object p0, p0, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object p0

    check-cast p0, Landroidx/recyclerview/widget/GridLayoutManager;

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/GridLayoutManager;->setSpanCount(I)V

    :cond_3
    return-void

    :cond_4
    sub-int v1, v0, v2

    const/4 v2, 0x2

    if-ltz v1, :cond_5

    .line 22
    iget-object v4, p0, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->setOverScrollMode(I)V

    .line 23
    :cond_5
    iget-object v4, p0, Lcom/android/customization/widget/OptionSelectorController;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {v4}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v4

    int-to-float v4, v4

    const v5, 0x408b3333    # 4.35f

    cmpl-float v4, v4, v5

    if-ltz v4, :cond_7

    int-to-float v1, v3

    mul-float/2addr v1, v5

    .line 24
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    sub-int/2addr v0, v1

    iget-object v1, p0, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    .line 25
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v1

    sub-int/2addr v0, v1

    .line 26
    div-int/lit8 v0, v0, 0x4

    if-gtz v0, :cond_6

    const v0, 0x7f070227

    .line 27
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v0

    .line 28
    :cond_6
    iget-object p0, p0, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    new-instance p1, Lcom/android/customization/widget/OptionSelectorController$ItemEndHorizontalSpaceItemDecoration;

    .line 29
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {p1, v1, v0, v2}, Lcom/android/customization/widget/OptionSelectorController$ItemEndHorizontalSpaceItemDecoration;-><init>(Landroid/content/Context;ILcom/android/customization/widget/OptionSelectorController$1;)V

    .line 30
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    return-void

    .line 31
    :cond_7
    iget-object p1, p0, Lcom/android/customization/widget/OptionSelectorController;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    div-int/2addr v1, p1

    .line 32
    div-int/2addr v1, v2

    .line 33
    iget-object p0, p0, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    new-instance p1, Lcom/android/customization/widget/HorizontalSpacerItemDecoration;

    invoke-direct {p1, v1}, Lcom/android/customization/widget/HorizontalSpacerItemDecoration;-><init>(I)V

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    return-void
.end method

.method public setSelectedOption(Lcom/android/customization/model/CustomizationOption;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/customization/widget/OptionSelectorController;->mOptions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2
    iget-object v0, p0, Lcom/android/customization/widget/OptionSelectorController;->mSelectedOption:Lcom/android/customization/model/CustomizationOption;

    .line 3
    iput-object p1, p0, Lcom/android/customization/widget/OptionSelectorController;->mSelectedOption:Lcom/android/customization/model/CustomizationOption;

    .line 4
    iget-object v1, p0, Lcom/android/customization/widget/OptionSelectorController;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    iget-object v2, p0, Lcom/android/customization/widget/OptionSelectorController;->mOptions:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p1

    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    if-eqz v0, :cond_0

    .line 5
    iget-object p1, p0, Lcom/android/customization/widget/OptionSelectorController;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    iget-object v1, p0, Lcom/android/customization/widget/OptionSelectorController;->mOptions:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 6
    :cond_0
    iget-object p1, p0, Lcom/android/customization/widget/OptionSelectorController;->mListeners:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_1

    .line 7
    :cond_1
    iget-object p1, p0, Lcom/android/customization/widget/OptionSelectorController;->mSelectedOption:Lcom/android/customization/model/CustomizationOption;

    .line 8
    new-instance v0, Ljava/util/HashSet;

    iget-object p0, p0, Lcom/android/customization/widget/OptionSelectorController;->mListeners:Ljava/util/Set;

    invoke-direct {v0, p0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 9
    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/customization/widget/OptionSelectorController$OptionSelectedListener;

    .line 10
    invoke-interface {v0, p1}, Lcom/android/customization/widget/OptionSelectorController$OptionSelectedListener;->onOptionSelected(Lcom/android/customization/model/CustomizationOption;)V

    goto :goto_0

    :cond_2
    :goto_1
    return-void

    .line 11
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Invalid option"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
