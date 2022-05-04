.class public Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/picker/CategorySelectorFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "CategoryHolder"
.end annotation


# instance fields
.field public mCategory:Lcom/android/wallpaper/model/Category;

.field public mImageView:Landroid/widget/ImageView;

.field public mOverlayIconView:Landroid/widget/ImageView;

.field public mTitleView:Landroid/widget/TextView;

.field public final synthetic this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/CategorySelectorFragment;Landroid/view/View;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    .line 2
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 3
    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0a0123

    .line 4
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->mImageView:Landroid/widget/ImageView;

    const v0, 0x7f0a0192

    .line 5
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->mOverlayIconView:Landroid/widget/ImageView;

    const v0, 0x7f0a0083

    .line 6
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->mTitleView:Landroid/widget/TextView;

    const p0, 0x7f0a0080

    .line 7
    invoke-virtual {p2, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroidx/cardview/widget/CardView;

    .line 8
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    .line 9
    iget-object v0, p1, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mTileSizePx:Landroid/graphics/Point;

    .line 10
    iget v0, v0, Landroid/graphics/Point;->y:I

    iput v0, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 11
    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0700fc

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {p0, p1}, Landroidx/cardview/widget/CardView;->setRadius(F)V

    return-void
.end method


# virtual methods
.method public final drawThumbnailAndOverlayIcon()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->mOverlayIconView:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->mCategory:Lcom/android/wallpaper/model/Category;

    iget-object v2, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    .line 2
    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    .line 3
    invoke-virtual {v1, v2}, Lcom/android/wallpaper/model/Category;->getOverlayIcon(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 4
    iget-object v0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->mCategory:Lcom/android/wallpaper/model/Category;

    invoke-virtual {v0}, Lcom/android/wallpaper/model/Category;->getOverlayIconSizeDp()I

    move-result v0

    .line 5
    invoke-static {}, Lcom/google/android/gms/internal/zzfit;->getInstance()Lcom/google/android/gms/internal/zzfit;

    move-result-object v1

    iget-object v2, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    .line 6
    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget-object v3, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v3

    invoke-interface {v3}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    .line 7
    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/internal/zzfit;->getDisplayMetrics(Landroid/content/res/Resources;Landroid/view/Display;)Landroid/util/DisplayMetrics;

    move-result-object v1

    int-to-float v0, v0

    .line 8
    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    .line 9
    iget-object v1, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->mOverlayIconView:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 10
    iget-object v1, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->mOverlayIconView:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 11
    iget-object v0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->mCategory:Lcom/android/wallpaper/model/Category;

    iget-object v1, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/wallpaper/model/Category;->getThumbnail(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 12
    iget-object v1, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->mImageView:Landroid/widget/ImageView;

    iget-object p0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    .line 13
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    const v3, 0x1010530

    .line 14
    invoke-static {p0, v3}, Landroidx/transition/R$id;->getColorAttr(Landroid/content/Context;I)I

    move-result p0

    .line 15
    invoke-virtual {v0, v1, v2, p0}, Lcom/android/wallpaper/asset/Asset;->loadDrawable(Landroid/content/Context;Landroid/widget/ImageView;I)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 16
    iget-object v1, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    const-string v2, "You cannot start a load on a not yet attached View or a Fragment where getActivity() returns null (which usually occurs when getActivity() is called before the Fragment is attached or after the Fragment is destroyed)."

    .line 17
    invoke-static {v1, v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 18
    invoke-static {v1}, Lcom/bumptech/glide/Glide;->get(Landroid/content/Context;)Lcom/bumptech/glide/Glide;

    move-result-object v2

    .line 19
    iget-object v2, v2, Lcom/bumptech/glide/Glide;->requestManagerRetriever:Lcom/bumptech/glide/manager/RequestManagerRetriever;

    .line 20
    invoke-virtual {v2, v1}, Lcom/bumptech/glide/manager/RequestManagerRetriever;->get(Landroidx/fragment/app/FragmentActivity;)Lcom/bumptech/glide/RequestManager;

    move-result-object v1

    .line 21
    invoke-virtual {v1}, Lcom/bumptech/glide/RequestManager;->asDrawable()Lcom/bumptech/glide/RequestBuilder;

    move-result-object v1

    .line 22
    invoke-virtual {v1, v0}, Lcom/bumptech/glide/RequestBuilder;->load(Ljava/lang/Object;)Lcom/bumptech/glide/RequestBuilder;

    iget-object p0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->mImageView:Landroid/widget/ImageView;

    .line 23
    invoke-virtual {v1, p0}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    :goto_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    .line 2
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/Injector;->getUserEventLogger(Landroid/content/Context;)Lcom/android/wallpaper/module/UserEventLogger;

    move-result-object v0

    .line 3
    iget-object v1, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->mCategory:Lcom/android/wallpaper/model/Category;

    .line 4
    iget-object v1, v1, Lcom/android/wallpaper/model/Category;->mCollectionId:Ljava/lang/String;

    .line 5
    invoke-interface {v0, v1}, Lcom/android/wallpaper/module/UserEventLogger;->logCategorySelected(Ljava/lang/String;)V

    .line 6
    iget-object v1, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->mCategory:Lcom/android/wallpaper/model/Category;

    invoke-virtual {v1}, Lcom/android/wallpaper/model/Category;->supportsCustomPhotos()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 7
    iget-object p1, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    .line 8
    invoke-virtual {p1}, Lcom/android/wallpaper/picker/CategorySelectorFragment;->getCategorySelectorFragmentHost()Lcom/android/wallpaper/picker/CategorySelectorFragment$CategorySelectorFragmentHost;

    move-result-object p1

    .line 9
    new-instance v0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder$1;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder$1;-><init>(Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;)V

    invoke-interface {p1, v0}, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategorySelectorFragmentHost;->requestCustomPhotoPicker(Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;)V

    return-void

    .line 10
    :cond_0
    iget-object v1, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->mCategory:Lcom/android/wallpaper/model/Category;

    invoke-virtual {v1}, Lcom/android/wallpaper/model/Category;->isSingleWallpaperCategory()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 11
    iget-object v1, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->mCategory:Lcom/android/wallpaper/model/Category;

    invoke-virtual {v1}, Lcom/android/wallpaper/model/Category;->getSingleWallpaper()Lcom/android/wallpaper/model/WallpaperInfo;

    move-result-object v1

    .line 12
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->mCategory:Lcom/android/wallpaper/model/Category;

    .line 13
    iget-object p0, p0, Lcom/android/wallpaper/model/Category;->mCollectionId:Ljava/lang/String;

    .line 14
    invoke-interface {v0, p0}, Lcom/android/wallpaper/module/UserEventLogger;->logIndividualWallpaperSelected(Ljava/lang/String;)V

    .line 15
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p0

    invoke-interface {p0, p1}, Lcom/android/wallpaper/module/Injector;->getWallpaperPersister(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPersister;

    move-result-object p0

    .line 16
    check-cast p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 17
    iput-object v1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperInfoInPreview:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 18
    new-instance p0, Lcom/android/wallpaper/picker/PreviewActivity$PreviewActivityIntentFactory;

    invoke-direct {p0}, Lcom/android/wallpaper/picker/PreviewActivity$PreviewActivityIntentFactory;-><init>()V

    .line 19
    instance-of v0, v1, Lcom/android/wallpaper/model/LiveWallpaperInfo;

    if-eqz v0, :cond_1

    const/4 v0, 0x4

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    .line 20
    :goto_0
    invoke-virtual {v1, p1, p0, v0}, Lcom/android/wallpaper/model/WallpaperInfo;->showPreview(Landroid/app/Activity;Lcom/android/wallpaper/model/InlinePreviewIntentFactory;I)V

    return-void

    .line 21
    :cond_2
    iget-object p1, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->this$0:Lcom/android/wallpaper/picker/CategorySelectorFragment;

    .line 22
    invoke-virtual {p1}, Lcom/android/wallpaper/picker/CategorySelectorFragment;->getCategorySelectorFragmentHost()Lcom/android/wallpaper/picker/CategorySelectorFragment$CategorySelectorFragmentHost;

    move-result-object p1

    .line 23
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;->mCategory:Lcom/android/wallpaper/model/Category;

    invoke-interface {p1, p0}, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategorySelectorFragmentHost;->show(Lcom/android/wallpaper/model/Category;)V

    return-void
.end method
