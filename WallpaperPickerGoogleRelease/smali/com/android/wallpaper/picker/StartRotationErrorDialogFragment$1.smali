.class public Lcom/android/wallpaper/picker/StartRotationErrorDialogFragment$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/picker/StartRotationErrorDialogFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/StartRotationErrorDialogFragment;

.field public final synthetic val$networkPreference:I


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/StartRotationErrorDialogFragment;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/StartRotationErrorDialogFragment$1;->this$0:Lcom/android/wallpaper/picker/StartRotationErrorDialogFragment;

    iput p2, p0, Lcom/android/wallpaper/picker/StartRotationErrorDialogFragment$1;->val$networkPreference:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/picker/StartRotationErrorDialogFragment$1;->this$0:Lcom/android/wallpaper/picker/StartRotationErrorDialogFragment;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getTargetFragment()Landroidx/fragment/app/Fragment;

    move-result-object p1

    check-cast p1, Lcom/android/wallpaper/picker/StartRotationErrorDialogFragment$Listener;

    .line 2
    iget p0, p0, Lcom/android/wallpaper/picker/StartRotationErrorDialogFragment$1;->val$networkPreference:I

    invoke-interface {p1, p0}, Lcom/android/wallpaper/picker/StartRotationErrorDialogFragment$Listener;->retryStartRotation(I)V

    return-void
.end method
