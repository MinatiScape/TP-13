.class public Lcom/google/android/material/tabs/TabLayout;
.super Landroid/widget/HorizontalScrollView;
.source "SourceFile"


# annotations
.annotation runtime Landroidx/viewpager/widget/ViewPager$DecorView;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/tabs/TabLayout$AdapterChangeListener;,
        Lcom/google/android/material/tabs/TabLayout$PagerAdapterObserver;,
        Lcom/google/android/material/tabs/TabLayout$ViewPagerOnTabSelectedListener;,
        Lcom/google/android/material/tabs/TabLayout$TabLayoutOnPageChangeListener;,
        Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;,
        Lcom/google/android/material/tabs/TabLayout$TabView;,
        Lcom/google/android/material/tabs/TabLayout$Tab;,
        Lcom/google/android/material/tabs/TabLayout$BaseOnTabSelectedListener;
    }
.end annotation


# static fields
.field public static final tabPool:Landroidx/core/util/Pools$Pool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/core/util/Pools$Pool<",
            "Lcom/google/android/material/tabs/TabLayout$Tab;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public adapterChangeListener:Lcom/google/android/material/tabs/TabLayout$AdapterChangeListener;

.field public contentInsetStart:I

.field public currentVpSelectedListener:Lcom/google/android/material/tabs/TabLayout$BaseOnTabSelectedListener;

.field public inlineLabel:Z

.field public mode:I

.field public pageChangeListener:Lcom/google/android/material/tabs/TabLayout$TabLayoutOnPageChangeListener;

.field public pagerAdapter:Landroidx/viewpager/widget/PagerAdapter;

.field public pagerAdapterObserver:Landroid/database/DataSetObserver;

.field public final requestedTabMaxWidth:I

.field public final requestedTabMinWidth:I

.field public scrollAnimator:Landroid/animation/ValueAnimator;

.field public final scrollableTabMinWidth:I

.field public final selectedListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/google/android/material/tabs/TabLayout$BaseOnTabSelectedListener;",
            ">;"
        }
    .end annotation
.end field

.field public selectedTab:Lcom/google/android/material/tabs/TabLayout$Tab;

.field public setupViewPagerImplicitly:Z

.field public final slidingTabIndicator:Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;

.field public final tabBackgroundResId:I

.field public tabGravity:I

.field public tabIconTint:Landroid/content/res/ColorStateList;

.field public tabIconTintMode:Landroid/graphics/PorterDuff$Mode;

.field public tabIndicatorAnimationDuration:I

.field public tabIndicatorFullWidth:Z

.field public tabIndicatorGravity:I

.field public tabIndicatorInterpolator:Lcom/google/android/material/tabs/TabIndicatorInterpolator;

.field public tabMaxWidth:I

.field public tabPaddingBottom:I

.field public tabPaddingEnd:I

.field public tabPaddingStart:I

.field public tabPaddingTop:I

.field public tabRippleColorStateList:Landroid/content/res/ColorStateList;

.field public tabSelectedIndicator:Landroid/graphics/drawable/Drawable;

.field public tabSelectedIndicatorColor:I

.field public tabTextAppearance:I

.field public tabTextColors:Landroid/content/res/ColorStateList;

.field public tabTextMultiLineSize:F

.field public tabTextSize:F

.field public final tabViewPool:Landroidx/core/util/Pools$Pool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/core/util/Pools$Pool<",
            "Lcom/google/android/material/tabs/TabLayout$TabView;",
            ">;"
        }
    .end annotation
.end field

.field public final tabs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/google/android/material/tabs/TabLayout$Tab;",
            ">;"
        }
    .end annotation
.end field

.field public unboundedRipple:Z

.field public viewPager:Landroidx/viewpager/widget/ViewPager;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Landroidx/core/util/Pools$SynchronizedPool;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Landroidx/core/util/Pools$SynchronizedPool;-><init>(I)V

    sput-object v0, Lcom/google/android/material/tabs/TabLayout;->tabPool:Landroidx/core/util/Pools$Pool;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/material/tabs/TabLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const v0, 0x7f040379

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/tabs/TabLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 12

    const v0, 0x7f1202b1

    .line 3
    invoke-static {p1, p2, p3, v0}, Lcom/google/android/material/theme/overlay/MaterialThemeOverlay;->wrap(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/tabs/TabLayout;->tabs:Ljava/util/ArrayList;

    .line 5
    new-instance p1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {p1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/tabs/TabLayout;->tabSelectedIndicator:Landroid/graphics/drawable/Drawable;

    const/4 p1, 0x0

    .line 6
    iput p1, p0, Lcom/google/android/material/tabs/TabLayout;->tabSelectedIndicatorColor:I

    const v0, 0x7fffffff

    .line 7
    iput v0, p0, Lcom/google/android/material/tabs/TabLayout;->tabMaxWidth:I

    .line 8
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->selectedListeners:Ljava/util/ArrayList;

    .line 9
    new-instance v0, Landroidx/core/util/Pools$SimplePool;

    const/16 v1, 0xc

    invoke-direct {v0, v1}, Landroidx/core/util/Pools$SimplePool;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->tabViewPool:Landroidx/core/util/Pools$Pool;

    .line 10
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 11
    invoke-virtual {p0, p1}, Landroid/widget/HorizontalScrollView;->setHorizontalScrollBarEnabled(Z)V

    .line 12
    new-instance v8, Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;

    invoke-direct {v8, p0, v0}, Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;-><init>(Lcom/google/android/material/tabs/TabLayout;Landroid/content/Context;)V

    iput-object v8, p0, Lcom/google/android/material/tabs/TabLayout;->slidingTabIndicator:Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;

    .line 13
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v3, -0x2

    const/4 v9, -0x1

    invoke-direct {v2, v3, v9}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-super {p0, v8, p1, v2}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 14
    sget-object v4, Lcom/google/android/material/R$styleable;->TabLayout:[I

    const/4 v10, 0x1

    new-array v7, v10, [I

    const/16 v11, 0x17

    aput v11, v7, p1

    const v6, 0x7f1202b1

    move-object v2, v0

    move-object v3, p2

    move v5, p3

    .line 15
    invoke-static/range {v2 .. v7}, Lcom/google/android/material/internal/ThemeEnforcement;->obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 16
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p3

    instance-of p3, p3, Landroid/graphics/drawable/ColorDrawable;

    if-eqz p3, :cond_0

    .line 17
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p3

    check-cast p3, Landroid/graphics/drawable/ColorDrawable;

    .line 18
    new-instance v2, Lcom/google/android/material/shape/MaterialShapeDrawable;

    invoke-direct {v2}, Lcom/google/android/material/shape/MaterialShapeDrawable;-><init>()V

    .line 19
    invoke-virtual {p3}, Landroid/graphics/drawable/ColorDrawable;->getColor()I

    move-result p3

    invoke-static {p3}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p3

    invoke-virtual {v2, p3}, Lcom/google/android/material/shape/MaterialShapeDrawable;->setFillColor(Landroid/content/res/ColorStateList;)V

    .line 20
    iget-object p3, v2, Lcom/google/android/material/shape/MaterialShapeDrawable;->drawableState:Lcom/google/android/material/shape/MaterialShapeDrawable$MaterialShapeDrawableState;

    new-instance v3, Lcom/google/android/material/elevation/ElevationOverlayProvider;

    invoke-direct {v3, v0}, Lcom/google/android/material/elevation/ElevationOverlayProvider;-><init>(Landroid/content/Context;)V

    iput-object v3, p3, Lcom/google/android/material/shape/MaterialShapeDrawable$MaterialShapeDrawableState;->elevationOverlayProvider:Lcom/google/android/material/elevation/ElevationOverlayProvider;

    .line 21
    invoke-virtual {v2}, Lcom/google/android/material/shape/MaterialShapeDrawable;->updateZ()V

    .line 22
    sget-object p3, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getElevation()F

    move-result p3

    .line 24
    invoke-virtual {v2, p3}, Lcom/google/android/material/shape/MaterialShapeDrawable;->setElevation(F)V

    .line 25
    invoke-virtual {p0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    const/4 p3, 0x5

    .line 26
    invoke-static {v0, p2, p3}, Lcom/google/android/material/resources/MaterialResources;->getDrawable(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    .line 27
    iget-object v2, p0, Lcom/google/android/material/tabs/TabLayout;->tabSelectedIndicator:Landroid/graphics/drawable/Drawable;

    if-eq v2, p3, :cond_2

    if-eqz p3, :cond_1

    goto :goto_0

    .line 28
    :cond_1
    new-instance p3, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {p3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    :goto_0
    iput-object p3, p0, Lcom/google/android/material/tabs/TabLayout;->tabSelectedIndicator:Landroid/graphics/drawable/Drawable;

    :cond_2
    const/16 p3, 0x8

    .line 29
    invoke-virtual {p2, p3, p1}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p3

    .line 30
    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->tabSelectedIndicatorColor:I

    const/16 p3, 0xb

    .line 31
    invoke-virtual {p2, p3, v9}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    .line 32
    iget-object v2, p0, Lcom/google/android/material/tabs/TabLayout;->tabSelectedIndicator:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    .line 33
    iget-object v3, p0, Lcom/google/android/material/tabs/TabLayout;->tabSelectedIndicator:Landroid/graphics/drawable/Drawable;

    iget v4, v2, Landroid/graphics/Rect;->left:I

    iget v2, v2, Landroid/graphics/Rect;->right:I

    invoke-virtual {v3, v4, p1, v2, p3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 34
    invoke-virtual {v8}, Landroid/widget/LinearLayout;->requestLayout()V

    const/16 p3, 0xa

    .line 35
    invoke-virtual {p2, p3, p1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p3

    .line 36
    iget v2, p0, Lcom/google/android/material/tabs/TabLayout;->tabIndicatorGravity:I

    if-eq v2, p3, :cond_3

    .line 37
    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->tabIndicatorGravity:I

    .line 38
    sget-object p3, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 39
    invoke-virtual {v8}, Landroid/view/View;->postInvalidateOnAnimation()V

    :cond_3
    const/16 p3, 0x9

    .line 40
    invoke-virtual {p2, p3, v10}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p3

    .line 41
    iput-boolean p3, p0, Lcom/google/android/material/tabs/TabLayout;->tabIndicatorFullWidth:Z

    .line 42
    sget-object p3, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 43
    invoke-virtual {v8}, Landroid/view/View;->postInvalidateOnAnimation()V

    const/4 p3, 0x7

    .line 44
    invoke-virtual {p2, p3, p1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p3

    if-eqz p3, :cond_5

    if-ne p3, v10, :cond_4

    .line 45
    new-instance p3, Lcom/google/android/material/tabs/ElasticTabIndicatorInterpolator;

    invoke-direct {p3}, Lcom/google/android/material/tabs/ElasticTabIndicatorInterpolator;-><init>()V

    iput-object p3, p0, Lcom/google/android/material/tabs/TabLayout;->tabIndicatorInterpolator:Lcom/google/android/material/tabs/TabIndicatorInterpolator;

    goto :goto_1

    .line 46
    :cond_4
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " is not a valid TabIndicatorAnimationMode"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 47
    :cond_5
    new-instance p3, Lcom/google/android/material/tabs/TabIndicatorInterpolator;

    invoke-direct {p3}, Lcom/google/android/material/tabs/TabIndicatorInterpolator;-><init>()V

    iput-object p3, p0, Lcom/google/android/material/tabs/TabLayout;->tabIndicatorInterpolator:Lcom/google/android/material/tabs/TabIndicatorInterpolator;

    :goto_1
    const/16 p3, 0x10

    .line 48
    invoke-virtual {p2, p3, p1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->tabPaddingBottom:I

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->tabPaddingEnd:I

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->tabPaddingTop:I

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->tabPaddingStart:I

    const/16 v2, 0x13

    .line 49
    invoke-virtual {p2, v2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->tabPaddingStart:I

    const/16 p3, 0x14

    .line 50
    iget v2, p0, Lcom/google/android/material/tabs/TabLayout;->tabPaddingTop:I

    invoke-virtual {p2, p3, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->tabPaddingTop:I

    const/16 p3, 0x12

    .line 51
    iget v2, p0, Lcom/google/android/material/tabs/TabLayout;->tabPaddingEnd:I

    invoke-virtual {p2, p3, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->tabPaddingEnd:I

    const/16 p3, 0x11

    .line 52
    iget v2, p0, Lcom/google/android/material/tabs/TabLayout;->tabPaddingBottom:I

    .line 53
    invoke-virtual {p2, p3, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->tabPaddingBottom:I

    const p3, 0x7f1201bd

    .line 54
    invoke-virtual {p2, v11, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->tabTextAppearance:I

    .line 55
    sget-object v2, Landroidx/appcompat/R$styleable;->TextAppearance:[I

    .line 56
    invoke-virtual {v0, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object p3

    .line 57
    :try_start_0
    invoke-virtual {p3, p1, p1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    int-to-float v2, v2

    iput v2, p0, Lcom/google/android/material/tabs/TabLayout;->tabTextSize:F

    const/4 v2, 0x3

    .line 58
    invoke-static {v0, p3, v2}, Lcom/google/android/material/resources/MaterialResources;->getColorStateList(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/material/tabs/TabLayout;->tabTextColors:Landroid/content/res/ColorStateList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    invoke-virtual {p3}, Landroid/content/res/TypedArray;->recycle()V

    const/16 p3, 0x18

    .line 60
    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 61
    invoke-static {v0, p2, p3}, Lcom/google/android/material/resources/MaterialResources;->getColorStateList(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object p3

    iput-object p3, p0, Lcom/google/android/material/tabs/TabLayout;->tabTextColors:Landroid/content/res/ColorStateList;

    :cond_6
    const/16 p3, 0x16

    .line 62
    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    const/4 v4, 0x2

    if-eqz v3, :cond_7

    .line 63
    invoke-virtual {p2, p3, p1}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p3

    .line 64
    iget-object v3, p0, Lcom/google/android/material/tabs/TabLayout;->tabTextColors:Landroid/content/res/ColorStateList;

    invoke-virtual {v3}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v3

    new-array v5, v4, [[I

    new-array v6, v4, [I

    .line 65
    sget-object v7, Landroid/widget/HorizontalScrollView;->SELECTED_STATE_SET:[I

    aput-object v7, v5, p1

    aput p3, v6, p1

    .line 66
    sget-object p3, Landroid/widget/HorizontalScrollView;->EMPTY_STATE_SET:[I

    aput-object p3, v5, v10

    aput v3, v6, v10

    .line 67
    new-instance p3, Landroid/content/res/ColorStateList;

    invoke-direct {p3, v5, v6}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    .line 68
    iput-object p3, p0, Lcom/google/android/material/tabs/TabLayout;->tabTextColors:Landroid/content/res/ColorStateList;

    .line 69
    :cond_7
    invoke-static {v0, p2, v2}, Lcom/google/android/material/resources/MaterialResources;->getColorStateList(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object p3

    iput-object p3, p0, Lcom/google/android/material/tabs/TabLayout;->tabIconTint:Landroid/content/res/ColorStateList;

    const/4 p3, 0x4

    .line 70
    invoke-virtual {p2, p3, v9}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p3

    const/4 v2, 0x0

    invoke-static {p3, v2}, Lcom/google/android/material/internal/ViewUtils;->parseTintMode(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    move-result-object p3

    iput-object p3, p0, Lcom/google/android/material/tabs/TabLayout;->tabIconTintMode:Landroid/graphics/PorterDuff$Mode;

    const/16 p3, 0x15

    .line 71
    invoke-static {v0, p2, p3}, Lcom/google/android/material/resources/MaterialResources;->getColorStateList(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object p3

    iput-object p3, p0, Lcom/google/android/material/tabs/TabLayout;->tabRippleColorStateList:Landroid/content/res/ColorStateList;

    const/4 p3, 0x6

    const/16 v0, 0x12c

    .line 72
    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->tabIndicatorAnimationDuration:I

    const/16 p3, 0xe

    .line 73
    invoke-virtual {p2, p3, v9}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->requestedTabMinWidth:I

    const/16 p3, 0xd

    .line 74
    invoke-virtual {p2, p3, v9}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->requestedTabMaxWidth:I

    .line 75
    invoke-virtual {p2, p1, p1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->tabBackgroundResId:I

    .line 76
    invoke-virtual {p2, v10, p1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->contentInsetStart:I

    const/16 p3, 0xf

    .line 77
    invoke-virtual {p2, p3, v10}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->mode:I

    .line 78
    invoke-virtual {p2, v4, p1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p3

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->tabGravity:I

    .line 79
    invoke-virtual {p2, v1, p1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p3

    iput-boolean p3, p0, Lcom/google/android/material/tabs/TabLayout;->inlineLabel:Z

    const/16 p3, 0x19

    .line 80
    invoke-virtual {p2, p3, p1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p3

    iput-boolean p3, p0, Lcom/google/android/material/tabs/TabLayout;->unboundedRipple:Z

    .line 81
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 82
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f0700e7

    .line 83
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    int-to-float p3, p3

    iput p3, p0, Lcom/google/android/material/tabs/TabLayout;->tabTextMultiLineSize:F

    const p3, 0x7f0700e5

    .line 84
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/google/android/material/tabs/TabLayout;->scrollableTabMinWidth:I

    .line 85
    iget p2, p0, Lcom/google/android/material/tabs/TabLayout;->mode:I

    if-eqz p2, :cond_9

    if-ne p2, v4, :cond_8

    goto :goto_2

    :cond_8
    move p2, p1

    goto :goto_3

    .line 86
    :cond_9
    :goto_2
    iget p2, p0, Lcom/google/android/material/tabs/TabLayout;->contentInsetStart:I

    iget p3, p0, Lcom/google/android/material/tabs/TabLayout;->tabPaddingStart:I

    sub-int/2addr p2, p3

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    .line 87
    :goto_3
    invoke-virtual {v8, p2, p1, p1, p1}, Landroid/view/View;->setPaddingRelative(IIII)V

    .line 88
    iget p1, p0, Lcom/google/android/material/tabs/TabLayout;->mode:I

    const-string p2, "TabLayout"

    if-eqz p1, :cond_c

    if-eq p1, v10, :cond_a

    if-eq p1, v4, :cond_a

    goto :goto_4

    .line 89
    :cond_a
    iget p1, p0, Lcom/google/android/material/tabs/TabLayout;->tabGravity:I

    if-ne p1, v4, :cond_b

    const-string p1, "GRAVITY_START is not supported with the current tab mode, GRAVITY_CENTER will be used instead"

    .line 90
    invoke-static {p2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    :cond_b
    invoke-virtual {v8, v10}, Landroid/widget/LinearLayout;->setGravity(I)V

    goto :goto_4

    .line 92
    :cond_c
    iget p1, p0, Lcom/google/android/material/tabs/TabLayout;->tabGravity:I

    if-eqz p1, :cond_e

    if-eq p1, v10, :cond_d

    if-eq p1, v4, :cond_f

    goto :goto_4

    .line 93
    :cond_d
    invoke-virtual {v8, v10}, Landroid/widget/LinearLayout;->setGravity(I)V

    goto :goto_4

    :cond_e
    const-string p1, "MODE_SCROLLABLE + GRAVITY_FILL is not supported, GRAVITY_START will be used instead"

    .line 94
    invoke-static {p2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_f
    const p1, 0x800003

    .line 95
    invoke-virtual {v8, p1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 96
    :goto_4
    invoke-virtual {p0, v10}, Lcom/google/android/material/tabs/TabLayout;->updateTabViews(Z)V

    return-void

    :catchall_0
    move-exception p0

    .line 97
    invoke-virtual {p3}, Landroid/content/res/TypedArray;->recycle()V

    .line 98
    throw p0
.end method


# virtual methods
.method public addTab(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    .line 2
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {p0, p1, v1, v0}, Lcom/google/android/material/tabs/TabLayout;->addTab(Lcom/google/android/material/tabs/TabLayout$Tab;IZ)V

    return-void
.end method

.method public addTab(Lcom/google/android/material/tabs/TabLayout$Tab;IZ)V
    .locals 5

    .line 3
    iget-object v0, p1, Lcom/google/android/material/tabs/TabLayout$Tab;->parent:Lcom/google/android/material/tabs/TabLayout;

    if-ne v0, p0, :cond_2

    .line 4
    iput p2, p1, Lcom/google/android/material/tabs/TabLayout$Tab;->position:I

    .line 5
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v0, p2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 6
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_0
    add-int/lit8 p2, p2, 0x1

    if-ge p2, v0, :cond_0

    .line 7
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 8
    iput p2, v1, Lcom/google/android/material/tabs/TabLayout$Tab;->position:I

    goto :goto_0

    .line 9
    :cond_0
    iget-object p2, p1, Lcom/google/android/material/tabs/TabLayout$Tab;->view:Lcom/google/android/material/tabs/TabLayout$TabView;

    const/4 v0, 0x0

    .line 10
    invoke-virtual {p2, v0}, Lcom/google/android/material/tabs/TabLayout$TabView;->setSelected(Z)V

    .line 11
    invoke-virtual {p2, v0}, Landroid/widget/LinearLayout;->setActivated(Z)V

    .line 12
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->slidingTabIndicator:Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;

    .line 13
    iget v1, p1, Lcom/google/android/material/tabs/TabLayout$Tab;->position:I

    .line 14
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    const/4 v4, -0x1

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 15
    invoke-virtual {p0, v2}, Lcom/google/android/material/tabs/TabLayout;->updateTabViewLayoutParams(Landroid/widget/LinearLayout$LayoutParams;)V

    .line 16
    invoke-virtual {v0, p2, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    if-eqz p3, :cond_1

    .line 17
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->select()V

    :cond_1
    return-void

    .line 18
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Tab belongs to a different TabLayout."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public addView(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->addViewInternal(Landroid/view/View;)V

    return-void
.end method

.method public addView(Landroid/view/View;I)V
    .locals 0

    .line 2
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->addViewInternal(Landroid/view/View;)V

    return-void
.end method

.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .locals 0

    .line 4
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->addViewInternal(Landroid/view/View;)V

    return-void
.end method

.method public addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 0

    .line 3
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->addViewInternal(Landroid/view/View;)V

    return-void
.end method

.method public final addViewInternal(Landroid/view/View;)V
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/google/android/material/tabs/TabItem;

    if-eqz v0, :cond_1

    .line 2
    check-cast p1, Lcom/google/android/material/tabs/TabItem;

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->newTab()Lcom/google/android/material/tabs/TabLayout$Tab;

    move-result-object v0

    .line 4
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object p1

    .line 7
    iput-object p1, v0, Lcom/google/android/material/tabs/TabLayout$Tab;->contentDesc:Ljava/lang/CharSequence;

    .line 8
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout$Tab;->updateView()V

    .line 9
    :cond_0
    invoke-virtual {p0, v0}, Lcom/google/android/material/tabs/TabLayout;->addTab(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    return-void

    .line 10
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Only TabItem instances can be added to TabLayout"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final animateToTab(I)V
    .locals 7

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    return-void

    .line 1
    :cond_0
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getWindowToken()Landroid/os/IBinder;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_7

    .line 2
    sget-object v0, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 3
    invoke-virtual {p0}, Landroid/view/View;->isLaidOut()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 4
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->slidingTabIndicator:Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;

    .line 5
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v3

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    if-ge v5, v3, :cond_2

    .line 6
    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 7
    invoke-virtual {v6}, Landroid/view/View;->getWidth()I

    move-result v6

    if-gtz v6, :cond_1

    move v0, v2

    goto :goto_1

    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_2
    move v0, v4

    :goto_1
    if-eqz v0, :cond_3

    goto :goto_2

    .line 8
    :cond_3
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getScrollX()I

    move-result v0

    .line 9
    invoke-virtual {p0, p1, v1}, Lcom/google/android/material/tabs/TabLayout;->calculateScrollXForTab(IF)I

    move-result v1

    if-eq v0, v1, :cond_5

    .line 10
    iget-object v3, p0, Lcom/google/android/material/tabs/TabLayout;->scrollAnimator:Landroid/animation/ValueAnimator;

    if-nez v3, :cond_4

    .line 11
    new-instance v3, Landroid/animation/ValueAnimator;

    invoke-direct {v3}, Landroid/animation/ValueAnimator;-><init>()V

    iput-object v3, p0, Lcom/google/android/material/tabs/TabLayout;->scrollAnimator:Landroid/animation/ValueAnimator;

    .line 12
    sget-object v5, Lcom/google/android/material/animation/AnimationUtils;->FAST_OUT_SLOW_IN_INTERPOLATOR:Landroid/animation/TimeInterpolator;

    invoke-virtual {v3, v5}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 13
    iget-object v3, p0, Lcom/google/android/material/tabs/TabLayout;->scrollAnimator:Landroid/animation/ValueAnimator;

    iget v5, p0, Lcom/google/android/material/tabs/TabLayout;->tabIndicatorAnimationDuration:I

    int-to-long v5, v5

    invoke-virtual {v3, v5, v6}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 14
    iget-object v3, p0, Lcom/google/android/material/tabs/TabLayout;->scrollAnimator:Landroid/animation/ValueAnimator;

    new-instance v5, Lcom/google/android/material/tabs/TabLayout$1;

    invoke-direct {v5, p0}, Lcom/google/android/material/tabs/TabLayout$1;-><init>(Lcom/google/android/material/tabs/TabLayout;)V

    invoke-virtual {v3, v5}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 15
    :cond_4
    iget-object v3, p0, Lcom/google/android/material/tabs/TabLayout;->scrollAnimator:Landroid/animation/ValueAnimator;

    const/4 v5, 0x2

    new-array v5, v5, [I

    aput v0, v5, v4

    aput v1, v5, v2

    invoke-virtual {v3, v5}, Landroid/animation/ValueAnimator;->setIntValues([I)V

    .line 16
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->scrollAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 17
    :cond_5
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->slidingTabIndicator:Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;

    iget p0, p0, Lcom/google/android/material/tabs/TabLayout;->tabIndicatorAnimationDuration:I

    .line 18
    iget-object v1, v0, Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;->indicatorAnimator:Landroid/animation/ValueAnimator;

    if-eqz v1, :cond_6

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 19
    iget-object v1, v0, Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;->indicatorAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 20
    :cond_6
    invoke-virtual {v0, v2, p1, p0}, Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;->updateOrRecreateIndicatorAnimation(ZII)V

    return-void

    .line 21
    :cond_7
    :goto_2
    invoke-virtual {p0, p1, v1, v2, v2}, Lcom/google/android/material/tabs/TabLayout;->setScrollPosition(IFZZ)V

    return-void
.end method

.method public final calculateScrollXForTab(IF)I
    .locals 4

    .line 1
    iget v0, p0, Lcom/google/android/material/tabs/TabLayout;->mode:I

    const/4 v1, 0x0

    const/4 v2, 0x2

    if-eqz v0, :cond_1

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    return v1

    .line 2
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->slidingTabIndicator:Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    add-int/lit8 p1, p1, 0x1

    .line 3
    iget-object v3, p0, Lcom/google/android/material/tabs/TabLayout;->slidingTabIndicator:Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;

    .line 4
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v3

    if-ge p1, v3, :cond_2

    iget-object v3, p0, Lcom/google/android/material/tabs/TabLayout;->slidingTabIndicator:Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;

    .line 5
    invoke-virtual {v3, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    goto :goto_1

    :cond_2
    const/4 p1, 0x0

    :goto_1
    if-eqz v0, :cond_3

    .line 6
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v3

    goto :goto_2

    :cond_3
    move v3, v1

    :goto_2
    if-eqz p1, :cond_4

    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v1

    .line 8
    :cond_4
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result p1

    div-int/lit8 v0, v3, 0x2

    add-int/2addr v0, p1

    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getWidth()I

    move-result p1

    div-int/2addr p1, v2

    sub-int/2addr v0, p1

    add-int/2addr v3, v1

    int-to-float p1, v3

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float/2addr p1, v1

    mul-float/2addr p1, p2

    float-to-int p1, p1

    .line 9
    sget-object p2, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getLayoutDirection()I

    move-result p0

    if-nez p0, :cond_5

    add-int/2addr v0, p1

    goto :goto_3

    :cond_5
    sub-int/2addr v0, p1

    :goto_3
    return v0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->generateLayoutParams(Landroid/util/AttributeSet;)Landroid/widget/FrameLayout$LayoutParams;

    move-result-object p0

    return-object p0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/widget/FrameLayout$LayoutParams;
    .locals 0

    .line 2
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->generateDefaultLayoutParams()Landroid/widget/FrameLayout$LayoutParams;

    move-result-object p0

    return-object p0
.end method

.method public getSelectedTabPosition()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/tabs/TabLayout;->selectedTab:Lcom/google/android/material/tabs/TabLayout$Tab;

    if-eqz p0, :cond_0

    .line 2
    iget p0, p0, Lcom/google/android/material/tabs/TabLayout$Tab;->position:I

    goto :goto_0

    :cond_0
    const/4 p0, -0x1

    :goto_0
    return p0
.end method

.method public getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;
    .locals 1

    if-ltz p1, :cond_1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    move-result v0

    if-lt p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object p0, p0, Lcom/google/android/material/tabs/TabLayout;->tabs:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/material/tabs/TabLayout$Tab;

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x0

    :goto_1
    return-object p0
.end method

.method public getTabCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/tabs/TabLayout;->tabs:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0
.end method

.method public final getTabMinWidth()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/google/android/material/tabs/TabLayout;->requestedTabMinWidth:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    return v0

    .line 2
    :cond_0
    iget v0, p0, Lcom/google/android/material/tabs/TabLayout;->mode:I

    if-eqz v0, :cond_2

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    iget p0, p0, Lcom/google/android/material/tabs/TabLayout;->scrollableTabMinWidth:I

    :goto_1
    return p0
.end method

.method public newTab()Lcom/google/android/material/tabs/TabLayout$Tab;
    .locals 3

    .line 1
    sget-object v0, Lcom/google/android/material/tabs/TabLayout;->tabPool:Landroidx/core/util/Pools$Pool;

    check-cast v0, Landroidx/core/util/Pools$SynchronizedPool;

    invoke-virtual {v0}, Landroidx/core/util/Pools$SynchronizedPool;->acquire()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/tabs/TabLayout$Tab;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Lcom/google/android/material/tabs/TabLayout$Tab;

    invoke-direct {v0}, Lcom/google/android/material/tabs/TabLayout$Tab;-><init>()V

    .line 3
    :cond_0
    iput-object p0, v0, Lcom/google/android/material/tabs/TabLayout$Tab;->parent:Lcom/google/android/material/tabs/TabLayout;

    .line 4
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->tabViewPool:Landroidx/core/util/Pools$Pool;

    if-eqz v1, :cond_1

    invoke-interface {v1}, Landroidx/core/util/Pools$Pool;->acquire()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/tabs/TabLayout$TabView;

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    if-nez v1, :cond_2

    .line 5
    new-instance v1, Lcom/google/android/material/tabs/TabLayout$TabView;

    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/google/android/material/tabs/TabLayout$TabView;-><init>(Lcom/google/android/material/tabs/TabLayout;Landroid/content/Context;)V

    .line 6
    :cond_2
    iget-object v2, v1, Lcom/google/android/material/tabs/TabLayout$TabView;->tab:Lcom/google/android/material/tabs/TabLayout$Tab;

    if-eq v0, v2, :cond_3

    .line 7
    iput-object v0, v1, Lcom/google/android/material/tabs/TabLayout$TabView;->tab:Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 8
    invoke-virtual {v1}, Lcom/google/android/material/tabs/TabLayout$TabView;->update()V

    :cond_3
    const/4 v2, 0x1

    .line 9
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setFocusable(Z)V

    .line 10
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->getTabMinWidth()I

    move-result p0

    invoke-virtual {v1, p0}, Landroid/widget/LinearLayout;->setMinimumWidth(I)V

    .line 11
    iget-object p0, v0, Lcom/google/android/material/tabs/TabLayout$Tab;->contentDesc:Ljava/lang/CharSequence;

    .line 12
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_4

    .line 13
    iget-object p0, v0, Lcom/google/android/material/tabs/TabLayout$Tab;->text:Ljava/lang/CharSequence;

    .line 14
    invoke-virtual {v1, p0}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 15
    :cond_4
    iget-object p0, v0, Lcom/google/android/material/tabs/TabLayout$Tab;->contentDesc:Ljava/lang/CharSequence;

    .line 16
    invoke-virtual {v1, p0}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 17
    :goto_1
    iput-object v1, v0, Lcom/google/android/material/tabs/TabLayout$Tab;->view:Lcom/google/android/material/tabs/TabLayout$TabView;

    .line 18
    iget p0, v0, Lcom/google/android/material/tabs/TabLayout$Tab;->id:I

    const/4 v2, -0x1

    if-eq p0, v2, :cond_5

    .line 19
    invoke-virtual {v1, p0}, Landroid/widget/LinearLayout;->setId(I)V

    :cond_5
    return-object v0
.end method

.method public onAttachedToWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 3
    instance-of v1, v0, Lcom/google/android/material/shape/MaterialShapeDrawable;

    if-eqz v1, :cond_0

    .line 4
    check-cast v0, Lcom/google/android/material/shape/MaterialShapeDrawable;

    invoke-static {p0, v0}, Landroidx/recyclerview/R$attr;->setParentAbsoluteElevation(Landroid/view/View;Lcom/google/android/material/shape/MaterialShapeDrawable;)V

    .line 5
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->viewPager:Landroidx/viewpager/widget/ViewPager;

    if-nez v0, :cond_1

    .line 6
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 7
    instance-of v1, v0, Landroidx/viewpager/widget/ViewPager;

    if-eqz v1, :cond_1

    .line 8
    check-cast v0, Landroidx/viewpager/widget/ViewPager;

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1, v1}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;ZZ)V

    :cond_1
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 2
    iget-boolean v0, p0, Lcom/google/android/material/tabs/TabLayout;->setupViewPagerImplicitly:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 3
    invoke-virtual {p0, v0, v1, v2}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;ZZ)V

    .line 4
    iput-boolean v2, p0, Lcom/google/android/material/tabs/TabLayout;->setupViewPagerImplicitly:Z

    :cond_0
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 7

    const/4 v0, 0x0

    .line 1
    :goto_0
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->slidingTabIndicator:Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 2
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->slidingTabIndicator:Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 3
    instance-of v2, v1, Lcom/google/android/material/tabs/TabLayout$TabView;

    if-eqz v2, :cond_0

    .line 4
    check-cast v1, Lcom/google/android/material/tabs/TabLayout$TabView;

    .line 5
    iget-object v2, v1, Lcom/google/android/material/tabs/TabLayout$TabView;->baseBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_0

    .line 6
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getLeft()I

    move-result v3

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getTop()I

    move-result v4

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getRight()I

    move-result v5

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getBottom()I

    move-result v6

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 7
    iget-object v1, v1, Lcom/google/android/material/tabs/TabLayout$TabView;->baseBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 8
    :cond_1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    move-result p0

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 3
    invoke-static {v1, p0, v0, v1}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$CollectionInfoCompat;->obtain(IIZI)Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$CollectionInfoCompat;

    move-result-object p0

    .line 4
    iget-object p0, p0, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$CollectionInfoCompat;->mInfo:Ljava/lang/Object;

    check-cast p0, Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;

    .line 5
    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setCollectionInfo(Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;)V

    return-void
.end method

.method public onMeasure(II)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 2
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    const/4 v4, 0x1

    if-ge v3, v1, :cond_1

    .line 3
    iget-object v5, p0, Lcom/google/android/material/tabs/TabLayout;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/material/tabs/TabLayout$Tab;

    if-eqz v5, :cond_0

    .line 4
    iget-object v6, v5, Lcom/google/android/material/tabs/TabLayout$Tab;->icon:Landroid/graphics/drawable/Drawable;

    if-eqz v6, :cond_0

    .line 5
    iget-object v5, v5, Lcom/google/android/material/tabs/TabLayout$Tab;->text:Ljava/lang/CharSequence;

    .line 6
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    move v1, v4

    goto :goto_1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    move v1, v2

    :goto_1
    if-eqz v1, :cond_2

    .line 7
    iget-boolean v1, p0, Lcom/google/android/material/tabs/TabLayout;->inlineLabel:Z

    if-nez v1, :cond_2

    const/16 v1, 0x48

    goto :goto_2

    :cond_2
    const/16 v1, 0x30

    .line 8
    :goto_2
    invoke-static {v0, v1}, Lcom/google/android/material/internal/ViewUtils;->dpToPx(Landroid/content/Context;I)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 9
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    const/high16 v3, -0x80000000

    const/high16 v5, 0x40000000    # 2.0f

    if-eq v1, v3, :cond_4

    if-eqz v1, :cond_3

    goto :goto_3

    .line 10
    :cond_3
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getPaddingTop()I

    move-result p2

    add-int/2addr p2, v0

    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getPaddingBottom()I

    move-result v0

    add-int/2addr v0, p2

    .line 11
    invoke-static {v0, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    goto :goto_3

    .line 12
    :cond_4
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getChildCount()I

    move-result v1

    if-ne v1, v4, :cond_5

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    if-lt v1, v0, :cond_5

    .line 13
    invoke-virtual {p0, v2}, Landroid/widget/HorizontalScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->setMinimumHeight(I)V

    .line 14
    :cond_5
    :goto_3
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    .line 15
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    if-eqz v1, :cond_7

    .line 16
    iget v1, p0, Lcom/google/android/material/tabs/TabLayout;->requestedTabMaxWidth:I

    if-lez v1, :cond_6

    goto :goto_4

    :cond_6
    int-to-float v0, v0

    .line 17
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getContext()Landroid/content/Context;

    move-result-object v1

    const/16 v3, 0x38

    invoke-static {v1, v3}, Lcom/google/android/material/internal/ViewUtils;->dpToPx(Landroid/content/Context;I)F

    move-result v1

    sub-float/2addr v0, v1

    float-to-int v1, v0

    :goto_4
    iput v1, p0, Lcom/google/android/material/tabs/TabLayout;->tabMaxWidth:I

    .line 18
    :cond_7
    invoke-super {p0, p1, p2}, Landroid/widget/HorizontalScrollView;->onMeasure(II)V

    .line 19
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getChildCount()I

    move-result p1

    if-ne p1, v4, :cond_b

    .line 20
    invoke-virtual {p0, v2}, Landroid/widget/HorizontalScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    .line 21
    iget v0, p0, Lcom/google/android/material/tabs/TabLayout;->mode:I

    if-eqz v0, :cond_9

    if-eq v0, v4, :cond_8

    const/4 v1, 0x2

    if-eq v0, v1, :cond_9

    goto :goto_6

    .line 22
    :cond_8
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getMeasuredWidth()I

    move-result v1

    if-eq v0, v1, :cond_a

    :goto_5
    move v2, v4

    goto :goto_6

    .line 23
    :cond_9
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getMeasuredWidth()I

    move-result v1

    if-ge v0, v1, :cond_a

    goto :goto_5

    :cond_a
    :goto_6
    if-eqz v2, :cond_b

    .line 24
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getPaddingTop()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getPaddingBottom()I

    move-result v1

    add-int/2addr v1, v0

    .line 25
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 26
    invoke-static {p2, v1, v0}, Landroid/widget/HorizontalScrollView;->getChildMeasureSpec(III)I

    move-result p2

    .line 27
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getMeasuredWidth()I

    move-result p0

    invoke-static {p0, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p0

    .line 28
    invoke-virtual {p1, p0, p2}, Landroid/view/View;->measure(II)V

    :cond_b
    return-void
.end method

.method public populateFromPagerAdapter()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->removeAllTabs()V

    .line 2
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->pagerAdapter:Landroidx/viewpager/widget/PagerAdapter;

    if-eqz v0, :cond_1

    .line 3
    invoke-virtual {v0}, Landroidx/viewpager/widget/PagerAdapter;->getCount()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_0

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->newTab()Lcom/google/android/material/tabs/TabLayout$Tab;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/material/tabs/TabLayout;->pagerAdapter:Landroidx/viewpager/widget/PagerAdapter;

    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/google/android/material/tabs/TabLayout$Tab;->setText(Ljava/lang/CharSequence;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 5
    iget-object v4, p0, Lcom/google/android/material/tabs/TabLayout;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual {p0, v3, v4, v1}, Lcom/google/android/material/tabs/TabLayout;->addTab(Lcom/google/android/material/tabs/TabLayout$Tab;IZ)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 6
    :cond_0
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->viewPager:Landroidx/viewpager/widget/ViewPager;

    if-eqz v1, :cond_1

    if-lez v0, :cond_1

    .line 7
    iget v0, v1, Landroidx/viewpager/widget/ViewPager;->mCurItem:I

    .line 8
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->getSelectedTabPosition()I

    move-result v1

    if-eq v0, v1, :cond_1

    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 9
    invoke-virtual {p0, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    move-result-object v0

    const/4 v1, 0x1

    .line 10
    invoke-virtual {p0, v0, v1}, Lcom/google/android/material/tabs/TabLayout;->selectTab(Lcom/google/android/material/tabs/TabLayout$Tab;Z)V

    :cond_1
    return-void
.end method

.method public removeAllTabs()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->slidingTabIndicator:Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    const/4 v1, 0x0

    if-ltz v0, :cond_2

    .line 2
    iget-object v2, p0, Lcom/google/android/material/tabs/TabLayout;->slidingTabIndicator:Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/google/android/material/tabs/TabLayout$TabView;

    .line 3
    iget-object v3, p0, Lcom/google/android/material/tabs/TabLayout;->slidingTabIndicator:Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->removeViewAt(I)V

    if-eqz v2, :cond_1

    .line 4
    iget-object v3, v2, Lcom/google/android/material/tabs/TabLayout$TabView;->tab:Lcom/google/android/material/tabs/TabLayout$Tab;

    if-eqz v3, :cond_0

    .line 5
    iput-object v1, v2, Lcom/google/android/material/tabs/TabLayout$TabView;->tab:Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 6
    invoke-virtual {v2}, Lcom/google/android/material/tabs/TabLayout$TabView;->update()V

    :cond_0
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v2, v1}, Lcom/google/android/material/tabs/TabLayout$TabView;->setSelected(Z)V

    .line 8
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->tabViewPool:Landroidx/core/util/Pools$Pool;

    invoke-interface {v1, v2}, Landroidx/core/util/Pools$Pool;->release(Ljava/lang/Object;)Z

    .line 9
    :cond_1
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->requestLayout()V

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 10
    :cond_2
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 11
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 12
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 13
    iput-object v1, v2, Lcom/google/android/material/tabs/TabLayout$Tab;->parent:Lcom/google/android/material/tabs/TabLayout;

    .line 14
    iput-object v1, v2, Lcom/google/android/material/tabs/TabLayout$Tab;->view:Lcom/google/android/material/tabs/TabLayout$TabView;

    .line 15
    iput-object v1, v2, Lcom/google/android/material/tabs/TabLayout$Tab;->tag:Ljava/lang/Object;

    .line 16
    iput-object v1, v2, Lcom/google/android/material/tabs/TabLayout$Tab;->icon:Landroid/graphics/drawable/Drawable;

    const/4 v3, -0x1

    .line 17
    iput v3, v2, Lcom/google/android/material/tabs/TabLayout$Tab;->id:I

    .line 18
    iput-object v1, v2, Lcom/google/android/material/tabs/TabLayout$Tab;->text:Ljava/lang/CharSequence;

    .line 19
    iput-object v1, v2, Lcom/google/android/material/tabs/TabLayout$Tab;->contentDesc:Ljava/lang/CharSequence;

    .line 20
    iput v3, v2, Lcom/google/android/material/tabs/TabLayout$Tab;->position:I

    .line 21
    iput-object v1, v2, Lcom/google/android/material/tabs/TabLayout$Tab;->customView:Landroid/view/View;

    .line 22
    sget-object v3, Lcom/google/android/material/tabs/TabLayout;->tabPool:Landroidx/core/util/Pools$Pool;

    check-cast v3, Landroidx/core/util/Pools$SynchronizedPool;

    invoke-virtual {v3, v2}, Landroidx/core/util/Pools$SynchronizedPool;->release(Ljava/lang/Object;)Z

    goto :goto_1

    .line 23
    :cond_3
    iput-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->selectedTab:Lcom/google/android/material/tabs/TabLayout$Tab;

    return-void
.end method

.method public selectTab(Lcom/google/android/material/tabs/TabLayout$Tab;Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->selectedTab:Lcom/google/android/material/tabs/TabLayout$Tab;

    const/4 v1, -0x1

    if-ne v0, p1, :cond_1

    if-eqz v0, :cond_7

    .line 2
    iget-object p2, p0, Lcom/google/android/material/tabs/TabLayout;->selectedListeners:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    add-int/2addr p2, v1

    :goto_0
    if-ltz p2, :cond_0

    .line 3
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->selectedListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/tabs/TabLayout$BaseOnTabSelectedListener;

    invoke-interface {v0, p1}, Lcom/google/android/material/tabs/TabLayout$BaseOnTabSelectedListener;->onTabReselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    add-int/lit8 p2, p2, -0x1

    goto :goto_0

    .line 4
    :cond_0
    iget p1, p1, Lcom/google/android/material/tabs/TabLayout$Tab;->position:I

    .line 5
    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout;->animateToTab(I)V

    goto :goto_5

    :cond_1
    if-eqz p1, :cond_2

    .line 6
    iget v2, p1, Lcom/google/android/material/tabs/TabLayout$Tab;->position:I

    goto :goto_1

    :cond_2
    move v2, v1

    :goto_1
    if-eqz p2, :cond_5

    if-eqz v0, :cond_3

    .line 7
    iget p2, v0, Lcom/google/android/material/tabs/TabLayout$Tab;->position:I

    if-ne p2, v1, :cond_4

    :cond_3
    if-eq v2, v1, :cond_4

    const/4 p2, 0x0

    const/4 v3, 0x1

    .line 8
    invoke-virtual {p0, v2, p2, v3, v3}, Lcom/google/android/material/tabs/TabLayout;->setScrollPosition(IFZZ)V

    goto :goto_2

    .line 9
    :cond_4
    invoke-virtual {p0, v2}, Lcom/google/android/material/tabs/TabLayout;->animateToTab(I)V

    :goto_2
    if-eq v2, v1, :cond_5

    .line 10
    invoke-virtual {p0, v2}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabView(I)V

    .line 11
    :cond_5
    iput-object p1, p0, Lcom/google/android/material/tabs/TabLayout;->selectedTab:Lcom/google/android/material/tabs/TabLayout$Tab;

    if-eqz v0, :cond_6

    .line 12
    iget-object p2, p0, Lcom/google/android/material/tabs/TabLayout;->selectedListeners:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    add-int/2addr p2, v1

    :goto_3
    if-ltz p2, :cond_6

    .line 13
    iget-object v2, p0, Lcom/google/android/material/tabs/TabLayout;->selectedListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/material/tabs/TabLayout$BaseOnTabSelectedListener;

    invoke-interface {v2, v0}, Lcom/google/android/material/tabs/TabLayout$BaseOnTabSelectedListener;->onTabUnselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    add-int/lit8 p2, p2, -0x1

    goto :goto_3

    :cond_6
    if-eqz p1, :cond_7

    .line 14
    iget-object p2, p0, Lcom/google/android/material/tabs/TabLayout;->selectedListeners:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    add-int/2addr p2, v1

    :goto_4
    if-ltz p2, :cond_7

    .line 15
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->selectedListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/tabs/TabLayout$BaseOnTabSelectedListener;

    invoke-interface {v0, p1}, Lcom/google/android/material/tabs/TabLayout$BaseOnTabSelectedListener;->onTabSelected(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    add-int/lit8 p2, p2, -0x1

    goto :goto_4

    :cond_7
    :goto_5
    return-void
.end method

.method public setElevation(F)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setElevation(F)V

    .line 2
    invoke-static {p0, p1}, Landroidx/recyclerview/R$attr;->setElevation(Landroid/view/View;F)V

    return-void
.end method

.method public setPagerAdapter(Landroidx/viewpager/widget/PagerAdapter;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->pagerAdapter:Landroidx/viewpager/widget/PagerAdapter;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->pagerAdapterObserver:Landroid/database/DataSetObserver;

    if-eqz v1, :cond_0

    .line 2
    iget-object v0, v0, Landroidx/viewpager/widget/PagerAdapter;->mObservable:Landroid/database/DataSetObservable;

    invoke-virtual {v0, v1}, Landroid/database/DataSetObservable;->unregisterObserver(Ljava/lang/Object;)V

    .line 3
    :cond_0
    iput-object p1, p0, Lcom/google/android/material/tabs/TabLayout;->pagerAdapter:Landroidx/viewpager/widget/PagerAdapter;

    if-eqz p2, :cond_2

    if-eqz p1, :cond_2

    .line 4
    iget-object p2, p0, Lcom/google/android/material/tabs/TabLayout;->pagerAdapterObserver:Landroid/database/DataSetObserver;

    if-nez p2, :cond_1

    .line 5
    new-instance p2, Lcom/google/android/material/tabs/TabLayout$PagerAdapterObserver;

    invoke-direct {p2, p0}, Lcom/google/android/material/tabs/TabLayout$PagerAdapterObserver;-><init>(Lcom/google/android/material/tabs/TabLayout;)V

    iput-object p2, p0, Lcom/google/android/material/tabs/TabLayout;->pagerAdapterObserver:Landroid/database/DataSetObserver;

    .line 6
    :cond_1
    iget-object p2, p0, Lcom/google/android/material/tabs/TabLayout;->pagerAdapterObserver:Landroid/database/DataSetObserver;

    .line 7
    iget-object p1, p1, Landroidx/viewpager/widget/PagerAdapter;->mObservable:Landroid/database/DataSetObservable;

    invoke-virtual {p1, p2}, Landroid/database/DataSetObservable;->registerObserver(Ljava/lang/Object;)V

    .line 8
    :cond_2
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->populateFromPagerAdapter()V

    return-void
.end method

.method public setScrollPosition(IFZZ)V
    .locals 4

    int-to-float v0, p1

    add-float/2addr v0, p2

    .line 1
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    if-ltz v0, :cond_4

    .line 2
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->slidingTabIndicator:Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-lt v0, v1, :cond_0

    goto :goto_0

    :cond_0
    if-eqz p4, :cond_2

    .line 3
    iget-object p4, p0, Lcom/google/android/material/tabs/TabLayout;->slidingTabIndicator:Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;

    .line 4
    iget-object v1, p4, Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;->indicatorAnimator:Landroid/animation/ValueAnimator;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 5
    iget-object v1, p4, Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;->indicatorAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 6
    :cond_1
    iput p1, p4, Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;->selectedPosition:I

    .line 7
    iput p2, p4, Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;->selectionOffset:F

    .line 8
    invoke-virtual {p4, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 9
    iget v2, p4, Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;->selectedPosition:I

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {p4, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 10
    iget v3, p4, Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;->selectionOffset:F

    invoke-virtual {p4, v1, v2, v3}, Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;->tweenIndicatorPosition(Landroid/view/View;Landroid/view/View;F)V

    .line 11
    :cond_2
    iget-object p4, p0, Lcom/google/android/material/tabs/TabLayout;->scrollAnimator:Landroid/animation/ValueAnimator;

    if-eqz p4, :cond_3

    invoke-virtual {p4}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result p4

    if-eqz p4, :cond_3

    .line 12
    iget-object p4, p0, Lcom/google/android/material/tabs/TabLayout;->scrollAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p4}, Landroid/animation/ValueAnimator;->cancel()V

    .line 13
    :cond_3
    invoke-virtual {p0, p1, p2}, Lcom/google/android/material/tabs/TabLayout;->calculateScrollXForTab(IF)I

    move-result p1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Landroid/widget/HorizontalScrollView;->scrollTo(II)V

    if-eqz p3, :cond_4

    .line 14
    invoke-virtual {p0, v0}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabView(I)V

    :cond_4
    :goto_0
    return-void
.end method

.method public final setSelectedTabView(I)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->slidingTabIndicator:Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    if-ge p1, v0, :cond_2

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_2

    .line 2
    iget-object v3, p0, Lcom/google/android/material/tabs/TabLayout;->slidingTabIndicator:Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    const/4 v4, 0x1

    if-ne v2, p1, :cond_0

    move v5, v4

    goto :goto_1

    :cond_0
    move v5, v1

    .line 3
    :goto_1
    invoke-virtual {v3, v5}, Landroid/view/View;->setSelected(Z)V

    if-ne v2, p1, :cond_1

    goto :goto_2

    :cond_1
    move v4, v1

    .line 4
    :goto_2
    invoke-virtual {v3, v4}, Landroid/view/View;->setActivated(Z)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public final setupWithViewPager(Landroidx/viewpager/widget/ViewPager;ZZ)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->viewPager:Landroidx/viewpager/widget/ViewPager;

    if-eqz v0, :cond_1

    .line 2
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->pageChangeListener:Lcom/google/android/material/tabs/TabLayout$TabLayoutOnPageChangeListener;

    if-eqz v1, :cond_0

    .line 3
    iget-object v0, v0, Landroidx/viewpager/widget/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 4
    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 5
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->adapterChangeListener:Lcom/google/android/material/tabs/TabLayout$AdapterChangeListener;

    if-eqz v0, :cond_1

    .line 6
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->viewPager:Landroidx/viewpager/widget/ViewPager;

    .line 7
    iget-object v1, v1, Landroidx/viewpager/widget/ViewPager;->mAdapterChangeListeners:Ljava/util/List;

    if-eqz v1, :cond_1

    .line 8
    invoke-interface {v1, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 9
    :cond_1
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->currentVpSelectedListener:Lcom/google/android/material/tabs/TabLayout$BaseOnTabSelectedListener;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 10
    iget-object v2, p0, Lcom/google/android/material/tabs/TabLayout;->selectedListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 11
    iput-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->currentVpSelectedListener:Lcom/google/android/material/tabs/TabLayout$BaseOnTabSelectedListener;

    :cond_2
    const/4 v0, 0x0

    if-eqz p1, :cond_9

    .line 12
    iput-object p1, p0, Lcom/google/android/material/tabs/TabLayout;->viewPager:Landroidx/viewpager/widget/ViewPager;

    .line 13
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->pageChangeListener:Lcom/google/android/material/tabs/TabLayout$TabLayoutOnPageChangeListener;

    if-nez v1, :cond_3

    .line 14
    new-instance v1, Lcom/google/android/material/tabs/TabLayout$TabLayoutOnPageChangeListener;

    invoke-direct {v1, p0}, Lcom/google/android/material/tabs/TabLayout$TabLayoutOnPageChangeListener;-><init>(Lcom/google/android/material/tabs/TabLayout;)V

    iput-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->pageChangeListener:Lcom/google/android/material/tabs/TabLayout$TabLayoutOnPageChangeListener;

    .line 15
    :cond_3
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->pageChangeListener:Lcom/google/android/material/tabs/TabLayout$TabLayoutOnPageChangeListener;

    .line 16
    iput v0, v1, Lcom/google/android/material/tabs/TabLayout$TabLayoutOnPageChangeListener;->scrollState:I

    iput v0, v1, Lcom/google/android/material/tabs/TabLayout$TabLayoutOnPageChangeListener;->previousScrollState:I

    .line 17
    iget-object v0, p1, Landroidx/viewpager/widget/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    if-nez v0, :cond_4

    .line 18
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p1, Landroidx/viewpager/widget/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    .line 19
    :cond_4
    iget-object v0, p1, Landroidx/viewpager/widget/ViewPager;->mOnPageChangeListeners:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    new-instance v0, Lcom/google/android/material/tabs/TabLayout$ViewPagerOnTabSelectedListener;

    invoke-direct {v0, p1}, Lcom/google/android/material/tabs/TabLayout$ViewPagerOnTabSelectedListener;-><init>(Landroidx/viewpager/widget/ViewPager;)V

    iput-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->currentVpSelectedListener:Lcom/google/android/material/tabs/TabLayout$BaseOnTabSelectedListener;

    .line 21
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->selectedListeners:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 22
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->selectedListeners:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 23
    :cond_5
    iget-object v0, p1, Landroidx/viewpager/widget/ViewPager;->mAdapter:Landroidx/viewpager/widget/PagerAdapter;

    if-eqz v0, :cond_6

    .line 24
    invoke-virtual {p0, v0, p2}, Lcom/google/android/material/tabs/TabLayout;->setPagerAdapter(Landroidx/viewpager/widget/PagerAdapter;Z)V

    .line 25
    :cond_6
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->adapterChangeListener:Lcom/google/android/material/tabs/TabLayout$AdapterChangeListener;

    if-nez v0, :cond_7

    .line 26
    new-instance v0, Lcom/google/android/material/tabs/TabLayout$AdapterChangeListener;

    invoke-direct {v0, p0}, Lcom/google/android/material/tabs/TabLayout$AdapterChangeListener;-><init>(Lcom/google/android/material/tabs/TabLayout;)V

    iput-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->adapterChangeListener:Lcom/google/android/material/tabs/TabLayout$AdapterChangeListener;

    .line 27
    :cond_7
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->adapterChangeListener:Lcom/google/android/material/tabs/TabLayout$AdapterChangeListener;

    .line 28
    iput-boolean p2, v0, Lcom/google/android/material/tabs/TabLayout$AdapterChangeListener;->autoRefresh:Z

    .line 29
    iget-object p2, p1, Landroidx/viewpager/widget/ViewPager;->mAdapterChangeListeners:Ljava/util/List;

    if-nez p2, :cond_8

    .line 30
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p1, Landroidx/viewpager/widget/ViewPager;->mAdapterChangeListeners:Ljava/util/List;

    .line 31
    :cond_8
    iget-object p2, p1, Landroidx/viewpager/widget/ViewPager;->mAdapterChangeListeners:Ljava/util/List;

    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    iget p1, p1, Landroidx/viewpager/widget/ViewPager;->mCurItem:I

    const/4 p2, 0x0

    const/4 v0, 0x1

    .line 33
    invoke-virtual {p0, p1, p2, v0, v0}, Lcom/google/android/material/tabs/TabLayout;->setScrollPosition(IFZZ)V

    goto :goto_0

    .line 34
    :cond_9
    iput-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->viewPager:Landroidx/viewpager/widget/ViewPager;

    .line 35
    invoke-virtual {p0, v1, v0}, Lcom/google/android/material/tabs/TabLayout;->setPagerAdapter(Landroidx/viewpager/widget/PagerAdapter;Z)V

    .line 36
    :goto_0
    iput-boolean p3, p0, Lcom/google/android/material/tabs/TabLayout;->setupViewPagerImplicitly:Z

    return-void
.end method

.method public shouldDelayChildPressedState()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout;->slidingTabIndicator:Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;

    .line 2
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getWidth()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getPaddingLeft()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getPaddingRight()I

    move-result p0

    sub-int/2addr v0, p0

    const/4 p0, 0x0

    .line 3
    invoke-static {p0, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    if-lez v0, :cond_0

    const/4 p0, 0x1

    :cond_0
    return p0
.end method

.method public final updateTabViewLayoutParams(Landroid/widget/LinearLayout$LayoutParams;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/google/android/material/tabs/TabLayout;->mode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget p0, p0, Lcom/google/android/material/tabs/TabLayout;->tabGravity:I

    if-nez p0, :cond_0

    const/4 p0, 0x0

    .line 2
    iput p0, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    const/high16 p0, 0x3f800000    # 1.0f

    .line 3
    iput p0, p1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    goto :goto_0

    :cond_0
    const/4 p0, -0x2

    .line 4
    iput p0, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    const/4 p0, 0x0

    .line 5
    iput p0, p1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    :goto_0
    return-void
.end method

.method public updateTabViews(Z)V
    .locals 3

    const/4 v0, 0x0

    .line 1
    :goto_0
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->slidingTabIndicator:Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 2
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout;->slidingTabIndicator:Lcom/google/android/material/tabs/TabLayout$SlidingTabIndicator;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout;->getTabMinWidth()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setMinimumWidth(I)V

    .line 4
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0, v2}, Lcom/google/android/material/tabs/TabLayout;->updateTabViewLayoutParams(Landroid/widget/LinearLayout$LayoutParams;)V

    if-eqz p1, :cond_0

    .line 5
    invoke-virtual {v1}, Landroid/view/View;->requestLayout()V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method
