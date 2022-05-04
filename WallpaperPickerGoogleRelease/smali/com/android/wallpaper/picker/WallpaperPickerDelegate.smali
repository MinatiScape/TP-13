.class public Lcom/android/wallpaper/picker/WallpaperPickerDelegate;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/picker/MyPhotosStarter;


# instance fields
.field public final mActivity:Landroidx/fragment/app/FragmentActivity;

.field public mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

.field public final mContainer:Lcom/android/wallpaper/picker/WallpapersUiContainer;

.field public mDownloadableIntentAction:Ljava/lang/String;

.field public mDownloadableWallpaperStatusListener:Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;

.field public mFormFactor:I

.field public mLiveWallpaperStatusListener:Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;

.field public mPackageStatusNotifier:Lcom/android/wallpaper/module/PackageStatusNotifier;

.field public mPermissionChangedListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;",
            ">;"
        }
    .end annotation
.end field

.field public mPickerIntentFactory:Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$IndividualPickerActivityIntentFactory;

.field public mPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

.field public mPreviewIntentFactory:Lcom/android/wallpaper/model/InlinePreviewIntentFactory;

.field public mThirdPartyStatusListener:Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;

.field public mViewOnlyPreviewIntentFactory:Lcom/android/wallpaper/model/InlinePreviewIntentFactory;

.field public mWallpaperPersister:Lcom/android/wallpaper/module/WallpaperPersister;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/WallpapersUiContainer;Landroidx/fragment/app/FragmentActivity;Lcom/android/wallpaper/module/Injector;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mContainer:Lcom/android/wallpaper/picker/WallpapersUiContainer;

    .line 3
    iput-object p2, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mActivity:Landroidx/fragment/app/FragmentActivity;

    .line 4
    new-instance p1, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$IndividualPickerActivityIntentFactory;

    invoke-direct {p1}, Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$IndividualPickerActivityIntentFactory;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mPickerIntentFactory:Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$IndividualPickerActivityIntentFactory;

    .line 5
    new-instance p1, Lcom/android/wallpaper/picker/PreviewActivity$PreviewActivityIntentFactory;

    invoke-direct {p1}, Lcom/android/wallpaper/picker/PreviewActivity$PreviewActivityIntentFactory;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mPreviewIntentFactory:Lcom/android/wallpaper/model/InlinePreviewIntentFactory;

    .line 6
    new-instance p1, Lcom/android/wallpaper/picker/ViewOnlyPreviewActivity$ViewOnlyPreviewActivityIntentFactory;

    invoke-direct {p1}, Lcom/android/wallpaper/picker/ViewOnlyPreviewActivity$ViewOnlyPreviewActivityIntentFactory;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mViewOnlyPreviewIntentFactory:Lcom/android/wallpaper/model/InlinePreviewIntentFactory;

    .line 7
    invoke-interface {p3, p2}, Lcom/android/wallpaper/module/Injector;->getCategoryProvider(Landroid/content/Context;)Lcom/android/wallpaper/model/CategoryProvider;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

    .line 8
    invoke-interface {p3, p2}, Lcom/android/wallpaper/module/Injector;->getPreferences(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPreferences;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 9
    invoke-interface {p3, p2}, Lcom/android/wallpaper/module/Injector;->getPackageStatusNotifier(Landroid/content/Context;)Lcom/android/wallpaper/module/PackageStatusNotifier;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mPackageStatusNotifier:Lcom/android/wallpaper/module/PackageStatusNotifier;

    .line 10
    invoke-interface {p3, p2}, Lcom/android/wallpaper/module/Injector;->getWallpaperPersister(Landroid/content/Context;)Lcom/android/wallpaper/module/WallpaperPersister;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mWallpaperPersister:Lcom/android/wallpaper/module/WallpaperPersister;

    .line 11
    invoke-interface {p3, p2}, Lcom/android/wallpaper/module/Injector;->getFormFactorChecker(Landroid/content/Context;)Lcom/android/wallpaper/util/DownloadableUtils;

    move-result-object p1

    .line 12
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p1, 0x1

    iput p1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mFormFactor:I

    .line 13
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mPermissionChangedListeners:Ljava/util/List;

    .line 14
    invoke-interface {p3}, Lcom/android/wallpaper/module/Injector;->getDownloadableIntentAction()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mDownloadableIntentAction:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public addCategory(Lcom/android/wallpaper/model/Category;Z)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->getCategorySelectorFragment()Lcom/android/wallpaper/picker/CategorySelectorFragment;

    move-result-object p0

    if-eqz p0, :cond_3

    const/4 v0, 0x1

    if-eqz p2, :cond_0

    .line 2
    iget-boolean p2, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mAwaitingCategories:Z

    if-nez p2, :cond_0

    .line 3
    iget-object p2, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mAdapter:Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;

    invoke-virtual {p0}, Lcom/android/wallpaper/picker/CategorySelectorFragment;->getNumColumns()I

    move-result v1

    invoke-virtual {p2, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 4
    iget-object p2, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mAdapter:Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;

    invoke-virtual {p0}, Lcom/android/wallpaper/picker/CategorySelectorFragment;->getNumColumns()I

    move-result v1

    .line 5
    iget-object p2, p2, Landroidx/recyclerview/widget/RecyclerView$Adapter;->mObservable:Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;

    invoke-virtual {p2, v1, v0}, Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;->notifyItemRangeInserted(II)V

    .line 6
    iput-boolean v0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mAwaitingCategories:Z

    .line 7
    :cond_0
    iget-object p2, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mCategories:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p2

    if-ltz p2, :cond_1

    .line 8
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/CategorySelectorFragment;->updateCategory(Lcom/android/wallpaper/model/Category;)V

    goto :goto_1

    .line 9
    :cond_1
    iget p2, p1, Lcom/android/wallpaper/model/Category;->mPriority:I

    const/4 v1, 0x0

    move v2, v1

    .line 10
    :goto_0
    iget-object v3, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mCategories:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    iget-object v3, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mCategories:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/wallpaper/model/Category;

    .line 11
    iget v3, v3, Lcom/android/wallpaper/model/Category;->mPriority:I

    if-lt p2, v3, :cond_2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 12
    :cond_2
    iget-object p2, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mCategories:Ljava/util/ArrayList;

    invoke-virtual {p2, v2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 13
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mAdapter:Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;

    if-eqz p0, :cond_3

    add-int/2addr v2, v1

    .line 14
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$Adapter;->mObservable:Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;

    invoke-virtual {p0, v2, v0}, Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;->notifyItemRangeInserted(II)V

    :cond_3
    :goto_1
    return-void
.end method

.method public cleanUp()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mPackageStatusNotifier:Lcom/android/wallpaper/module/PackageStatusNotifier;

    if-eqz v0, :cond_0

    .line 2
    iget-object v1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mLiveWallpaperStatusListener:Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;

    check-cast v0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;

    invoke-virtual {v0, v1}, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;->removeListener(Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;)V

    .line 3
    iget-object v0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mPackageStatusNotifier:Lcom/android/wallpaper/module/PackageStatusNotifier;

    iget-object v1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mThirdPartyStatusListener:Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;

    check-cast v0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;

    invoke-virtual {v0, v1}, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;->removeListener(Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;)V

    .line 4
    iget-object v0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mPackageStatusNotifier:Lcom/android/wallpaper/module/PackageStatusNotifier;

    iget-object p0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mDownloadableWallpaperStatusListener:Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;

    check-cast v0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;

    invoke-virtual {v0, p0}, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;->removeListener(Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;)V

    :cond_0
    return-void
.end method

.method public final getCategorySelectorFragment()Lcom/android/wallpaper/picker/CategorySelectorFragment;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mContainer:Lcom/android/wallpaper/picker/WallpapersUiContainer;

    invoke-interface {p0}, Lcom/android/wallpaper/picker/WallpapersUiContainer;->getCategorySelectorFragment()Lcom/android/wallpaper/picker/CategorySelectorFragment;

    move-result-object p0

    return-object p0
.end method

.method public handleActivityResult(IILandroid/content/Intent;)Z
    .locals 2

    const/4 v0, 0x0

    const/4 v1, -0x1

    if-eq p2, v1, :cond_0

    return v0

    :cond_0
    const/4 p2, 0x1

    if-eqz p1, :cond_3

    if-eq p1, p2, :cond_2

    const/4 p3, 0x2

    if-eq p1, p3, :cond_2

    const/4 p3, 0x4

    if-eq p1, p3, :cond_1

    return v0

    .line 1
    :cond_1
    iget-object p1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mWallpaperPersister:Lcom/android/wallpaper/module/WallpaperPersister;

    check-cast p1, Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    invoke-virtual {p1}, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->onLiveWallpaperSet()V

    .line 2
    invoke-virtual {p0, p2}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->populateCategories(Z)V

    :cond_2
    return p2

    :cond_3
    if-nez p3, :cond_4

    const/4 p1, 0x0

    goto :goto_0

    .line 3
    :cond_4
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    :goto_0
    if-nez p1, :cond_5

    return p2

    .line 4
    :cond_5
    new-instance p3, Lcom/android/wallpaper/model/ImageWallpaperInfo;

    invoke-direct {p3, p1}, Lcom/android/wallpaper/model/ImageWallpaperInfo;-><init>(Landroid/net/Uri;)V

    .line 5
    iget-object p1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mWallpaperPersister:Lcom/android/wallpaper/module/WallpaperPersister;

    check-cast p1, Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 6
    iput-object p3, p1, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperInfoInPreview:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 7
    iget-object p1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mActivity:Landroidx/fragment/app/FragmentActivity;

    .line 8
    iget-object p0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mPreviewIntentFactory:Lcom/android/wallpaper/model/InlinePreviewIntentFactory;

    .line 9
    invoke-virtual {p3, p1, p0, p2}, Lcom/android/wallpaper/model/ImageWallpaperInfo;->showPreview(Landroid/app/Activity;Lcom/android/wallpaper/model/InlinePreviewIntentFactory;I)V

    return v0
.end method

.method public initialize(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->populateCategories(Z)V

    .line 2
    new-instance p1, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$$ExternalSyntheticLambda0;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/picker/WallpaperPickerDelegate;I)V

    iput-object p1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mLiveWallpaperStatusListener:Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;

    .line 3
    new-instance v0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$$ExternalSyntheticLambda0;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/picker/WallpaperPickerDelegate;I)V

    iput-object v0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mThirdPartyStatusListener:Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;

    .line 4
    iget-object v0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mPackageStatusNotifier:Lcom/android/wallpaper/module/PackageStatusNotifier;

    check-cast v0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;

    const-string v1, "android.service.wallpaper.WallpaperService"

    invoke-virtual {v0, p1, v1}, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;->addListener(Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;Ljava/lang/String;)V

    .line 5
    iget-object p1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mPackageStatusNotifier:Lcom/android/wallpaper/module/PackageStatusNotifier;

    iget-object v0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mThirdPartyStatusListener:Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;

    check-cast p1, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;

    const-string v1, "android.intent.action.SET_WALLPAPER"

    invoke-virtual {p1, v0, v1}, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;->addListener(Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;Ljava/lang/String;)V

    .line 6
    iget-object p1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mDownloadableIntentAction:Ljava/lang/String;

    if-eqz p1, :cond_0

    .line 7
    new-instance v0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$$ExternalSyntheticLambda0;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/picker/WallpaperPickerDelegate;I)V

    iput-object v0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mDownloadableWallpaperStatusListener:Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;

    .line 8
    iget-object p0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mPackageStatusNotifier:Lcom/android/wallpaper/module/PackageStatusNotifier;

    check-cast p0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;

    invoke-virtual {p0, v0, p1}, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;->addListener(Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public isReadExternalStoragePermissionGranted()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iget-object p0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mActivity:Landroidx/fragment/app/FragmentActivity;

    .line 2
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

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

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 1

    const/4 v0, 0x3

    if-ne p1, v0, :cond_2

    .line 1
    array-length p1, p2

    if-lez p1, :cond_2

    const/4 p1, 0x0

    aget-object p2, p2, p1

    const-string v0, "android.permission.READ_EXTERNAL_STORAGE"

    .line 2
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_2

    array-length p2, p3

    if-lez p2, :cond_2

    .line 3
    aget p2, p3, p1

    if-nez p2, :cond_0

    .line 4
    iget-object p1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mPermissionChangedListeners:Ljava/util/List;

    .line 5
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;

    .line 6
    invoke-interface {p2}, Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;->onPermissionsGranted()V

    goto :goto_0

    .line 7
    :cond_0
    iget-object p2, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mActivity:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {p2, v0}, Landroid/app/Activity;->shouldShowRequestPermissionRationale(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_1

    .line 8
    iget-object p1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mPermissionChangedListeners:Ljava/util/List;

    .line 9
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;

    const/4 p3, 0x1

    .line 10
    invoke-interface {p2, p3}, Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;->onPermissionsDenied(Z)V

    goto :goto_1

    .line 11
    :cond_1
    iget-object p2, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mPermissionChangedListeners:Ljava/util/List;

    .line 12
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_2
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;

    .line 13
    invoke-interface {p3, p1}, Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;->onPermissionsDenied(Z)V

    goto :goto_2

    .line 14
    :cond_2
    iget-object p0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mPermissionChangedListeners:Ljava/util/List;

    .line 15
    invoke-interface {p0}, Ljava/util/List;->clear()V

    return-void
.end method

.method public populateCategories(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->getCategorySelectorFragment()Lcom/android/wallpaper/picker/CategorySelectorFragment;

    move-result-object v0

    if-eqz p1, :cond_0

    if-eqz v0, :cond_0

    .line 2
    iget-object v1, v0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mCategories:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 3
    iget-object v0, v0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mAdapter:Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;

    .line 4
    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView$Adapter;->mObservable:Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;->notifyChanged()V

    .line 5
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

    new-instance v1, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$6;

    invoke-direct {v1, p0}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$6;-><init>(Lcom/android/wallpaper/picker/WallpaperPickerDelegate;)V

    check-cast v0, Lcom/android/wallpaper/module/DefaultCategoryProvider;

    invoke-virtual {v0, v1, p1}, Lcom/android/wallpaper/module/DefaultCategoryProvider;->fetchCategories(Lcom/android/wallpaper/model/CategoryReceiver;Z)V

    return-void
.end method

.method public removeCategory(Lcom/android/wallpaper/model/Category;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->getCategorySelectorFragment()Lcom/android/wallpaper/picker/CategorySelectorFragment;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mCategories:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    if-ltz p1, :cond_0

    .line 3
    iget-object v0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mCategories:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 4
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mAdapter:Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;

    add-int/lit8 p1, p1, 0x0

    .line 5
    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView$Adapter;->mObservable:Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;->notifyItemRangeRemoved(II)V

    :cond_0
    return-void
.end method

.method public requestCustomPhotoPicker(Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->isReadExternalStoragePermissionGranted()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$1;

    invoke-direct {v0, p0, p1}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$1;-><init>(Lcom/android/wallpaper/picker/WallpaperPickerDelegate;Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;)V

    .line 3
    invoke-virtual {p0, v0}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->requestExternalStoragePermission(Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;)V

    return-void

    .line 4
    :cond_0
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.PICK"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "image/*"

    .line 5
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 6
    iget-object p0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mActivity:Landroidx/fragment/app/FragmentActivity;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method public requestExternalStoragePermission(Lcom/android/wallpaper/picker/MyPhotosStarter$PermissionChangedListener;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mPermissionChangedListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mActivity:Landroidx/fragment/app/FragmentActivity;

    const-string p1, "android.permission.READ_EXTERNAL_STORAGE"

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x3

    invoke-virtual {p0, p1, v0}, Landroid/app/Activity;->requestPermissions([Ljava/lang/String;I)V

    return-void
.end method

.method public show(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

    check-cast v0, Lcom/android/wallpaper/module/DefaultCategoryProvider;

    invoke-virtual {v0, p1}, Lcom/android/wallpaper/module/DefaultCategoryProvider;->getCategory(Ljava/lang/String;)Lcom/android/wallpaper/model/Category;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    .line 2
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mActivity:Landroidx/fragment/app/FragmentActivity;

    iget-object p0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mPickerIntentFactory:Lcom/android/wallpaper/picker/individual/IndividualPickerActivity$IndividualPickerActivityIntentFactory;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p0, v1}, Lcom/android/wallpaper/model/Category;->show(Landroid/app/Activity;Lcom/android/wallpaper/model/PickerIntentFactory;I)V

    return-void
.end method
