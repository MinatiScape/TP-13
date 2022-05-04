.class public Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder$AssetListener;
    }
.end annotation


# instance fields
.field public final mActivity:Landroid/app/Activity;

.field public final mMyPhotosStarter:Lcom/android/wallpaper/picker/MyPhotosStarter;

.field public final mOverlayIconView:Landroid/widget/ImageView;

.field public final mThumbnailView:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/android/wallpaper/picker/MyPhotosStarter;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p4}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder;->mActivity:Landroid/app/Activity;

    .line 3
    iput-object p2, p0, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder;->mMyPhotosStarter:Lcom/android/wallpaper/picker/MyPhotosStarter;

    .line 4
    invoke-virtual {p4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iput p3, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    const p1, 0x7f0a0266

    .line 5
    invoke-virtual {p4, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f0a0264

    .line 6
    invoke-virtual {p4, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder;->mThumbnailView:Landroid/widget/ImageView;

    const p1, 0x7f0a0192

    .line 7
    invoke-virtual {p4, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder;->mOverlayIconView:Landroid/widget/ImageView;

    return-void
.end method

.method public static isReadExternalStoragePermissionGranted(Landroid/content/Context;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 2
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const-string v1, "android.permission.READ_EXTERNAL_STORAGE"

    .line 3
    invoke-virtual {v0, v1, p0}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method


# virtual methods
.method public bind()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder;->mActivity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder;->isReadExternalStoragePermissionGranted(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder;->mOverlayIconView:Landroid/widget/ImageView;

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 3
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder;->mActivity:Landroid/app/Activity;

    new-instance v2, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder$2;

    invoke-direct {v2, p0}, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder$2;-><init>(Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder;)V

    .line 4
    invoke-static {v0}, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder;->isReadExternalStoragePermissionGranted(Landroid/content/Context;)Z

    .line 5
    new-instance p0, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder$1;

    invoke-direct {p0, v0, v2}, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder$1;-><init>(Landroid/content/Context;Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder$AssetListener;)V

    sget-object v0, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-array v1, v1, [Ljava/lang/Void;

    .line 6
    invoke-virtual {p0, v0, v1}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder;->mOverlayIconView:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 8
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder;->mOverlayIconView:Landroid/widget/ImageView;

    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder;->mActivity:Landroid/app/Activity;

    const v1, 0x7f0800ee

    invoke-virtual {p0, v1}, Landroid/app/Activity;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :goto_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder;->mMyPhotosStarter:Lcom/android/wallpaper/picker/MyPhotosStarter;

    invoke-interface {p1, p0}, Lcom/android/wallpaper/picker/MyPhotosStarter;->requestCustomPhotoPicker(Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;)V

    return-void
.end method

.method public onPermissionsDenied(Z)V
    .locals 0

    return-void
.end method

.method public onPermissionsGranted()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder;->bind()V

    return-void
.end method
