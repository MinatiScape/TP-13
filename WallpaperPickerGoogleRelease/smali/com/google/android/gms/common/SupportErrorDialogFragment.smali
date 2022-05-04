.class public Lcom/google/android/gms/common/SupportErrorDialogFragment;
.super Landroidx/fragment/app/DialogFragment;
.source "SourceFile"


# instance fields
.field public zza:Landroid/app/Dialog;

.field public zzb:Landroid/content/DialogInterface$OnCancelListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/google/android/gms/common/SupportErrorDialogFragment;->zza:Landroid/app/Dialog;

    .line 3
    iput-object v0, p0, Lcom/google/android/gms/common/SupportErrorDialogFragment;->zzb:Landroid/content/DialogInterface$OnCancelListener;

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/common/SupportErrorDialogFragment;->zzb:Landroid/content/DialogInterface$OnCancelListener;

    if-eqz p0, :cond_0

    .line 2
    invoke-interface {p0, p1}, Landroid/content/DialogInterface$OnCancelListener;->onCancel(Landroid/content/DialogInterface;)V

    :cond_0
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/google/android/gms/common/SupportErrorDialogFragment;->zza:Landroid/app/Dialog;

    if-nez p1, :cond_0

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Landroidx/fragment/app/DialogFragment;->mShowsDialog:Z

    :cond_0
    return-object p1
.end method

.method public show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/fragment/app/DialogFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method
