.class public Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/customization/widget/OptionSelectorController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TileViewHolder"
.end annotation


# instance fields
.field public labelView:Landroid/widget/TextView;

.field public tileView:Landroid/view/View;

.field public title:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    const v0, 0x7f0a018c

    .line 2
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;->labelView:Landroid/widget/TextView;

    const v0, 0x7f0a018d

    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;->tileView:Landroid/view/View;

    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;->title:Ljava/lang/CharSequence;

    return-void
.end method


# virtual methods
.method public setContentDescription(Landroid/content/Context;Lcom/android/customization/model/CustomizationOption;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/android/customization/model/CustomizationOption<",
            "*>;I)V"
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Lcom/android/customization/model/CustomizationOption;->getTitle()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;->title:Ljava/lang/CharSequence;

    .line 2
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;->tileView:Landroid/view/View;

    if-eqz p2, :cond_0

    .line 3
    invoke-virtual {p2}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object p2

    iput-object p2, p0, Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;->title:Ljava/lang/CharSequence;

    :cond_0
    const/4 p2, 0x1

    new-array p2, p2, [Ljava/lang/Object;

    const/4 v0, 0x0

    .line 4
    iget-object v1, p0, Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;->title:Ljava/lang/CharSequence;

    aput-object v1, p2, v0

    invoke-virtual {p1, p3, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 5
    iget-object p2, p0, Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;->labelView:Landroid/widget/TextView;

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_1

    .line 6
    iget-object p2, p0, Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;->labelView:Landroid/widget/TextView;

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setAccessibilityPaneTitle(Ljava/lang/CharSequence;)V

    .line 7
    iget-object p0, p0, Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;->labelView:Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 8
    :cond_1
    iget-object p2, p0, Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;->tileView:Landroid/view/View;

    if-eqz p2, :cond_2

    .line 9
    invoke-virtual {p2, p1}, Landroid/view/View;->setAccessibilityPaneTitle(Ljava/lang/CharSequence;)V

    .line 10
    iget-object p0, p0, Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;->tileView:Landroid/view/View;

    invoke-virtual {p0, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_2
    :goto_0
    return-void
.end method
