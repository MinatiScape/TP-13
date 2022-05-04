.class public Lcom/android/customization/model/color/ColorBundle;
.super Lcom/android/customization/model/color/ColorOption;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/customization/model/color/ColorBundle$PreviewInfo;
    }
.end annotation


# instance fields
.field public final mPreviewInfo:Lcom/android/customization/model/color/ColorBundle$PreviewInfo;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/Map;ZILcom/android/customization/model/color/ColorBundle$PreviewInfo;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;ZI",
            "Lcom/android/customization/model/color/ColorBundle$PreviewInfo;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/customization/model/color/ColorOption;-><init>(Ljava/lang/String;Ljava/util/Map;ZI)V

    .line 2
    iput-object p5, p0, Lcom/android/customization/model/color/ColorBundle;->mPreviewInfo:Lcom/android/customization/model/color/ColorBundle$PreviewInfo;

    return-void
.end method


# virtual methods
.method public bindThumbnailTile(Landroid/view/View;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 2
    iget-object v1, p0, Lcom/android/customization/model/color/ColorBundle;->mPreviewInfo:Lcom/android/customization/model/color/ColorBundle$PreviewInfo;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget v2, v2, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 v2, v2, 0x30

    const/16 v3, 0x20

    if-ne v2, v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    if-eqz v2, :cond_1

    .line 4
    iget v1, v1, Lcom/android/customization/model/color/ColorBundle$PreviewInfo;->secondaryColorDark:I

    goto :goto_1

    :cond_1
    iget v1, v1, Lcom/android/customization/model/color/ColorBundle$PreviewInfo;->secondaryColorLight:I

    :goto_1
    const v2, 0x7f0a00a4

    .line 5
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f080077

    .line 7
    invoke-virtual {v3}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v3

    .line 8
    invoke-virtual {v4, v5, v3}, Landroid/content/res/Resources;->getDrawable(ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    check-cast v3, Landroid/graphics/drawable/GradientDrawable;

    if-eqz v1, :cond_2

    .line 9
    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/graphics/drawable/GradientDrawable;->setTintList(Landroid/content/res/ColorStateList;)V

    goto :goto_2

    :cond_2
    const v1, 0x106003f

    .line 10
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    .line 11
    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/graphics/drawable/GradientDrawable;->setTintList(Landroid/content/res/ColorStateList;)V

    .line 12
    :goto_2
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 13
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/android/customization/model/color/ColorOption;->mContentDescription:Ljava/lang/CharSequence;

    if-nez v1, :cond_4

    const v1, 0x7f110078

    .line 15
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 16
    iget-boolean v1, p0, Lcom/android/customization/model/color/ColorOption;->mIsDefault:Z

    if-eqz v1, :cond_3

    .line 17
    iput-object v0, p0, Lcom/android/customization/model/color/ColorOption;->mContentDescription:Ljava/lang/CharSequence;

    goto :goto_3

    .line 18
    :cond_3
    iget-object v0, p0, Lcom/android/customization/model/color/ColorOption;->mTitle:Ljava/lang/String;

    iput-object v0, p0, Lcom/android/customization/model/color/ColorOption;->mContentDescription:Ljava/lang/CharSequence;

    .line 19
    :cond_4
    :goto_3
    iget-object p0, p0, Lcom/android/customization/model/color/ColorOption;->mContentDescription:Ljava/lang/CharSequence;

    .line 20
    invoke-virtual {p1, p0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public getLayoutResId()I
    .locals 0

    const p0, 0x7f0d003e

    return p0
.end method

.method public getSource()Ljava/lang/String;
    .locals 0

    const-string p0, "preset"

    return-object p0
.end method
