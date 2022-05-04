.class public final synthetic Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Predicate;


# static fields
.field public static final synthetic INSTANCE:Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$$ExternalSyntheticLambda0;


# direct methods
.method public static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$$ExternalSyntheticLambda0;-><init>()V

    sput-object v0, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$$ExternalSyntheticLambda0;->INSTANCE:Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$$ExternalSyntheticLambda0;

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

    check-cast p1, Lcom/android/wallpaper/model/Category;

    .line 1
    iget p0, p1, Lcom/android/wallpaper/model/Category;->mPriority:I

    const/4 p1, 0x1

    if-le p0, p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method
