.class public final Lcom/google/android/gms/common/api/internal/zzbo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/api/internal/zzm;


# instance fields
.field public final synthetic zza:Lcom/google/android/gms/common/api/internal/zzbn;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/internal/zzbn;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbo;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbo;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 2
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    const/4 v0, 0x1

    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    .line 4
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method
