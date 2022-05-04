.class public Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/model/WallpaperReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->fetchWallpapers(Z)V
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
    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$5;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onWallpapersReceived(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/WallpaperInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$5;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mIsWallpapersReceived:Z

    .line 2
    invoke-virtual {v0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->updateLoading()V

    .line 3
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/wallpaper/model/WallpaperInfo;

    .line 4
    iget-object v3, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$5;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget-object v3, v3, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpapers:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 5
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$5;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-virtual {v0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->maybeSetUpImageGrid()V

    .line 6
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$5;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget-object v0, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mAdapter:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;

    if-eqz v0, :cond_1

    .line 7
    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView$Adapter;->mObservable:Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;->notifyChanged()V

    .line 8
    :cond_1
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$5;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget-object v0, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpapersUiContainer:Lcom/android/wallpaper/picker/WallpapersUiContainer;

    if-eqz v0, :cond_2

    .line 9
    invoke-interface {v0}, Lcom/android/wallpaper/picker/WallpapersUiContainer;->onWallpapersReady()V

    goto :goto_1

    .line 10
    :cond_2
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 11
    iget-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$5;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 12
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$5;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    iget p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mFormFactor:I

    if-ne p0, v1, :cond_3

    .line 13
    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    :cond_3
    :goto_1
    return-void
.end method
