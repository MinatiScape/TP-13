.class public final Lcom/google/android/gms/common/api/internal/zzbu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic zza:Lcom/google/android/gms/common/api/internal/zzbt;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/internal/zzbt;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbu;->zza:Lcom/google/android/gms/common/api/internal/zzbt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbu;->zza:Lcom/google/android/gms/common/api/internal/zzbt;

    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbt;->zza:Lcom/google/android/gms/common/api/internal/zzbp;

    .line 2
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzc:Lcom/google/android/gms/common/api/Api$Client;

    .line 3
    invoke-interface {p0}, Lcom/google/android/gms/common/api/Api$Client;->disconnect()V

    return-void
.end method
