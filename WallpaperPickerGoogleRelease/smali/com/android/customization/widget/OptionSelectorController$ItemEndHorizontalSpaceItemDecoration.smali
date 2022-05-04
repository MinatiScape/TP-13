.class public final Lcom/android/customization/widget/OptionSelectorController$ItemEndHorizontalSpaceItemDecoration;
.super Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/customization/widget/OptionSelectorController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ItemEndHorizontalSpaceItemDecoration"
.end annotation


# instance fields
.field public final mDirectionLTR:Z

.field public final mHorizontalSpacePx:I


# direct methods
.method public constructor <init>(Landroid/content/Context;ILcom/android/customization/widget/OptionSelectorController$1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;-><init>()V

    .line 2
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/android/customization/widget/OptionSelectorController$ItemEndHorizontalSpaceItemDecoration;->mDirectionLTR:Z

    .line 3
    iput p2, p0, Lcom/android/customization/widget/OptionSelectorController$ItemEndHorizontalSpaceItemDecoration;->mHorizontalSpacePx:I

    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
    .locals 0

    .line 1
    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p4

    if-nez p4, :cond_0

    return-void

    .line 2
    :cond_0
    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result p2

    .line 3
    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p3

    invoke-static {p3}, Lcom/android/internal/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    move-result p3

    add-int/lit8 p3, p3, -0x1

    if-eq p2, p3, :cond_2

    .line 4
    iget-boolean p2, p0, Lcom/android/customization/widget/OptionSelectorController$ItemEndHorizontalSpaceItemDecoration;->mDirectionLTR:Z

    if-eqz p2, :cond_1

    .line 5
    iget p0, p0, Lcom/android/customization/widget/OptionSelectorController$ItemEndHorizontalSpaceItemDecoration;->mHorizontalSpacePx:I

    iput p0, p1, Landroid/graphics/Rect;->right:I

    goto :goto_0

    .line 6
    :cond_1
    iget p0, p0, Lcom/android/customization/widget/OptionSelectorController$ItemEndHorizontalSpaceItemDecoration;->mHorizontalSpacePx:I

    iput p0, p1, Landroid/graphics/Rect;->left:I

    :cond_2
    :goto_0
    return-void
.end method
