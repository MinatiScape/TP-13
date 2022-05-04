.class public Landroidx/slice/widget/MessageView;
.super Landroidx/slice/widget/SliceChildView;
.source "SourceFile"


# instance fields
.field public mDetails:Landroid/widget/TextView;

.field public mIcon:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
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

    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    const v0, 0x1020010

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Landroidx/slice/widget/MessageView;->mDetails:Landroid/widget/TextView;

    const v0, 0x1020006

    .line 3
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Landroidx/slice/widget/MessageView;->mIcon:Landroid/widget/ImageView;

    return-void
.end method

.method public resetView()V
    .locals 0

    return-void
.end method

.method public setSliceItem(Landroidx/slice/widget/SliceContent;ZIILandroidx/slice/widget/SliceView$OnSliceActionListener;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "content",
            "isHeader",
            "index",
            "rowCount",
            "observer"
        }
    .end annotation

    .line 1
    iget-object p1, p1, Landroidx/slice/widget/SliceContent;->mSliceItem:Landroidx/slice/SliceItem;

    .line 2
    iput-object p5, p0, Landroidx/slice/widget/SliceChildView;->mObserver:Landroidx/slice/widget/SliceView$OnSliceActionListener;

    const-string p2, "image"

    const-string p3, "source"

    .line 3
    invoke-static {p1, p2, p3}, Landroidx/slice/core/SliceQuery;->findSubtype(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 4
    iget-object p2, p2, Landroidx/slice/SliceItem;->mObj:Ljava/lang/Object;

    check-cast p2, Landroidx/core/graphics/drawable/IconCompat;

    if-eqz p2, :cond_0

    .line 5
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroidx/core/graphics/drawable/IconCompat;->loadDrawable(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    if-eqz p2, :cond_0

    const/4 p3, 0x1

    const/high16 p4, 0x41c00000    # 24.0f

    .line 6
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p5

    invoke-virtual {p5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p5

    invoke-virtual {p5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p5

    .line 7
    invoke-static {p3, p4, p5}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p3

    float-to-int p3, p3

    .line 8
    sget-object p4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p3, p3, p4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p4

    .line 9
    new-instance p5, Landroid/graphics/Canvas;

    invoke-direct {p5, p4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    const/4 v0, 0x0

    .line 10
    invoke-virtual {p2, v0, v0, p3, p3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 11
    invoke-virtual {p2, p5}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 12
    iget-object p2, p0, Landroidx/slice/widget/MessageView;->mIcon:Landroid/widget/ImageView;

    invoke-static {p4}, Landroidx/slice/widget/SliceViewUtil;->getCircularBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 13
    :cond_0
    new-instance p2, Landroid/text/SpannableStringBuilder;

    invoke-direct {p2}, Landroid/text/SpannableStringBuilder;-><init>()V

    const/4 p3, 0x0

    const-string p4, "text"

    .line 14
    invoke-static {p1, p4, p3, p3}, Landroidx/slice/core/SliceQuery;->findAll(Landroidx/slice/SliceItem;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    .line 15
    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroidx/slice/SliceItem;

    .line 16
    invoke-virtual {p2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p4

    if-eqz p4, :cond_1

    const/16 p4, 0xa

    .line 17
    invoke-virtual {p2, p4}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 18
    :cond_1
    invoke-virtual {p3}, Landroidx/slice/SliceItem;->getSanitizedText()Ljava/lang/CharSequence;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto :goto_0

    .line 19
    :cond_2
    iget-object p0, p0, Landroidx/slice/widget/MessageView;->mDetails:Landroid/widget/TextView;

    invoke-virtual {p2}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
