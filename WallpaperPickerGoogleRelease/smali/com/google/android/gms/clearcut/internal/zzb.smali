.class public final Lcom/google/android/gms/clearcut/internal/zzb;
.super Lcom/google/android/gms/common/api/GoogleApi;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/clearcut/ClearcutLoggerApi;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/common/api/GoogleApi<",
        "*>;",
        "Lcom/google/android/gms/clearcut/ClearcutLoggerApi;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/google/android/gms/clearcut/ClearcutLogger;->API:Lcom/google/android/gms/common/api/Api;

    new-instance v1, Lcom/google/android/gms/common/api/internal/zzh;

    invoke-direct {v1}, Lcom/google/android/gms/common/api/internal/zzh;-><init>()V

    const/4 v2, 0x0

    invoke-direct {p0, p1, v0, v2, v1}, Lcom/google/android/gms/common/api/GoogleApi;-><init>(Landroid/content/Context;Lcom/google/android/gms/common/api/Api;Lcom/google/android/gms/common/api/Api$ApiOptions;Lcom/google/android/gms/common/api/internal/zzh;)V

    return-void
.end method
