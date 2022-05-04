.class public Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$6;
.super Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;
.source "SourceFile"


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$6;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$6;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    .line 2
    iget-object p2, p1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCurrentWallpaperBottomSheetPresenter:Lcom/android/wallpaper/picker/CurrentWallpaperBottomSheetPresenter;

    if-nez p2, :cond_0

    return-void

    .line 3
    :cond_0
    iget-object p2, p1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCurrentWallpaperBottomSheetExpandedRunnable:Ljava/lang/Runnable;

    if-eqz p2, :cond_1

    .line 4
    iget-object p1, p1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 5
    :cond_1
    iget-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$6;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    new-instance p2, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$6$1;

    invoke-direct {p2, p0, p3}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$6$1;-><init>(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$6;I)V

    .line 6
    iput-object p2, p1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCurrentWallpaperBottomSheetExpandedRunnable:Ljava/lang/Runnable;

    .line 7
    iget-object p0, p1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mHandler:Landroid/os/Handler;

    const-wide/16 v0, 0x64

    invoke-virtual {p0, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
