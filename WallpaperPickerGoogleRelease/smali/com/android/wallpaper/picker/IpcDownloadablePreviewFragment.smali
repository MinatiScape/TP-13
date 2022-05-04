.class public Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;
.super Lcom/android/wallpaper/picker/DownloadablePreviewFragment;
.source "SourceFile"


# static fields
.field public static final synthetic $r8$clinit:I


# instance fields
.field public mAlertDialog:Landroid/app/AlertDialog;

.field public mHandler:Landroid/os/Handler;

.field public mIntentSenderLauncher:Landroidx/activity/result/ActivityResultLauncher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/activity/result/ActivityResultLauncher<",
            "Landroidx/activity/result/IntentSenderRequest;",
            ">;"
        }
    .end annotation
.end field

.field public mIsForceExit:Z

.field public mOnBackPressedCallback:Landroidx/activity/OnBackPressedCallback;

.field public mReceiver:Landroid/os/Messenger;

.field public mService:Landroid/os/Messenger;

.field public mServiceConnection:Landroid/content/ServiceConnection;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/picker/DownloadablePreviewFragment;-><init>()V

    .line 2
    new-instance v0, Landroid/os/Handler;

    new-instance v1, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment$1;

    invoke-direct {v1, p0}, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment$1;-><init>(Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;)V

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;->mHandler:Landroid/os/Handler;

    .line 3
    new-instance v0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment$2;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment$2;-><init>(Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;Z)V

    iput-object v0, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;->mOnBackPressedCallback:Landroidx/activity/OnBackPressedCallback;

    .line 4
    new-instance v0, Landroid/os/Messenger;

    iget-object v1, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;->mHandler:Landroid/os/Handler;

    invoke-direct {v0, v1}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;->mReceiver:Landroid/os/Messenger;

    .line 5
    new-instance v0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment$3;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment$3;-><init>(Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;)V

    iput-object v0, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;->mServiceConnection:Landroid/content/ServiceConnection;

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 9

    .line 1
    invoke-super {p0, p1}, Lcom/android/wallpaper/picker/DownloadablePreviewFragment;->onCreate(Landroid/os/Bundle;)V

    .line 2
    new-instance p1, Landroid/content/Intent;

    const-string v0, "com.google.pixel.livewallpaper.action.DOWNLOAD_LIVE_WALLPAPER"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 3
    new-instance v0, Landroid/content/ComponentName;

    const-string v1, "com.google.pixel.livewallpaper"

    const-string v2, "com.google.pixel.livewallpaper.split.DownloadService"

    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 4
    iget-object v0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    invoke-virtual {v0}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperComponent()Landroid/app/WallpaperInfo;

    move-result-object v0

    const-string v1, "android.live_wallpaper.info"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;->mServiceConnection:Landroid/content/ServiceConnection;

    const/4 v2, 0x1

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 6
    new-instance p1, Landroidx/activity/result/contract/ActivityResultContracts$StartIntentSenderForResult;

    invoke-direct {p1}, Landroidx/activity/result/contract/ActivityResultContracts$StartIntentSenderForResult;-><init>()V

    sget-object v8, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment$$ExternalSyntheticLambda0;->INSTANCE:Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment$$ExternalSyntheticLambda0;

    .line 7
    new-instance v5, Landroidx/fragment/app/Fragment$6;

    invoke-direct {v5, p0}, Landroidx/fragment/app/Fragment$6;-><init>(Landroidx/fragment/app/Fragment;)V

    .line 8
    iget v0, p0, Landroidx/fragment/app/Fragment;->mState:I

    if-gt v0, v2, :cond_1

    .line 9
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 10
    new-instance v1, Landroidx/fragment/app/Fragment$8;

    move-object v3, v1

    move-object v4, p0

    move-object v6, v0

    move-object v7, p1

    invoke-direct/range {v3 .. v8}, Landroidx/fragment/app/Fragment$8;-><init>(Landroidx/fragment/app/Fragment;Landroidx/arch/core/util/Function;Ljava/util/concurrent/atomic/AtomicReference;Landroidx/activity/result/contract/ActivityResultContract;Landroidx/activity/result/ActivityResultCallback;)V

    .line 11
    iget v2, p0, Landroidx/fragment/app/Fragment;->mState:I

    if-ltz v2, :cond_0

    .line 12
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment$8;->onPreAttached()V

    goto :goto_0

    .line 13
    :cond_0
    iget-object v2, p0, Landroidx/fragment/app/Fragment;->mOnPreAttachedListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 14
    :goto_0
    new-instance v1, Landroidx/fragment/app/Fragment$9;

    invoke-direct {v1, p0, v0, p1}, Landroidx/fragment/app/Fragment$9;-><init>(Landroidx/fragment/app/Fragment;Ljava/util/concurrent/atomic/AtomicReference;Landroidx/activity/result/contract/ActivityResultContract;)V

    .line 15
    iput-object v1, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;->mIntentSenderLauncher:Landroidx/activity/result/ActivityResultLauncher;

    return-void

    .line 16
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Fragment "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, " is attempting to registerForActivityResult after being created. Fragments must call registerForActivityResult() before they are created (i.e. initialization, onAttach(), or onCreate())."

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public onDestroy()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;->mAlertDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;->mAlertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 3
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;->mIntentSenderLauncher:Landroidx/activity/result/ActivityResultLauncher;

    invoke-virtual {v0}, Landroidx/activity/result/ActivityResultLauncher;->unregister()V

    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;->mServiceConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 5
    invoke-super {p0}, Lcom/android/wallpaper/picker/PreviewFragment;->onDestroy()V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/wallpaper/picker/LivePreviewFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 2
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 3
    iget-object p1, p1, Landroidx/activity/ComponentActivity;->mOnBackPressedDispatcher:Landroidx/activity/OnBackPressedDispatcher;

    .line 4
    iget-object p2, p0, Landroidx/fragment/app/Fragment;->mViewLifecycleOwner:Landroidx/fragment/app/FragmentViewLifecycleOwner;

    if-eqz p2, :cond_0

    .line 5
    iget-object p0, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;->mOnBackPressedCallback:Landroidx/activity/OnBackPressedCallback;

    .line 6
    invoke-virtual {p1, p2, p0}, Landroidx/activity/OnBackPressedDispatcher;->addCallback(Landroidx/lifecycle/LifecycleOwner;Landroidx/activity/OnBackPressedCallback;)V

    goto :goto_0

    .line 7
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Can\'t access the Fragment View\'s LifecycleOwner when getView() is null i.e., before onCreateView() or after onDestroyView()"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    :goto_0
    return-void
.end method

.method public final sendDownloadMessage(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;->mService:Landroid/os/Messenger;

    const-string v1, "IpcDownloadablePreviewFragment"

    if-nez v0, :cond_0

    const-string p0, "Download service is not connected."

    .line 2
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const/4 v0, 0x0

    const/4 v2, 0x0

    .line 3
    invoke-static {v0, p1, v2, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;III)Landroid/os/Message;

    move-result-object v0

    .line 4
    iget-object v2, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;->mReceiver:Landroid/os/Messenger;

    iput-object v2, v0, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    .line 5
    :try_start_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;->mService:Landroid/os/Messenger;

    invoke-virtual {p0, v0}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 6
    :catch_0
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Fail to send download message: "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method public startDownload(Lcom/android/wallpaper/model/WallpaperInfo;)V
    .locals 0

    const/4 p1, 0x1

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;->sendDownloadMessage(I)V

    return-void
.end method
