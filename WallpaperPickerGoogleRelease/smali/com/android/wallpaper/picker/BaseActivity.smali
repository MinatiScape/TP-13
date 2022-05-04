.class public Lcom/android/wallpaper/picker/BaseActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/picker/FragmentTransactionChecker;


# instance fields
.field public mIsSafeToCommitFragmentTransaction:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public isSafeToCommitFragmentTransaction()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/wallpaper/picker/BaseActivity;->mIsSafeToCommitFragmentTransaction:Z

    return p0
.end method

.method public onPause()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onPause()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/wallpaper/picker/BaseActivity;->mIsSafeToCommitFragmentTransaction:Z

    return-void
.end method

.method public onResume()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onResume()V

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/android/wallpaper/picker/BaseActivity;->mIsSafeToCommitFragmentTransaction:Z

    return-void
.end method
