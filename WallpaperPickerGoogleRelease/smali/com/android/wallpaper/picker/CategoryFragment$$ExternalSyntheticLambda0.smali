.class public final synthetic Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/model/WallpaperSectionController;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda0;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/CategoryFragment;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda0;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;)V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda0;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;)V
    .locals 1

    const/4 v0, 0x3

    iput v0, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda0;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/LivePreviewFragment;)V
    .locals 1

    const/4 v0, 0x4

    iput v0, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda0;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/StartRotationDialogFragment;)V
    .locals 1

    const/4 v0, 0x5

    iput v0, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda0;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    iget p1, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda0;->$r8$classId:I

    const/4 p2, 0x1

    const-string v0, "package"

    const/4 v1, 0x0

    const-string v2, "android.settings.APPLICATION_DETAILS_SETTINGS"

    packed-switch p1, :pswitch_data_0

    goto/16 :goto_0

    :pswitch_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/wallpaper/picker/LivePreviewFragment;

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mDeleteIntent:Landroid/content/Intent;

    if-eqz p1, :cond_0

    .line 2
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    iget-object p2, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mDeleteIntent:Landroid/content/Intent;

    invoke-virtual {p1, p2}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    const/4 p1, 0x0

    .line 3
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/PreviewFragment;->finishActivity(Z)V

    :cond_0
    return-void

    .line 4
    :pswitch_1
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;

    sget p1, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;->$r8$clinit:I

    const/4 p1, 0x3

    .line 5
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/IpcDownloadablePreviewFragment;->sendDownloadMessage(I)V

    return-void

    .line 6
    :pswitch_2
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 8
    iget-object v2, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;->this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    .line 9
    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 10
    invoke-static {v0, v2, v1}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 11
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 12
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;->this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    invoke-virtual {p0, p1, p2}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    return-void

    .line 13
    :pswitch_3
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/wallpaper/model/WallpaperSectionController;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 15
    invoke-virtual {p1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    iget-object v2, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mAppContext:Landroid/content/Context;

    .line 17
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 18
    invoke-static {v0, v2, v1}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 19
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 20
    iget-object p0, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mActivity:Landroid/app/Activity;

    invoke-virtual {p0, p1, p2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void

    .line 21
    :pswitch_4
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/wallpaper/picker/CategoryFragment;

    sget p1, Lcom/android/wallpaper/picker/CategoryFragment;->$r8$clinit:I

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 23
    invoke-virtual {p1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 24
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 25
    invoke-static {v0, v2, v1}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 26
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 27
    invoke-virtual {p0, p1, p2}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    return-void

    .line 28
    :goto_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    check-cast p0, Lcom/android/wallpaper/picker/StartRotationDialogFragment;

    sget p1, Lcom/android/wallpaper/picker/StartRotationDialogFragment;->$r8$clinit:I

    .line 29
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getTargetFragment()Landroidx/fragment/app/Fragment;

    move-result-object p1

    check-cast p1, Lcom/android/wallpaper/picker/RotationStarter;

    .line 30
    iget-boolean p0, p0, Lcom/android/wallpaper/picker/StartRotationDialogFragment;->mIsWifiOnlyChecked:Z

    .line 31
    invoke-interface {p1, p0}, Lcom/android/wallpaper/picker/RotationStarter;->startRotation(I)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
