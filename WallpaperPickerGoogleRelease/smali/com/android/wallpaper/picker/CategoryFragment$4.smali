.class public Lcom/android/wallpaper/picker/CategoryFragment$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/CategoryFragment;

.field public final synthetic val$rootView:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/CategoryFragment;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/CategoryFragment$4;->this$0:Lcom/android/wallpaper/picker/CategoryFragment;

    iput-object p2, p0, Lcom/android/wallpaper/picker/CategoryFragment$4;->val$rootView:Landroid/view/View;

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
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment$4;->this$0:Lcom/android/wallpaper/picker/CategoryFragment;

    sget p1, Lcom/android/wallpaper/picker/CategoryFragment;->$r8$clinit:I

    const p1, 0x7f110100

    .line 2
    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 3
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

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

    invoke-direct {v0, p0}, Lcom/android/wallpaper/picker/CategoryFragment$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/picker/CategoryFragment;)V

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
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/CategoryFragment$4;->this$0:Lcom/android/wallpaper/picker/CategoryFragment;

    iget-object v1, p0, Lcom/android/wallpaper/picker/CategoryFragment$4;->val$rootView:Landroid/view/View;

    sget v2, Lcom/android/wallpaper/picker/CategoryFragment;->$r8$clinit:I

    const/4 v2, 0x1

    .line 2
    invoke-virtual {v0, v1, v2}, Lcom/android/wallpaper/picker/CategoryFragment;->showCurrentWallpaper(Landroid/view/View;Z)V

    .line 3
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment$4;->this$0:Lcom/android/wallpaper/picker/CategoryFragment;

    .line 4
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategoryFragment;->mCategorySelectorFragment:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    .line 5
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mAdapter:Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;

    .line 6
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$Adapter;->mObservable:Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;->notifyChanged()V

    return-void
.end method
