.class public final synthetic Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcom/android/wallpaper/widget/BottomActionBar;

.field public final synthetic f$1:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

.field public final synthetic f$2:Landroid/view/View$OnClickListener;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/widget/BottomActionBar;Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;Landroid/view/View$OnClickListener;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda2;->f$0:Lcom/android/wallpaper/widget/BottomActionBar;

    iput-object p2, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda2;->f$1:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    iput-object p3, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda2;->f$2:Landroid/view/View$OnClickListener;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 5

    iget-object v0, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda2;->f$0:Lcom/android/wallpaper/widget/BottomActionBar;

    iget-object v1, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda2;->f$1:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    iget-object p0, p0, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda2;->f$2:Landroid/view/View$OnClickListener;

    .line 1
    iget-object v2, v0, Lcom/android/wallpaper/widget/BottomActionBar;->mSelectedAction:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    .line 2
    iget-object v4, v0, Lcom/android/wallpaper/widget/BottomActionBar;->mActionMap:Ljava/util/Map;

    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->isSelected()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 3
    iget-object v2, v0, Lcom/android/wallpaper/widget/BottomActionBar;->mSelectedAction:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v4}, Lcom/android/wallpaper/widget/BottomActionBar;->updateSelectedState(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;Z)V

    .line 4
    iget-object v2, v0, Lcom/android/wallpaper/widget/BottomActionBar;->mSelectedAction:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    invoke-virtual {v0, v2}, Lcom/android/wallpaper/widget/BottomActionBar;->isExpandable(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 5
    iget-object v2, v0, Lcom/android/wallpaper/widget/BottomActionBar;->mBottomSheetBehavior:Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;

    const/4 v4, 0x4

    invoke-virtual {v2, v4}, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;->enqueue(I)V

    goto :goto_0

    .line 6
    :cond_0
    iput-object v3, v0, Lcom/android/wallpaper/widget/BottomActionBar;->mSelectedAction:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    .line 7
    :cond_1
    :goto_0
    iget-object v2, v0, Lcom/android/wallpaper/widget/BottomActionBar;->mSelectedAction:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    const/4 v4, 0x1

    if-ne v1, v2, :cond_2

    .line 8
    iput-object v3, v0, Lcom/android/wallpaper/widget/BottomActionBar;->mSelectedAction:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    goto :goto_1

    .line 9
    :cond_2
    iput-object v1, v0, Lcom/android/wallpaper/widget/BottomActionBar;->mSelectedAction:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    iput-object v1, v0, Lcom/android/wallpaper/widget/BottomActionBar;->mLastSelectedAction:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    .line 10
    invoke-virtual {v0, v1, v4}, Lcom/android/wallpaper/widget/BottomActionBar;->updateSelectedState(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;Z)V

    .line 11
    iget-object v1, v0, Lcom/android/wallpaper/widget/BottomActionBar;->mSelectedAction:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    invoke-virtual {v0, v1}, Lcom/android/wallpaper/widget/BottomActionBar;->isExpandable(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 12
    iget-object v1, v0, Lcom/android/wallpaper/widget/BottomActionBar;->mBottomSheetBehavior:Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;->enqueue(I)V

    .line 13
    :cond_3
    :goto_1
    invoke-interface {p0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 14
    iget-object p0, v0, Lcom/android/wallpaper/widget/BottomActionBar;->mBottomSheetBehavior:Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;

    .line 15
    iget-object p1, p0, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;->mStateQueue:Ljava/util/Deque;

    invoke-interface {p1}, Ljava/util/Deque;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_2

    .line 16
    :cond_4
    iget-object p1, p0, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;->mStateQueue:Ljava/util/Deque;

    invoke-interface {p1}, Ljava/util/Deque;->getFirst()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 17
    iput-boolean v4, p0, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;->mIsQueueProcessing:Z

    :goto_2
    return-void
.end method
