.class public final synthetic Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Predicate;


# static fields
.field public static final synthetic INSTANCE:Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask$$ExternalSyntheticLambda3;


# direct methods
.method public static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask$$ExternalSyntheticLambda3;

    invoke-direct {v0}, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask$$ExternalSyntheticLambda3;-><init>()V

    sput-object v0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask$$ExternalSyntheticLambda3;->INSTANCE:Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask$$ExternalSyntheticLambda3;

    return-void
.end method

.method public synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 0

    check-cast p1, Lcom/android/wallpaper/model/WallpaperInfo;

    sget p0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->$r8$clinit:I

    .line 1
    instance-of p0, p1, Lcom/android/wallpaper/model/LiveWallpaperInfo;

    return p0
.end method
