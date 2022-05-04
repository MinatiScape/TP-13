.class public Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


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
    iput-object p1, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment$1;->this$0:Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 8

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_0

    return v1

    .line 2
    :pswitch_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment$1;->this$0:Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/content/Intent;

    sget v4, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;->$r8$clinit:I

    .line 3
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p1, :cond_1

    const-string v4, "com.google.pixel.livewallpaper.sender"

    .line 4
    invoke-virtual {p1, v4}, Landroid/content/Intent;->getExtra(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/IntentSender;

    const-string v5, "com.google.pixel.livewallpaper.fill_in"

    .line 5
    invoke-virtual {p1, v5}, Landroid/content/Intent;->getExtra(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/Intent;

    const-string v6, "com.google.pixel.livewallpaper.flags_mask"

    .line 6
    invoke-virtual {p1, v6, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v6

    const-string v7, "com.google.pixel.livewallpaper.flags_value"

    .line 7
    invoke-virtual {p1, v7, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    .line 8
    new-instance v1, Landroidx/activity/result/IntentSenderRequest;

    invoke-direct {v1, v4, v5, v6, p1}, Landroidx/activity/result/IntentSenderRequest;-><init>(Landroid/content/IntentSender;Landroid/content/Intent;II)V

    .line 9
    iget-object p1, v0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;->mIntentSenderLauncher:Landroidx/activity/result/ActivityResultLauncher;

    .line 10
    invoke-virtual {p1, v1, v3}, Landroidx/activity/result/ActivityResultLauncher;->launch(Ljava/lang/Object;Landroidx/core/app/ActivityOptionsCompat;)V

    goto :goto_0

    .line 11
    :pswitch_1
    iget-object p1, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment$1;->this$0:Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;

    .line 12
    iput-boolean v2, p1, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;->mIsForceExit:Z

    .line 13
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 14
    invoke-virtual {p1}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    goto :goto_0

    .line 15
    :pswitch_2
    iget-object p1, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment$1;->this$0:Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;

    .line 16
    iget-object v0, p1, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;->mAlertDialog:Landroid/app/AlertDialog;

    if-nez v0, :cond_0

    .line 17
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const v4, 0x7f1200fe

    invoke-direct {v0, v1, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    const v1, 0x7f1100a3

    .line 18
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f1100a2

    .line 19
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f110047

    new-instance v4, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda0;

    invoke-direct {v4, p1}, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;)V

    .line 20
    invoke-virtual {v0, v1, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/high16 v1, 0x1040000

    .line 21
    invoke-virtual {v0, v1, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 22
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p1, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;->mAlertDialog:Landroid/app/AlertDialog;

    .line 23
    :cond_0
    iget-object p1, p1, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;->mAlertDialog:Landroid/app/AlertDialog;

    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    goto :goto_0

    .line 24
    :pswitch_3
    iget-object p1, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment$1;->this$0:Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;

    invoke-virtual {p1}, Lcom/android/wallpaper/picker/DownloadablePreviewFragment;->showDownloadFailed()V

    goto :goto_0

    .line 25
    :pswitch_4
    iget-object p1, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment$1;->this$0:Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;

    invoke-virtual {p1}, Lcom/android/wallpaper/picker/DownloadablePreviewFragment;->showDownloadSuccess()V

    .line 26
    :cond_1
    :goto_0
    :pswitch_5
    iget-object p1, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment$1;->this$0:Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;

    iget-object p1, p1, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    sget-object v0, Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;->DOWNLOAD:Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;

    invoke-virtual {p1, v0}, Lcom/android/wallpaper/widget/BottomActionBar;->deselectAction(Lcom/android/wallpaper/widget/BottomActionBar$BottomAction;)V

    .line 27
    iget-object p0, p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment$1;->this$0:Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;

    iget-object p0, p0, Lcom/android/wallpaper/picker/PreviewFragment;->mBottomActionBar:Lcom/android/wallpaper/widget/BottomActionBar;

    invoke-virtual {p0}, Lcom/android/wallpaper/widget/BottomActionBar;->enableActions()V

    return v2

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_5
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
