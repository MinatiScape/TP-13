.class public Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/WallpaperChangedNotifier$Listener;


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
    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$1;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onWallpaperChanged()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$1;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget v1, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mFormFactor:I

    if-eqz v1, :cond_0

    return-void

    .line 2
    :cond_0
    iget-object v1, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mAdapter:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;

    .line 3
    iget v0, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->mSelectedAdapterPosition:I

    .line 4
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->findViewHolderForAdapterPosition(I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$1;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget-object v1, v1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    invoke-interface {v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperRemoteId()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    .line 6
    instance-of p0, v0, Lcom/android/wallpaper/picker/individual/SelectableHolder;

    if-eqz p0, :cond_2

    .line 7
    check-cast v0, Lcom/android/wallpaper/picker/individual/SelectableHolder;

    const/4 p0, 0x0

    invoke-interface {v0, p0}, Lcom/android/wallpaper/picker/individual/SelectableHolder;->setSelectionState(I)V

    goto :goto_0

    .line 8
    :cond_1
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$1;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mAdapter:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;

    .line 9
    iget v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->mPendingSelectedAdapterPosition:I

    .line 10
    invoke-static {p0, v0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->access$200(Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;I)V

    :cond_2
    :goto_0
    return-void
.end method
