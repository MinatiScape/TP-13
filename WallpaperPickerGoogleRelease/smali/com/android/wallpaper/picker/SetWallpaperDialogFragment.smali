.class public Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;
.super Landroidx/fragment/app/DialogFragment;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$Listener;
    }
.end annotation


# static fields
.field public static final synthetic $r8$clinit:I


# instance fields
.field public mHomeAvailable:Z

.field public mListener:Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$Listener;

.field public mLockAvailable:Z

.field public mSetHomeWallpaperButton:Landroid/widget/Button;

.field public mSetLockWallpaperButton:Landroid/widget/Button;

.field public mTitleResId:I

.field public mWithItemSelected:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;->mHomeAvailable:Z

    .line 3
    iput-boolean v0, p0, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;->mLockAvailable:Z

    .line 4
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->mRetainInstance:Z

    .line 5
    iget-object v1, p0, Landroidx/fragment/app/Fragment;->mFragmentManager:Landroidx/fragment/app/FragmentManager;

    if-eqz v1, :cond_0

    .line 6
    iget-object v0, v1, Landroidx/fragment/app/FragmentManager;->mNonConfig:Landroidx/fragment/app/FragmentManagerViewModel;

    invoke-virtual {v0, p0}, Landroidx/fragment/app/FragmentManagerViewModel;->addRetainedFragment(Landroidx/fragment/app/Fragment;)V

    goto :goto_0

    .line 7
    :cond_0
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->mRetainInstanceChangedWhileDetached:Z

    :goto_0
    return-void
.end method


# virtual methods
.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 6

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;

    .line 2
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 3
    new-instance v0, Landroidx/appcompat/view/ContextThemeWrapper;

    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f1200fe

    invoke-direct {v0, v1, v2}, Landroidx/appcompat/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    const v1, 0x7f0d0054

    const/4 v3, 0x0

    .line 5
    invoke-static {v0, v1, v3}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0a00d4

    .line 6
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const/4 v4, 0x1

    .line 7
    invoke-virtual {v1, v4}, Landroid/view/View;->setClipToOutline(Z)V

    const v1, 0x7f0d0055

    .line 8
    invoke-static {p1, v1, v3}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    const v3, 0x7f0a00d5

    .line 9
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 10
    iget v5, p0, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;->mTitleResId:I

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(I)V

    .line 11
    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-direct {v3, p1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    .line 12
    invoke-virtual {v3, v1}, Landroid/app/AlertDialog$Builder;->setCustomTitle(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 13
    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 14
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    const v1, 0x7f0a01f6

    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;->mSetHomeWallpaperButton:Landroid/widget/Button;

    .line 16
    new-instance v2, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$$ExternalSyntheticLambda0;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;I)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v1, 0x7f0a01f7

    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;->mSetLockWallpaperButton:Landroid/widget/Button;

    .line 18
    new-instance v2, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, v4}, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;I)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v1, 0x7f0a01f5

    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 20
    new-instance v1, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$$ExternalSyntheticLambda0;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;I)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 21
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;->updateButtonsVisibility()V

    return-object p1
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;->mListener:Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$Listener;

    if-eqz p1, :cond_0

    .line 3
    iget-boolean p0, p0, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;->mWithItemSelected:Z

    invoke-interface {p1, p0}, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$Listener;->onDialogDismissed(Z)V

    :cond_0
    return-void
.end method

.method public final onSetWallpaperButtonClick(I)V
    .locals 1

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;->mWithItemSelected:Z

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;->mListener:Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$Listener;

    invoke-interface {v0, p1}, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment$Listener;->onSet(I)V

    const/4 p1, 0x0

    .line 3
    invoke-virtual {p0, p1, p1}, Landroidx/fragment/app/DialogFragment;->dismissInternal(ZZ)V

    return-void
.end method

.method public final updateButtonsVisibility()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;->mSetHomeWallpaperButton:Landroid/widget/Button;

    const/4 v1, 0x0

    const/16 v2, 0x8

    if-eqz v0, :cond_1

    .line 2
    iget-boolean v3, p0, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;->mHomeAvailable:Z

    if-eqz v3, :cond_0

    move v3, v1

    goto :goto_0

    :cond_0
    move v3, v2

    :goto_0
    invoke-virtual {v0, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 3
    :cond_1
    iget-object v0, p0, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;->mSetLockWallpaperButton:Landroid/widget/Button;

    if-eqz v0, :cond_3

    .line 4
    iget-boolean p0, p0, Lcom/android/wallpaper/picker/SetWallpaperDialogFragment;->mLockAvailable:Z

    if-eqz p0, :cond_2

    goto :goto_1

    :cond_2
    move v1, v2

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    :cond_3
    return-void
.end method
