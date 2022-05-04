.class public final synthetic Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Function;


# static fields
.field public static final synthetic INSTANCE:Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask$$ExternalSyntheticLambda1;


# direct methods
.method public static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask$$ExternalSyntheticLambda1;

    invoke-direct {v0}, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask$$ExternalSyntheticLambda1;-><init>()V

    sput-object v0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask$$ExternalSyntheticLambda1;->INSTANCE:Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask$$ExternalSyntheticLambda1;

    return-void
.end method

.method public synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, Lcom/android/wallpaper/model/Category;

    sget p0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->$r8$clinit:I

    .line 1
    check-cast p1, Lcom/android/wallpaper/model/WallpaperCategory;

    .line 2
    iget-object p0, p1, Lcom/android/wallpaper/model/WallpaperCategory;->mWallpapers:Ljava/util/List;

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    .line 3
    invoke-interface {p0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    move-result-object p0

    sget-object p1, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask$$ExternalSyntheticLambda3;->INSTANCE:Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask$$ExternalSyntheticLambda3;

    .line 4
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object p0

    sget-object p1, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask$$ExternalSyntheticLambda0;->INSTANCE:Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask$$ExternalSyntheticLambda0;

    .line 5
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    move-result-object p0

    return-object p0
.end method
