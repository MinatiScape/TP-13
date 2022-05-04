.class public Lcom/android/wallpaper/widget/BottomActionBar$1;
.super Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/widget/BottomActionBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/widget/BottomActionBar;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/widget/BottomActionBar;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/widget/BottomActionBar$1;->this$0:Lcom/android/wallpaper/widget/BottomActionBar;

    invoke-direct {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onSlide(Landroid/view/View;F)V
    .locals 0

    return-void
.end method

.method public onStateChanged(Landroid/view/View;I)V
    .locals 6

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/widget/BottomActionBar$1;->this$0:Lcom/android/wallpaper/widget/BottomActionBar;

    .line 2
    iget-object v0, p1, Lcom/android/wallpaper/widget/BottomActionBar;->mBottomSheetBehavior:Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;

    .line 3
    iget-boolean v0, v0, Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;->mIsQueueProcessing:Z

    const/4 v1, 0x4

    if-eqz v0, :cond_1

    .line 4
    invoke-virtual {p1}, Lcom/android/wallpaper/widget/BottomActionBar;->disableActions()V

    .line 5
    iget-object p0, p0, Lcom/android/wallpaper/widget/BottomActionBar$1;->this$0:Lcom/android/wallpaper/widget/BottomActionBar;

    .line 6
    iget-object p1, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mSelectedAction:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    if-eqz p1, :cond_0

    if-ne p2, v1, :cond_0

    .line 7
    iget-object p0, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mContentViewMap:Ljava/util/Map;

    new-instance p2, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda3;

    invoke-direct {p2, p1}, Lcom/android/wallpaper/widget/BottomActionBar$$ExternalSyntheticLambda3;-><init>(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V

    invoke-interface {p0, p2}, Ljava/util/Map;->forEach(Ljava/util/function/BiConsumer;)V

    :cond_0
    return-void

    .line 8
    :cond_1
    iget-object v0, p1, Lcom/android/wallpaper/widget/BottomActionBar;->mAccessibilityCallback:Lcom/android/wallpaper/widget/BottomActionBar$AccessibilityCallback;

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x3

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    if-ne p2, v1, :cond_4

    .line 9
    iget-object v0, p1, Lcom/android/wallpaper/widget/BottomActionBar;->mLastSelectedAction:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    invoke-virtual {p1, v0, v3}, Lcom/android/wallpaper/widget/BottomActionBar;->getAccessibilityText(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;Z)Ljava/lang/CharSequence;

    move-result-object v0

    .line 10
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 11
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setAccessibilityPaneTitle(Ljava/lang/CharSequence;)V

    .line 12
    :cond_3
    iget-object p1, p1, Lcom/android/wallpaper/widget/BottomActionBar;->mAccessibilityCallback:Lcom/android/wallpaper/widget/BottomActionBar$AccessibilityCallback;

    invoke-interface {p1}, Lcom/android/wallpaper/widget/BottomActionBar$AccessibilityCallback;->onBottomSheetCollapsed()V

    goto :goto_0

    :cond_4
    if-ne p2, v4, :cond_6

    .line 13
    iget-object v0, p1, Lcom/android/wallpaper/widget/BottomActionBar;->mSelectedAction:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    invoke-virtual {p1, v0, v2}, Lcom/android/wallpaper/widget/BottomActionBar;->getAccessibilityText(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;Z)Ljava/lang/CharSequence;

    move-result-object v0

    .line 14
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_5

    .line 15
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setAccessibilityPaneTitle(Ljava/lang/CharSequence;)V

    .line 16
    :cond_5
    iget-object p1, p1, Lcom/android/wallpaper/widget/BottomActionBar;->mAccessibilityCallback:Lcom/android/wallpaper/widget/BottomActionBar$AccessibilityCallback;

    invoke-interface {p1}, Lcom/android/wallpaper/widget/BottomActionBar$AccessibilityCallback;->onBottomSheetExpanded()V

    .line 17
    :cond_6
    :goto_0
    iget-object p1, p0, Lcom/android/wallpaper/widget/BottomActionBar$1;->this$0:Lcom/android/wallpaper/widget/BottomActionBar;

    invoke-virtual {p1}, Lcom/android/wallpaper/widget/BottomActionBar;->enableActions()V

    .line 18
    iget-object p1, p0, Lcom/android/wallpaper/widget/BottomActionBar$1;->this$0:Lcom/android/wallpaper/widget/BottomActionBar;

    .line 19
    iget-object v0, p1, Lcom/android/wallpaper/widget/BottomActionBar;->mSelectedAction:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    .line 20
    invoke-virtual {p1, v0}, Lcom/android/wallpaper/widget/BottomActionBar;->isExpandable(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)Z

    move-result p1

    if-nez p1, :cond_7

    return-void

    :cond_7
    if-ne p2, v1, :cond_8

    .line 21
    iget-object p0, p0, Lcom/android/wallpaper/widget/BottomActionBar$1;->this$0:Lcom/android/wallpaper/widget/BottomActionBar;

    .line 22
    iget-object p1, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mSelectedAction:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    .line 23
    invoke-virtual {p0, p1, v3}, Lcom/android/wallpaper/widget/BottomActionBar;->updateSelectedState(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;Z)V

    goto :goto_1

    :cond_8
    if-ne p2, v4, :cond_9

    .line 24
    iget-object p0, p0, Lcom/android/wallpaper/widget/BottomActionBar$1;->this$0:Lcom/android/wallpaper/widget/BottomActionBar;

    .line 25
    iget-object p1, p0, Lcom/android/wallpaper/widget/BottomActionBar;->mSelectedAction:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    .line 26
    invoke-virtual {p0, p1, v2}, Lcom/android/wallpaper/widget/BottomActionBar;->updateSelectedState(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;Z)V

    :cond_9
    :goto_1
    return-void
.end method
