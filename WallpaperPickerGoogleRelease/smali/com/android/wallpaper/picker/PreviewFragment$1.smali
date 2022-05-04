.class public Lcom/android/wallpaper/picker/PreviewFragment$1;
.super Landroidx/activity/OnBackPressedCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/picker/PreviewFragment;->onBottomActionBarReady(Lcom/android/wallpaper/widget/BottomActionBar;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/PreviewFragment;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/PreviewFragment;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/PreviewFragment$1;->this$0:Lcom/android/wallpaper/picker/PreviewFragment;

    invoke-direct {p0, p2}, Landroidx/activity/OnBackPressedCallback;-><init>(Z)V

    return-void
.end method


# virtual methods
.method public handleOnBackPressed()V
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment$1;->this$0:Lcom/android/wallpaper/picker/PreviewFragment;

    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mFullScreenAnimation:Lcom/android/wallpaper/util/FullScreenAnimation;

    .line 2
    iget-boolean v1, v0, Lcom/android/wallpaper/util/FullScreenAnimation;->mIsFullScreen:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 3
    iget-boolean v1, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mShowInFullScreen:Z

    if-nez v1, :cond_0

    .line 4
    invoke-virtual {v0, v2}, Lcom/android/wallpaper/util/FullScreenAnimation;->startAnimation(Z)V

    return-void

    .line 5
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    if-eqz v0, :cond_2

    .line 6
    iget-object v1, v0, Lcom/android/wallpaper/widget/BottomActionBar;->mBottomSheetBehavior:Lcom/android/wallpaper/widget/BottomActionBar$QueueStateBottomSheetBehavior;

    .line 7
    iget v1, v1, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->state:I

    const/4 v3, 0x4

    if-ne v1, v3, :cond_1

    const/4 v2, 0x1

    :cond_1
    if-nez v2, :cond_2

    .line 8
    invoke-virtual {v0}, Lcom/android/wallpaper/widget/BottomActionBar;->hideBottomSheetAndDeselectButtonIfExpanded()V

    return-void

    .line 9
    :cond_2
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method
