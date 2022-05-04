.class public final Lcom/google/android/gms/internal/zzbmk;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static zzb:Lcom/google/android/gms/internal/zzbmk;


# instance fields
.field public zza:Lcom/google/android/gms/internal/zzbmj;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/zzbmk;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzbmk;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/zzbmk;->zzb:Lcom/google/android/gms/internal/zzbmk;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/google/android/gms/internal/zzbmk;->zza:Lcom/google/android/gms/internal/zzbmj;

    return-void
.end method

.method public static zza(Landroid/content/Context;)Lcom/google/android/gms/internal/zzbmj;
    .locals 2

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/zzbmk;->zzb:Lcom/google/android/gms/internal/zzbmk;

    .line 2
    monitor-enter v0

    .line 3
    :try_start_0
    iget-object v1, v0, Lcom/google/android/gms/internal/zzbmk;->zza:Lcom/google/android/gms/internal/zzbmj;

    if-nez v1, :cond_1

    .line 4
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 5
    :goto_0
    new-instance v1, Lcom/google/android/gms/internal/zzbmj;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzbmj;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lcom/google/android/gms/internal/zzbmk;->zza:Lcom/google/android/gms/internal/zzbmj;

    .line 6
    :cond_1
    iget-object p0, v0, Lcom/google/android/gms/internal/zzbmk;->zza:Lcom/google/android/gms/internal/zzbmj;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method
