.class public Lcom/android/wallpaper/picker/WallpaperPickerDelegate$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->requestCustomPhotoPicker(Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

.field public final synthetic val$listener:Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/WallpaperPickerDelegate;Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$1;->this$0:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    iput-object p2, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$1;->val$listener:Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPermissionsDenied(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$1;->val$listener:Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;->onPermissionsDenied(Z)V

    return-void
.end method

.method public onPermissionsGranted()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$1;->val$listener:Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;

    invoke-interface {v0}, Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;->onPermissionsGranted()V

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$1;->this$0:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    .line 3
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.PICK"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "image/*"

    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 6
    iget-object p0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mActivity:Landroidx/fragment/app/FragmentActivity;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method
