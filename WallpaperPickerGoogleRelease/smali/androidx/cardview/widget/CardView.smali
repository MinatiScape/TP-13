.class public Landroidx/cardview/widget/CardView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# static fields
.field public static final COLOR_BACKGROUND_ATTR:[I

.field public static final IMPL:Landroidx/cardview/widget/CardViewImpl;


# instance fields
.field public final mCardViewDelegate:Landroidx/cardview/widget/CardViewDelegate;

.field public mCompatPadding:Z

.field public final mContentPadding:Landroid/graphics/Rect;

.field public mPreventCornerOverlap:Z

.field public final mShadowBounds:Landroid/graphics/Rect;

.field public mUserSetMinHeight:I

.field public mUserSetMinWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x1010031

    aput v2, v0, v1

    .line 1
    sput-object v0, Landroidx/cardview/widget/CardView;->COLOR_BACKGROUND_ATTR:[I

    .line 2
    new-instance v0, Landroidx/cardview/widget/CardViewApi21Impl;

    invoke-direct {v0}, Landroidx/cardview/widget/CardViewApi21Impl;-><init>()V

    sput-object v0, Landroidx/cardview/widget/CardView;->IMPL:Landroidx/cardview/widget/CardViewImpl;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "context"
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "attrs"
        }
    .end annotation

    const v0, 0x7f040088

    .line 2
    invoke-direct {p0, p1, p2, v0}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 10
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "attrs",
            "defStyleAttr"
        }
    .end annotation

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroidx/cardview/widget/CardView;->mContentPadding:Landroid/graphics/Rect;

    .line 5
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Landroidx/cardview/widget/CardView;->mShadowBounds:Landroid/graphics/Rect;

    .line 6
    new-instance v1, Landroidx/cardview/widget/CardView$1;

    invoke-direct {v1, p0}, Landroidx/cardview/widget/CardView$1;-><init>(Landroidx/cardview/widget/CardView;)V

    iput-object v1, p0, Landroidx/cardview/widget/CardView;->mCardViewDelegate:Landroidx/cardview/widget/CardViewDelegate;

    .line 7
    sget-object v4, Landroidx/cardview/R$styleable;->CardView:[I

    const v2, 0x7f1200ed

    invoke-virtual {p1, p2, v4, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v9

    .line 8
    sget-object v2, Landroidx/core/view/ViewCompat;->sViewPropertyAnimatorMap:Ljava/util/WeakHashMap;

    const v8, 0x7f1200ed

    move-object v2, p0

    move-object v3, p1

    move-object v5, p2

    move-object v6, v9

    move v7, p3

    .line 9
    invoke-static/range {v2 .. v8}, Landroidx/core/view/ViewCompat$Api29Impl;->saveAttributeDataForStyleable(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V

    const/4 p1, 0x2

    .line 10
    invoke-virtual {v9, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    const/4 p3, 0x3

    const/4 v2, 0x0

    if-eqz p2, :cond_0

    .line 11
    invoke-virtual {v9, p1}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    goto :goto_1

    .line 12
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p2

    sget-object v3, Landroidx/cardview/widget/CardView;->COLOR_BACKGROUND_ATTR:[I

    invoke-virtual {p2, v3}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 13
    invoke-virtual {p2, v2, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v3

    .line 14
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    new-array p2, p3, [F

    .line 15
    invoke-static {v3, p2}, Landroid/graphics/Color;->colorToHSV(I[F)V

    .line 16
    aget p1, p2, p1

    const/high16 p2, 0x3f000000    # 0.5f

    cmpl-float p1, p1, p2

    if-lez p1, :cond_1

    .line 17
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f06002e

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    goto :goto_0

    .line 18
    :cond_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f06002d

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    .line 19
    :goto_0
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    :goto_1
    const/4 p2, 0x0

    .line 20
    invoke-virtual {v9, p3, p2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p3

    const/4 v3, 0x4

    .line 21
    invoke-virtual {v9, v3, p2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v3

    const/4 v4, 0x5

    .line 22
    invoke-virtual {v9, v4, p2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p2

    const/4 v4, 0x7

    .line 23
    invoke-virtual {v9, v4, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v4

    iput-boolean v4, p0, Landroidx/cardview/widget/CardView;->mCompatPadding:Z

    const/4 v4, 0x6

    const/4 v5, 0x1

    .line 24
    invoke-virtual {v9, v4, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v4

    iput-boolean v4, p0, Landroidx/cardview/widget/CardView;->mPreventCornerOverlap:Z

    const/16 v4, 0x8

    .line 25
    invoke-virtual {v9, v4, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    const/16 v6, 0xa

    .line 26
    invoke-virtual {v9, v6, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v6

    iput v6, v0, Landroid/graphics/Rect;->left:I

    const/16 v6, 0xc

    .line 27
    invoke-virtual {v9, v6, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v6

    iput v6, v0, Landroid/graphics/Rect;->top:I

    const/16 v6, 0xb

    .line 28
    invoke-virtual {v9, v6, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v6

    iput v6, v0, Landroid/graphics/Rect;->right:I

    const/16 v6, 0x9

    .line 29
    invoke-virtual {v9, v6, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, v0, Landroid/graphics/Rect;->bottom:I

    cmpl-float v0, v3, p2

    if-lez v0, :cond_2

    move p2, v3

    .line 30
    :cond_2
    invoke-virtual {v9, v2, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    iput v0, p0, Landroidx/cardview/widget/CardView;->mUserSetMinWidth:I

    .line 31
    invoke-virtual {v9, v5, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    iput v0, p0, Landroidx/cardview/widget/CardView;->mUserSetMinHeight:I

    .line 32
    invoke-virtual {v9}, Landroid/content/res/TypedArray;->recycle()V

    .line 33
    sget-object p0, Landroidx/cardview/widget/CardView;->IMPL:Landroidx/cardview/widget/CardViewImpl;

    check-cast p0, Landroidx/cardview/widget/CardViewApi21Impl;

    .line 34
    new-instance v0, Landroidx/cardview/widget/RoundRectDrawable;

    invoke-direct {v0, p1, p3}, Landroidx/cardview/widget/RoundRectDrawable;-><init>(Landroid/content/res/ColorStateList;F)V

    .line 35
    move-object p1, v1

    check-cast p1, Landroidx/cardview/widget/CardView$1;

    .line 36
    iput-object v0, p1, Landroidx/cardview/widget/CardView$1;->mCardBackground:Landroid/graphics/drawable/Drawable;

    .line 37
    iget-object p3, p1, Landroidx/cardview/widget/CardView$1;->this$0:Landroidx/cardview/widget/CardView;

    invoke-virtual {p3, v0}, Landroid/widget/FrameLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 38
    iget-object p3, p1, Landroidx/cardview/widget/CardView$1;->this$0:Landroidx/cardview/widget/CardView;

    .line 39
    invoke-virtual {p3, v5}, Landroid/view/View;->setClipToOutline(Z)V

    .line 40
    invoke-virtual {p3, v3}, Landroid/view/View;->setElevation(F)V

    .line 41
    invoke-virtual {p0, v1}, Landroidx/cardview/widget/CardViewApi21Impl;->getCardBackground(Landroidx/cardview/widget/CardViewDelegate;)Landroidx/cardview/widget/RoundRectDrawable;

    move-result-object p3

    .line 42
    iget-object v0, p1, Landroidx/cardview/widget/CardView$1;->this$0:Landroidx/cardview/widget/CardView;

    .line 43
    iget-boolean v3, v0, Landroidx/cardview/widget/CardView;->mCompatPadding:Z

    .line 44
    iget-boolean v0, v0, Landroidx/cardview/widget/CardView;->mPreventCornerOverlap:Z

    .line 45
    iget v4, p3, Landroidx/cardview/widget/RoundRectDrawable;->mPadding:F

    cmpl-float v4, p2, v4

    if-nez v4, :cond_3

    iget-boolean v4, p3, Landroidx/cardview/widget/RoundRectDrawable;->mInsetForPadding:Z

    if-ne v4, v3, :cond_3

    iget-boolean v4, p3, Landroidx/cardview/widget/RoundRectDrawable;->mInsetForRadius:Z

    if-ne v4, v0, :cond_3

    goto :goto_2

    .line 46
    :cond_3
    iput p2, p3, Landroidx/cardview/widget/RoundRectDrawable;->mPadding:F

    .line 47
    iput-boolean v3, p3, Landroidx/cardview/widget/RoundRectDrawable;->mInsetForPadding:Z

    .line 48
    iput-boolean v0, p3, Landroidx/cardview/widget/RoundRectDrawable;->mInsetForRadius:Z

    const/4 p2, 0x0

    .line 49
    invoke-virtual {p3, p2}, Landroidx/cardview/widget/RoundRectDrawable;->updateBounds(Landroid/graphics/Rect;)V

    .line 50
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 51
    :goto_2
    iget-object p2, p1, Landroidx/cardview/widget/CardView$1;->this$0:Landroidx/cardview/widget/CardView;

    .line 52
    iget-boolean p2, p2, Landroidx/cardview/widget/CardView;->mCompatPadding:Z

    if-nez p2, :cond_4

    .line 53
    invoke-virtual {p1, v2, v2, v2, v2}, Landroidx/cardview/widget/CardView$1;->setShadowPadding(IIII)V

    goto :goto_3

    .line 54
    :cond_4
    invoke-virtual {p0, v1}, Landroidx/cardview/widget/CardViewApi21Impl;->getCardBackground(Landroidx/cardview/widget/CardViewDelegate;)Landroidx/cardview/widget/RoundRectDrawable;

    move-result-object p2

    .line 55
    iget p2, p2, Landroidx/cardview/widget/RoundRectDrawable;->mPadding:F

    .line 56
    invoke-virtual {p0, v1}, Landroidx/cardview/widget/CardViewApi21Impl;->getCardBackground(Landroidx/cardview/widget/CardViewDelegate;)Landroidx/cardview/widget/RoundRectDrawable;

    move-result-object p0

    .line 57
    iget p0, p0, Landroidx/cardview/widget/RoundRectDrawable;->mRadius:F

    .line 58
    iget-object p3, p1, Landroidx/cardview/widget/CardView$1;->this$0:Landroidx/cardview/widget/CardView;

    .line 59
    iget-boolean p3, p3, Landroidx/cardview/widget/CardView;->mPreventCornerOverlap:Z

    .line 60
    invoke-static {p2, p0, p3}, Landroidx/cardview/widget/RoundRectDrawableWithShadow;->calculateHorizontalPadding(FFZ)F

    move-result p3

    float-to-double v0, p3

    .line 61
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int p3, v0

    .line 62
    iget-object v0, p1, Landroidx/cardview/widget/CardView$1;->this$0:Landroidx/cardview/widget/CardView;

    .line 63
    iget-boolean v0, v0, Landroidx/cardview/widget/CardView;->mPreventCornerOverlap:Z

    .line 64
    invoke-static {p2, p0, v0}, Landroidx/cardview/widget/RoundRectDrawableWithShadow;->calculateVerticalPadding(FFZ)F

    move-result p0

    float-to-double v0, p0

    .line 65
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int p0, v0

    .line 66
    invoke-virtual {p1, p3, p0, p3, p0}, Landroidx/cardview/widget/CardView$1;->setShadowPadding(IIII)V

    :goto_3
    return-void
.end method

.method public static synthetic access$001(Landroidx/cardview/widget/CardView;IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->setPadding(IIII)V

    return-void
.end method


# virtual methods
.method public onMeasure(II)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "widthMeasureSpec",
            "heightMeasureSpec"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    return-void
.end method

.method public setMinimumHeight(I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "minHeight"
        }
    .end annotation

    .line 1
    iput p1, p0, Landroidx/cardview/widget/CardView;->mUserSetMinHeight:I

    .line 2
    invoke-super {p0, p1}, Landroid/view/View;->setMinimumHeight(I)V

    return-void
.end method

.method public setMinimumWidth(I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "minWidth"
        }
    .end annotation

    .line 1
    iput p1, p0, Landroidx/cardview/widget/CardView;->mUserSetMinWidth:I

    .line 2
    invoke-super {p0, p1}, Landroid/view/View;->setMinimumWidth(I)V

    return-void
.end method

.method public setPadding(IIII)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "left",
            "top",
            "right",
            "bottom"
        }
    .end annotation

    return-void
.end method

.method public setPaddingRelative(IIII)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "start",
            "top",
            "end",
            "bottom"
        }
    .end annotation

    return-void
.end method

.method public setRadius(F)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "radius"
        }
    .end annotation

    .line 1
    sget-object v0, Landroidx/cardview/widget/CardView;->IMPL:Landroidx/cardview/widget/CardViewImpl;

    iget-object p0, p0, Landroidx/cardview/widget/CardView;->mCardViewDelegate:Landroidx/cardview/widget/CardViewDelegate;

    check-cast v0, Landroidx/cardview/widget/CardViewApi21Impl;

    .line 2
    invoke-virtual {v0, p0}, Landroidx/cardview/widget/CardViewApi21Impl;->getCardBackground(Landroidx/cardview/widget/CardViewDelegate;)Landroidx/cardview/widget/RoundRectDrawable;

    move-result-object p0

    .line 3
    iget v0, p0, Landroidx/cardview/widget/RoundRectDrawable;->mRadius:F

    cmpl-float v0, p1, v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 4
    :cond_0
    iput p1, p0, Landroidx/cardview/widget/RoundRectDrawable;->mRadius:F

    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Landroidx/cardview/widget/RoundRectDrawable;->updateBounds(Landroid/graphics/Rect;)V

    .line 6
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    :goto_0
    return-void
.end method
