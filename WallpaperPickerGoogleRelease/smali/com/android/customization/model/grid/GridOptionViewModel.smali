.class public Lcom/android/customization/model/grid/GridOptionViewModel;
.super Landroidx/lifecycle/ViewModel;
.source "SourceFile"


# instance fields
.field public mState:Landroidx/lifecycle/SavedStateHandle;


# direct methods
.method public constructor <init>(Landroidx/lifecycle/SavedStateHandle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/lifecycle/ViewModel;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/customization/model/grid/GridOptionViewModel;->mState:Landroidx/lifecycle/SavedStateHandle;

    return-void
.end method


# virtual methods
.method public getSelectedOption()Lcom/android/customization/model/grid/GridOption;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/customization/model/grid/GridOptionViewModel;->mState:Landroidx/lifecycle/SavedStateHandle;

    .line 2
    iget-object p0, p0, Landroidx/lifecycle/SavedStateHandle;->mRegular:Ljava/util/Map;

    const-string v0, "selected_option"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 3
    check-cast p0, Lcom/android/customization/model/grid/GridOption;

    return-object p0
.end method

.method public setBottomActionBarVisible(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/customization/model/grid/GridOptionViewModel;->mState:Landroidx/lifecycle/SavedStateHandle;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    const-string v0, "bottom_action_bar_visible"

    invoke-virtual {p0, v0, p1}, Landroidx/lifecycle/SavedStateHandle;->set(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setSelectedOption(Lcom/android/customization/model/grid/GridOption;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/customization/model/grid/GridOptionViewModel;->mState:Landroidx/lifecycle/SavedStateHandle;

    const-string v0, "selected_option"

    invoke-virtual {p0, v0, p1}, Landroidx/lifecycle/SavedStateHandle;->set(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method
