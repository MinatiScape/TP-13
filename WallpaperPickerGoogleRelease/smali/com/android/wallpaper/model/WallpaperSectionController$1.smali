.class public Lcom/android/wallpaper/model/WallpaperSectionController$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/model/WallpaperSectionController;

.field public final synthetic val$rootView:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/model/WallpaperSectionController;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/model/WallpaperSectionController$1;->this$0:Lcom/android/wallpaper/model/WallpaperSectionController;

    iput-object p2, p0, Lcom/android/wallpaper/model/WallpaperSectionController$1;->val$rootView:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPermissionsDenied(Z)V
    .locals 3

    if-nez p1, :cond_0

    return-void

    .line 1
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/model/WallpaperSectionController$1;->this$0:Lcom/android/wallpaper/model/WallpaperSectionController;

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mAppContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f110100

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 3
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/android/wallpaper/model/WallpaperSectionController;->mAppContext:Landroid/content/Context;

    const v2, 0x7f1200fe

    invoke-direct {v0, v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    .line 4
    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const v0, 0x104000a

    const/4 v1, 0x0

    .line 5
    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/model/WallpaperSectionController;)V

    const p0, 0x7f11011a

    .line 6
    invoke-virtual {p1, p0, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    .line 8
    invoke-virtual {p0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method public onPermissionsGranted()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/model/WallpaperSectionController$1;->this$0:Lcom/android/wallpaper/model/WallpaperSectionController;

    iget-object p0, p0, Lcom/android/wallpaper/model/WallpaperSectionController$1;->val$rootView:Landroid/view/View;

    const/4 v1, 0x1

    .line 2
    invoke-virtual {v0, p0, v1}, Lcom/android/wallpaper/model/WallpaperSectionController;->showCurrentWallpaper(Landroid/view/View;Z)V

    return-void
.end method
