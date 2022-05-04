.class public Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;
.super Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$UnlockAdditionalsHeaderHolder;,
        Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$IndividualUnlockAdapter;
    }
.end annotation


# static fields
.field public static final synthetic $r8$clinit:I


# instance fields
.field public mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

.field public mDownloadableWallpapers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/WallpaperInfo;",
            ">;"
        }
    .end annotation
.end field

.field public mInjector:Lcom/android/wallpaper/module/Injector;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;->mDownloadableWallpapers:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public fetchWallpapers(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;->mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

    if-nez v0, :cond_0

    const-string p0, "IndividualPickerUnlockableFrgmnt"

    const-string p1, "fetchWallpapers with null category provider"

    .line 2
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 3
    :cond_0
    new-instance v1, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$1;

    invoke-direct {v1, p0, p1}, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$1;-><init>(Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;Z)V

    check-cast v0, Lcom/android/wallpaper/module/DefaultCategoryProvider;

    invoke-virtual {v0, v1, p1}, Lcom/android/wallpaper/module/DefaultCategoryProvider;->fetchCategories(Lcom/android/wallpaper/model/CategoryReceiver;Z)V

    return-void
.end method

.method public isFewerColumnLayout()Z
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpapers:Ljava/util/List;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 2
    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_1

    return v1

    .line 3
    :cond_1
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpapers:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    move-result-object p0

    new-instance v2, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;

    invoke-direct {v2, v0}, Lcom/android/customization/picker/grid/GridFragment$$ExternalSyntheticLambda2;-><init>(Landroid/content/Context;)V

    invoke-interface {p0, v2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object p0

    .line 4
    invoke-interface {p0}, Ljava/util/stream/Stream;->count()J

    move-result-wide v2

    const-wide/16 v4, 0x8

    cmp-long p0, v2, v4

    if-gtz p0, :cond_2

    const/4 v1, 0x1

    :cond_2
    return v1
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/wallpaper/picker/AppbarFragment;->onAttach(Landroid/content/Context;)V

    .line 2
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p1

    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/android/wallpaper/module/Injector;->getCategoryProvider(Landroid/content/Context;)Lcom/android/wallpaper/model/CategoryProvider;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;->mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

    return-void
.end method

.method public onCategoryLoaded()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->onCategoryLoaded()V

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mCategory:Lcom/android/wallpaper/model/WallpaperCategory;

    .line 3
    iget-object v0, v0, Lcom/android/wallpaper/model/Category;->mCollectionId:Ljava/lang/String;

    if-eqz v0, :cond_0

    const-string v1, "nexus_live_category"

    .line 4
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 5
    new-instance v0, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/widget/PreviewPager$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;)V

    iput-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mAppStatusListener:Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;

    .line 6
    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mPackageStatusNotifier:Lcom/android/wallpaper/module/PackageStatusNotifier;

    check-cast v1, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;

    const-string v2, "android.service.wallpaper.WallpaperService"

    invoke-virtual {v1, v0, v2}, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;->addListener(Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;Ljava/lang/String;)V

    .line 7
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mPackageStatusNotifier:Lcom/android/wallpaper/module/PackageStatusNotifier;

    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mAppStatusListener:Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;

    check-cast v0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;

    const-string v1, "com.google.pixel.livewallpaper.action.DOWNLOAD_LIVE_WALLPAPER"

    invoke-virtual {v0, p0, v1}, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;->addListener(Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public setUpImageGrid()V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$IndividualUnlockAdapter;

    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mWallpapers:Ljava/util/List;

    invoke-direct {v0, p0, v1}, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$IndividualUnlockAdapter;-><init>(Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;Ljava/util/List;)V

    iput-object v0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mAdapter:Lcom/android/wallpaper/picker/individual/IndividualPickerFragment$IndividualAdapter;

    .line 2
    iget-object v1, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 3
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->getNumColumns()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 4
    new-instance v1, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$3;

    invoke-direct {v1, p0, v0}, Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment$3;-><init>(Lcom/android/wallpaper/picker/individual/IndividualPickerUnlockableFragment;Landroidx/recyclerview/widget/GridLayoutManager;)V

    .line 5
    iput-object v1, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    .line 6
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/IndividualPickerFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    return-void
.end method
