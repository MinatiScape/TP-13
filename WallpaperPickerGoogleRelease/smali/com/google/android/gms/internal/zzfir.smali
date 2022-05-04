.class public final Lcom/google/android/gms/internal/zzfir;
.super Landroid/database/ContentObserver;
.source "SourceFile"


# instance fields
.field public final synthetic zza:Lcom/google/android/gms/internal/zzfiq;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzfiq;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/internal/zzfir;->zza:Lcom/google/android/gms/internal/zzfiq;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public final onChange(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/internal/zzfir;->zza:Lcom/google/android/gms/internal/zzfiq;

    .line 2
    iget-object p1, p0, Lcom/google/android/gms/internal/zzfiq;->zze:Ljava/lang/Object;

    monitor-enter p1

    const/4 v0, 0x0

    .line 3
    :try_start_0
    iput-object v0, p0, Lcom/google/android/gms/internal/zzfiq;->zzf:Ljava/util/Map;

    .line 4
    monitor-exit p1

    return-void

    :catchall_0
    move-exception p0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
