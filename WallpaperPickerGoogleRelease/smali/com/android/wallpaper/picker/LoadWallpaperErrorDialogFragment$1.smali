.class public Lcom/android/wallpaper/picker/LoadWallpaperErrorDialogFragment$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/picker/LoadWallpaperErrorDialogFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/LoadWallpaperErrorDialogFragment;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/LoadWallpaperErrorDialogFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/LoadWallpaperErrorDialogFragment$1;->this$0:Lcom/android/wallpaper/picker/LoadWallpaperErrorDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/LoadWallpaperErrorDialogFragment$1;->this$0:Lcom/android/wallpaper/picker/LoadWallpaperErrorDialogFragment;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getTargetFragment()Landroidx/fragment/app/Fragment;

    move-result-object p0

    check-cast p0, Lcom/android/wallpaper/picker/LoadWallpaperErrorDialogFragment$Listener;

    .line 2
    invoke-interface {p0}, Lcom/android/wallpaper/picker/LoadWallpaperErrorDialogFragment$Listener;->onClickOk()V

    return-void
.end method
