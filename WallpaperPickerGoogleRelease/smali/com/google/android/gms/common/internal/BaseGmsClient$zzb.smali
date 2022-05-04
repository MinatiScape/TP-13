.class public final Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/internal/BaseGmsClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "zzb"
.end annotation


# instance fields
.field public final synthetic zza:Lcom/google/android/gms/common/internal/BaseGmsClient;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/internal/BaseGmsClient;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zza:Lcom/google/android/gms/common/internal/BaseGmsClient;

    .line 2
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method

.method public static zzb(Landroid/os/Message;)Z
    .locals 2

    .line 1
    iget p0, p0, Landroid/os/Message;->what:I

    const/4 v0, 0x1

    const/4 v1, 0x2

    if-eq p0, v1, :cond_1

    if-eq p0, v0, :cond_1

    const/4 v1, 0x7

    if-ne p0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    return v0
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zza:Lcom/google/android/gms/common/internal/BaseGmsClient;

    iget-object v0, v0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mDisconnectCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    iget v1, p1, Landroid/os/Message;->arg1:I

    if-eq v0, v1, :cond_1

    .line 2
    invoke-static {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zzb(Landroid/os/Message;)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 3
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;

    .line 4
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->zzb()V

    .line 5
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->zzd()V

    :cond_0
    return-void

    .line 6
    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x4

    const/4 v2, 0x5

    const/4 v3, 0x1

    if-eq v0, v3, :cond_2

    const/4 v4, 0x7

    if-eq v0, v4, :cond_2

    if-eq v0, v1, :cond_2

    if-ne v0, v2, :cond_3

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zza:Lcom/google/android/gms/common/internal/BaseGmsClient;

    .line 7
    invoke-virtual {v0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->isConnecting()Z

    move-result v0

    if-nez v0, :cond_3

    .line 8
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;

    .line 9
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->zzb()V

    .line 10
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->zzd()V

    return-void

    .line 11
    :cond_3
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v4, 0x8

    const/4 v5, 0x3

    const/4 v6, 0x0

    if-ne v0, v1, :cond_9

    .line 12
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zza:Lcom/google/android/gms/common/internal/BaseGmsClient;

    new-instance v1, Lcom/google/android/gms/common/ConnectionResult;

    iget p1, p1, Landroid/os/Message;->arg2:I

    invoke-direct {v1, p1}, Lcom/google/android/gms/common/ConnectionResult;-><init>(I)V

    .line 13
    iput-object v1, v0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzx:Lcom/google/android/gms/common/ConnectionResult;

    .line 14
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zza:Lcom/google/android/gms/common/internal/BaseGmsClient;

    .line 15
    iget-boolean v0, p1, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzy:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_4

    goto :goto_0

    .line 16
    :cond_4
    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getServiceDescriptor()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_5

    goto :goto_0

    .line 17
    :cond_5
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_6

    goto :goto_0

    .line 18
    :cond_6
    :try_start_0
    invoke-virtual {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->getServiceDescriptor()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    :goto_0
    move v3, v1

    :goto_1
    if-eqz v3, :cond_7

    .line 19
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zza:Lcom/google/android/gms/common/internal/BaseGmsClient;

    .line 20
    iget-boolean v0, p1, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzy:Z

    if-nez v0, :cond_7

    .line 21
    invoke-virtual {p1, v5, v6}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzb(ILandroid/os/IInterface;)V

    return-void

    .line 22
    :cond_7
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zza:Lcom/google/android/gms/common/internal/BaseGmsClient;

    .line 23
    iget-object p1, p1, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzx:Lcom/google/android/gms/common/ConnectionResult;

    if-eqz p1, :cond_8

    goto :goto_2

    .line 24
    :cond_8
    new-instance p1, Lcom/google/android/gms/common/ConnectionResult;

    invoke-direct {p1, v4}, Lcom/google/android/gms/common/ConnectionResult;-><init>(I)V

    .line 25
    :goto_2
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zza:Lcom/google/android/gms/common/internal/BaseGmsClient;

    iget-object v0, v0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mConnectionProgressReportCallbacks:Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;

    invoke-interface {v0, p1}, Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;->onReportServiceBinding(Lcom/google/android/gms/common/ConnectionResult;)V

    .line 26
    iget-object p0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zza:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V

    return-void

    :cond_9
    if-ne v0, v2, :cond_b

    .line 27
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zza:Lcom/google/android/gms/common/internal/BaseGmsClient;

    .line 28
    iget-object p1, p1, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzx:Lcom/google/android/gms/common/ConnectionResult;

    if-eqz p1, :cond_a

    goto :goto_3

    .line 29
    :cond_a
    new-instance p1, Lcom/google/android/gms/common/ConnectionResult;

    invoke-direct {p1, v4}, Lcom/google/android/gms/common/ConnectionResult;-><init>(I)V

    .line 30
    :goto_3
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zza:Lcom/google/android/gms/common/internal/BaseGmsClient;

    iget-object v0, v0, Lcom/google/android/gms/common/internal/BaseGmsClient;->mConnectionProgressReportCallbacks:Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;

    invoke-interface {v0, p1}, Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;->onReportServiceBinding(Lcom/google/android/gms/common/ConnectionResult;)V

    .line 31
    iget-object p0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zza:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V

    return-void

    :cond_b
    if-ne v0, v5, :cond_d

    .line 32
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v1, v0, Landroid/app/PendingIntent;

    if-eqz v1, :cond_c

    move-object v6, v0

    check-cast v6, Landroid/app/PendingIntent;

    .line 33
    :cond_c
    new-instance v0, Lcom/google/android/gms/common/ConnectionResult;

    iget p1, p1, Landroid/os/Message;->arg2:I

    invoke-direct {v0, p1, v6}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    .line 34
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zza:Lcom/google/android/gms/common/internal/BaseGmsClient;

    iget-object p1, p1, Lcom/google/android/gms/common/internal/BaseGmsClient;->mConnectionProgressReportCallbacks:Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;

    invoke-interface {p1, v0}, Lcom/google/android/gms/common/internal/BaseGmsClient$ConnectionProgressReportCallbacks;->onReportServiceBinding(Lcom/google/android/gms/common/ConnectionResult;)V

    .line 35
    iget-object p0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zza:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V

    return-void

    :cond_d
    const/4 v1, 0x6

    if-ne v0, v1, :cond_f

    .line 36
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zza:Lcom/google/android/gms/common/internal/BaseGmsClient;

    .line 37
    invoke-virtual {v0, v2, v6}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzb(ILandroid/os/IInterface;)V

    .line 38
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zza:Lcom/google/android/gms/common/internal/BaseGmsClient;

    .line 39
    iget-object v0, v0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzt:Lcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;

    if-eqz v0, :cond_e

    .line 40
    iget v1, p1, Landroid/os/Message;->arg2:I

    check-cast v0, Lcom/google/android/gms/common/internal/zzm;

    .line 41
    iget-object v0, v0, Lcom/google/android/gms/common/internal/zzm;->zza:Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;

    invoke-interface {v0, v1}, Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;->onConnectionSuspended(I)V

    .line 42
    :cond_e
    iget-object v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zza:Lcom/google/android/gms/common/internal/BaseGmsClient;

    iget p1, p1, Landroid/os/Message;->arg2:I

    .line 43
    iput p1, v0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzc:I

    .line 44
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, v0, Lcom/google/android/gms/common/internal/BaseGmsClient;->zzd:J

    .line 45
    iget-object p0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zza:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-static {p0, v2, v3, v6}, Lcom/google/android/gms/common/internal/BaseGmsClient;->zza(Lcom/google/android/gms/common/internal/BaseGmsClient;IILandroid/os/IInterface;)Z

    return-void

    :cond_f
    const/4 v1, 0x2

    if-ne v0, v1, :cond_10

    .line 46
    iget-object p0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zza:Lcom/google/android/gms/common/internal/BaseGmsClient;

    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient;->isConnected()Z

    move-result p0

    if-nez p0, :cond_10

    .line 47
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;

    .line 48
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->zzb()V

    .line 49
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->zzd()V

    return-void

    .line 50
    :cond_10
    invoke-static {p1}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzb;->zzb(Landroid/os/Message;)Z

    move-result p0

    if-eqz p0, :cond_13

    .line 51
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;

    .line 52
    monitor-enter p0

    .line 53
    :try_start_1
    iget-object p1, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->zza:Ljava/lang/Object;

    .line 54
    iget-boolean v0, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->zzb:Z

    if-eqz v0, :cond_11

    const-string v0, "GmsClient"

    .line 55
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x2f

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v2, "Callback proxy "

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " being reused. This is not safe."

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    :cond_11
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz p1, :cond_12

    .line 57
    :try_start_2
    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->zza(Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_4

    :catch_1
    move-exception p1

    .line 58
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->zzb()V

    .line 59
    throw p1

    .line 60
    :cond_12
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->zzb()V

    .line 61
    :goto_4
    monitor-enter p0

    .line 62
    :try_start_3
    iput-boolean v3, p0, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->zzb:Z

    .line 63
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 64
    invoke-virtual {p0}, Lcom/google/android/gms/common/internal/BaseGmsClient$zzc;->zzd()V

    return-void

    :catchall_0
    move-exception p1

    .line 65
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw p1

    :catchall_1
    move-exception p1

    .line 66
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw p1

    :cond_13
    const-string p0, "GmsClient"

    .line 67
    iget p1, p1, Landroid/os/Message;->what:I

    const/16 v0, 0x2d

    const-string v1, "Don\'t know how to handle message: "

    invoke-static {v0, v1, p1}, Landroidx/fragment/R$id$$ExternalSyntheticOutline0;->m(ILjava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    invoke-static {p0, p1, v0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method
