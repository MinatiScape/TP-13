.class public Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior$1;
.super Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;

.field public final synthetic val$callback:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior$1;->this$0:Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;

    iput-object p2, p0, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior$1;->val$callback:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    invoke-direct {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onSlide(Landroid/view/View;F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior$1;->val$callback:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    if-eqz p0, :cond_0

    .line 2
    invoke-virtual {p0, p1, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;->onSlide(Landroid/view/View;F)V

    :cond_0
    return-void
.end method

.method public onStateChanged(Landroid/view/View;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior$1;->this$0:Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;

    .line 2
    iget-object v0, v0, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;->mStateQueue:Ljava/util/Deque;

    .line 3
    invoke-interface {v0}, Ljava/util/Deque;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 4
    iget-object v0, p0, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior$1;->this$0:Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;

    .line 5
    iget-object v0, v0, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;->mStateQueue:Ljava/util/Deque;

    .line 6
    invoke-interface {v0}, Ljava/util/Deque;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne p2, v0, :cond_1

    .line 7
    iget-object v0, p0, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior$1;->this$0:Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;

    .line 8
    iget-object v0, v0, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;->mStateQueue:Ljava/util/Deque;

    .line 9
    invoke-interface {v0}, Ljava/util/Deque;->removeFirst()Ljava/lang/Object;

    .line 10
    iget-object v0, p0, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior$1;->this$0:Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;

    .line 11
    iget-object v0, v0, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;->mStateQueue:Ljava/util/Deque;

    .line 12
    invoke-interface {v0}, Ljava/util/Deque;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 13
    iget-object v0, p0, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior$1;->this$0:Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;

    const/4 v1, 0x0

    .line 14
    iput-boolean v1, v0, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;->mIsQueueProcessing:Z

    goto :goto_0

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior$1;->this$0:Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;

    .line 16
    iget-object v1, v0, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;->mStateQueue:Ljava/util/Deque;

    .line 17
    invoke-interface {v1}, Ljava/util/Deque;->getFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    goto :goto_0

    .line 18
    :cond_1
    iget-object v0, p0, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior$1;->this$0:Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;

    .line 19
    iget-object v1, v0, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;->mStateQueue:Ljava/util/Deque;

    .line 20
    invoke-interface {v1}, Ljava/util/Deque;->getFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 21
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior$1;->val$callback:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    if-eqz p0, :cond_3

    .line 22
    invoke-virtual {p0, p1, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;->onStateChanged(Landroid/view/View;I)V

    :cond_3
    return-void
.end method
