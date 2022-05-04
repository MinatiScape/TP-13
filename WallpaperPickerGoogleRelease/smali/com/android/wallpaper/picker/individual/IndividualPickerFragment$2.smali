.class public Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$2;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$2;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget-object v0, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->findViewHolderForAdapterPosition(I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    move-result-object v0

    .line 2
    instance-of v1, v0, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;

    if-eqz v1, :cond_0

    .line 3
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$2;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    check-cast v0, Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;

    invoke-static {p0, v0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->access$300(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;Lcom/android/wallpaper/picker/individual/DesktopRotationHolder;)V

    goto :goto_0

    .line 4
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$2;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mHandler:Landroid/os/Handler;

    .line 5
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mUpdateDailyWallpaperThumbRunnable:Ljava/lang/Runnable;

    const-wide/16 v1, 0xfa0

    .line 6
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :goto_0
    return-void
.end method
