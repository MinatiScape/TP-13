.class public Lcom/android/wallpaper/widget/PreviewPager;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/widget/PreviewPager$PreviewPagerScroller;
    }
.end annotation


# static fields
.field public static final synthetic $r8$clinit:I


# instance fields
.field public mAdapter:Landroidx/viewpager/widget/PagerAdapter;

.field public mExternalPageListener:Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;

.field public final mNextArrow:Landroid/view/View;

.field public final mPageIndicator:Lcom/android/wallpaper/widget/PageIndicator;

.field public final mPageListener:Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;

.field public mPageStyle:I

.field public final mPreviousArrow:Landroid/view/View;

.field public mScreenAspectRatio:F

.field public final mViewPager:Landroidx/viewpager/widget/ViewPager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/android/wallpaper/widget/PreviewPager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/android/wallpaper/widget/PreviewPager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 7

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0d00c7

    invoke-virtual {v0, v1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 6
    sget-object v1, Lcom/android/wallpaper/R$styleable;->PreviewPager:[I

    const/4 v2, 0x0

    invoke-virtual {p1, p2, v1, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 7
    invoke-virtual {p2, v2, v2}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result p3

    iput p3, p0, Lcom/android/wallpaper/widget/PreviewPager;->mPageStyle:I

    .line 8
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    const p2, 0x7f0a01bd

    .line 9
    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroidx/viewpager/widget/ViewPager;

    iput-object p2, p0, Lcom/android/wallpaper/widget/PreviewPager;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    .line 10
    new-instance p3, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;

    invoke-direct {p3, p0}, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/widget/PreviewPager;)V

    invoke-virtual {p2, v2, p3, v2}, Landroidx/viewpager/widget/ViewPager;->setPageTransformer(ZLandroidx/viewpager/widget/ViewPager$PageTransformer;I)V

    const p3, 0x7f070243

    .line 11
    invoke-virtual {v0, p3}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result p3

    invoke-virtual {p2, p3}, Landroidx/viewpager/widget/ViewPager;->setPageMargin(I)V

    .line 12
    invoke-virtual {p2, v2}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 13
    iget p3, p0, Lcom/android/wallpaper/widget/PreviewPager;->mPageStyle:I

    const v1, 0x7f070242

    const v3, 0x7f070245

    const/4 v4, 0x1

    if-nez p3, :cond_0

    .line 14
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    invoke-virtual {p3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p3

    iget p3, p3, Landroid/util/DisplayMetrics;->widthPixels:I

    const v5, 0x7f070244

    .line 15
    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v5

    .line 16
    div-int/lit8 p3, p3, 0x8

    invoke-static {v5, p3}, Ljava/lang/Math;->max(II)I

    move-result p3

    .line 17
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v3

    .line 18
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v0

    .line 19
    invoke-virtual {p2, p3, v3, p3, v0}, Landroid/view/ViewGroup;->setPadding(IIII)V

    goto :goto_0

    :cond_0
    if-ne p3, v4, :cond_1

    .line 20
    const-class p3, Landroid/view/WindowManager;

    invoke-virtual {p1, p3}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/view/WindowManager;

    .line 21
    invoke-static {}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getInstance()Lcom/android/wallpaper/util/ScreenSizeCalculator;

    move-result-object v5

    .line 22
    invoke-interface {p3}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p3

    invoke-virtual {v5, p3}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getScreenSize(Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object p3

    .line 23
    iget v5, p3, Landroid/graphics/Point;->y:I

    int-to-float v5, v5

    iget v6, p3, Landroid/graphics/Point;->x:I

    int-to-float v6, v6

    div-float/2addr v5, v6

    iput v5, p0, Lcom/android/wallpaper/widget/PreviewPager;->mScreenAspectRatio:F

    .line 24
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v3

    .line 25
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v0

    .line 26
    invoke-virtual {p2, v2, v3, v2, v0}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 27
    iget p3, p3, Landroid/graphics/Point;->x:I

    div-int/lit8 p3, p3, 0x2

    invoke-virtual {p2, p3}, Landroidx/viewpager/widget/ViewPager;->setPageMargin(I)V

    .line 28
    new-instance p3, Lcom/android/wallpaper/widget/PreviewPager$1;

    invoke-direct {p3, p0}, Lcom/android/wallpaper/widget/PreviewPager$1;-><init>(Lcom/android/wallpaper/widget/PreviewPager;)V

    invoke-virtual {p2, p3}, Landroid/view/ViewGroup;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 29
    :cond_1
    :goto_0
    :try_start_0
    const-class p3, Landroidx/viewpager/widget/ViewPager;

    const-string v0, "mScroller"

    invoke-virtual {p3, v0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p3

    .line 30
    invoke-virtual {p3, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 31
    new-instance v0, Lcom/android/wallpaper/widget/PreviewPager$PreviewPagerScroller;

    new-instance v1, Landroidx/interpolator/view/animation/LinearOutSlowInInterpolator;

    invoke-direct {v1}, Landroidx/interpolator/view/animation/LinearOutSlowInInterpolator;-><init>()V

    invoke-direct {v0, p1, v1}, Lcom/android/wallpaper/widget/PreviewPager$PreviewPagerScroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    .line 32
    invoke-virtual {p3, p2, v0}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    const-string p2, "PreviewPager"

    const-string p3, "Failed to setup pager scroller."

    .line 33
    invoke-static {p2, p3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1
    const p1, 0x7f0a0195

    .line 34
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/wallpaper/widget/PageIndicator;

    iput-object p1, p0, Lcom/android/wallpaper/widget/PreviewPager;->mPageIndicator:Lcom/android/wallpaper/widget/PageIndicator;

    const p1, 0x7f0a0069

    .line 35
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/widget/PreviewPager;->mPreviousArrow:Landroid/view/View;

    .line 36
    new-instance p2, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda0;

    invoke-direct {p2, p0, v2}, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/widget/PreviewPager;I)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f0a0068

    .line 37
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/widget/PreviewPager;->mNextArrow:Landroid/view/View;

    .line 38
    new-instance p2, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda0;

    invoke-direct {p2, p0, v4}, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/widget/PreviewPager;I)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 39
    new-instance p1, Lcom/android/wallpaper/widget/PreviewPager$4;

    invoke-direct {p1, p0}, Lcom/android/wallpaper/widget/PreviewPager$4;-><init>(Lcom/android/wallpaper/widget/PreviewPager;)V

    .line 40
    iput-object p1, p0, Lcom/android/wallpaper/widget/PreviewPager;->mPageListener:Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;

    .line 41
    iget-object p0, p0, Lcom/android/wallpaper/widget/PreviewPager;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    .line 42
    iget-object p2, p0, Landroidx/viewpager/widget/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    if-nez p2, :cond_2

    .line 43
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Landroidx/viewpager/widget/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    .line 44
    :cond_2
    iget-object p0, p0, Landroidx/viewpager/widget/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public final initIndicator()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/widget/PreviewPager;->mPageIndicator:Lcom/android/wallpaper/widget/PageIndicator;

    iget-object v1, p0, Lcom/android/wallpaper/widget/PreviewPager;->mAdapter:Landroidx/viewpager/widget/PagerAdapter;

    invoke-virtual {v1}, Landroidx/viewpager/widget/PagerAdapter;->getCount()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-le v1, v3, :cond_0

    move v4, v2

    goto :goto_0

    :cond_0
    const/4 v4, 0x4

    .line 2
    :goto_0
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 3
    iget-boolean v4, v0, Lcom/android/wallpaper/widget/PageIndicator;->mAnimating:Z

    if-eqz v4, :cond_1

    const-string v4, "PageIndicator"

    const-string v5, "setNumPages during animation"

    .line 4
    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 5
    :cond_1
    :goto_1
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    if-ge v1, v4, :cond_2

    .line 6
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    sub-int/2addr v4, v3

    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->removeViewAt(I)V

    goto :goto_1

    .line 7
    :cond_2
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v4

    new-array v5, v3, [I

    const v6, 0x101042a

    aput v6, v5, v2

    invoke-virtual {v4, v5}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v4

    .line 8
    invoke-virtual {v4, v2, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    .line 9
    invoke-virtual {v4}, Landroid/content/res/TypedArray;->recycle()V

    .line 10
    :goto_2
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    if-le v1, v4, :cond_3

    .line 11
    new-instance v4, Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    const v5, 0x7f0800dc

    .line 12
    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 13
    invoke-static {v2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    .line 14
    new-instance v5, Landroid/view/ViewGroup$LayoutParams;

    iget v6, v0, Lcom/android/wallpaper/widget/PageIndicator;->mPageIndicatorWidth:I

    iget v7, v0, Lcom/android/wallpaper/widget/PageIndicator;->mPageIndicatorHeight:I

    invoke-direct {v5, v6, v7}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v4, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_2

    .line 15
    :cond_3
    iget v1, v0, Lcom/android/wallpaper/widget/PageIndicator;->mPosition:I

    shr-int/2addr v1, v3

    invoke-virtual {v0, v1}, Lcom/android/wallpaper/widget/PageIndicator;->setIndex(I)V

    .line 16
    iget-object v0, p0, Lcom/android/wallpaper/widget/PreviewPager;->mPageIndicator:Lcom/android/wallpaper/widget/PageIndicator;

    iget-object p0, p0, Lcom/android/wallpaper/widget/PreviewPager;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    .line 17
    iget p0, p0, Landroidx/viewpager/widget/ViewPager;->mCurItem:I

    int-to-float p0, p0

    .line 18
    invoke-virtual {v0, p0}, Lcom/android/wallpaper/widget/PageIndicator;->setLocation(F)V

    return-void
.end method

.method public isRtl()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/widget/PreviewPager;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    sget-object v1, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 2
    invoke-virtual {v0}, Landroid/view/View;->isLayoutDirectionResolved()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 3
    iget-object p0, p0, Lcom/android/wallpaper/widget/PreviewPager;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getLayoutDirection()I

    move-result p0

    if-ne p0, v2, :cond_0

    move v1, v2

    :cond_0
    return v1

    .line 5
    :cond_1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    sget v0, Landroidx/core/text/TextUtilsCompat;->$r8$clinit:I

    .line 6
    invoke-static {p0}, Landroid/text/TextUtils;->getLayoutDirectionFromLocale(Ljava/util/Locale;)I

    move-result p0

    if-ne p0, v2, :cond_2

    move v1, v2

    :cond_2
    return v1
.end method

.method public onMeasure(II)V
    .locals 4

    .line 1
    iget v0, p0, Lcom/android/wallpaper/widget/PreviewPager;->mPageStyle:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 2
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    .line 3
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 4
    iget-object v2, p0, Lcom/android/wallpaper/widget/PreviewPager;->mPageIndicator:Lcom/android/wallpaper/widget/PageIndicator;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iget v2, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    sub-int/2addr v1, v2

    if-lez v0, :cond_0

    .line 5
    iget-object v2, p0, Lcom/android/wallpaper/widget/PreviewPager;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v2

    sub-int/2addr v1, v2

    iget-object v2, p0, Lcom/android/wallpaper/widget/PreviewPager;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    .line 6
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    iget v2, p0, Lcom/android/wallpaper/widget/PreviewPager;->mScreenAspectRatio:F

    div-float/2addr v1, v2

    float-to-int v1, v1

    .line 7
    div-int/lit8 v0, v0, 0x2

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    .line 8
    iget-object v1, p0, Lcom/android/wallpaper/widget/PreviewPager;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    .line 9
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v2

    iget-object v3, p0, Lcom/android/wallpaper/widget/PreviewPager;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    .line 10
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v3

    .line 11
    invoke-virtual {v1, v0, v2, v0, v3}, Landroid/view/ViewGroup;->setPaddingRelative(IIII)V

    .line 12
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    return-void
.end method

.method public setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V
    .locals 2

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/widget/PreviewPager;->mAdapter:Landroidx/viewpager/widget/PagerAdapter;

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/widget/PreviewPager;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 3
    iget-object v1, p0, Lcom/android/wallpaper/widget/PreviewPager;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    .line 4
    iget-object v1, v1, Landroidx/viewpager/widget/ViewPager;->mAdapter:Landroidx/viewpager/widget/PagerAdapter;

    if-eqz v1, :cond_2

    .line 5
    invoke-virtual {p0}, Lcom/android/wallpaper/widget/PreviewPager;->isRtl()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/wallpaper/widget/PreviewPager;->mAdapter:Landroidx/viewpager/widget/PagerAdapter;

    invoke-virtual {v0}, Landroidx/viewpager/widget/PagerAdapter;->getCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    iget-object v1, p0, Lcom/android/wallpaper/widget/PreviewPager;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    .line 6
    iget v1, v1, Landroidx/viewpager/widget/ViewPager;->mCurItem:I

    sub-int/2addr v0, v1

    goto :goto_0

    .line 7
    :cond_1
    iget-object v0, p0, Lcom/android/wallpaper/widget/PreviewPager;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    .line 8
    iget v0, v0, Landroidx/viewpager/widget/ViewPager;->mCurItem:I

    .line 9
    :cond_2
    :goto_0
    iput-object p1, p0, Lcom/android/wallpaper/widget/PreviewPager;->mAdapter:Landroidx/viewpager/widget/PagerAdapter;

    .line 10
    iget-object v1, p0, Lcom/android/wallpaper/widget/PreviewPager;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v1, p1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    .line 11
    iget-object p1, p0, Lcom/android/wallpaper/widget/PreviewPager;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {p0}, Lcom/android/wallpaper/widget/PreviewPager;->isRtl()Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/android/wallpaper/widget/PreviewPager;->mAdapter:Landroidx/viewpager/widget/PagerAdapter;

    invoke-virtual {v1}, Landroidx/viewpager/widget/PagerAdapter;->getCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    sub-int v0, v1, v0

    :cond_3
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 12
    iget-object p1, p0, Lcom/android/wallpaper/widget/PreviewPager;->mAdapter:Landroidx/viewpager/widget/PagerAdapter;

    new-instance v0, Lcom/android/wallpaper/widget/PreviewPager$3;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/widget/PreviewPager$3;-><init>(Lcom/android/wallpaper/widget/PreviewPager;)V

    .line 13
    iget-object p1, p1, Landroidx/viewpager/widget/PagerAdapter;->mObservable:Landroid/database/DataSetObservable;

    invoke-virtual {p1, v0}, Landroid/database/DataSetObservable;->registerObserver(Ljava/lang/Object;)V

    .line 14
    invoke-virtual {p0}, Lcom/android/wallpaper/widget/PreviewPager;->initIndicator()V

    .line 15
    iget-object p1, p0, Lcom/android/wallpaper/widget/PreviewPager;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    .line 16
    iget p1, p1, Landroidx/viewpager/widget/ViewPager;->mCurItem:I

    .line 17
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/widget/PreviewPager;->updateIndicator(I)V

    return-void
.end method

.method public final updateIndicator(I)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/widget/PreviewPager;->mAdapter:Landroidx/viewpager/widget/PagerAdapter;

    invoke-virtual {v0}, Landroidx/viewpager/widget/PagerAdapter;->getCount()I

    move-result v0

    const/4 v1, 0x1

    const/16 v2, 0x8

    if-le v0, v1, :cond_2

    .line 2
    iget-object v3, p0, Lcom/android/wallpaper/widget/PreviewPager;->mPreviousArrow:Landroid/view/View;

    const/4 v4, 0x0

    if-eqz p1, :cond_0

    move v5, v4

    goto :goto_0

    :cond_0
    move v5, v2

    :goto_0
    invoke-virtual {v3, v5}, Landroid/view/View;->setVisibility(I)V

    .line 3
    iget-object p0, p0, Lcom/android/wallpaper/widget/PreviewPager;->mNextArrow:Landroid/view/View;

    sub-int/2addr v0, v1

    if-eq p1, v0, :cond_1

    move v2, v4

    :cond_1
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    .line 4
    :cond_2
    iget-object p1, p0, Lcom/android/wallpaper/widget/PreviewPager;->mPageIndicator:Lcom/android/wallpaper/widget/PageIndicator;

    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 5
    iget-object p1, p0, Lcom/android/wallpaper/widget/PreviewPager;->mPreviousArrow:Landroid/view/View;

    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 6
    iget-object p0, p0, Lcom/android/wallpaper/widget/PreviewPager;->mNextArrow:Landroid/view/View;

    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    :goto_1
    return-void
.end method
