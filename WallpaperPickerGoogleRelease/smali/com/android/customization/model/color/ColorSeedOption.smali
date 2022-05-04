.class public Lcom/android/customization/model/color/ColorSeedOption;
.super Lcom/android/customization/model/color/ColorOption;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/customization/model/color/ColorSeedOption$PreviewInfo;
    }
.end annotation


# instance fields
.field public final mPreviewColorIds:[I

.field public final mPreviewInfo:Lcom/android/customization/model/color/ColorSeedOption$PreviewInfo;

.field public final mSource:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/Map;ZLjava/lang/String;ILcom/android/customization/model/color/ColorSeedOption$PreviewInfo;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z",
            "Ljava/lang/String;",
            "I",
            "Lcom/android/customization/model/color/ColorSeedOption$PreviewInfo;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2, p3, p5}, Lcom/android/customization/model/color/ColorOption;-><init>(Ljava/lang/String;Ljava/util/Map;ZI)V

    const/4 p1, 0x4

    new-array p1, p1, [I

    .line 2
    fill-array-data p1, :array_0

    iput-object p1, p0, Lcom/android/customization/model/color/ColorSeedOption;->mPreviewColorIds:[I

    .line 3
    iput-object p4, p0, Lcom/android/customization/model/color/ColorSeedOption;->mSource:Ljava/lang/String;

    .line 4
    iput-object p6, p0, Lcom/android/customization/model/color/ColorSeedOption;->mPreviewInfo:Lcom/android/customization/model/color/ColorSeedOption$PreviewInfo;

    return-void

    :array_0
    .array-data 4
        0x7f0a00a0
        0x7f0a00a1
        0x7f0a00a2
        0x7f0a00a3
    .end array-data
.end method


# virtual methods
.method public bindThumbnailTile(Landroid/view/View;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 2
    iget-object v1, p0, Lcom/android/customization/model/color/ColorSeedOption;->mPreviewInfo:Lcom/android/customization/model/color/ColorSeedOption$PreviewInfo;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget v2, v2, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 v2, v2, 0x30

    const/16 v3, 0x20

    const/4 v4, 0x0

    if-ne v2, v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    move v2, v4

    :goto_0
    if-eqz v2, :cond_1

    .line 4
    iget-object v1, v1, Lcom/android/customization/model/color/ColorSeedOption$PreviewInfo;->darkColors:[I

    goto :goto_1

    :cond_1
    iget-object v1, v1, Lcom/android/customization/model/color/ColorSeedOption$PreviewInfo;->lightColors:[I

    .line 5
    :goto_1
    invoke-virtual {p1}, Landroid/view/View;->isActivated()Z

    move-result v2

    if-eqz v2, :cond_2

    const v2, 0x7f070095

    .line 6
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    goto :goto_2

    :cond_2
    const v2, 0x7f070094

    .line 7
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 8
    :goto_2
    iget-object v2, p0, Lcom/android/customization/model/color/ColorSeedOption;->mPreviewColorIds:[I

    array-length v3, v2

    if-ge v4, v3, :cond_3

    .line 9
    aget v2, v2, v4

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 10
    invoke-virtual {v2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    aget v5, v1, v4

    sget-object v6, Landroid/graphics/PorterDuff$Mode;->SRC:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v3, v5, v6}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 11
    invoke-virtual {v2, v0, v0, v0, v0}, Landroid/widget/ImageView;->setPadding(IIII)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 12
    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const v0, 0x7f110143

    .line 13
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    .line 14
    invoke-virtual {p1, p0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public getLayoutResId()I
    .locals 0

    const p0, 0x7f0d0041

    return p0
.end method

.method public getSource()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/customization/model/color/ColorSeedOption;->mSource:Ljava/lang/String;

    return-object p0
.end method
