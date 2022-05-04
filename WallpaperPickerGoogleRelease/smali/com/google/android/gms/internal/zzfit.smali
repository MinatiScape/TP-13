.class public synthetic Lcom/google/android/gms/internal/zzfit;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/internal/zzfiy;


# static fields
.field public static sInstance$com$android$wallpaper$util$DisplayMetricsRetriever:Lcom/google/android/gms/internal/zzfit;


# instance fields
.field public zza:Ljava/lang/Object;

.field public zzb:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/zzfis;Lcom/google/android/gms/internal/zzfiq;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfit;->zza:Ljava/lang/Object;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzfit;->zzb:Ljava/lang/Object;

    return-void
.end method

.method public static getInstance()Lcom/google/android/gms/internal/zzfit;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/zzfit;->sInstance$com$android$wallpaper$util$DisplayMetricsRetriever:Lcom/google/android/gms/internal/zzfit;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Lcom/google/android/gms/internal/zzfit;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzfit;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzfit;->sInstance$com$android$wallpaper$util$DisplayMetricsRetriever:Lcom/google/android/gms/internal/zzfit;

    .line 3
    :cond_0
    sget-object v0, Lcom/google/android/gms/internal/zzfit;->sInstance$com$android$wallpaper$util$DisplayMetricsRetriever:Lcom/google/android/gms/internal/zzfit;

    return-object v0
.end method


# virtual methods
.method public getDisplayMetrics(Landroid/content/res/Resources;Landroid/view/Display;)Landroid/util/DisplayMetrics;
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    const-string v0, "Unknown device orientation: "

    .line 2
    invoke-static {v0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "DisplayMetricsRetriever"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3
    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/zzfit;->getPortraitDisplayMetrics(Landroid/view/Display;)Landroid/util/DisplayMetrics;

    move-result-object p0

    return-object p0

    .line 4
    :cond_0
    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/zzfit;->getLandscapeDisplayMetrics(Landroid/view/Display;)Landroid/util/DisplayMetrics;

    move-result-object p0

    return-object p0

    .line 5
    :cond_1
    invoke-virtual {p0, p2}, Lcom/google/android/gms/internal/zzfit;->getPortraitDisplayMetrics(Landroid/view/Display;)Landroid/util/DisplayMetrics;

    move-result-object p0

    return-object p0
.end method

.method public getLandscapeDisplayMetrics(Landroid/view/Display;)Landroid/util/DisplayMetrics;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzfit;->zzb:Ljava/lang/Object;

    check-cast v0, Landroid/util/DisplayMetrics;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzfit;->zzb:Ljava/lang/Object;

    .line 3
    check-cast v0, Landroid/util/DisplayMetrics;

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/zzfit;->writeDisplayMetrics(Landroid/view/Display;Landroid/util/DisplayMetrics;)V

    .line 4
    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/internal/zzfit;->zzb:Ljava/lang/Object;

    check-cast p0, Landroid/util/DisplayMetrics;

    return-object p0
.end method

.method public getPortraitDisplayMetrics(Landroid/view/Display;)Landroid/util/DisplayMetrics;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzfit;->zza:Ljava/lang/Object;

    check-cast v0, Landroid/util/DisplayMetrics;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzfit;->zza:Ljava/lang/Object;

    .line 3
    check-cast v0, Landroid/util/DisplayMetrics;

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/zzfit;->writeDisplayMetrics(Landroid/view/Display;Landroid/util/DisplayMetrics;)V

    .line 4
    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/internal/zzfit;->zza:Ljava/lang/Object;

    check-cast p0, Landroid/util/DisplayMetrics;

    return-object p0
.end method

.method public writeDisplayMetrics(Landroid/view/Display;Landroid/util/DisplayMetrics;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    return-void
.end method

.method public zza()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzfit;->zza:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/gms/internal/zzfis;

    iget-object p0, p0, Lcom/google/android/gms/internal/zzfit;->zzb:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/gms/internal/zzfiq;

    .line 2
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "gms:phenotype:phenotype_flag:debug_disable_caching"

    .line 3
    invoke-static {v1}, Lcom/google/android/gms/internal/zzfis;->zza(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 4
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzfiq;->zzc()Ljava/util/Map;

    move-result-object v1

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzfiq;->zzf:Ljava/util/Map;

    :goto_0
    if-nez v1, :cond_2

    .line 5
    iget-object v2, p0, Lcom/google/android/gms/internal/zzfiq;->zze:Ljava/lang/Object;

    monitor-enter v2

    .line 6
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzfiq;->zzf:Ljava/util/Map;

    if-nez v1, :cond_1

    .line 7
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzfiq;->zzc()Ljava/util/Map;

    move-result-object v1

    .line 8
    iput-object v1, p0, Lcom/google/android/gms/internal/zzfiq;->zzf:Ljava/util/Map;

    .line 9
    :cond_1
    monitor-exit v2

    goto :goto_1

    :catchall_0
    move-exception p0

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_2
    :goto_1
    if-eqz v1, :cond_3

    goto :goto_2

    .line 10
    :cond_3
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    .line 11
    :goto_2
    iget-object p0, v0, Lcom/google/android/gms/internal/zzfis;->zza:Ljava/lang/String;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method
