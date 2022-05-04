.class public Lcom/android/wallpaper/widget/SeparatedTabLayout$SeparatedTabLayoutOnPageChangeCallback;
.super Landroidx/viewpager2/widget/ViewPager2$OnPageChangeCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/widget/SeparatedTabLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SeparatedTabLayoutOnPageChangeCallback"
.end annotation


# instance fields
.field public mPreviousScrollState:I

.field public mScrollState:I

.field public final mTabLayoutRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/google/android/material/tabs/TabLayout;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/material/tabs/TabLayout;Lcom/android/wallpaper/widget/SeparatedTabLayout$1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/viewpager2/widget/ViewPager2$OnPageChangeCallback;-><init>()V

    const/4 p2, 0x0

    .line 2
    iput p2, p0, Lcom/android/wallpaper/widget/SeparatedTabLayout$SeparatedTabLayoutOnPageChangeCallback;->mPreviousScrollState:I

    .line 3
    iput p2, p0, Lcom/android/wallpaper/widget/SeparatedTabLayout$SeparatedTabLayoutOnPageChangeCallback;->mScrollState:I

    .line 4
    new-instance p2, Ljava/lang/ref/WeakReference;

    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lcom/android/wallpaper/widget/SeparatedTabLayout$SeparatedTabLayoutOnPageChangeCallback;->mTabLayoutRef:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/wallpaper/widget/SeparatedTabLayout$SeparatedTabLayoutOnPageChangeCallback;->mScrollState:I

    iput v0, p0, Lcom/android/wallpaper/widget/SeparatedTabLayout$SeparatedTabLayoutOnPageChangeCallback;->mPreviousScrollState:I

    .line 2
    iput p1, p0, Lcom/android/wallpaper/widget/SeparatedTabLayout$SeparatedTabLayoutOnPageChangeCallback;->mScrollState:I

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 1

    const/4 p3, 0x0

    cmpl-float p2, p2, p3

    if-nez p2, :cond_1

    .line 1
    iget p2, p0, Lcom/android/wallpaper/widget/SeparatedTabLayout$SeparatedTabLayoutOnPageChangeCallback;->mPreviousScrollState:I

    const/4 p3, 0x1

    if-ne p2, p3, :cond_0

    iget p2, p0, Lcom/android/wallpaper/widget/SeparatedTabLayout$SeparatedTabLayoutOnPageChangeCallback;->mScrollState:I

    const/4 v0, 0x2

    if-ne p2, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    :goto_0
    if-eqz p3, :cond_1

    .line 2
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/widget/SeparatedTabLayout$SeparatedTabLayoutOnPageChangeCallback;->updateTabPositionIfNeeded(I)V

    :cond_1
    return-void
.end method

.method public onPageSelected(I)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/wallpaper/widget/SeparatedTabLayout$SeparatedTabLayoutOnPageChangeCallback;->mPreviousScrollState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/android/wallpaper/widget/SeparatedTabLayout$SeparatedTabLayoutOnPageChangeCallback;->mScrollState:I

    const/4 v2, 0x2

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_1

    return-void

    .line 2
    :cond_1
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/widget/SeparatedTabLayout$SeparatedTabLayoutOnPageChangeCallback;->updateTabPositionIfNeeded(I)V

    return-void
.end method

.method public final updateTabPositionIfNeeded(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/widget/SeparatedTabLayout$SeparatedTabLayoutOnPageChangeCallback;->mTabLayoutRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/material/tabs/TabLayout;

    if-eqz p0, :cond_0

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->getSelectedTabPosition()I

    move-result v0

    if-eq v0, p1, :cond_0

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 4
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/google/android/material/tabs/TabLayout;->selectTab(Lcom/google/android/material/tabs/TabLayout$Tab;Z)V

    :cond_0
    return-void
.end method
