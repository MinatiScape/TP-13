.class public final Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1$doneFetchingCategories$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/CurrentWallpaperInfoFactory$WallpaperInfoCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1;->doneFetchingCategories()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
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
.method public constructor <init>(Ljava/util/List;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1$doneFetchingCategories$2;->$wallpapers:Ljava/util/List;

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1$doneFetchingCategories$2;->$continuation:Lkotlin/coroutines/Continuation;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onWallpaperInfoCreated(Lcom/android/wallpaper/model/WallpaperInfo;Lcom/android/wallpaper/model/WallpaperInfo;I)V
    .locals 1
    .param p2    # Lcom/android/wallpaper/model/WallpaperInfo;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p2, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1$doneFetchingCategories$2;->$wallpapers:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_0

    .line 2
    iget-object p2, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1$doneFetchingCategories$2;->$wallpapers:Ljava/util/List;

    const/4 p3, 0x0

    const-string v0, "homeWallpaper"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p2, p3, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 3
    :cond_0
    iget-object p1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1$doneFetchingCategories$2;->$continuation:Lkotlin/coroutines/Continuation;

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$generateDefaults$2$1$doneFetchingCategories$2;->$wallpapers:Ljava/util/List;

    invoke-interface {p1, p0}, Lkotlin/coroutines/Continuation;->resumeWith(Ljava/lang/Object;)V

    return-void
.end method
