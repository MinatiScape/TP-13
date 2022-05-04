.class public final Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$DisplayMetricsScreenDimensions;,
        Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;,
        Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$ScreenDimensions;
    }
.end annotation


# static fields
.field public static final BYTES_PER_ARGB_8888_PIXEL:I = 0x4


# instance fields
.field public final arrayPoolSize:I

.field public final bitmapPoolSize:I

.field public final context:Landroid/content/Context;

.field public final memoryCacheSize:I


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;)V
    .locals 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "builder"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iget-object v0, p1, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;->context:Landroid/content/Context;

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;->context:Landroid/content/Context;

    .line 3
    iget-object v0, p1, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;->activityManager:Landroid/app/ActivityManager;

    .line 4
    invoke-virtual {v0}, Landroid/app/ActivityManager;->isLowRamDevice()Z

    move-result v0

    if-eqz v0, :cond_0

    const/high16 v0, 0x200000

    goto :goto_0

    :cond_0
    const/high16 v0, 0x400000

    .line 5
    :goto_0
    iput v0, p0, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;->arrayPoolSize:I

    .line 6
    iget-object v1, p1, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;->activityManager:Landroid/app/ActivityManager;

    const v2, 0x3ecccccd    # 0.4f

    const v3, 0x3ea8f5c3    # 0.33f

    .line 7
    invoke-virtual {v1}, Landroid/app/ActivityManager;->getMemoryClass()I

    move-result v4

    mul-int/lit16 v4, v4, 0x400

    mul-int/lit16 v4, v4, 0x400

    .line 8
    invoke-virtual {v1}, Landroid/app/ActivityManager;->isLowRamDevice()Z

    move-result v1

    int-to-float v4, v4

    if-eqz v1, :cond_1

    move v2, v3

    :cond_1
    mul-float/2addr v4, v2

    .line 9
    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 10
    iget-object v2, p1, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;->screenDimensions:Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$ScreenDimensions;

    check-cast v2, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$DisplayMetricsScreenDimensions;

    .line 11
    iget-object v2, v2, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$DisplayMetricsScreenDimensions;->displayMetrics:Landroid/util/DisplayMetrics;

    iget v3, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 12
    iget v2, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    mul-int/2addr v3, v2

    mul-int/lit8 v3, v3, 0x4

    int-to-float v2, v3

    .line 13
    iget v3, p1, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;->bitmapPoolScreens:F

    mul-float/2addr v3, v2

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    .line 14
    iget v4, p1, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;->memoryCacheScreens:F

    mul-float/2addr v2, v4

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    sub-int v4, v1, v0

    add-int v5, v2, v3

    if-gt v5, v4, :cond_2

    .line 15
    iput v2, p0, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;->memoryCacheSize:I

    .line 16
    iput v3, p0, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;->bitmapPoolSize:I

    goto :goto_1

    :cond_2
    int-to-float v2, v4

    .line 17
    iget v3, p1, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;->bitmapPoolScreens:F

    iget v4, p1, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;->memoryCacheScreens:F

    add-float/2addr v3, v4

    div-float/2addr v2, v3

    mul-float/2addr v4, v2

    .line 18
    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v3

    iput v3, p0, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;->memoryCacheSize:I

    .line 19
    iget v3, p1, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;->bitmapPoolScreens:F

    mul-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    iput v2, p0, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;->bitmapPoolSize:I

    :goto_1
    const/4 v2, 0x3

    const-string v3, "MemorySizeCalculator"

    .line 20
    invoke-static {v3, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 21
    iget v2, p0, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;->memoryCacheSize:I

    .line 22
    invoke-virtual {p0, v2}, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;->toMb(I)Ljava/lang/String;

    move-result-object v2

    iget v4, p0, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;->bitmapPoolSize:I

    .line 23
    invoke-virtual {p0, v4}, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;->toMb(I)Ljava/lang/String;

    move-result-object v4

    .line 24
    invoke-virtual {p0, v0}, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;->toMb(I)Ljava/lang/String;

    move-result-object v0

    if-le v5, v1, :cond_3

    const/4 v5, 0x1

    goto :goto_2

    :cond_3
    const/4 v5, 0x0

    .line 25
    :goto_2
    invoke-virtual {p0, v1}, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;->toMb(I)Ljava/lang/String;

    move-result-object p0

    iget-object v1, p1, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;->activityManager:Landroid/app/ActivityManager;

    .line 26
    invoke-virtual {v1}, Landroid/app/ActivityManager;->getMemoryClass()I

    move-result v1

    iget-object p1, p1, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;->activityManager:Landroid/app/ActivityManager;

    .line 27
    invoke-virtual {p1}, Landroid/app/ActivityManager;->isLowRamDevice()Z

    move-result p1

    const/16 v6, 0xb1

    .line 28
    invoke-static {v2, v6}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v6

    invoke-static {v4, v6}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v6

    invoke-static {v0, v6}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v6

    invoke-static {p0, v6}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v6

    const-string v7, "Calculation complete, Calculated memory cache size: "

    const-string v8, ", pool size: "

    invoke-static {v6, v7, v2, v8, v4}, Landroidx/recyclerview/R$attr$$ExternalSyntheticOutline0;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ", byte array size: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", memory class limited? "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, ", max size: "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ", memoryClass: "

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, ", isLowMemoryDevice: "

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 29
    invoke-static {v3, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    return-void
.end method


# virtual methods
.method public final toMb(I)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "bytes"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;->context:Landroid/content/Context;

    int-to-long v0, p1

    invoke-static {p0, v0, v1}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
