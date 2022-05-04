.class public Lcom/android/customization/model/grid/GridSectionController$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/customization/model/CustomizationManager$OptionsFetchedListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/customization/model/CustomizationManager$OptionsFetchedListener<",
        "Lcom/android/customization/model/grid/GridOption;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/customization/model/grid/GridSectionController;

.field public final synthetic val$sectionDescription:Landroid/widget/TextView;

.field public final synthetic val$sectionTile:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/android/customization/model/grid/GridSectionController;Landroid/widget/TextView;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/customization/model/grid/GridSectionController$1;->this$0:Lcom/android/customization/model/grid/GridSectionController;

    iput-object p2, p0, Lcom/android/customization/model/grid/GridSectionController$1;->val$sectionDescription:Landroid/widget/TextView;

    iput-object p3, p0, Lcom/android/customization/model/grid/GridSectionController$1;->val$sectionTile:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/Throwable;)V
    .locals 2

    if-eqz p1, :cond_0

    const-string v0, "GridSectionController"

    const-string v1, "Error loading grid options"

    .line 1
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2
    :cond_0
    iget-object p1, p0, Lcom/android/customization/model/grid/GridSectionController$1;->val$sectionDescription:Landroid/widget/TextView;

    const v0, 0x7f110122

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 3
    iget-object p0, p0, Lcom/android/customization/model/grid/GridSectionController$1;->val$sectionTile:Landroid/view/View;

    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public onOptionsLoaded(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/customization/model/grid/GridOption;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/customization/model/grid/GridSectionController$1;->val$sectionDescription:Landroid/widget/TextView;

    iget-object p0, p0, Lcom/android/customization/model/grid/GridSectionController$1;->this$0:Lcom/android/customization/model/grid/GridSectionController;

    .line 2
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    move-result-object v1

    new-instance v2, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;

    invoke-direct {v2, p0}, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;-><init>(Lcom/android/customization/model/grid/GridSectionController;)V

    .line 4
    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/util/stream/Stream;->findAny()Ljava/util/Optional;

    move-result-object p0

    const/4 v1, 0x0

    .line 6
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/customization/model/grid/GridOption;

    invoke-virtual {p0, p1}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/customization/model/grid/GridOption;

    .line 7
    iget-object p0, p0, Lcom/android/customization/model/grid/GridOption;->mTitle:Ljava/lang/String;

    .line 8
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
