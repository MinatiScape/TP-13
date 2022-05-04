.class public Lcom/android/wallpaper/widget/SeparatedTabLayout$SeparatedTabLayoutOnTabSelectedListener;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/material/tabs/TabLayout$BaseOnTabSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/widget/SeparatedTabLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SeparatedTabLayoutOnTabSelectedListener"
.end annotation


# instance fields
.field public final mViewPagerRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroidx/viewpager2/widget/ViewPager2;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/viewpager2/widget/ViewPager2;Lcom/android/wallpaper/widget/SeparatedTabLayout$1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance p2, Ljava/lang/ref/WeakReference;

    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lcom/android/wallpaper/widget/SeparatedTabLayout$SeparatedTabLayoutOnTabSelectedListener;->mViewPagerRef:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public onTabReselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    return-void
.end method

.method public onTabSelected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/widget/SeparatedTabLayout$SeparatedTabLayoutOnTabSelectedListener;->mViewPagerRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroidx/viewpager2/widget/ViewPager2;

    if-eqz p0, :cond_0

    .line 2
    iget v0, p0, Landroidx/viewpager2/widget/ViewPager2;->mCurrentItem:I

    .line 3
    iget p1, p1, Lcom/google/android/material/tabs/TabLayout$Tab;->position:I

    if-eq v0, p1, :cond_0

    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, p1, v0}, Landroidx/viewpager2/widget/ViewPager2;->setCurrentItem(IZ)V

    :cond_0
    return-void
.end method

.method public onTabUnselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    return-void
.end method
