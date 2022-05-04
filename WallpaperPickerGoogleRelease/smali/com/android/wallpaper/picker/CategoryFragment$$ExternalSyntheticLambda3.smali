.class public final synthetic Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcom/android/wallpaper/picker/CategoryFragment;

.field public final synthetic f$1:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/CategoryFragment;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda3;->f$0:Lcom/android/wallpaper/picker/CategoryFragment;

    iput-object p2, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda3;->f$1:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    iget-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda3;->f$0:Lcom/android/wallpaper/picker/CategoryFragment;

    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda3;->f$1:Landroid/view/View;

    sget v0, Lcom/android/wallpaper/picker/CategoryFragment;->$r8$clinit:I

    .line 1
    invoke-virtual {p1}, Lcom/android/wallpaper/picker/CategoryFragment;->getFragmentHost()Lcom/android/wallpaper/picker/CategoryFragment$CategoryFragmentHost;

    move-result-object v0

    new-instance v1, Lcom/android/wallpaper/picker/CategoryFragment$4;

    invoke-direct {v1, p1, p0}, Lcom/android/wallpaper/picker/CategoryFragment$4;-><init>(Lcom/android/wallpaper/picker/CategoryFragment;Landroid/view/View;)V

    invoke-interface {v0, v1}, Lcom/android/wallpaper/picker/CategoryFragment$CategoryFragmentHost;->requestExternalStoragePermission(Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;)V

    return-void
.end method
