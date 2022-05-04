.class public final Lcom/google/android/gms/gcm/GcmTaskService$zza;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/gcm/GcmTaskService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "zza"
.end annotation


# instance fields
.field public final synthetic zza:Lcom/google/android/gms/gcm/GcmTaskService;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/gcm/GcmTaskService;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/gcm/GcmTaskService$zza;->zza:Lcom/google/android/gms/gcm/GcmTaskService;

    .line 2
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/gcm/GcmTaskService$zza;->zza:Lcom/google/android/gms/gcm/GcmTaskService;

    iget v1, p1, Landroid/os/Message;->sendingUid:I

    const-string v2, "com.google.android.gms"

    .line 2
    invoke-static {v0}, Lcom/google/android/gms/internal/zzbmk;->zza(Landroid/content/Context;)Lcom/google/android/gms/internal/zzbmj;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v3, 0x1

    .line 3
    :try_start_0
    iget-object v0, v0, Lcom/google/android/gms/internal/zzbmj;->zza:Landroid/content/Context;

    const-string v4, "appops"

    .line 4
    invoke-virtual {v0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AppOpsManager;

    .line 5
    invoke-virtual {v0, v1, v2}, Landroid/app/AppOpsManager;->checkPackage(ILjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v3

    goto :goto_0

    :catch_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "GcmTaskService"

    if-nez v0, :cond_0

    const-string p0, "unable to verify presence of Google Play Services"

    .line 6
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 7
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    if-eq v0, v3, :cond_4

    const/4 v2, 0x2

    if-eq v0, v2, :cond_2

    const/4 v2, 0x4

    if-eq v0, v2, :cond_1

    .line 8
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    add-int/lit8 p1, p1, 0x1f

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string p1, "Unrecognized message received: "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 9
    :cond_1
    iget-object p0, p0, Lcom/google/android/gms/gcm/GcmTaskService$zza;->zza:Lcom/google/android/gms/gcm/GcmTaskService;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_2
    const/4 p0, 0x3

    .line 10
    invoke-static {v1, p0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p0

    if-eqz p0, :cond_3

    .line 11
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    add-int/lit8 p1, p1, 0x2d

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string p1, "ignoring unimplemented stop message for now: "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    return-void

    .line 12
    :cond_4
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    .line 13
    invoke-virtual {v0}, Landroid/os/Bundle;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_5

    .line 14
    iget-object v7, p1, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    if-eqz v7, :cond_5

    const-string p1, "tag"

    .line 15
    invoke-virtual {v0, p1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string p1, "triggered_uris"

    .line 16
    invoke-virtual {v0, p1}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v9

    .line 17
    iget-object p1, p0, Lcom/google/android/gms/gcm/GcmTaskService$zza;->zza:Lcom/google/android/gms/gcm/GcmTaskService;

    .line 18
    invoke-virtual {p1, v6}, Lcom/google/android/gms/gcm/GcmTaskService;->zza(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_5

    const-string p1, "extras"

    .line 19
    invoke-virtual {v0, p1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v8

    .line 20
    new-instance p1, Lcom/google/android/gms/gcm/GcmTaskService$zzb;

    iget-object p0, p0, Lcom/google/android/gms/gcm/GcmTaskService$zza;->zza:Lcom/google/android/gms/gcm/GcmTaskService;

    move-object v4, p1

    move-object v5, p0

    invoke-direct/range {v4 .. v9}, Lcom/google/android/gms/gcm/GcmTaskService$zzb;-><init>(Lcom/google/android/gms/gcm/GcmTaskService;Ljava/lang/String;Landroid/os/Messenger;Landroid/os/Bundle;Ljava/util/List;)V

    .line 21
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    :try_start_1
    iget-object p0, p0, Lcom/google/android/gms/gcm/GcmTaskService;->zzc:Ljava/util/concurrent/ExecutorService;

    invoke-interface {p0, p1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception p0

    const-string v0, "Executor is shutdown. onDestroy was called but main looper had an unprocessed start task message. The task will be retried with backoff delay."

    .line 23
    invoke-static {v1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 24
    invoke-virtual {p1, v3}, Lcom/google/android/gms/gcm/GcmTaskService$zzb;->zza(I)V

    :cond_5
    :goto_1
    return-void
.end method
