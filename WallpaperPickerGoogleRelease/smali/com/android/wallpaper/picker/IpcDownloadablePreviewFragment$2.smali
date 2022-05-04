.class public Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment$2;
.super Landroidx/activity/OnBackPressedCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment$2;->this$0:Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;

    invoke-direct {p0, p2}, Landroidx/activity/OnBackPressedCallback;-><init>(Z)V

    return-void
.end method


# virtual methods
.method public handleOnBackPressed()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment$2;->this$0:Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;

    .line 2
    iget-boolean v0, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;->mIsForceExit:Z

    if-nez v0, :cond_0

    const/4 v0, 0x2

    .line 3
    invoke-virtual {p0, v0}, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;->sendDownloadMessage(I)V

    return-void

    .line 4
    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 5
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :cond_1
    return-void
.end method
