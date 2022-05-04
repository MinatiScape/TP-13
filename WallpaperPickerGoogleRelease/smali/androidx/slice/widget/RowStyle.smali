.class public Landroidx/slice/widget/RowStyle;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public mActionDividerHeight:I

.field public mBottomDividerEndPadding:I

.field public mBottomDividerStartPadding:I

.field public mContentEndPadding:I

.field public mContentStartPadding:I

.field public mDisableRecyclerViewItemAnimator:Z

.field public mEndItemEndPadding:I

.field public mEndItemStartPadding:I

.field public mIconSize:I

.field public mImageSize:I

.field public mProgressBarEndPadding:I

.field public mProgressBarInlineWidth:I

.field public mProgressBarStartPadding:I

.field public mSeekBarInlineWidth:I

.field public final mSliceStyle:Landroidx/slice/widget/SliceStyle;

.field public mSubContentEndPadding:I

.field public mSubContentStartPadding:I

.field public mSubtitleColor:Ljava/lang/Integer;

.field public mTextActionPadding:I

.field public mTintColor:Ljava/lang/Integer;

.field public mTitleColor:Ljava/lang/Integer;

.field public mTitleEndPadding:I

.field public mTitleItemEndPadding:I

.field public mTitleItemStartPadding:I

.field public mTitleStartPadding:I


# direct methods
.method public constructor <init>(Landroid/content/Context;ILandroidx/slice/widget/SliceStyle;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "resId",
            "sliceStyle"
        }
    .end annotation

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 25
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mTitleItemStartPadding:I

    .line 26
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mTitleItemEndPadding:I

    .line 27
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mContentStartPadding:I

    .line 28
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mContentEndPadding:I

    .line 29
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mTitleStartPadding:I

    .line 30
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mTitleEndPadding:I

    .line 31
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mSubContentStartPadding:I

    .line 32
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mSubContentEndPadding:I

    .line 33
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mEndItemStartPadding:I

    .line 34
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mEndItemEndPadding:I

    .line 35
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mBottomDividerStartPadding:I

    .line 36
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mBottomDividerEndPadding:I

    .line 37
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mActionDividerHeight:I

    .line 38
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mSeekBarInlineWidth:I

    .line 39
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mProgressBarInlineWidth:I

    .line 40
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mProgressBarStartPadding:I

    .line 41
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mProgressBarEndPadding:I

    .line 42
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mTextActionPadding:I

    .line 43
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mIconSize:I

    const/4 v0, 0x0

    .line 44
    iput-boolean v0, p0, Landroidx/slice/widget/RowStyle;->mDisableRecyclerViewItemAnimator:Z

    .line 45
    iput-object p3, p0, Landroidx/slice/widget/RowStyle;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    .line 46
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p3

    sget-object v1, Landroidx/slice/view/R$styleable;->RowStyle:[I

    invoke-virtual {p3, p2, v1}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object p2

    const/16 p3, 0x16

    const/high16 v1, -0x40800000    # -1.0f

    .line 47
    :try_start_0
    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p3

    float-to-int p3, p3

    iput p3, p0, Landroidx/slice/widget/RowStyle;->mTitleItemStartPadding:I

    const/16 p3, 0x15

    .line 48
    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p3

    float-to-int p3, p3

    iput p3, p0, Landroidx/slice/widget/RowStyle;->mTitleItemEndPadding:I

    const/4 p3, 0x4

    .line 49
    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p3

    float-to-int p3, p3

    iput p3, p0, Landroidx/slice/widget/RowStyle;->mContentStartPadding:I

    const/4 p3, 0x3

    .line 50
    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p3

    float-to-int p3, p3

    iput p3, p0, Landroidx/slice/widget/RowStyle;->mContentEndPadding:I

    const/16 p3, 0x17

    .line 51
    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p3

    float-to-int p3, p3

    iput p3, p0, Landroidx/slice/widget/RowStyle;->mTitleStartPadding:I

    const/16 p3, 0x14

    .line 52
    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p3

    float-to-int p3, p3

    iput p3, p0, Landroidx/slice/widget/RowStyle;->mTitleEndPadding:I

    const/16 p3, 0xf

    .line 53
    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p3

    float-to-int p3, p3

    iput p3, p0, Landroidx/slice/widget/RowStyle;->mSubContentStartPadding:I

    const/16 p3, 0xe

    .line 54
    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p3

    float-to-int p3, p3

    iput p3, p0, Landroidx/slice/widget/RowStyle;->mSubContentEndPadding:I

    const/4 p3, 0x7

    .line 55
    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p3

    float-to-int p3, p3

    iput p3, p0, Landroidx/slice/widget/RowStyle;->mEndItemStartPadding:I

    const/4 p3, 0x6

    .line 56
    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p3

    float-to-int p3, p3

    iput p3, p0, Landroidx/slice/widget/RowStyle;->mEndItemEndPadding:I

    const/4 p3, 0x2

    .line 57
    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p3

    float-to-int p3, p3

    iput p3, p0, Landroidx/slice/widget/RowStyle;->mBottomDividerStartPadding:I

    const/4 p3, 0x1

    .line 58
    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p3

    float-to-int p3, p3

    iput p3, p0, Landroidx/slice/widget/RowStyle;->mBottomDividerEndPadding:I

    .line 59
    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p3

    float-to-int p3, p3

    iput p3, p0, Landroidx/slice/widget/RowStyle;->mActionDividerHeight:I

    const/16 p3, 0xd

    .line 60
    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p3

    float-to-int p3, p3

    iput p3, p0, Landroidx/slice/widget/RowStyle;->mSeekBarInlineWidth:I

    const/16 p3, 0xb

    .line 61
    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p3

    float-to-int p3, p3

    iput p3, p0, Landroidx/slice/widget/RowStyle;->mProgressBarInlineWidth:I

    const/16 p3, 0xc

    .line 62
    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p3

    float-to-int p3, p3

    iput p3, p0, Landroidx/slice/widget/RowStyle;->mProgressBarStartPadding:I

    const/16 p3, 0xa

    .line 63
    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p3

    float-to-int p3, p3

    iput p3, p0, Landroidx/slice/widget/RowStyle;->mProgressBarEndPadding:I

    const/16 p3, 0x11

    const/high16 v2, 0x41200000    # 10.0f

    .line 64
    invoke-virtual {p2, p3, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p3

    float-to-int p3, p3

    iput p3, p0, Landroidx/slice/widget/RowStyle;->mTextActionPadding:I

    const/16 p3, 0x8

    .line 65
    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p3

    float-to-int p3, p3

    iput p3, p0, Landroidx/slice/widget/RowStyle;->mIconSize:I

    const/4 p3, 0x5

    .line 66
    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p3

    iput-boolean p3, p0, Landroidx/slice/widget/RowStyle;->mDisableRecyclerViewItemAnimator:Z

    const/16 p3, 0x9

    .line 67
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f070057

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    int-to-float p1, p1

    .line 68
    invoke-virtual {p2, p3, p1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p1

    float-to-int p1, p1

    iput p1, p0, Landroidx/slice/widget/RowStyle;->mImageSize:I

    const/16 p1, 0x12

    .line 69
    invoke-static {p2, p1}, Landroidx/slice/widget/RowStyle;->getOptionalColor(Landroid/content/res/TypedArray;I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Landroidx/slice/widget/RowStyle;->mTintColor:Ljava/lang/Integer;

    const/16 p1, 0x13

    .line 70
    invoke-static {p2, p1}, Landroidx/slice/widget/RowStyle;->getOptionalColor(Landroid/content/res/TypedArray;I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Landroidx/slice/widget/RowStyle;->mTitleColor:Ljava/lang/Integer;

    const/16 p1, 0x10

    .line 71
    invoke-static {p2, p1}, Landroidx/slice/widget/RowStyle;->getOptionalColor(Landroid/content/res/TypedArray;I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Landroidx/slice/widget/RowStyle;->mSubtitleColor:Ljava/lang/Integer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    return-void

    :catchall_0
    move-exception p0

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 73
    throw p0
.end method

.method public constructor <init>(Landroid/content/Context;Landroidx/slice/widget/SliceStyle;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "sliceStyle"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mTitleItemStartPadding:I

    .line 3
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mTitleItemEndPadding:I

    .line 4
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mContentStartPadding:I

    .line 5
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mContentEndPadding:I

    .line 6
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mTitleStartPadding:I

    .line 7
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mTitleEndPadding:I

    .line 8
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mSubContentStartPadding:I

    .line 9
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mSubContentEndPadding:I

    .line 10
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mEndItemStartPadding:I

    .line 11
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mEndItemEndPadding:I

    .line 12
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mBottomDividerStartPadding:I

    .line 13
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mBottomDividerEndPadding:I

    .line 14
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mActionDividerHeight:I

    .line 15
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mSeekBarInlineWidth:I

    .line 16
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mProgressBarInlineWidth:I

    .line 17
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mProgressBarStartPadding:I

    .line 18
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mProgressBarEndPadding:I

    .line 19
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mTextActionPadding:I

    .line 20
    iput v0, p0, Landroidx/slice/widget/RowStyle;->mIconSize:I

    const/4 v0, 0x0

    .line 21
    iput-boolean v0, p0, Landroidx/slice/widget/RowStyle;->mDisableRecyclerViewItemAnimator:Z

    .line 22
    iput-object p2, p0, Landroidx/slice/widget/RowStyle;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    .line 23
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070057

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Landroidx/slice/widget/RowStyle;->mImageSize:I

    return-void
.end method

.method public static getOptionalColor(Landroid/content/res/TypedArray;I)Ljava/lang/Integer;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "a",
            "colorRes"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method


# virtual methods
.method public getSubtitleColor()I
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/RowStyle;->mSubtitleColor:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    goto :goto_0

    :cond_0
    iget-object p0, p0, Landroidx/slice/widget/RowStyle;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    .line 2
    iget p0, p0, Landroidx/slice/widget/SliceStyle;->mSubtitleColor:I

    :goto_0
    return p0
.end method

.method public getTintColor()I
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/RowStyle;->mTintColor:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    goto :goto_0

    :cond_0
    iget-object p0, p0, Landroidx/slice/widget/RowStyle;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    .line 2
    iget p0, p0, Landroidx/slice/widget/SliceStyle;->mTintColor:I

    :goto_0
    return p0
.end method

.method public getTitleColor()I
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/RowStyle;->mTitleColor:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    goto :goto_0

    :cond_0
    iget-object p0, p0, Landroidx/slice/widget/RowStyle;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    .line 2
    iget p0, p0, Landroidx/slice/widget/SliceStyle;->mTitleColor:I

    :goto_0
    return p0
.end method
