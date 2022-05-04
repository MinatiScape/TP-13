.class public Lcom/android/customization/picker/grid/GridFragment$2;
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
.field public final synthetic this$0:Lcom/android/customization/picker/grid/GridFragment;


# direct methods
.method public constructor <init>(Lcom/android/customization/picker/grid/GridFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/customization/picker/grid/GridFragment$2;->this$0:Lcom/android/customization/picker/grid/GridFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/Throwable;)V
    .locals 2

    if-eqz p1, :cond_0

    const-string v0, "GridFragment"

    const-string v1, "Error loading grid options"

    .line 1
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2
    :cond_0
    iget-object p0, p0, Lcom/android/customization/picker/grid/GridFragment$2;->this$0:Lcom/android/customization/picker/grid/GridFragment;

    .line 3
    iget-object p1, p0, Lcom/android/customization/picker/grid/GridFragment;->mLoading:Landroidx/core/widget/ContentLoadingProgressBar;

    invoke-virtual {p1}, Landroidx/core/widget/ContentLoadingProgressBar;->hide()V

    .line 4
    iget-object p1, p0, Lcom/android/customization/picker/grid/GridFragment;->mContent:Landroid/view/View;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 5
    iget-object p0, p0, Lcom/android/customization/picker/grid/GridFragment;->mError:Landroid/view/View;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public onOptionsLoaded(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/customization/model/grid/GridOption;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/customization/picker/grid/GridFragment$2;->this$0:Lcom/android/customization/picker/grid/GridFragment;

    .line 2
    iget-object v0, v0, Lcom/android/customization/picker/grid/GridFragment;->mLoading:Landroidx/core/widget/ContentLoadingProgressBar;

    .line 3
    invoke-virtual {v0}, Landroidx/core/widget/ContentLoadingProgressBar;->hide()V

    .line 4
    iget-object v0, p0, Lcom/android/customization/picker/grid/GridFragment$2;->this$0:Lcom/android/customization/picker/grid/GridFragment;

    new-instance v1, Lcom/android/customization/widget/OptionSelectorController;

    .line 5
    iget-object v2, v0, Lcom/android/customization/picker/grid/GridFragment;->mOptionsContainer:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v3, 0x0

    const/4 v4, 0x3

    .line 6
    invoke-direct {v1, v2, p1, v3, v4}, Lcom/android/customization/widget/OptionSelectorController;-><init>(Landroidx/recyclerview/widget/RecyclerView;Ljava/util/List;ZI)V

    .line 7
    iput-object v1, v0, Lcom/android/customization/picker/grid/GridFragment;->mOptionsController:Lcom/android/customization/widget/OptionSelectorController;

    .line 8
    iget-object v0, p0, Lcom/android/customization/picker/grid/GridFragment$2;->this$0:Lcom/android/customization/picker/grid/GridFragment;

    .line 9
    iget-object v1, v0, Lcom/android/customization/picker/grid/GridFragment;->mOptionsController:Lcom/android/customization/widget/OptionSelectorController;

    .line 10
    iget-object v0, v0, Lcom/android/customization/picker/grid/GridFragment;->mGridManager:Lcom/android/customization/model/grid/GridOptionsManager;

    .line 11
    invoke-virtual {v1, v0}, Lcom/android/customization/widget/OptionSelectorController;->initOptions(Lcom/android/customization/model/CustomizationManager;)V

    .line 12
    iget-object v0, p0, Lcom/android/customization/picker/grid/GridFragment$2;->this$0:Lcom/android/customization/picker/grid/GridFragment;

    .line 13
    iget-object v0, v0, Lcom/android/customization/picker/grid/GridFragment;->mGridOptionViewModel:Lcom/android/customization/model/grid/GridOptionViewModel;

    .line 14
    invoke-virtual {v0}, Lcom/android/customization/model/grid/GridOptionViewModel;->getSelectedOption()Lcom/android/customization/model/grid/GridOption;

    move-result-object v0

    .line 15
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    move-result-object v1

    new-instance v2, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;

    invoke-direct {v2, v0}, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;-><init>(Lcom/android/customization/model/grid/GridOption;)V

    .line 16
    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v0

    .line 17
    invoke-interface {v0}, Ljava/util/stream/Stream;->findAny()Ljava/util/Optional;

    move-result-object v0

    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, v1}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/customization/model/grid/GridOption;

    .line 19
    iget-object v1, p0, Lcom/android/customization/picker/grid/GridFragment$2;->this$0:Lcom/android/customization/picker/grid/GridFragment;

    .line 20
    iget-object v2, v1, Lcom/android/customization/picker/grid/GridFragment;->mGridOptionViewModel:Lcom/android/customization/model/grid/GridOptionViewModel;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 21
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    move-result-object v0

    new-instance v4, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;

    invoke-direct {v4, v1}, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;-><init>(Lcom/android/customization/picker/grid/GridFragment;)V

    .line 22
    invoke-interface {v0, v4}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v0

    .line 23
    invoke-interface {v0}, Ljava/util/stream/Stream;->findAny()Ljava/util/Optional;

    move-result-object v0

    .line 24
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/customization/model/grid/GridOption;

    invoke-virtual {v0, p1}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Lcom/android/customization/model/grid/GridOption;

    .line 25
    :goto_0
    invoke-virtual {v2, v0}, Lcom/android/customization/model/grid/GridOptionViewModel;->setSelectedOption(Lcom/android/customization/model/grid/GridOption;)V

    .line 26
    iget-object p1, p0, Lcom/android/customization/picker/grid/GridFragment$2;->this$0:Lcom/android/customization/picker/grid/GridFragment;

    .line 27
    iget-object v0, p1, Lcom/android/customization/picker/grid/GridFragment;->mOptionsController:Lcom/android/customization/widget/OptionSelectorController;

    .line 28
    iget-object p1, p1, Lcom/android/customization/picker/grid/GridFragment;->mGridOptionViewModel:Lcom/android/customization/model/grid/GridOptionViewModel;

    .line 29
    invoke-virtual {p1}, Lcom/android/customization/model/grid/GridOptionViewModel;->getSelectedOption()Lcom/android/customization/model/grid/GridOption;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/android/customization/widget/OptionSelectorController;->setSelectedOption(Lcom/android/customization/model/CustomizationOption;)V

    .line 30
    iget-object p1, p0, Lcom/android/customization/picker/grid/GridFragment$2;->this$0:Lcom/android/customization/picker/grid/GridFragment;

    .line 31
    iget-object v0, p1, Lcom/android/customization/picker/grid/GridFragment;->mGridOptionViewModel:Lcom/android/customization/model/grid/GridOptionViewModel;

    .line 32
    invoke-virtual {v0}, Lcom/android/customization/model/grid/GridOptionViewModel;->getSelectedOption()Lcom/android/customization/model/grid/GridOption;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/customization/picker/grid/GridFragment;->access$800(Lcom/android/customization/picker/grid/GridFragment;Lcom/android/customization/model/CustomizationOption;)V

    .line 33
    iget-object p1, p0, Lcom/android/customization/picker/grid/GridFragment$2;->this$0:Lcom/android/customization/picker/grid/GridFragment;

    .line 34
    iget-object v0, p1, Lcom/android/customization/picker/grid/GridFragment;->mGridOptionViewModel:Lcom/android/customization/model/grid/GridOptionViewModel;

    .line 35
    iget-object v1, v0, Lcom/android/customization/model/grid/GridOptionViewModel;->mState:Landroidx/lifecycle/SavedStateHandle;

    .line 36
    iget-object v1, v1, Landroidx/lifecycle/SavedStateHandle;->mRegular:Ljava/util/Map;

    const-string v2, "bottom_action_bar_visible"

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 37
    iget-object v0, v0, Lcom/android/customization/model/grid/GridOptionViewModel;->mState:Landroidx/lifecycle/SavedStateHandle;

    .line 38
    iget-object v0, v0, Landroidx/lifecycle/SavedStateHandle;->mRegular:Ljava/util/Map;

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 39
    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto :goto_1

    :cond_1
    move v0, v3

    :goto_1
    if-eqz v0, :cond_2

    .line 40
    iget-object p1, p1, Lcom/android/customization/picker/grid/GridFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    .line 41
    invoke-virtual {p1, v3}, Landroid/widget/FrameLayout;->setVisibility(I)V

    goto :goto_2

    .line 42
    :cond_2
    iget-object p1, p1, Lcom/android/customization/picker/grid/GridFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    const/16 v0, 0x8

    .line 43
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 44
    :goto_2
    iget-object p1, p0, Lcom/android/customization/picker/grid/GridFragment$2;->this$0:Lcom/android/customization/picker/grid/GridFragment;

    .line 45
    iget-object p1, p1, Lcom/android/customization/picker/grid/GridFragment;->mOptionsController:Lcom/android/customization/widget/OptionSelectorController;

    .line 46
    new-instance v0, Lcom/android/customization/picker/grid/GridFragment$2$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/android/customization/picker/grid/GridFragment$2$$ExternalSyntheticLambda0;-><init>(Lcom/android/customization/picker/grid/GridFragment$2;)V

    .line 47
    iget-object p0, p1, Lcom/android/customization/widget/OptionSelectorController;->mListeners:Ljava/util/Set;

    invoke-interface {p0, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method
