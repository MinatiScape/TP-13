.class public final Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1$doneFetchingCategories$$inlined$sortBy$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1;->doneFetchingCategories()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "TT;>;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nComparisons.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Comparisons.kt\nkotlin/comparisons/ComparisonsKt__ComparisonsKt$compareBy$2\n+ 2 RecentWallpaperUtils.kt\ncom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1\n*L\n1#1,319:1\n230#2:320\n*E\n"
.end annotation


# instance fields
.field public final synthetic $categories$inlined:Ljava/util/HashMap;

.field public final synthetic $context$inlined:Landroid/content/Context;


# direct methods
.method public constructor <init>(Ljava/util/HashMap;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1$doneFetchingCategories$$inlined$sortBy$1;->$categories$inlined:Ljava/util/HashMap;

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1$doneFetchingCategories$$inlined$sortBy$1;->$context$inlined:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)I"
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/android/wallpaper/model/WallpaperInfo;

    .line 2
    iget-object v0, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1$doneFetchingCategories$$inlined$sortBy$1;->$categories$inlined:Ljava/util/HashMap;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1$doneFetchingCategories$$inlined$sortBy$1;->$context$inlined:Landroid/content/Context;

    invoke-virtual {p1, v1}, Lcom/android/wallpaper/model/WallpaperInfo;->getCollectionId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/wallpaper/model/Category;

    const/4 v0, 0x0

    if-nez p1, :cond_0

    move-object p1, v0

    goto :goto_0

    .line 3
    :cond_0
    iget p1, p1, Lcom/android/wallpaper/model/Category;->mPriority:I

    .line 4
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    :goto_0
    check-cast p2, Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object v1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1$doneFetchingCategories$$inlined$sortBy$1;->$categories$inlined:Ljava/util/HashMap;

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1$doneFetchingCategories$$inlined$sortBy$1;->$context$inlined:Landroid/content/Context;

    invoke-virtual {p2, p0}, Lcom/android/wallpaper/model/WallpaperInfo;->getCollectionId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/android/wallpaper/model/Category;

    if-nez p0, :cond_1

    goto :goto_1

    .line 5
    :cond_1
    iget p0, p0, Lcom/android/wallpaper/model/Category;->mPriority:I

    .line 6
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    :goto_1
    invoke-static {p1, v0}, Lkotlin/comparisons/ComparisonsKt___ComparisonsJvmKt;->compareValues(Ljava/lang/Comparable;Ljava/lang/Comparable;)I

    move-result p0

    return p0
.end method
