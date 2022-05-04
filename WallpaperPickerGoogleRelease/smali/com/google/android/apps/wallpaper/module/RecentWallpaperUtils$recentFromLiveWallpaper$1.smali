.class final Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromLiveWallpaper$1;
.super Lkotlin/coroutines/jvm/internal/ContinuationImpl;
.source "RecentWallpaperUtils.kt"


# annotations
.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.google.android.apps.wallpaper.module.RecentWallpaperUtils"
    f = "RecentWallpaperUtils.kt"
    l = {
        0x151
    }
    m = "recentFromLiveWallpaper"
.end annotation


# instance fields
.field public L$0:Ljava/lang/Object;

.field public L$1:Ljava/lang/Object;

.field public L$2:Ljava/lang/Object;

.field public L$3:Ljava/lang/Object;

.field public label:I

.field public synthetic result:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromLiveWallpaper$1;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0, p1}, Lkotlin/coroutines/jvm/internal/ContinuationImpl;-><init>(Lkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromLiveWallpaper$1;->result:Ljava/lang/Object;

    iget p1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromLiveWallpaper$1;->label:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils$recentFromLiveWallpaper$1;->label:I

    const/4 p1, 0x0

    invoke-static {p1, p1, p0}, Lcom/google/android/apps/wallpaper/module/RecentWallpaperUtils;->access$recentFromLiveWallpaper(Lcom/android/wallpaper/model/LiveWallpaperInfo;Landroid/content/Context;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
