.class public Lcom/android/wallpaper/picker/BottomActionBarFragment;
.super Landroidx/fragment/app/Fragment;
.source "SourceFile"


# instance fields
.field public mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onBackPressed()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public onBottomActionBarReady(Lcom/android/wallpaper/widget/BottomActionBar;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/BottomActionBarFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    .line 2
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    const v0, 0x7f0a0034

    .line 3
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Lcom/android/wallpaper/picker/AppbarFragment$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/picker/AppbarFragment$$ExternalSyntheticLambda0;-><init>(Landroid/app/Activity;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    .line 2
    instance-of p2, p1, Lcom/android/wallpaper/widget/BottomActionBar$BottomActionBarHost;

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    .line 3
    check-cast p1, Lcom/android/wallpaper/widget/BottomActionBar$BottomActionBarHost;

    invoke-interface {p1}, Lcom/android/wallpaper/widget/BottomActionBar$BottomActionBarHost;->getBottomActionBar()Lcom/android/wallpaper/widget/BottomActionBar;

    move-result-object p1

    goto :goto_0

    .line 4
    :cond_0
    iget-object p1, p0, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    if-eqz p1, :cond_1

    const p2, 0x7f0a0077

    .line 5
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/wallpaper/widget/BottomActionBar;

    goto :goto_0

    :cond_1
    move-object p1, v0

    .line 6
    :goto_0
    iput-object p1, p0, Lcom/android/wallpaper/picker/BottomActionBarFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    if-eqz p1, :cond_2

    const/16 p2, 0x8

    .line 7
    invoke-virtual {p1, p2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    const/4 p2, 0x0

    new-array v1, p2, [Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    .line 8
    invoke-virtual {p1, v1}, Lcom/android/wallpaper/widget/BottomActionBar;->showActionsOnly([Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V

    .line 9
    invoke-virtual {p1}, Lcom/android/wallpaper/widget/BottomActionBar;->enableActions()V

    .line 10
    iget-object v1, p1, Lcom/android/wallpaper/widget/BottomActionBar;->mActionMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    sget-object v2, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda7;->INSTANCE:Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda7;

    invoke-interface {v1, v2}, Ljava/util/Collection;->forEach(Ljava/util/function/Consumer;)V

    const v1, 0x7f0a0034

    .line 11
    invoke-virtual {p1, v1}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 12
    iget-object v1, p1, Lcom/android/wallpaper/widget/BottomActionBar;->mActionMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    new-instance v2, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda4;

    invoke-direct {v2, p1}, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda4;-><init>(Lcom/android/wallpaper/widget/BottomActionBar;)V

    invoke-interface {v1, v2}, Ljava/util/Set;->forEach(Ljava/util/function/Consumer;)V

    .line 13
    iget-object v1, p1, Lcom/android/wallpaper/widget/BottomActionBar;->mContentViewMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 14
    iget-object v1, p1, Lcom/android/wallpaper/widget/BottomActionBar;->mActionSelectedListeners:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 15
    iget-object v1, p1, Lcom/android/wallpaper/widget/BottomActionBar;->mBottomSheetView:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 16
    iget-object v1, p1, Lcom/android/wallpaper/widget/BottomActionBar;->mBottomSheetBehavior:Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;

    .line 17
    iget-object v2, v1, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;->mStateQueue:Ljava/util/Deque;

    invoke-interface {v2}, Ljava/util/Deque;->clear()V

    .line 18
    iput-boolean p2, v1, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;->mIsQueueProcessing:Z

    .line 19
    iput-object v0, p1, Lcom/android/wallpaper/widget/BottomActionBar;->mSelectedAction:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    .line 20
    iget-object p1, p0, Lcom/android/wallpaper/picker/BottomActionBarFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/BottomActionBarFragment;->onBottomActionBarReady(Lcom/android/wallpaper/widget/BottomActionBar;)V

    :cond_2
    return-void
.end method
