.class public Lcom/android/customization/model/color/ColorSectionController$ColorSectionAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/customization/model/color/ColorSectionController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ColorSectionAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/customization/model/color/ColorSectionController$ColorSectionAdapter$ColorOptionsViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field public final mItemCounts:I

.field public final synthetic this$0:Lcom/android/customization/model/color/ColorSectionController;


# direct methods
.method public constructor <init>(Lcom/android/customization/model/color/ColorSectionController;Lcom/android/customization/model/color/ColorSectionController$1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/customization/model/color/ColorSectionController$ColorSectionAdapter;->this$0:Lcom/android/customization/model/color/ColorSectionController;

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    const/4 p1, 0x2

    .line 2
    iput p1, p0, Lcom/android/customization/model/color/ColorSectionController$ColorSectionAdapter;->mItemCounts:I

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/customization/model/color/ColorSectionController$ColorSectionAdapter;->mItemCounts:I

    return p0
.end method

.method public getItemViewType(I)I
    .locals 0

    const p0, 0x7f0d003f

    return p0
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 3

    .line 1
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    instance-of v0, p1, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v0, :cond_2

    const/4 v0, 0x2

    const/4 v1, 0x1

    if-eqz p2, :cond_1

    if-eq p2, v1, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    iget-object p0, p0, Lcom/android/customization/model/color/ColorSectionController$ColorSectionAdapter;->this$0:Lcom/android/customization/model/color/ColorSectionController;

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    .line 3
    new-instance p2, Lcom/android/customization/widget/OptionSelectorController;

    iget-object v2, p0, Lcom/android/customization/model/color/ColorSectionController;->mPresetColorOptions:Ljava/util/List;

    invoke-direct {p2, p1, v2, v1, v0}, Lcom/android/customization/widget/OptionSelectorController;-><init>(Landroidx/recyclerview/widget/RecyclerView;Ljava/util/List;ZI)V

    .line 4
    iget-object p1, p0, Lcom/android/customization/model/color/ColorSectionController;->mColorManager:Lcom/android/customization/model/color/ColorCustomizationManager;

    invoke-virtual {p2, p1}, Lcom/android/customization/widget/OptionSelectorController;->initOptions(Lcom/android/customization/model/CustomizationManager;)V

    .line 5
    invoke-virtual {p0, p2}, Lcom/android/customization/model/color/ColorSectionController;->setUpColorOptionsController(Lcom/android/customization/widget/OptionSelectorController;)V

    goto :goto_0

    .line 6
    :cond_1
    iget-object p0, p0, Lcom/android/customization/model/color/ColorSectionController$ColorSectionAdapter;->this$0:Lcom/android/customization/model/color/ColorSectionController;

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    .line 7
    new-instance p2, Lcom/android/customization/widget/OptionSelectorController;

    iget-object v2, p0, Lcom/android/customization/model/color/ColorSectionController;->mWallpaperColorOptions:Ljava/util/List;

    invoke-direct {p2, p1, v2, v1, v0}, Lcom/android/customization/widget/OptionSelectorController;-><init>(Landroidx/recyclerview/widget/RecyclerView;Ljava/util/List;ZI)V

    .line 8
    iget-object p1, p0, Lcom/android/customization/model/color/ColorSectionController;->mColorManager:Lcom/android/customization/model/color/ColorCustomizationManager;

    invoke-virtual {p2, p1}, Lcom/android/customization/widget/OptionSelectorController;->initOptions(Lcom/android/customization/model/CustomizationManager;)V

    .line 9
    invoke-virtual {p0, p2}, Lcom/android/customization/model/color/ColorSectionController;->setUpColorOptionsController(Lcom/android/customization/widget/OptionSelectorController;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 3

    .line 1
    new-instance v0, Lcom/android/customization/model/color/ColorSectionController$ColorSectionAdapter$ColorOptionsViewHolder;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, p2, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {v0, p0, p1}, Lcom/android/customization/model/color/ColorSectionController$ColorSectionAdapter$ColorOptionsViewHolder;-><init>(Lcom/android/customization/model/color/ColorSectionController$ColorSectionAdapter;Landroid/view/View;)V

    return-object v0
.end method
