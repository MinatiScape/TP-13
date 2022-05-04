.class public Lcom/android/wallpaper/picker/individual/SetIndividualHolder$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/picker/individual/SetIndividualHolder;->setWallpaper()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/individual/SetIndividualHolder;

.field public final synthetic val$appContext:Landroid/content/Context;

.field public final synthetic val$eventLogger:Lcom/android/wallpaper/module/UserEventLogger;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/individual/SetIndividualHolder;ILcom/android/wallpaper/module/UserEventLogger;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/SetIndividualHolder$1;->this$0:Lcom/android/wallpaper/picker/individual/SetIndividualHolder;

    iput-object p3, p0, Lcom/android/wallpaper/picker/individual/SetIndividualHolder$1;->val$eventLogger:Lcom/android/wallpaper/module/UserEventLogger;

    iput-object p4, p0, Lcom/android/wallpaper/picker/individual/SetIndividualHolder$1;->val$appContext:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/Throwable;)V
    .locals 4

    const-string v0, "SetIndividualHolder"

    const-string v1, "Could not set a wallpaper."

    .line 1
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/SetIndividualHolder$1;->val$eventLogger:Lcom/android/wallpaper/module/UserEventLogger;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/android/wallpaper/module/UserEventLogger;->logWallpaperSetResult(I)V

    .line 3
    invoke-static {p1}, Landroidx/lifecycle/runtime/R$id;->isOOM(Ljava/lang/Throwable;)Z

    move-result p1

    .line 4
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/SetIndividualHolder$1;->val$eventLogger:Lcom/android/wallpaper/module/UserEventLogger;

    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logWallpaperSetFailureReason(I)V

    .line 5
    iget-object p1, p0, Lcom/android/wallpaper/picker/individual/SetIndividualHolder$1;->this$0:Lcom/android/wallpaper/picker/individual/SetIndividualHolder;

    .line 6
    iget-object p1, p1, Lcom/android/wallpaper/picker/individual/SetIndividualHolder;->mSelectionAnimator:Lcom/android/wallpaper/picker/individual/SelectionAnimator;

    .line 7
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/SetIndividualHolder$1;->this$0:Lcom/android/wallpaper/picker/individual/SetIndividualHolder;

    .line 9
    iget-object p1, p0, Lcom/android/wallpaper/picker/individual/SetIndividualHolder;->mOnSetListener:Lcom/android/wallpaper/picker/individual/SetIndividualHolder$OnSetListener;

    .line 10
    check-cast p1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter$1;

    .line 11
    iget-object v0, p1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter$1;->this$1:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;

    iget-object v0, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    sget v2, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->$r8$clinit:I

    .line 12
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const v2, 0x7f110116

    const/4 v3, 0x2

    .line 13
    invoke-static {v2, v3}, Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment;->newInstance(II)Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment;

    move-result-object v2

    .line 14
    invoke-virtual {v2, v0, v1}, Landroidx/fragment/app/Fragment;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    .line 15
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    check-cast v1, Lcom/android/wallpaper/picker/BaseActivity;

    .line 16
    iget-boolean v1, v1, Lcom/android/wallpaper/picker/BaseActivity;->mIsSafeToCommitFragmentTransaction:Z

    if-eqz v1, :cond_0

    .line 17
    iget-object v0, v0, Landroidx/fragment/app/Fragment;->mFragmentManager:Landroidx/fragment/app/FragmentManager;

    const-string v1, "individual_set_wallpaper_error_dialog"

    .line 18
    invoke-virtual {v2, v0, v1}, Landroidx/fragment/app/DialogFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    goto :goto_0

    .line 19
    :cond_0
    iput-object v2, v0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mStagedSetWallpaperErrorDialogFragment:Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment;

    .line 20
    :goto_0
    iget-object p1, p1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter$1;->this$1:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;

    iget-object p1, p1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;->this$0:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;

    .line 21
    iput-object p0, p1, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mPendingSetIndividualHolder:Lcom/android/wallpaper/picker/individual/SetIndividualHolder;

    return-void
.end method

.method public onSuccess(Lcom/android/wallpaper/model/WallpaperInfo;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/picker/individual/SetIndividualHolder$1;->this$0:Lcom/android/wallpaper/picker/individual/SetIndividualHolder;

    .line 2
    iget-object p1, p1, Lcom/android/wallpaper/picker/individual/SetIndividualHolder;->mOnSetListener:Lcom/android/wallpaper/picker/individual/SetIndividualHolder$OnSetListener;

    .line 3
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    iget-object p1, p0, Lcom/android/wallpaper/picker/individual/SetIndividualHolder$1;->val$eventLogger:Lcom/android/wallpaper/module/UserEventLogger;

    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/SetIndividualHolder$1;->this$0:Lcom/android/wallpaper/picker/individual/SetIndividualHolder;

    iget-object v0, v0, Lcom/android/wallpaper/picker/individual/IndividualHolder;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/SetIndividualHolder$1;->val$appContext:Landroid/content/Context;

    .line 5
    invoke-virtual {v0, v1}, Lcom/android/wallpaper/model/WallpaperInfo;->getCollectionId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/SetIndividualHolder$1;->this$0:Lcom/android/wallpaper/picker/individual/SetIndividualHolder;

    iget-object v1, v1, Lcom/android/wallpaper/picker/individual/IndividualHolder;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    invoke-virtual {v1}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperId()Ljava/lang/String;

    move-result-object v1

    .line 6
    invoke-interface {p1, v0, v1}, Lcom/android/wallpaper/module/UserEventLogger;->logWallpaperSet(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/SetIndividualHolder$1;->val$eventLogger:Lcom/android/wallpaper/module/UserEventLogger;

    const/4 p1, 0x0

    invoke-interface {p0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logWallpaperSetResult(I)V

    return-void
.end method
