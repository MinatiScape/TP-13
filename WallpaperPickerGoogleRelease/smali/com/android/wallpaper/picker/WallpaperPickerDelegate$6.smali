.class public Lcom/android/wallpaper/picker/WallpaperPickerDelegate$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/model/CategoryReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->populateCategories(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/WallpaperPickerDelegate;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$6;->this$0:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doneFetchingCategories()V
    .locals 7

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$6;->this$0:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    .line 2
    iget v0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mFormFactor:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    .line 3
    invoke-virtual {p0}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->getCategorySelectorFragment()Lcom/android/wallpaper/picker/CategorySelectorFragment;

    move-result-object p0

    if-eqz p0, :cond_3

    .line 4
    iget-boolean v0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mAwaitingCategories:Z

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 5
    iget-object v0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mAdapter:Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;

    invoke-virtual {v0}, Lcom/android/wallpaper/picker/CategorySelectorFragment$CategoryAdapter;->getItemCount()I

    move-result v3

    sub-int/2addr v3, v1

    .line 6
    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView$Adapter;->mObservable:Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;

    invoke-virtual {v0, v3, v1}, Landroidx/recyclerview/widget/RecyclerView$AdapterDataObservable;->notifyItemRangeRemoved(II)V

    .line 7
    iput-boolean v2, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mAwaitingCategories:Z

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mCategoryProvider:Lcom/android/wallpaper/model/CategoryProvider;

    check-cast v0, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider;

    .line 9
    iget-object v0, v0, Lcom/android/wallpaper/module/DefaultCategoryProvider;->mCategories:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    move-result-object v0

    sget-object v3, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$$ExternalSyntheticLambda0;->INSTANCE:Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$$ExternalSyntheticLambda0;

    .line 10
    invoke-interface {v0, v3}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v0

    sget-object v3, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$$ExternalSyntheticLambda1;->INSTANCE:Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$$ExternalSyntheticLambda1;

    .line 11
    invoke-interface {v0, v3}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v0

    .line 12
    invoke-interface {v0}, Ljava/util/stream/Stream;->count()J

    move-result-wide v3

    const-wide/16 v5, 0x2

    cmp-long v0, v3, v5

    if-ltz v0, :cond_1

    goto :goto_0

    :cond_1
    move v1, v2

    .line 13
    :goto_0
    iput-boolean v1, p0, Lcom/android/wallpaper/picker/CategorySelectorFragment;->mIsFeaturedCollectionAvailable:Z

    goto :goto_1

    .line 14
    :cond_2
    iget-object p0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->mContainer:Lcom/android/wallpaper/picker/WallpapersUiContainer;

    invoke-interface {p0}, Lcom/android/wallpaper/picker/WallpapersUiContainer;->doneFetchingCategories()V

    :cond_3
    :goto_1
    return-void
.end method

.method public onCategoryReceived(Lcom/android/wallpaper/model/Category;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/picker/WallpaperPickerDelegate$6;->this$0:Lcom/android/wallpaper/picker/WallpaperPickerDelegate;

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/android/wallpaper/picker/WallpaperPickerDelegate;->addCategory(Lcom/android/wallpaper/model/Category;Z)V

    return-void
.end method
