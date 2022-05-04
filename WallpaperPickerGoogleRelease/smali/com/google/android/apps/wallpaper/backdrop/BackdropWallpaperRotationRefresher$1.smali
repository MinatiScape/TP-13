.class public Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationRefresher$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotator$RotationListener;


# instance fields
.field public final synthetic val$backdropPreferences:Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;

.field public final synthetic val$listener:Lcom/android/wallpaper/module/WallpaperRotationRefresher$Listener;


# direct methods
.method public constructor <init>(Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationRefresher;Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;Lcom/android/wallpaper/module/WallpaperRotationRefresher$Listener;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationRefresher$1;->val$backdropPreferences:Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;

    iput-object p3, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationRefresher$1;->val$listener:Lcom/android/wallpaper/module/WallpaperRotationRefresher$Listener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError()V
    .locals 2

    const-string v0, "BackdropRefresher"

    const-string v1, "Fetching and setting the next wallpaper failed."

    .line 1
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationRefresher$1;->val$listener:Lcom/android/wallpaper/module/WallpaperRotationRefresher$Listener;

    check-cast p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$5;

    .line 3
    iget-object v0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$5;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 4
    iget-object v0, v0, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mRefreshWallpaperProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    .line 5
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 6
    :cond_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object p0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$5;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    const v1, 0x7f1200fe

    invoke-direct {v0, p0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    const p0, 0x7f11010c

    .line 7
    invoke-virtual {v0, p0}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const v0, 0x104000a

    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 9
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    .line 10
    invoke-virtual {p0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method public onSuccess(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationRefresher$1;->val$backdropPreferences:Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;

    invoke-virtual {v0, p1}, Lcom/google/android/apps/wallpaper/backdrop/BackdropPreferences;->setResumeToken(Ljava/lang/String;)V

    .line 2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Fetching and setting the next wallpaper succeeded with resumeToken: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "BackdropRefresher"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/backdrop/BackdropWallpaperRotationRefresher$1;->val$listener:Lcom/android/wallpaper/module/WallpaperRotationRefresher$Listener;

    check-cast p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$5;

    .line 4
    iget-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$5;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    .line 5
    :cond_0
    iget-object p1, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$5;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    .line 6
    iget-object p1, p1, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->mRefreshWallpaperProgressDialog:Landroid/app/ProgressDialog;

    if-eqz p1, :cond_1

    .line 7
    invoke-virtual {p1}, Landroid/app/ProgressDialog;->dismiss()V

    .line 8
    :cond_1
    iget-object p0, p0, Lcom/android/wallpaper/picker/TopLevelPickerActivity$5;->this$0:Lcom/android/wallpaper/picker/TopLevelPickerActivity;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/TopLevelPickerActivity;->refreshCurrentWallpapers(Lcom/android/wallpaper/picker/CurrentWallpaperBottomSheetPresenter$RefreshListener;)V

    :goto_0
    return-void
.end method
