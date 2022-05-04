.class public final Lcom/google/android/gms/common/api/Api;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/common/api/Api$Client;,
        Lcom/google/android/gms/common/api/Api$zzb;,
        Lcom/google/android/gms/common/api/Api$ClientKey;,
        Lcom/google/android/gms/common/api/Api$zzc;,
        Lcom/google/android/gms/common/api/Api$ApiOptions;,
        Lcom/google/android/gms/common/api/Api$zza;,
        Lcom/google/android/gms/common/api/Api$zzd;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<O::",
        "Lcom/google/android/gms/common/api/Api$ApiOptions;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final zza:Lcom/google/android/gms/common/api/Api$zza;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api$zza<",
            "*TO;>;"
        }
    .end annotation
.end field

.field public final zzc:Lcom/google/android/gms/common/api/Api$ClientKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api$ClientKey<",
            "*>;"
        }
    .end annotation
.end field

.field public final zze:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/google/android/gms/common/api/Api$zza;Lcom/google/android/gms/common/api/Api$ClientKey;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<C::",
            "Lcom/google/android/gms/common/api/Api$Client;",
            ">(",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/common/api/Api$zza<",
            "TC;TO;>;",
            "Lcom/google/android/gms/common/api/Api$ClientKey<",
            "TC;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/android/gms/common/api/Api;->zze:Ljava/lang/String;

    .line 3
    iput-object p2, p0, Lcom/google/android/gms/common/api/Api;->zza:Lcom/google/android/gms/common/api/Api$zza;

    .line 4
    iput-object p3, p0, Lcom/google/android/gms/common/api/Api;->zzc:Lcom/google/android/gms/common/api/Api$ClientKey;

    return-void
.end method


# virtual methods
.method public final zzc()Lcom/google/android/gms/common/api/Api$zzc;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/common/api/Api$zzc<",
            "*>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/common/api/Api;->zzc:Lcom/google/android/gms/common/api/Api$ClientKey;

    if-eqz p0, :cond_0

    return-object p0

    .line 2
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "This API was constructed with null client keys. This should not be possible."

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
