.class public final synthetic Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Predicate;


# static fields
.field public static final synthetic INSTANCE:Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$$ExternalSyntheticLambda1;


# direct methods
.method public static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$$ExternalSyntheticLambda1;

    invoke-direct {v0}, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$$ExternalSyntheticLambda1;-><init>()V

    sput-object v0, Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$$ExternalSyntheticLambda1;->INSTANCE:Lcom/google/android/apps/wallpaper/module/WallpaperCategoryProvider$$ExternalSyntheticLambda1;

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

    const/16 p1, 0xc9

    if-ge p0, p1, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
