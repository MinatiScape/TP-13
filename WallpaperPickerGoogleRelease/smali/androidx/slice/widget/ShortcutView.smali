.class public Landroidx/slice/widget/ShortcutView;
.super Landroidx/slice/widget/SliceChildView;
.source "SourceFile"


# instance fields
.field public mActionItem:Landroidx/slice/SliceItem;

.field public mIcon:Landroidx/core/graphics/drawable/IconCompat;

.field public mLargeIconSize:I

.field public mListContent:Landroidx/slice/widget/ListContent;

.field public mLoadingActions:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/slice/SliceItem;",
            ">;"
        }
    .end annotation
.end field

.field public mSmallIconSize:I


# direct methods
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

    .line 1
    invoke-direct {p0, p1}, Landroidx/slice/widget/SliceChildView;-><init>(Landroid/content/Context;)V

    .line 2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f070048

    .line 3
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Landroidx/slice/widget/ShortcutView;->mSmallIconSize:I

    const v0, 0x7f070055

    .line 4
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Landroidx/slice/widget/ShortcutView;->mLargeIconSize:I

    return-void
.end method


# virtual methods
.method public getLoadingActions()Ljava/util/Set;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Landroidx/slice/SliceItem;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Landroidx/slice/widget/ShortcutView;->mLoadingActions:Ljava/util/Set;

    return-object p0
.end method

.method public performClick()Z
    .locals 6

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/ShortcutView;->mListContent:Landroidx/slice/widget/ListContent;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 2
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->callOnClick()Z

    move-result v0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    .line 3
    :try_start_0
    iget-object v0, p0, Landroidx/slice/widget/ShortcutView;->mActionItem:Landroidx/slice/SliceItem;

    if-eqz v0, :cond_2

    const/4 v3, 0x0

    .line 4
    invoke-virtual {v0, v3, v3}, Landroidx/slice/SliceItem;->fireActionInternal(Landroid/content/Context;Landroid/content/Intent;)Z

    .line 5
    iget-object v0, p0, Landroidx/slice/widget/SliceChildView;->mObserver:Landroidx/slice/widget/SliceView$OnSliceActionListener;

    if-eqz v0, :cond_2

    .line 6
    new-instance v3, Landroidx/slice/widget/EventInfo;

    const/4 v4, 0x3

    const/4 v5, -0x1

    invoke-direct {v3, v4, v2, v5, v1}, Landroidx/slice/widget/EventInfo;-><init>(IIII)V

    .line 7
    iget-object v1, p0, Landroidx/slice/widget/ShortcutView;->mActionItem:Landroidx/slice/SliceItem;

    if-eqz v1, :cond_1

    goto :goto_0

    .line 8
    :cond_1
    iget-object p0, p0, Landroidx/slice/widget/ShortcutView;->mListContent:Landroidx/slice/widget/ListContent;

    .line 9
    iget-object v1, p0, Landroidx/slice/widget/SliceContent;->mSliceItem:Landroidx/slice/SliceItem;

    .line 10
    :goto_0
    invoke-interface {v0, v3, v1}, Landroidx/slice/widget/SliceView$OnSliceActionListener;->onSliceAction(Landroidx/slice/widget/EventInfo;Landroidx/slice/SliceItem;)V
    :try_end_0
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    const-string v0, "ShortcutView"

    const-string v1, "PendingIntent for slice cannot be sent"

    .line 11
    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_2
    :goto_1
    return v2
.end method

.method public resetView()V
    .locals 1

    const/4 v0, 0x0

    .line 1
    iput-object v0, p0, Landroidx/slice/widget/ShortcutView;->mListContent:Landroidx/slice/widget/ListContent;

    .line 2
    iput-object v0, p0, Landroidx/slice/widget/ShortcutView;->mActionItem:Landroidx/slice/SliceItem;

    .line 3
    iput-object v0, p0, Landroidx/slice/widget/ShortcutView;->mIcon:Landroidx/core/graphics/drawable/IconCompat;

    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 5
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->removeAllViews()V

    return-void
.end method

.method public setLoadingActions(Ljava/util/Set;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "actions"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Landroidx/slice/SliceItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Landroidx/slice/widget/ShortcutView;->mLoadingActions:Ljava/util/Set;

    return-void
.end method

.method public setSliceContent(Landroidx/slice/widget/ListContent;)V
    .locals 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "sliceContent"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroidx/slice/widget/ShortcutView;->resetView()V

    .line 2
    iput-object p1, p0, Landroidx/slice/widget/ShortcutView;->mListContent:Landroidx/slice/widget/ListContent;

    if-nez p1, :cond_0

    return-void

    .line 3
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/slice/widget/ListContent;->getShortcut(Landroid/content/Context;)Landroidx/slice/core/SliceAction;

    move-result-object p1

    check-cast p1, Landroidx/slice/core/SliceActionImpl;

    .line 4
    iget-object v0, p1, Landroidx/slice/core/SliceActionImpl;->mActionItem:Landroidx/slice/SliceItem;

    .line 5
    iput-object v0, p0, Landroidx/slice/widget/ShortcutView;->mActionItem:Landroidx/slice/SliceItem;

    .line 6
    iget-object v0, p1, Landroidx/slice/core/SliceActionImpl;->mIcon:Landroidx/core/graphics/drawable/IconCompat;

    .line 7
    iput-object v0, p0, Landroidx/slice/widget/ShortcutView;->mIcon:Landroidx/core/graphics/drawable/IconCompat;

    .line 8
    iget p1, p1, Landroidx/slice/core/SliceActionImpl;->mImageMode:I

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-nez p1, :cond_1

    move p1, v0

    goto :goto_0

    :cond_1
    move p1, v1

    .line 9
    :goto_0
    iget-object v2, p0, Landroidx/slice/widget/ShortcutView;->mListContent:Landroidx/slice/widget/ListContent;

    .line 10
    iget-object v2, v2, Landroidx/slice/widget/SliceContent;->mColorItem:Landroidx/slice/SliceItem;

    const/4 v3, -0x1

    if-eqz v2, :cond_2

    invoke-virtual {v2}, Landroidx/slice/SliceItem;->getInt()I

    move-result v2

    goto :goto_1

    :cond_2
    move v2, v3

    :goto_1
    if-eq v2, v3, :cond_3

    goto :goto_2

    .line 11
    :cond_3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v2

    const v4, 0x1010435

    .line 12
    invoke-static {v2, v4}, Landroidx/slice/widget/SliceViewUtil;->getColorAttr(Landroid/content/Context;I)I

    move-result v2

    .line 13
    :goto_2
    new-instance v4, Landroid/graphics/drawable/ShapeDrawable;

    new-instance v5, Landroid/graphics/drawable/shapes/OvalShape;

    invoke-direct {v5}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    invoke-direct {v4, v5}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 14
    invoke-virtual {v4, v2}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 15
    new-instance v2, Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v2, v5}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 16
    iget-object v5, p0, Landroidx/slice/widget/ShortcutView;->mIcon:Landroidx/core/graphics/drawable/IconCompat;

    if-eqz v5, :cond_4

    if-eqz p1, :cond_4

    .line 17
    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 18
    :cond_4
    invoke-virtual {p0, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 19
    iget-object v4, p0, Landroidx/slice/widget/ShortcutView;->mIcon:Landroidx/core/graphics/drawable/IconCompat;

    const/16 v5, 0x11

    if-eqz v4, :cond_8

    if-eqz p1, :cond_5

    .line 20
    iget v4, p0, Landroidx/slice/widget/ShortcutView;->mSmallIconSize:I

    goto :goto_3

    :cond_5
    iget v4, p0, Landroidx/slice/widget/ShortcutView;->mLargeIconSize:I

    .line 21
    :goto_3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v6

    iget-object v7, p0, Landroidx/slice/widget/ShortcutView;->mIcon:Landroidx/core/graphics/drawable/IconCompat;

    xor-int/2addr p1, v0

    .line 22
    new-instance v8, Landroid/widget/ImageView;

    invoke-direct {v8, v6}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 23
    invoke-virtual {v7, v6}, Landroidx/core/graphics/drawable/IconCompat;->checkResource(Landroid/content/Context;)V

    .line 24
    invoke-virtual {v7, v6}, Landroidx/core/graphics/drawable/IconCompat;->toIcon(Landroid/content/Context;)Landroid/graphics/drawable/Icon;

    move-result-object v7

    invoke-virtual {v7, v6}, Landroid/graphics/drawable/Icon;->loadDrawable(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    .line 25
    invoke-virtual {v8, v6}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    if-eqz p1, :cond_6

    .line 26
    sget-object v6, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    goto :goto_4

    .line 27
    :cond_6
    sget-object v6, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    .line 28
    :goto_4
    invoke-virtual {v8, v6}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 29
    invoke-virtual {p0, v8}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 30
    invoke-virtual {v8}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/widget/FrameLayout$LayoutParams;

    if-eqz p1, :cond_7

    .line 31
    sget-object p1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v4, v4, p1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 32
    new-instance v3, Landroid/graphics/Canvas;

    invoke-direct {v3, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 33
    invoke-virtual {v8, v1, v1, v4, v4}, Landroid/widget/ImageView;->layout(IIII)V

    .line 34
    invoke-virtual {v8, v3}, Landroid/widget/ImageView;->draw(Landroid/graphics/Canvas;)V

    .line 35
    invoke-static {p1}, Landroidx/slice/widget/SliceViewUtil;->getCircularBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-virtual {v8, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_5

    .line 36
    :cond_7
    invoke-virtual {v8, v3}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 37
    :goto_5
    iput v4, v6, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 38
    iput v4, v6, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 39
    iput v5, v6, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 40
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setClickable(Z)V

    goto :goto_6

    .line 41
    :cond_8
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setClickable(Z)V

    .line 42
    :goto_6
    invoke-virtual {v2}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 43
    iput v5, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 44
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method
