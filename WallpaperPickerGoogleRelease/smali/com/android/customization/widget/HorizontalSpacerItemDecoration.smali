.class public Lcom/android/customization/widget/HorizontalSpacerItemDecoration;
.super Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;
.source "SourceFile"


# instance fields
.field public final mOffset:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;-><init>()V

    .line 2
    iput p1, p0, Lcom/android/customization/widget/HorizontalSpacerItemDecoration;->mOffset:I

    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
    .locals 0

    .line 1
    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result p2

    .line 2
    iget p4, p0, Lcom/android/customization/widget/HorizontalSpacerItemDecoration;->mOffset:I

    if-nez p2, :cond_0

    mul-int/lit8 p4, p4, 0x2

    .line 3
    :cond_0
    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p3

    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    move-result p3

    add-int/lit8 p3, p3, -0x1

    iget p0, p0, Lcom/android/customization/widget/HorizontalSpacerItemDecoration;->mOffset:I

    if-ne p2, p3, :cond_1

    mul-int/lit8 p0, p0, 0x2

    :cond_1
    const/4 p2, 0x0

    .line 4
    invoke-virtual {p1, p4, p2, p0, p2}, Landroid/graphics/Rect;->set(IIII)V

    return-void
.end method
