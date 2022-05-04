.class public final synthetic Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$1$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/model/WallpaperReceiver;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$1;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$1$$ExternalSyntheticLambda0;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$1$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$1;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$1$$ExternalSyntheticLambda0;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$1$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onWallpapersReceived(Ljava/util/List;)V
    .locals 4

    iget v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$1$$ExternalSyntheticLambda0;->$r8$classId:I

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$1$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$1;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/wallpaper/model/WallpaperInfo;

    .line 2
    invoke-virtual {v0}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperId()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$1;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;

    .line 3
    iget-object v3, v3, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;->mWallpaperId:Ljava/lang/String;

    .line 4
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 5
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$1;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;

    .line 6
    iget-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;->mWallpaperPersister:Lcom/android/wallpaper/module/WallpaperPersister;

    check-cast p1, Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 7
    iput-object v0, p1, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperInfoInPreview:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 8
    iget-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;->mPreviewIntentFactory:Lcom/android/wallpaper/model/InlinePreviewIntentFactory;

    .line 9
    instance-of v2, v0, Lcom/android/wallpaper/model/LiveWallpaperInfo;

    if-eqz v2, :cond_1

    const/4 v1, 0x4

    .line 10
    :cond_1
    invoke-virtual {v0, p0, p1, v1}, Lcom/android/wallpaper/model/WallpaperInfo;->showPreview(Landroid/app/Activity;Lcom/android/wallpaper/model/InlinePreviewIntentFactory;I)V

    goto :goto_0

    .line 11
    :cond_2
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$1;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerActivity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :goto_0
    return-void

    .line 12
    :goto_1
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$1$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$1;

    .line 13
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$1;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;

    iput-boolean v1, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mIsWallpapersReceived:Z

    .line 14
    invoke-virtual {v0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->updateLoading()V

    .line 15
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/wallpaper/model/WallpaperInfo;

    if-eqz v0, :cond_3

    .line 16
    instance-of v1, v0, Lcom/android/wallpaper/model/DownloadableLiveWallpaperInfo;

    if-eqz v1, :cond_3

    .line 17
    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$1;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;

    .line 18
    iget-object v1, v1, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;->mDownloadableWallpapers:Ljava/util/List;

    .line 19
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 20
    :cond_3
    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$1;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;

    iget-object v1, v1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpapers:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 21
    :cond_4
    iget-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$1;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;

    .line 22
    iget-object p1, p1, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;->mDownloadableWallpapers:Ljava/util/List;

    .line 23
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-lez p1, :cond_5

    .line 24
    iget-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$1;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;

    iget-object v0, p1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpapers:Ljava/util/List;

    .line 25
    new-instance v1, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$2;

    const-string v2, "unlock_additionals_header"

    invoke-direct {v1, p1, v2}, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$2;-><init>(Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;Ljava/lang/String;)V

    .line 26
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    iget-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$1;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;

    iget-object v0, p1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpapers:Ljava/util/List;

    .line 28
    iget-object p1, p1, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;->mDownloadableWallpapers:Ljava/util/List;

    .line 29
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 30
    :cond_5
    iget-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$1;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;

    invoke-virtual {p1}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->maybeSetUpImageGrid()V

    .line 31
    iget-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$1;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;

    iget-object p1, p1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mAdapter:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;

    if-eqz p1, :cond_6

    .line 32
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$Adapter;->mObservable:Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;->notifyChanged()V

    .line 33
    :cond_6
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$1;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;

    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpapersUiContainer:Lcom/android/wallpaper/picker/WallpapersUiContainer;

    if-eqz p0, :cond_7

    .line 34
    invoke-interface {p0}, Lcom/android/wallpaper/picker/WallpapersUiContainer;->onWallpapersReady()V

    :cond_7
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
