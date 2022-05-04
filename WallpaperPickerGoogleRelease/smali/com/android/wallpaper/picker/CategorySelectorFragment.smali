.class public Lcom/android/wallpaper/picker/CategorySelectorFragment;
.super Lcom/android/wallpaper/picker/AppbarFragment;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/picker/CategorySelectorFragment$CategorySpanSizeLookup;,
        Lcom/android/wallpaper/picker/CategorySelectorFragment$GridPaddingDecoration;,
        Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;,
        Lcom/android/wallpaper/picker/CategorySelectorFragment$LoadingIndicatorHolder;,
        Lcom/android/wallpaper/picker/CategorySelectorFragment$MyPhotosCategoryHolder;,
        Lcom/android/wallpaper/picker/CategorySelectorFragment$FeaturedCategoryHolder;,
        Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryHolder;,
        Lcom/android/wallpaper/picker/CategorySelectorFragment$CategorySelectorFragmentHost;
    }
.end annotation


# static fields
.field public static final synthetic $r8$clinit:I


# instance fields
.field public mAdapter:Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;

.field public mAwaitingCategories:Z

.field public mCategories:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/wallpaper/model/Category;",
            ">;"
        }
    .end annotation
.end field

.field public final mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

.field public mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

.field public mIsFeaturedCollectionAvailable:Z

.field public mTileSizePx:Landroid/graphics/Point;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/picker/AppbarFragment;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mCategories:Ljava/util/ArrayList;

    .line 3
    new-instance v1, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v0, v2}, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;-><init>(Lcom/android/wallpaper/picker/CategorySelectorFragment;Ljava/util/List;Lcom/android/wallpaper/picker/CategorySelectorFragment$1;)V

    iput-object v1, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mAdapter:Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;

    .line 4
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/android/wallpaper/module/Injector;->getCategoryProvider(Landroid/content/Context;)Lcom/android/wallpaper/model/CategoryProvider;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

    return-void
.end method


# virtual methods
.method public final getCategorySelectorFragmentHost()Lcom/android/wallpaper/picker/CategorySelectorFragment$CategorySelectorFragmentHost;
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/Fragment;->mParentFragment:Landroidx/fragment/app/Fragment;

    if-eqz v0, :cond_0

    .line 2
    check-cast v0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategorySelectorFragmentHost;

    return-object v0

    .line 3
    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    check-cast p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategorySelectorFragmentHost;

    return-object p0
.end method

.method public final getNumColumns()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    .line 2
    :cond_0
    invoke-static {p0}, Lcom/android/wallpaper/util/SizeCalculator;->getActivityWindowWidthPx(Landroid/app/Activity;)I

    move-result v0

    const/4 v1, 0x3

    .line 3
    invoke-static {p0, v0, v1, v1}, Lcom/android/wallpaper/util/SizeCalculator;->getNumColumns(Landroid/content/Context;III)I

    move-result p0

    :goto_0
    return p0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3

    const p3, 0x7f0d0059

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0a0082

    .line 2
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroidx/recyclerview/widget/RecyclerView;

    iput-object p2, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    .line 3
    new-instance p3, Lcom/android/wallpaper/picker/CategorySelectorFragment$GridPaddingDecoration;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f070104

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-direct {p3, p0, v0}, Lcom/android/wallpaper/picker/CategorySelectorFragment$GridPaddingDecoration;-><init>(Lcom/android/wallpaper/picker/CategorySelectorFragment;I)V

    invoke-virtual {p2, p3}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p2

    .line 5
    invoke-virtual {p2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    .line 6
    invoke-static {p2}, Lcom/android/wallpaper/util/SizeCalculator;->getActivityWindowWidthPx(Landroid/app/Activity;)I

    move-result v0

    const/4 v2, 0x3

    .line 7
    invoke-static {p2, v0, v2, v2}, Lcom/android/wallpaper/util/SizeCalculator;->getNumColumns(Landroid/content/Context;III)I

    move-result p2

    .line 8
    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    const v2, 0x7f070087

    .line 9
    invoke-virtual {p3, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    .line 10
    invoke-static {p2, v0, v1, p3}, Lcom/android/wallpaper/util/SizeCalculator;->getSquareTileSize(IIII)Landroid/graphics/Point;

    move-result-object p2

    .line 11
    iput-object p2, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mTileSizePx:Landroid/graphics/Point;

    .line 12
    iget-object p2, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p3, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mAdapter:Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;

    invoke-virtual {p2, p3}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 13
    new-instance p2, Landroidx/recyclerview/widget/GridLayoutManager;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p3

    .line 14
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/CategorySelectorFragment;->getNumColumns()I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    invoke-direct {p2, p3, v0}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 15
    new-instance p3, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategorySpanSizeLookup;

    iget-object v0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mAdapter:Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;

    const/4 v1, 0x0

    invoke-direct {p3, p0, v0, v1}, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategorySpanSizeLookup;-><init>(Lcom/android/wallpaper/picker/CategorySelectorFragment;Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;Lcom/android/wallpaper/picker/CategorySelectorFragment$1;)V

    .line 16
    iput-object p3, p2, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    .line 17
    iget-object p3, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 18
    iget-object p2, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    new-instance p3, Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate;

    iget-object v0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mImageGrid:Landroidx/recyclerview/widget/RecyclerView;

    .line 19
    iget-object v1, p0, Landroidx/fragment/app/Fragment;->mParentFragment:Landroidx/fragment/app/Fragment;

    .line 20
    check-cast v1, Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate$BottomSheetHost;

    invoke-virtual {p0}, Lcom/android/wallpaper/picker/CategorySelectorFragment;->getNumColumns()I

    move-result v2

    invoke-direct {p3, v0, v1, v2}, Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate;-><init>(Landroidx/recyclerview/widget/RecyclerView;Lcom/android/wallpaper/widget/WallpaperPickerRecyclerViewAccessibilityDelegate$BottomSheetHost;I)V

    .line 21
    invoke-virtual {p2, p3}, Landroidx/recyclerview/widget/RecyclerView;->setAccessibilityDelegateCompat(Landroidx/recyclerview/widget/RecyclerViewAccessibilityDelegate;)V

    .line 22
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/CategorySelectorFragment;->getCategorySelectorFragmentHost()Lcom/android/wallpaper/picker/CategorySelectorFragment$CategorySelectorFragmentHost;

    move-result-object p2

    invoke-interface {p2}, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategorySelectorFragmentHost;->isHostToolbarShown()Z

    move-result p2

    const p3, 0x7f11014b

    if-eqz p2, :cond_0

    const p2, 0x7f0a0113

    .line 23
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    const/16 v0, 0x8

    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 24
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/CategorySelectorFragment;->getCategorySelectorFragmentHost()Lcom/android/wallpaper/picker/CategorySelectorFragment$CategorySelectorFragmentHost;

    move-result-object p2

    .line 25
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p3}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object p3

    .line 26
    invoke-interface {p2, p3}, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategorySelectorFragmentHost;->setToolbarTitle(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_0
    const/4 p2, 0x1

    .line 27
    invoke-virtual {p0, p1, p2}, Lcom/android/wallpaper/picker/AppbarFragment;->setUpToolbar(Landroid/view/View;Z)V

    .line 28
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object p2

    .line 29
    invoke-virtual {p0, p2}, Lcom/android/wallpaper/picker/AppbarFragment;->setTitle(Ljava/lang/CharSequence;)V

    .line 30
    :goto_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p2

    invoke-virtual {p2}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p2

    invoke-static {p2}, Landroidx/cardview/R$color;->isDeepLink(Landroid/content/Intent;)Z

    move-result p2

    if-nez p2, :cond_1

    .line 31
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/CategorySelectorFragment;->getCategorySelectorFragmentHost()Lcom/android/wallpaper/picker/CategorySelectorFragment$CategorySelectorFragmentHost;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategorySelectorFragmentHost;->fetchCategories()V

    .line 32
    :cond_1
    sget-object p0, Lcom/android/wallpaper/picker/CategorySelectorFragment$$ExternalSyntheticLambda0;->INSTANCE:Lcom/android/wallpaper/picker/CategorySelectorFragment$$ExternalSyntheticLambda0;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    return-object p1
.end method

.method public onDestroyView()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/CategorySelectorFragment;->getCategorySelectorFragmentHost()Lcom/android/wallpaper/picker/CategorySelectorFragment$CategorySelectorFragmentHost;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategorySelectorFragmentHost;->cleanUp()V

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Landroidx/fragment/app/Fragment;->mCalled:Z

    return-void
.end method

.method public updateCategory(Lcom/android/wallpaper/model/Category;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mCategories:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_0

    .line 2
    iget-object v1, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mCategories:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 3
    iget-object v1, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mCategories:Ljava/util/ArrayList;

    invoke-virtual {v1, v0, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 4
    iget-object p0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mAdapter:Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;

    add-int/lit8 v0, v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    :cond_0
    return-void
.end method
