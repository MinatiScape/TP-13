.class public final synthetic Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Lcom/android/wallpaper/picker/LivePreviewFragment;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/LivePreviewFragment;I)V
    .locals 1

    iput p2, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda1;->$r8$classId:I

    const/4 v0, 0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda1;->f$0:Lcom/android/wallpaper/picker/LivePreviewFragment;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    iget p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda1;->$r8$classId:I

    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda1;->f$0:Lcom/android/wallpaper/picker/LivePreviewFragment;

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/picker/LivePreviewFragment;->mSettingsIntent:Landroid/content/Intent;

    .line 2
    invoke-virtual {p0, p1, v0}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;Landroid/os/Bundle;)V

    return-void

    .line 3
    :pswitch_1
    iget-object p0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda1;->f$0:Lcom/android/wallpaper/picker/LivePreviewFragment;

    sget p1, Lcom/android/wallpaper/picker/LivePreviewFragment;->$r8$clinit:I

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/wallpaper/picker/PreviewFragment;->onSetWallpaperClicked(Landroid/view/View;)V

    return-void

    .line 5
    :goto_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda1;->f$0:Lcom/android/wallpaper/picker/LivePreviewFragment;

    sget p1, Lcom/android/wallpaper/picker/LivePreviewFragment;->$r8$clinit:I

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p1, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f11007c

    .line 7
    invoke-virtual {p1, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v1, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/android/wallpaper/picker/LivePreviewFragment$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/picker/LivePreviewFragment;)V

    .line 8
    invoke-virtual {p1, v1}, Landroid/app/AlertDialog$Builder;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v1, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/picker/LivePreviewFragment;)V

    const p0, 0x7f11007b

    .line 9
    invoke-virtual {p1, p0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const/high16 p1, 0x1040000

    .line 10
    invoke-virtual {p0, p1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 11
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    .line 12
    invoke-virtual {p0}, Landroid/app/AlertDialog;->show()V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
