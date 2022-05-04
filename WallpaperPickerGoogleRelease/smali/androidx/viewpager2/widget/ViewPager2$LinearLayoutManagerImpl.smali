.class public Landroidx/viewpager2/widget/ViewPager2$LinearLayoutManagerImpl;
.super Landroidx/recyclerview/widget/LinearLayoutManager;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/viewpager2/widget/ViewPager2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "LinearLayoutManagerImpl"
.end annotation


# instance fields
.field public final synthetic this$0:Landroidx/viewpager2/widget/ViewPager2;


# direct methods
.method public constructor <init>(Landroidx/viewpager2/widget/ViewPager2;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/viewpager2/widget/ViewPager2$LinearLayoutManagerImpl;->this$0:Landroidx/viewpager2/widget/ViewPager2;

    const/4 p1, 0x1

    const/4 p2, 0x0

    .line 2
    invoke-direct {p0, p1, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(IZ)V

    return-void
.end method


# virtual methods
.method public calculateExtraLayoutSpace(Landroidx/recyclerview/widget/RecyclerView$State;[I)V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2$LinearLayoutManagerImpl;->this$0:Landroidx/viewpager2/widget/ViewPager2;

    .line 2
    iget v1, v0, Landroidx/viewpager2/widget/ViewPager2;->mOffscreenPageLimit:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 3
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->calculateExtraLayoutSpace(Landroidx/recyclerview/widget/RecyclerView$State;[I)V

    return-void

    .line 4
    :cond_0
    iget-object p0, v0, Landroidx/viewpager2/widget/ViewPager2;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    .line 5
    iget-object p1, v0, Landroidx/viewpager2/widget/ViewPager2;->mLayoutManager:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 6
    iget p1, p1, Landroidx/recyclerview/widget/LinearLayoutManager;->mOrientation:I

    if-nez p1, :cond_1

    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    move-result p1

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v0

    sub-int/2addr p1, v0

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result p0

    goto :goto_0

    .line 8
    :cond_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getHeight()I

    move-result p1

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v0

    sub-int/2addr p1, v0

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result p0

    :goto_0
    sub-int/2addr p1, p0

    mul-int/2addr p1, v1

    const/4 p0, 0x0

    .line 9
    aput p1, p2, p0

    const/4 p0, 0x1

    .line 10
    aput p1, p2, p0

    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->onInitializeAccessibilityNodeInfo(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;)V

    .line 2
    iget-object p0, p0, Landroidx/viewpager2/widget/ViewPager2$LinearLayoutManagerImpl;->this$0:Landroidx/viewpager2/widget/ViewPager2;

    iget-object p0, p0, Landroidx/viewpager2/widget/ViewPager2;->mAccessibilityProvider:Landroidx/viewpager2/widget/ViewPager2$AccessibilityProvider;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public onInitializeAccessibilityNodeInfoForItem(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;Landroid/view/View;Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;)V
    .locals 8

    .line 1
    iget-object p0, p0, Landroidx/viewpager2/widget/ViewPager2$LinearLayoutManagerImpl;->this$0:Landroidx/viewpager2/widget/ViewPager2;

    iget-object p0, p0, Landroidx/viewpager2/widget/ViewPager2;->mAccessibilityProvider:Landroidx/viewpager2/widget/ViewPager2$AccessibilityProvider;

    check-cast p0, Landroidx/viewpager2/widget/ViewPager2$PageAwareAccessibilityProvider;

    .line 2
    iget-object p1, p0, Landroidx/viewpager2/widget/ViewPager2$PageAwareAccessibilityProvider;->this$0:Landroidx/viewpager2/widget/ViewPager2;

    .line 3
    iget-object p1, p1, Landroidx/viewpager2/widget/ViewPager2;->mLayoutManager:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 4
    iget p2, p1, Landroidx/recyclerview/widget/LinearLayoutManager;->mOrientation:I

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p2, v0, :cond_0

    .line 5
    invoke-virtual {p1, p3}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getPosition(Landroid/view/View;)I

    move-result p1

    move v2, p1

    goto :goto_0

    :cond_0
    move v2, v1

    .line 6
    :goto_0
    iget-object p0, p0, Landroidx/viewpager2/widget/ViewPager2$PageAwareAccessibilityProvider;->this$0:Landroidx/viewpager2/widget/ViewPager2;

    .line 7
    iget-object p0, p0, Landroidx/viewpager2/widget/ViewPager2;->mLayoutManager:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 8
    iget p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->mOrientation:I

    if-nez p1, :cond_1

    .line 9
    invoke-virtual {p0, p3}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    :cond_1
    move v4, v1

    const/4 v3, 0x1

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 10
    invoke-static/range {v2 .. v7}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;->obtain(IIIIZZ)Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;

    move-result-object p0

    .line 11
    invoke-virtual {p4, p0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->setCollectionItemInfo(Ljava/lang/Object;)V

    return-void
.end method

.method public performAccessibilityAction(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;ILandroid/os/Bundle;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2$LinearLayoutManagerImpl;->this$0:Landroidx/viewpager2/widget/ViewPager2;

    iget-object v0, v0, Landroidx/viewpager2/widget/ViewPager2;->mAccessibilityProvider:Landroidx/viewpager2/widget/ViewPager2$AccessibilityProvider;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-super {p0, p1, p2, p3, p4}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->performAccessibilityAction(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;ILandroid/os/Bundle;)Z

    move-result p0

    return p0
.end method

.method public requestChildRectangleOnScreen(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;Landroid/graphics/Rect;ZZ)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method
