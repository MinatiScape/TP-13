.class public Lcom/android/wallpaper/module/WallpaperSetter$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$Listener;


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/module/WallpaperSetter;

.field public final synthetic val$activity:Landroid/app/Activity;

.field public final synthetic val$listener:Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$Listener;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/module/WallpaperSetter;Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$Listener;Landroid/app/Activity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/module/WallpaperSetter$3;->this$0:Lcom/android/wallpaper/module/WallpaperSetter;

    iput-object p2, p0, Lcom/android/wallpaper/module/WallpaperSetter$3;->val$listener:Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$Listener;

    iput-object p3, p0, Lcom/android/wallpaper/module/WallpaperSetter$3;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDialogDismissed(Z)V
    .locals 4

    if-nez p1, :cond_0

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/WallpaperSetter$3;->this$0:Lcom/android/wallpaper/module/WallpaperSetter;

    iget-object v1, p0, Lcom/android/wallpaper/module/WallpaperSetter$3;->val$activity:Landroid/app/Activity;

    .line 2
    iget-object v2, v0, Lcom/android/wallpaper/module/WallpaperSetter;->mCurrentScreenOrientation:Ljava/util/Optional;

    new-instance v3, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;

    invoke-direct {v3, v0, v1}, Lcom/android/wallpaper/module/WallpaperSetter$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/module/WallpaperSetter;Landroid/app/Activity;)V

    invoke-virtual {v2, v3}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 3
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/module/WallpaperSetter$3;->val$listener:Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$Listener;

    if-eqz p0, :cond_1

    .line 4
    invoke-interface {p0, p1}, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$Listener;->onDialogDismissed(Z)V

    :cond_1
    return-void
.end method

.method public onSet(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/WallpaperSetter$3;->val$listener:Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$Listener;

    if-eqz p0, :cond_0

    .line 2
    invoke-interface {p0, p1}, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$Listener;->onSet(I)V

    :cond_0
    return-void
.end method
