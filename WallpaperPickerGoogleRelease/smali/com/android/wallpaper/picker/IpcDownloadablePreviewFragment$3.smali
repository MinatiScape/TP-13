.class public Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/ServiceConnection;


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
.method public constructor <init>(Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment$3;->this$0:Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment$3;->this$0:Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;

    new-instance p1, Landroid/os/Messenger;

    invoke-direct {p1, p2}, Landroid/os/Messenger;-><init>(Landroid/os/IBinder;)V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;->mService:Landroid/os/Messenger;

    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment$3;->this$0:Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;

    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;->mService:Landroid/os/Messenger;

    return-void
.end method
