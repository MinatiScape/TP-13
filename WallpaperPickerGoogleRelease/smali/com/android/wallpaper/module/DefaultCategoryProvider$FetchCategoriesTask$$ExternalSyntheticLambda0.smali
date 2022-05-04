.class public final synthetic Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Function;


# static fields
.field public static final synthetic INSTANCE:Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask$$ExternalSyntheticLambda0;


# direct methods
.method public static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask$$ExternalSyntheticLambda0;-><init>()V

    sput-object v0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask$$ExternalSyntheticLambda0;->INSTANCE:Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask$$ExternalSyntheticLambda0;

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

    check-cast p1, Lcom/android/wallpaper/model/WallpaperInfo;

    sget p0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->$r8$clinit:I

    .line 1
    check-cast p1, Lcom/android/wallpaper/model/LiveWallpaperInfo;

    .line 2
    iget-object p0, p1, Lcom/android/wallpaper/model/LiveWallpaperInfo;->mInfo:Landroid/app/WallpaperInfo;

    .line 3
    invoke-virtual {p0}, Landroid/app/WallpaperInfo;->getPackageName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
