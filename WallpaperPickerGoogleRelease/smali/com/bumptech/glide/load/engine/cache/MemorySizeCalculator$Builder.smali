.class public final Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# static fields
.field public static final MEMORY_CACHE_TARGET_SCREENS:I = 0x2


# instance fields
.field public activityManager:Landroid/app/ActivityManager;

.field public bitmapPoolScreens:F

.field public final context:Landroid/content/Context;

.field public memoryCacheScreens:F

.field public screenDimensions:Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$ScreenDimensions;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "context"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x40000000    # 2.0f

    .line 2
    iput v0, p0, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;->memoryCacheScreens:F

    const/4 v0, 0x1

    int-to-float v0, v0

    .line 3
    iput v0, p0, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;->bitmapPoolScreens:F

    .line 4
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;->context:Landroid/content/Context;

    const-string v0, "activity"

    .line 5
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;->activityManager:Landroid/app/ActivityManager;

    .line 6
    new-instance v0, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$DisplayMetricsScreenDimensions;

    .line 7
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$DisplayMetricsScreenDimensions;-><init>(Landroid/util/DisplayMetrics;)V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;->screenDimensions:Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$ScreenDimensions;

    .line 8
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;->activityManager:Landroid/app/ActivityManager;

    .line 9
    invoke-virtual {p1}, Landroid/app/ActivityManager;->isLowRamDevice()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    .line 10
    iput p1, p0, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;->bitmapPoolScreens:F

    :cond_0
    return-void
.end method


# virtual methods
.method public setActivityManager(Landroid/app/ActivityManager;)Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "activityManager"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;->activityManager:Landroid/app/ActivityManager;

    return-object p0
.end method

.method public setScreenDimensions(Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$ScreenDimensions;)Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "screenDimensions"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;->screenDimensions:Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$ScreenDimensions;

    return-object p0
.end method
