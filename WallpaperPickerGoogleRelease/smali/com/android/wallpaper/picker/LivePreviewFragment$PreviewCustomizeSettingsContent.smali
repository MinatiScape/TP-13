.class public final Lcom/android/wallpaper/picker/LivePreviewFragment$PreviewCustomizeSettingsContent;
.super Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/picker/LivePreviewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "PreviewCustomizeSettingsContent"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/LivePreviewFragment;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/LivePreviewFragment;Landroid/content/Context;Lcom/android/wallpaper/picker/LivePreviewFragment$1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$PreviewCustomizeSettingsContent;->this$0:Lcom/android/wallpaper/picker/LivePreviewFragment;

    .line 2
    invoke-direct {p0, p2}, Lcom/android/wallpaper/widget/BottomActionBar$BottomSheetContent;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public getViewId()I
    .locals 0

    const p0, 0x7f0d00c6

    return p0
.end method

.method public onRecreateView(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$PreviewCustomizeSettingsContent;->this$0:Lcom/android/wallpaper/picker/LivePreviewFragment;

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mSettingsLiveData:Landroidx/lifecycle/LiveData;

    if-eqz p1, :cond_1

    .line 3
    iget-object v0, p1, Landroidx/lifecycle/LiveData;->mObservers:Landroidx/arch/core/internal/SafeIterableMap;

    .line 4
    iget v0, v0, Landroidx/arch/core/internal/SafeIterableMap;->mSize:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 5
    iget-object p0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mSettingsSliceView:Landroidx/slice/widget/SliceView;

    if-eqz p0, :cond_1

    .line 6
    invoke-virtual {p1, p0}, Landroidx/lifecycle/LiveData;->removeObserver(Landroidx/lifecycle/Observer;)V

    :cond_1
    return-void
.end method

.method public onViewCreated(Landroid/view/View;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$PreviewCustomizeSettingsContent;->this$0:Lcom/android/wallpaper/picker/LivePreviewFragment;

    const v1, 0x7f0a01f8

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/slice/widget/SliceView;

    .line 2
    iput-object p1, v0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mSettingsSliceView:Landroidx/slice/widget/SliceView;

    .line 3
    iget-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$PreviewCustomizeSettingsContent;->this$0:Lcom/android/wallpaper/picker/LivePreviewFragment;

    .line 4
    iget-object p1, p1, Lcom/android/wallpaper/picker/LivePreviewFragment;->mSettingsSliceView:Landroidx/slice/widget/SliceView;

    .line 5
    iget-object v0, p1, Landroidx/slice/widget/SliceView;->mViewPolicy:Landroidx/slice/widget/SliceViewPolicy;

    .line 6
    iget v1, v0, Landroidx/slice/widget/SliceViewPolicy;->mMode:I

    const/4 v2, 0x0

    const/4 v3, 0x2

    if-ne v1, v3, :cond_0

    goto/16 :goto_1

    :cond_0
    const/4 v4, 0x3

    const/4 v5, 0x1

    if-eq v1, v3, :cond_1

    .line 7
    iput v3, v0, Landroidx/slice/widget/SliceViewPolicy;->mMode:I

    .line 8
    iget-object v0, v0, Landroidx/slice/widget/SliceViewPolicy;->mListener:Landroidx/slice/widget/SliceViewPolicy$PolicyChangeListener;

    if-eqz v0, :cond_1

    .line 9
    check-cast v0, Landroidx/slice/widget/TemplateView;

    .line 10
    iget-object v1, v0, Landroidx/slice/widget/TemplateView;->mListContent:Landroidx/slice/widget/ListContent;

    if-eqz v1, :cond_1

    .line 11
    iget-object v3, v0, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    iget-object v6, v0, Landroidx/slice/widget/SliceChildView;->mViewPolicy:Landroidx/slice/widget/SliceViewPolicy;

    invoke-virtual {v1, v3, v6}, Landroidx/slice/widget/ListContent;->getHeight(Landroidx/slice/widget/SliceStyle;Landroidx/slice/widget/SliceViewPolicy;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/slice/widget/TemplateView;->updateDisplayedItems(I)V

    .line 12
    :cond_1
    iget-object v0, p1, Landroidx/slice/widget/SliceView;->mViewPolicy:Landroidx/slice/widget/SliceViewPolicy;

    .line 13
    iget v0, v0, Landroidx/slice/widget/SliceViewPolicy;->mMode:I

    .line 14
    iget-object v1, p1, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    instance-of v3, v1, Landroidx/slice/widget/ShortcutView;

    .line 15
    invoke-virtual {v1}, Landroidx/slice/widget/SliceChildView;->getLoadingActions()Ljava/util/Set;

    move-result-object v1

    if-ne v0, v4, :cond_2

    if-nez v3, :cond_2

    .line 16
    iget-object v0, p1, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 17
    new-instance v0, Landroidx/slice/widget/ShortcutView;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v0, v3}, Landroidx/slice/widget/ShortcutView;-><init>(Landroid/content/Context;)V

    iput-object v0, p1, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    .line 18
    invoke-virtual {p1, v0}, Landroidx/slice/widget/SliceView;->getChildLp(Landroid/view/View;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    invoke-virtual {p1, v0, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0

    :cond_2
    if-eq v0, v4, :cond_3

    if-eqz v3, :cond_3

    .line 19
    iget-object v0, p1, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 20
    new-instance v0, Landroidx/slice/widget/TemplateView;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v0, v3}, Landroidx/slice/widget/TemplateView;-><init>(Landroid/content/Context;)V

    iput-object v0, p1, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    .line 21
    invoke-virtual {p1, v0}, Landroidx/slice/widget/SliceView;->getChildLp(Landroid/view/View;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    invoke-virtual {p1, v0, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0

    :cond_3
    move v5, v2

    :goto_0
    if-eqz v5, :cond_5

    .line 22
    iget-object v0, p1, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    iget-object v3, p1, Landroidx/slice/widget/SliceView;->mViewPolicy:Landroidx/slice/widget/SliceViewPolicy;

    invoke-virtual {v0, v3}, Landroidx/slice/widget/SliceChildView;->setPolicy(Landroidx/slice/widget/SliceViewPolicy;)V

    .line 23
    invoke-virtual {p1}, Landroidx/slice/widget/SliceView;->applyConfigurations()V

    .line 24
    iget-object v0, p1, Landroidx/slice/widget/SliceView;->mListContent:Landroidx/slice/widget/ListContent;

    if-eqz v0, :cond_4

    invoke-virtual {v0}, Landroidx/slice/widget/ListContent;->isValid()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 25
    iget-object v0, p1, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    iget-object v3, p1, Landroidx/slice/widget/SliceView;->mListContent:Landroidx/slice/widget/ListContent;

    invoke-virtual {v0, v3}, Landroidx/slice/widget/SliceChildView;->setSliceContent(Landroidx/slice/widget/ListContent;)V

    .line 26
    :cond_4
    iget-object v0, p1, Landroidx/slice/widget/SliceView;->mCurrentView:Landroidx/slice/widget/SliceChildView;

    invoke-virtual {v0, v1}, Landroidx/slice/widget/SliceChildView;->setLoadingActions(Ljava/util/Set;)V

    .line 27
    :cond_5
    invoke-virtual {p1}, Landroidx/slice/widget/SliceView;->updateActions()V

    .line 28
    :goto_1
    iget-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$PreviewCustomizeSettingsContent;->this$0:Lcom/android/wallpaper/picker/LivePreviewFragment;

    .line 29
    iget-object p1, p1, Lcom/android/wallpaper/picker/LivePreviewFragment;->mSettingsSliceView:Landroidx/slice/widget/SliceView;

    .line 30
    iget-object p1, p1, Landroidx/slice/widget/SliceView;->mViewPolicy:Landroidx/slice/widget/SliceViewPolicy;

    .line 31
    iget-boolean v0, p1, Landroidx/slice/widget/SliceViewPolicy;->mScrollable:Z

    if-eqz v0, :cond_6

    if-eqz v0, :cond_6

    .line 32
    iput-boolean v2, p1, Landroidx/slice/widget/SliceViewPolicy;->mScrollable:Z

    .line 33
    iget-object p1, p1, Landroidx/slice/widget/SliceViewPolicy;->mListener:Landroidx/slice/widget/SliceViewPolicy$PolicyChangeListener;

    if-eqz p1, :cond_6

    .line 34
    check-cast p1, Landroidx/slice/widget/TemplateView;

    .line 35
    iget-object v0, p1, Landroidx/slice/widget/TemplateView;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    .line 36
    iget-object v0, p1, Landroidx/slice/widget/TemplateView;->mListContent:Landroidx/slice/widget/ListContent;

    if-eqz v0, :cond_6

    .line 37
    iget-object v1, p1, Landroidx/slice/widget/SliceChildView;->mSliceStyle:Landroidx/slice/widget/SliceStyle;

    iget-object v2, p1, Landroidx/slice/widget/SliceChildView;->mViewPolicy:Landroidx/slice/widget/SliceViewPolicy;

    invoke-virtual {v0, v1, v2}, Landroidx/slice/widget/ListContent;->getHeight(Landroidx/slice/widget/SliceStyle;Landroidx/slice/widget/SliceViewPolicy;)I

    move-result v0

    invoke-virtual {p1, v0}, Landroidx/slice/widget/TemplateView;->updateDisplayedItems(I)V

    .line 38
    :cond_6
    iget-object p0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$PreviewCustomizeSettingsContent;->this$0:Lcom/android/wallpaper/picker/LivePreviewFragment;

    .line 39
    iget-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mSettingsLiveData:Landroidx/lifecycle/LiveData;

    if-eqz p1, :cond_7

    .line 40
    iget-object p0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mSettingsSliceView:Landroidx/slice/widget/SliceView;

    .line 41
    invoke-virtual {p1, p0}, Landroidx/lifecycle/LiveData;->observeForever(Landroidx/lifecycle/Observer;)V

    :cond_7
    return-void
.end method
