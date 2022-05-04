.class public Lcom/android/wallpaper/widget/PreviewPager$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/widget/PreviewPager;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/widget/PreviewPager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/widget/PreviewPager$4;->this$0:Lcom/android/wallpaper/widget/PreviewPager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/widget/PreviewPager$4;->this$0:Lcom/android/wallpaper/widget/PreviewPager;

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/widget/PreviewPager;->mExternalPageListener:Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;

    if-eqz p0, :cond_0

    .line 3
    invoke-interface {p0, p1}, Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;->onPageScrollStateChanged(I)V

    :cond_0
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 2

    int-to-float v0, p1

    add-float/2addr v0, p2

    const/high16 v1, 0x42c80000    # 100.0f

    mul-float/2addr v0, v1

    .line 1
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v1

    .line 2
    iget-object v1, p0, Lcom/android/wallpaper/widget/PreviewPager$4;->this$0:Lcom/android/wallpaper/widget/PreviewPager;

    .line 3
    iget-object v1, v1, Lcom/android/wallpaper/widget/PreviewPager;->mPageIndicator:Lcom/android/wallpaper/widget/PageIndicator;

    .line 4
    invoke-virtual {v1, v0}, Lcom/android/wallpaper/widget/PageIndicator;->setLocation(F)V

    .line 5
    iget-object p0, p0, Lcom/android/wallpaper/widget/PreviewPager$4;->this$0:Lcom/android/wallpaper/widget/PreviewPager;

    .line 6
    iget-object p0, p0, Lcom/android/wallpaper/widget/PreviewPager;->mExternalPageListener:Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;

    if-eqz p0, :cond_0

    .line 7
    invoke-interface {p0, p1, p2, p3}, Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;->onPageScrolled(IFI)V

    :cond_0
    return-void
.end method

.method public onPageSelected(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/widget/PreviewPager$4;->this$0:Lcom/android/wallpaper/widget/PreviewPager;

    .line 2
    iget-object v0, v0, Lcom/android/wallpaper/widget/PreviewPager;->mAdapter:Landroidx/viewpager/widget/PagerAdapter;

    .line 3
    invoke-virtual {v0}, Landroidx/viewpager/widget/PagerAdapter;->getCount()I

    move-result v0

    if-ltz p1, :cond_1

    if-lt p1, v0, :cond_0

    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/widget/PreviewPager$4;->this$0:Lcom/android/wallpaper/widget/PreviewPager;

    .line 5
    invoke-virtual {v0, p1}, Lcom/android/wallpaper/widget/PreviewPager;->updateIndicator(I)V

    .line 6
    iget-object p0, p0, Lcom/android/wallpaper/widget/PreviewPager$4;->this$0:Lcom/android/wallpaper/widget/PreviewPager;

    .line 7
    iget-object p0, p0, Lcom/android/wallpaper/widget/PreviewPager;->mExternalPageListener:Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;

    if-eqz p0, :cond_1

    .line 8
    invoke-interface {p0, p1}, Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;->onPageSelected(I)V

    :cond_1
    :goto_0
    return-void
.end method
