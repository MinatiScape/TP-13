.class public Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment;

.field public final synthetic val$wallpaperDestination:I


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment$1;->this$0:Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment;

    iput p2, p0, Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment$1;->val$wallpaperDestination:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment$1;->this$0:Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getTargetFragment()Landroidx/fragment/app/Fragment;

    move-result-object p1

    .line 2
    iget-object p2, p0, Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment$1;->this$0:Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment;

    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p2

    if-nez p1, :cond_0

    move-object p1, p2

    .line 3
    :cond_0
    check-cast p1, Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment$Listener;

    if-eqz p1, :cond_1

    .line 4
    iget p0, p0, Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment$1;->val$wallpaperDestination:I

    invoke-interface {p1, p0}, Lcom/android/wallpaper/picker/SetWallpaperErrorDialogFragment$Listener;->onClickTryAgain(I)V

    :cond_1
    return-void
.end method
