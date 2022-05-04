.class public Lcom/android/wallpaper/picker/TopLevelPickerActivity$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/picker/TopLevelPickerActivity;->setCustomPhotoWallpaper(Lcom/android/wallpaper/model/WallpaperInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

.field public final synthetic val$wallpaper:Lcom/android/wallpaper/model/WallpaperInfo;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/TopLevelPickerActivity;Lcom/android/wallpaper/model/WallpaperInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$6;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    iput-object p2, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$6;->val$wallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$6;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 2
    iget-object v0, v0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mSetWallpaperProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    .line 3
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$6;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 5
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const v1, 0x7f110116

    const/4 v2, 0x2

    .line 6
    invoke-static {v1, v2}, Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment;->newInstance(II)Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment;

    move-result-object v1

    .line 7
    iget-boolean v2, v0, Lcom/android/wallpaper/picker/BaseActivity;->mIsSafeToCommitFragmentTransaction:Z

    if-eqz v2, :cond_1

    .line 8
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const-string v2, "toplevel_set_wallpaper_error_dialog"

    invoke-virtual {v1, v0, v2}, Landroidx/fragment/app/DialogFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    goto :goto_0

    .line 9
    :cond_1
    iput-object v1, v0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mStagedSetWallpaperErrorDialogFragment:Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment;

    .line 10
    :goto_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$6;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 11
    iget-object v0, v0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    .line 12
    iget-object v0, v0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    const/4 v1, 0x0

    .line 13
    invoke-interface {v0, v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->setPendingWallpaperSetStatus(I)V

    .line 14
    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$6;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 15
    iget-object v0, v0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;

    const/4 v1, 0x1

    .line 16
    invoke-interface {v0, v1}, Lcom/android/wallpaper/module/UserEventLogger;->logWallpaperSetResult(I)V

    .line 17
    invoke-static {p1}, Landroidx/lifecycle/runtime/R$id;->isOOM(Ljava/lang/Throwable;)Z

    move-result p1

    .line 18
    iget-object p0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$6;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 19
    iget-object p0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;

    .line 20
    invoke-interface {p0, p1}, Lcom/android/wallpaper/module/UserEventLogger;->logWallpaperSetFailureReason(I)V

    const-string p0, "TopLevelPicker"

    const-string p1, "Unable to set wallpaper from \'my photos\'."

    .line 21
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onSuccess(Lcom/android/wallpaper/model/WallpaperInfo;)V
    .locals 11

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$6;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 2
    iget-object p1, p1, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mSetWallpaperProgressDialog:Landroid/app/ProgressDialog;

    if-eqz p1, :cond_0

    .line 3
    invoke-virtual {p1}, Landroid/app/ProgressDialog;->dismiss()V

    .line 4
    :cond_0
    iget-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$6;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->refreshCurrentWallpapers(Lcom/android/wallpaper/picker/CurrentWallpaperBottomSheetPresenter$RefreshListener;)V

    .line 5
    iget-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$6;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 6
    iget-object p1, p1, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mDelegate:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    .line 7
    iget-object p1, p1, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    const/4 v0, 0x0

    .line 8
    invoke-interface {p1, v0}, Lcom/android/wallpaper/module/WallpaperPreferences;->setPendingWallpaperSetStatus(I)V

    .line 9
    iget-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$6;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 10
    iget-object v1, p1, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;

    .line 11
    iget-object v2, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$6;->val$wallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 12
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {v2, p1}, Lcom/android/wallpaper/model/WallpaperInfo;->getCollectionId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    iget-object v2, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$6;->val$wallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 13
    invoke-virtual {v2}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperId()Ljava/lang/String;

    move-result-object v2

    .line 14
    invoke-interface {v1, p1, v2}, Lcom/android/wallpaper/module/UserEventLogger;->logWallpaperSet(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    iget-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$6;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 16
    iget-object p1, p1, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mUserEventLogger:Lcom/android/wallpaper/module/UserEventLogger;

    .line 17
    invoke-interface {p1, v0}, Lcom/android/wallpaper/module/UserEventLogger;->logWallpaperSetResult(I)V

    .line 18
    iget-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$6;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    move-result p1

    if-eqz p1, :cond_1

    return-void

    .line 19
    :cond_1
    iget-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$6;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 20
    iget-object p1, p1, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mWallpaperPositionOptions:Landroid/widget/LinearLayout;

    .line 21
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 22
    iget-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$6;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 23
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    iget-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$6;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 25
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    iget-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$6;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    iget-object p0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$6;->val$wallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    const v1, 0x7f0a0294

    .line 27
    invoke-virtual {p1, v1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Landroid/widget/Button;

    const v1, 0x7f0a0295

    .line 28
    invoke-virtual {p1, v1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Landroid/widget/Button;

    const v1, 0x7f0a0293

    .line 29
    invoke-virtual {p1, v1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Landroid/widget/Button;

    const/4 v1, 0x1

    .line 30
    invoke-virtual {p1, v7, v1}, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->setCenterCropWallpaperPositionButtonSelected(Landroid/widget/Button;Z)V

    .line 31
    new-instance v10, Lcom/android/wallpaper/picker/TopLevelPickerActivity$7;

    move-object v1, v10

    move-object v2, p1

    move-object v3, p0

    move-object v4, v7

    move-object v5, v9

    move-object v6, v8

    invoke-direct/range {v1 .. v6}, Lcom/android/wallpaper/picker/TopLevelPickerActivity$7;-><init>(Lcom/android/wallpaper/picker/TopLevelPickerActivity;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;)V

    invoke-virtual {v7, v10}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 32
    invoke-virtual {p1, v8, v0}, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->setStretchWallpaperPositionButtonSelected(Landroid/widget/Button;Z)V

    .line 33
    new-instance v10, Lcom/android/wallpaper/picker/TopLevelPickerActivity$8;

    move-object v1, v10

    move-object v4, v8

    move-object v5, v7

    move-object v6, v9

    invoke-direct/range {v1 .. v6}, Lcom/android/wallpaper/picker/TopLevelPickerActivity$8;-><init>(Lcom/android/wallpaper/picker/TopLevelPickerActivity;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;)V

    invoke-virtual {v8, v10}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 34
    invoke-virtual {p1, v9, v0}, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->setCenterWallpaperPositionButtonSelected(Landroid/widget/Button;Z)V

    .line 35
    new-instance v0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$9;

    move-object v1, v0

    move-object v4, v9

    move-object v6, v8

    invoke-direct/range {v1 .. v6}, Lcom/android/wallpaper/picker/TopLevelPickerActivity$9;-><init>(Lcom/android/wallpaper/picker/TopLevelPickerActivity;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;)V

    invoke-virtual {v9, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
