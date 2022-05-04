.class public Lcom/android/wallpaper/picker/DownloadablePreviewFragment$1;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/picker/DownloadablePreviewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/DownloadablePreviewFragment;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/DownloadablePreviewFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/DownloadablePreviewFragment$1;->this$0:Lcom/android/wallpaper/picker/DownloadablePreviewFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string v0, "com.google.pixel.livewallpaper.action.DOWNLOAD_STATE"

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    const-string p1, "com.google.pixel.livewallpaper.download_state"

    const/4 v0, 0x0

    .line 2
    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    const/4 p2, 0x1

    if-eq p1, p2, :cond_2

    const/4 p2, 0x3

    if-eq p1, p2, :cond_1

    goto :goto_0

    .line 3
    :cond_1
    iget-object p1, p0, Lcom/android/wallpaper/picker/DownloadablePreviewFragment$1;->this$0:Lcom/android/wallpaper/picker/DownloadablePreviewFragment;

    invoke-virtual {p1}, Lcom/android/wallpaper/picker/DownloadablePreviewFragment;->showDownloadFailed()V

    goto :goto_0

    .line 4
    :cond_2
    iget-object p1, p0, Lcom/android/wallpaper/picker/DownloadablePreviewFragment$1;->this$0:Lcom/android/wallpaper/picker/DownloadablePreviewFragment;

    invoke-virtual {p1}, Lcom/android/wallpaper/picker/DownloadablePreviewFragment;->showDownloadSuccess()V

    .line 5
    :goto_0
    iget-object p1, p0, Lcom/android/wallpaper/picker/DownloadablePreviewFragment$1;->this$0:Lcom/android/wallpaper/picker/DownloadablePreviewFragment;

    iget-object p1, p1, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    sget-object p2, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->DOWNLOAD:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    invoke-virtual {p1, p2}, Lcom/android/wallpaper/widget/BottomActionBar;->deselectAction(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V

    .line 6
    iget-object p1, p0, Lcom/android/wallpaper/picker/DownloadablePreviewFragment$1;->this$0:Lcom/android/wallpaper/picker/DownloadablePreviewFragment;

    iget-object p1, p1, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    invoke-virtual {p1}, Lcom/android/wallpaper/widget/BottomActionBar;->enableActions()V

    .line 7
    iget-object p0, p0, Lcom/android/wallpaper/picker/DownloadablePreviewFragment$1;->this$0:Lcom/android/wallpaper/picker/DownloadablePreviewFragment;

    .line 8
    iput-boolean v0, p0, Lcom/android/wallpaper/picker/DownloadablePreviewFragment;->mIsCancelingDownload:Z

    return-void
.end method
