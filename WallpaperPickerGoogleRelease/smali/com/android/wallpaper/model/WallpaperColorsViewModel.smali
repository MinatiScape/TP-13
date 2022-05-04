.class public final Lcom/android/wallpaper/model/WallpaperColorsViewModel;
.super Landroidx/lifecycle/ViewModel;
.source "SourceFile"


# instance fields
.field public final homeWallpaperColors$delegate:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final lockWallpaperColors$delegate:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/lifecycle/ViewModel;-><init>()V

    .line 2
    sget-object v0, Lcom/android/wallpaper/model/WallpaperColorsViewModel$homeWallpaperColors$2;->INSTANCE:Lcom/android/wallpaper/model/WallpaperColorsViewModel$homeWallpaperColors$2;

    invoke-static {v0}, Lkotlin/LazyKt__LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wallpaper/model/WallpaperColorsViewModel;->homeWallpaperColors$delegate:Lkotlin/Lazy;

    .line 3
    sget-object v0, Lcom/android/wallpaper/model/WallpaperColorsViewModel$lockWallpaperColors$2;->INSTANCE:Lcom/android/wallpaper/model/WallpaperColorsViewModel$lockWallpaperColors$2;

    invoke-static {v0}, Lkotlin/LazyKt__LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wallpaper/model/WallpaperColorsViewModel;->lockWallpaperColors$delegate:Lkotlin/Lazy;

    return-void
.end method


# virtual methods
.method public final getHomeWallpaperColors()Landroidx/lifecycle/MutableLiveData;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/MutableLiveData<",
            "Landroid/app/WallpaperColors;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/model/WallpaperColorsViewModel;->homeWallpaperColors$delegate:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroidx/lifecycle/MutableLiveData;

    return-object p0
.end method

.method public final getLockWallpaperColors()Landroidx/lifecycle/MutableLiveData;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/MutableLiveData<",
            "Landroid/app/WallpaperColors;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/model/WallpaperColorsViewModel;->lockWallpaperColors$delegate:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroidx/lifecycle/MutableLiveData;

    return-object p0
.end method
