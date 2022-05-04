.class public Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$1:Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder$1;->this$1:Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPermissionsDenied(Z)V
    .locals 0

    return-void
.end method

.method public onPermissionsGranted()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder$1;->this$1:Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;

    .line 2
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->drawThumbnailAndOverlayIcon()V

    return-void
.end method
