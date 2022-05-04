.class public Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;
.super Lcom/google/android/material/bottomsheet/BottomSheetBehavior;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/widget/BottomActionBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "QueueStateBottomSheetBehavior"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Landroid/view/View;",
        ">",
        "Lcom/google/android/material/bottomsheet/BottomSheetBehavior<",
        "TV;>;"
    }
.end annotation


# instance fields
.field public mIsQueueProcessing:Z

.field public final mStateQueue:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    new-instance p1, Ljava/util/ArrayDeque;

    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;->mStateQueue:Ljava/util/Deque;

    const/4 p1, 0x0

    .line 3
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    return-void
.end method


# virtual methods
.method public enqueue(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;->mStateQueue:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;->mStateQueue:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->getLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, p1, :cond_0

    return-void

    .line 2
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;->mStateQueue:Ljava/util/Deque;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior$1;

    invoke-direct {v0, p0, p1}, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior$1;-><init>(Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    invoke-super {p0, v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    return-void
.end method
