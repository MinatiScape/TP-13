.class public final Lcom/android/wallpaper/picker/WallpaperSectionView;
.super Lcom/android/wallpaper/picker/SectionView;
.source "SourceFile"


# instance fields
.field public mHomePreviewCard:Landroidx/cardview/widget/CardView;

.field public mLockscreenPreviewCard:Landroidx/cardview/widget/CardView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/wallpaper/picker/SectionView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final matchDeviceShape(Landroidx/cardview/widget/CardView;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getInstance()Lcom/android/wallpaper/util/ScreenSizeCalculator;

    move-result-object v0

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getScreenAspectRatio(Landroid/content/Context;)F

    move-result v0

    .line 2
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    move-result v1

    int-to-float v2, v1

    mul-float/2addr v2, v0

    float-to-int v0, v2

    .line 3
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 4
    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 5
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Landroid/app/Activity;

    invoke-static {p0, v1}, Lcom/android/wallpaper/util/SizeCalculator;->getPreviewCornerRadius(Landroid/app/Activity;I)F

    move-result p0

    .line 6
    invoke-virtual {p1, p0}, Landroidx/cardview/widget/CardView;->setRadius(F)V

    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    const v0, 0x7f0a011a

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/cardview/widget/CardView;

    iput-object v0, p0, Lcom/android/wallpaper/picker/WallpaperSectionView;->mHomePreviewCard:Landroidx/cardview/widget/CardView;

    const v0, 0x7f0a013d

    .line 3
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/cardview/widget/CardView;

    iput-object v0, p0, Lcom/android/wallpaper/picker/WallpaperSectionView;->mLockscreenPreviewCard:Landroidx/cardview/widget/CardView;

    .line 4
    iget-object v0, p0, Lcom/android/wallpaper/picker/WallpaperSectionView;->mHomePreviewCard:Landroidx/cardview/widget/CardView;

    .line 5
    iget-object v0, v0, Landroidx/cardview/widget/CardView;->mCardViewDelegate:Landroidx/cardview/widget/CardViewDelegate;

    .line 6
    check-cast v0, Landroidx/cardview/widget/CardView$1;

    .line 7
    iget-object v0, v0, Landroidx/cardview/widget/CardView$1;->this$0:Landroidx/cardview/widget/CardView;

    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setElevation(F)V

    .line 9
    iget-object p0, p0, Lcom/android/wallpaper/picker/WallpaperSectionView;->mLockscreenPreviewCard:Landroidx/cardview/widget/CardView;

    .line 10
    iget-object p0, p0, Landroidx/cardview/widget/CardView;->mCardViewDelegate:Landroidx/cardview/widget/CardViewDelegate;

    .line 11
    check-cast p0, Landroidx/cardview/widget/CardView$1;

    .line 12
    iget-object p0, p0, Landroidx/cardview/widget/CardView$1;->this$0:Landroidx/cardview/widget/CardView;

    .line 13
    invoke-virtual {p0, v1}, Landroid/view/View;->setElevation(F)V

    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/picker/WallpaperSectionView;->mHomePreviewCard:Landroidx/cardview/widget/CardView;

    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/WallpaperSectionView;->matchDeviceShape(Landroidx/cardview/widget/CardView;)V

    .line 3
    iget-object p1, p0, Lcom/android/wallpaper/picker/WallpaperSectionView;->mLockscreenPreviewCard:Landroidx/cardview/widget/CardView;

    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/WallpaperSectionView;->matchDeviceShape(Landroidx/cardview/widget/CardView;)V

    return-void
.end method
