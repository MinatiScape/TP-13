.class public Lcom/android/customization/widget/OptionSelectorController$1;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/customization/widget/OptionSelectorController;->initOptions(Lcom/android/customization/model/CustomizationManager;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/customization/widget/OptionSelectorController;

.field public final synthetic val$manager:Lcom/android/customization/model/CustomizationManager;


# direct methods
.method public constructor <init>(Lcom/android/customization/widget/OptionSelectorController;Lcom/android/customization/model/CustomizationManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/customization/widget/OptionSelectorController$1;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    iput-object p2, p0, Lcom/android/customization/widget/OptionSelectorController$1;->val$manager:Lcom/android/customization/model/CustomizationManager;

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    return-void
.end method


# virtual methods
.method public final drawCheckmark(Lcom/android/customization/model/CustomizationOption;Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;Landroid/graphics/drawable/Drawable;IIIZ)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/customization/model/CustomizationOption<",
            "*>;",
            "Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;",
            "Landroid/graphics/drawable/Drawable;",
            "IIIZ)V"
        }
    .end annotation

    .line 1
    iget-object v0, p2, Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;->tileView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getForeground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Landroid/graphics/drawable/Drawable;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const/4 v3, 0x1

    aput-object p3, v1, v3

    if-nez v0, :cond_0

    new-array v1, v3, [Landroid/graphics/drawable/Drawable;

    aput-object p3, v1, v2

    .line 2
    :cond_0
    new-instance p3, Landroid/graphics/drawable/LayerDrawable;

    invoke-direct {p3, v1}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 3
    array-length v0, v1

    sub-int/2addr v0, v3

    .line 4
    invoke-virtual {p3, v0, p4}, Landroid/graphics/drawable/LayerDrawable;->setLayerGravity(II)V

    .line 5
    invoke-virtual {p3, v0, p5}, Landroid/graphics/drawable/LayerDrawable;->setLayerWidth(II)V

    .line 6
    invoke-virtual {p3, v0, p5}, Landroid/graphics/drawable/LayerDrawable;->setLayerHeight(II)V

    .line 7
    invoke-virtual {p3, v0, p6}, Landroid/graphics/drawable/LayerDrawable;->setLayerInsetBottom(II)V

    .line 8
    invoke-virtual {p3, v0, p6}, Landroid/graphics/drawable/LayerDrawable;->setLayerInsetRight(II)V

    .line 9
    iget-object p4, p2, Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;->tileView:Landroid/view/View;

    invoke-virtual {p4, p3}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    if-eqz p7, :cond_1

    .line 10
    iget-object p0, p0, Lcom/android/customization/widget/OptionSelectorController$1;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 11
    iget-object p0, p0, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    .line 12
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p0

    const p3, 0x7f1100f6

    invoke-virtual {p2, p0, p1, p3}, Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;->setContentDescription(Landroid/content/Context;Lcom/android/customization/model/CustomizationOption;I)V

    goto :goto_0

    .line 13
    :cond_1
    iget-object p0, p0, Lcom/android/customization/widget/OptionSelectorController$1;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 14
    iget-object p0, p0, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    .line 15
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p0

    const p3, 0x7f1100f5

    invoke-virtual {p2, p0, p1, p3}, Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;->setContentDescription(Landroid/content/Context;Lcom/android/customization/model/CustomizationOption;I)V

    :goto_0
    return-void
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/customization/widget/OptionSelectorController$1;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 2
    iget-object p0, p0, Lcom/android/customization/widget/OptionSelectorController;->mOptions:Ljava/util/List;

    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/customization/widget/OptionSelectorController$1;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 2
    iget-object p0, p0, Lcom/android/customization/widget/OptionSelectorController;->mOptions:Ljava/util/List;

    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/customization/model/CustomizationOption;

    invoke-interface {p0}, Lcom/android/customization/model/CustomizationOption;->getLayoutResId()I

    move-result p0

    return p0
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 8

    .line 1
    move-object v2, p1

    check-cast v2, Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;

    .line 2
    iget-object p1, p0, Lcom/android/customization/widget/OptionSelectorController$1;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 3
    iget-object p1, p1, Lcom/android/customization/widget/OptionSelectorController;->mOptions:Ljava/util/List;

    .line 4
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Lcom/android/customization/model/CustomizationOption;

    .line 5
    iget-object p1, p0, Lcom/android/customization/widget/OptionSelectorController$1;->val$manager:Lcom/android/customization/model/CustomizationManager;

    invoke-interface {v1, p1}, Lcom/android/customization/model/CustomizationOption;->isActive(Lcom/android/customization/model/CustomizationManager;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 6
    iget-object p1, p0, Lcom/android/customization/widget/OptionSelectorController$1;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 7
    iput-object v1, p1, Lcom/android/customization/widget/OptionSelectorController;->mAppliedOption:Lcom/android/customization/model/CustomizationOption;

    .line 8
    iget-object p2, p1, Lcom/android/customization/widget/OptionSelectorController;->mSelectedOption:Lcom/android/customization/model/CustomizationOption;

    if-nez p2, :cond_0

    .line 9
    iput-object v1, p1, Lcom/android/customization/widget/OptionSelectorController;->mSelectedOption:Lcom/android/customization/model/CustomizationOption;

    .line 10
    :cond_0
    iget-object p1, v2, Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;->labelView:Landroid/widget/TextView;

    if-eqz p1, :cond_1

    .line 11
    invoke-interface {v1}, Lcom/android/customization/model/CustomizationOption;->getTitle()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    :cond_1
    iget-object p1, v2, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object p2, p0, Lcom/android/customization/widget/OptionSelectorController$1;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 13
    iget-object p2, p2, Lcom/android/customization/widget/OptionSelectorController;->mSelectedOption:Lcom/android/customization/model/CustomizationOption;

    .line 14
    invoke-virtual {v1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p2

    invoke-virtual {p1, p2}, Landroid/view/View;->setActivated(Z)V

    .line 15
    iget-object p1, v2, Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;->tileView:Landroid/view/View;

    invoke-interface {v1, p1}, Lcom/android/customization/model/CustomizationOption;->bindThumbnailTile(Landroid/view/View;)V

    .line 16
    iget-object p1, v2, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    new-instance p2, Lcom/android/customization/widget/OptionSelectorController$1$$ExternalSyntheticLambda0;

    invoke-direct {p2, p0, v1}, Lcom/android/customization/widget/OptionSelectorController$1$$ExternalSyntheticLambda0;-><init>(Lcom/android/customization/widget/OptionSelectorController$1;Lcom/android/customization/model/CustomizationOption;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 17
    iget-object p1, p0, Lcom/android/customization/widget/OptionSelectorController$1;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 18
    iget-object p1, p1, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    .line 19
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    .line 20
    iget-object p2, p0, Lcom/android/customization/widget/OptionSelectorController$1;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 21
    iget v0, p2, Lcom/android/customization/widget/OptionSelectorController;->mCheckmarkStyle:I

    const/4 v3, 0x1

    if-ne v0, v3, :cond_2

    .line 22
    iget-object p2, p2, Lcom/android/customization/widget/OptionSelectorController;->mAppliedOption:Lcom/android/customization/model/CustomizationOption;

    .line 23
    invoke-virtual {v1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_2

    const p2, 0x7f080072

    .line 24
    iget-object v0, p0, Lcom/android/customization/widget/OptionSelectorController$1;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 25
    iget-object v0, v0, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    .line 26
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    .line 27
    invoke-virtual {p1, p2, v0}, Landroid/content/res/Resources;->getDrawable(ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    const/16 v4, 0x55

    const p2, 0x7f07008d

    .line 28
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    const p2, 0x7f07008c

    .line 29
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v6

    const/4 v7, 0x1

    move-object v0, p0

    .line 30
    invoke-virtual/range {v0 .. v7}, Lcom/android/customization/widget/OptionSelectorController$1;->drawCheckmark(Lcom/android/customization/model/CustomizationOption;Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;Landroid/graphics/drawable/Drawable;IIIZ)V

    goto/16 :goto_2

    .line 31
    :cond_2
    iget-object p2, p0, Lcom/android/customization/widget/OptionSelectorController$1;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 32
    iget v0, p2, Lcom/android/customization/widget/OptionSelectorController;->mCheckmarkStyle:I

    const/4 v3, 0x2

    const v4, 0x7f07008b

    const v5, 0x7f080073

    if-ne v0, v3, :cond_3

    .line 33
    iget-object p2, p2, Lcom/android/customization/widget/OptionSelectorController;->mAppliedOption:Lcom/android/customization/model/CustomizationOption;

    .line 34
    invoke-virtual {v1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_3

    .line 35
    iget-object p2, p0, Lcom/android/customization/widget/OptionSelectorController$1;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 36
    iget-object p2, p2, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    .line 37
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p2

    .line 38
    invoke-virtual {p1, v5, p2}, Landroid/content/res/Resources;->getDrawable(ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    const/16 p2, 0x11

    .line 39
    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    const/4 v6, 0x0

    const/4 v7, 0x1

    move-object v0, p0

    move v4, p2

    .line 40
    invoke-virtual/range {v0 .. v7}, Lcom/android/customization/widget/OptionSelectorController$1;->drawCheckmark(Lcom/android/customization/model/CustomizationOption;Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;Landroid/graphics/drawable/Drawable;IIIZ)V

    goto/16 :goto_2

    .line 41
    :cond_3
    iget-object p2, p0, Lcom/android/customization/widget/OptionSelectorController$1;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 42
    iget v0, p2, Lcom/android/customization/widget/OptionSelectorController;->mCheckmarkStyle:I

    const/4 v3, 0x3

    if-ne v0, v3, :cond_5

    .line 43
    iget-object p2, p2, Lcom/android/customization/widget/OptionSelectorController;->mAppliedOption:Lcom/android/customization/model/CustomizationOption;

    .line 44
    invoke-virtual {v1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_5

    .line 45
    iget-object p2, p0, Lcom/android/customization/widget/OptionSelectorController$1;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 46
    iget-object p2, p2, Lcom/android/customization/widget/OptionSelectorController;->mSelectedOption:Lcom/android/customization/model/CustomizationOption;

    .line 47
    invoke-virtual {v1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_4

    goto :goto_0

    :cond_4
    const v5, 0x7f080074

    .line 48
    :goto_0
    iget-object p2, p0, Lcom/android/customization/widget/OptionSelectorController$1;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 49
    iget-object p2, p2, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    .line 50
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p2

    .line 51
    invoke-virtual {p1, v5, p2}, Landroid/content/res/Resources;->getDrawable(ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    const/16 p2, 0x11

    .line 52
    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    const/4 v6, 0x0

    iget-object p1, p0, Lcom/android/customization/widget/OptionSelectorController$1;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 53
    iget-object p1, p1, Lcom/android/customization/widget/OptionSelectorController;->mSelectedOption:Lcom/android/customization/model/CustomizationOption;

    .line 54
    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    move-object v0, p0

    move v4, p2

    .line 55
    invoke-virtual/range {v0 .. v7}, Lcom/android/customization/widget/OptionSelectorController$1;->drawCheckmark(Lcom/android/customization/model/CustomizationOption;Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;Landroid/graphics/drawable/Drawable;IIIZ)V

    goto :goto_2

    .line 56
    :cond_5
    iget-object p1, p0, Lcom/android/customization/widget/OptionSelectorController$1;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 57
    iget-object p1, p1, Lcom/android/customization/widget/OptionSelectorController;->mAppliedOption:Lcom/android/customization/model/CustomizationOption;

    .line 58
    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    const p2, 0x7f1100f8

    if-eqz p1, :cond_6

    .line 59
    iget-object p0, p0, Lcom/android/customization/widget/OptionSelectorController$1;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 60
    iget-object p0, p0, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    .line 61
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v2, p0, v1, p2}, Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;->setContentDescription(Landroid/content/Context;Lcom/android/customization/model/CustomizationOption;I)V

    goto :goto_2

    .line 62
    :cond_6
    iget-object p1, p0, Lcom/android/customization/widget/OptionSelectorController$1;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 63
    iget v0, p1, Lcom/android/customization/widget/OptionSelectorController;->mCheckmarkStyle:I

    if-eqz v0, :cond_9

    if-ne v0, v3, :cond_8

    .line 64
    iget-object p1, p1, Lcom/android/customization/widget/OptionSelectorController;->mSelectedOption:Lcom/android/customization/model/CustomizationOption;

    .line 65
    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    .line 66
    iget-object p0, p0, Lcom/android/customization/widget/OptionSelectorController$1;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 67
    iget-object p0, p0, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    .line 68
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v2, p0, v1, p2}, Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;->setContentDescription(Landroid/content/Context;Lcom/android/customization/model/CustomizationOption;I)V

    goto :goto_1

    .line 69
    :cond_7
    iget-object p0, p0, Lcom/android/customization/widget/OptionSelectorController$1;->this$0:Lcom/android/customization/widget/OptionSelectorController;

    .line 70
    iget-object p0, p0, Lcom/android/customization/widget/OptionSelectorController;->mContainer:Landroidx/recyclerview/widget/RecyclerView;

    .line 71
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p0

    const p1, 0x7f1100f7

    invoke-virtual {v2, p0, v1, p1}, Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;->setContentDescription(Landroid/content/Context;Lcom/android/customization/model/CustomizationOption;I)V

    .line 72
    :cond_8
    :goto_1
    iget-object p0, v2, Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;->tileView:Landroid/view/View;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    :cond_9
    :goto_2
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    .line 2
    new-instance p1, Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;

    invoke-direct {p1, p0}, Lcom/android/customization/widget/OptionSelectorController$TileViewHolder;-><init>(Landroid/view/View;)V

    return-object p1
.end method
