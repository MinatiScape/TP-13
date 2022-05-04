.class public final Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/model/CategoryReceiver;


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nRecentWallpaperUtils.kt\nKotlin\n*S Kotlin\n*F\n+ 1 RecentWallpaperUtils.kt\ncom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,346:1\n970#2,2:347\n*E\n*S KotlinDebug\n*F\n+ 1 RecentWallpaperUtils.kt\ncom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1\n*L\n229#1,2:347\n*E\n"
.end annotation


# instance fields
.field public final synthetic $categories:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/android/wallpaper/model/Category;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic $context:Landroid/content/Context;

.field public final synthetic $continuation:Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/coroutines/Continuation<",
            "Ljava/util/List<",
            "+",
            "Lcom/android/wallpaper/model/WallpaperInfo;",
            ">;>;"
        }
    .end annotation
.end field

.field public final synthetic $wallpapers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/WallpaperInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/HashMap;Landroid/content/Context;Ljava/util/List;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/android/wallpaper/model/Category;",
            ">;",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/WallpaperInfo;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Ljava/util/List<",
            "+",
            "Lcom/android/wallpaper/model/WallpaperInfo;",
            ">;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1;->$categories:Ljava/util/HashMap;

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1;->$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1;->$wallpapers:Ljava/util/List;

    iput-object p4, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1;->$continuation:Lkotlin/coroutines/Continuation;

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doneFetchingCategories()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1;->$wallpapers:Ljava/util/List;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1;->$categories:Ljava/util/HashMap;

    iget-object v2, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1;->$context:Landroid/content/Context;

    .line 2
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x1

    if-le v3, v4, :cond_0

    new-instance v3, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1$doneFetchingCategories$$inlined$sortBy$1;

    invoke-direct {v3, v1, v2}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1$doneFetchingCategories$$inlined$sortBy$1;-><init>(Ljava/util/HashMap;Landroid/content/Context;)V

    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-le v1, v4, :cond_0

    invoke-static {v0, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 4
    :cond_0
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1;->$context:Landroid/content/Context;

    invoke-interface {v0, v1}, Lcom/android/wallpaper/module/Injector;->getCurrentWallpaperFactory(Landroid/content/Context;)Lcom/android/wallpaper/module/CurrentWallpaperInfoFactory;

    move-result-object v0

    .line 6
    new-instance v1, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1$doneFetchingCategories$2;

    iget-object v2, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1;->$wallpapers:Ljava/util/List;

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1;->$continuation:Lkotlin/coroutines/Continuation;

    invoke-direct {v1, v2, p0}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1$doneFetchingCategories$2;-><init>(Ljava/util/List;Lkotlin/coroutines/Continuation;)V

    const/4 p0, 0x0

    check-cast v0, Lcom/android/wallpaper/module/DefaultCurrentWallpaperInfoFactory;

    invoke-virtual {v0, v1, p0}, Lcom/android/wallpaper/module/DefaultCurrentWallpaperInfoFactory;->createCurrentWallpaperInfos(Lcom/android/wallpaper/module/CurrentWallpaperInfoFactory$WallpaperInfoCallback;Z)V

    return-void
.end method

.method public onCategoryReceived(Lcom/android/wallpaper/model/Category;)V
    .locals 3
    .param p1    # Lcom/android/wallpaper/model/Category;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    instance-of v0, p1, Lcom/android/wallpaper/model/WallpaperCategory;

    if-nez v0, :cond_0

    return-void

    .line 2
    :cond_0
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1;->$categories:Ljava/util/HashMap;

    move-object v1, p1

    check-cast v1, Lcom/android/wallpaper/model/WallpaperCategory;

    .line 3
    iget-object v2, v1, Lcom/android/wallpaper/model/Category;->mCollectionId:Ljava/lang/String;

    .line 4
    invoke-virtual {v0, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1;->$context:Landroid/content/Context;

    new-instance v0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1$onCategoryReceived$1;

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1;->$wallpapers:Ljava/util/List;

    invoke-direct {v0, p0}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1$onCategoryReceived$1;-><init>(Ljava/util/List;)V

    const/4 p0, 0x1

    invoke-virtual {v1, p1, v0, p0}, Lcom/android/wallpaper/model/WallpaperCategory;->fetchWallpapers(Landroid/content/Context;Lcom/android/wallpaper/model/WallpaperReceiver;Z)V

    return-void
.end method
