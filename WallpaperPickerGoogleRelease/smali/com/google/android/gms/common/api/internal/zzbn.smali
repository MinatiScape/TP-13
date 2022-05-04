.class public final Lcom/google/android/gms/common/api/internal/zzbn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# static fields
.field public static final zza:Lcom/google/android/gms/common/api/Status;

.field public static final zzb:Lcom/google/android/gms/common/api/Status;

.field public static final zzf:Ljava/lang/Object;

.field public static zzg:Lcom/google/android/gms/common/api/internal/zzbn;


# instance fields
.field public zze:J

.field public final zzh:Landroid/content/Context;

.field public final zzi:Lcom/google/android/gms/common/GoogleApiAvailability;

.field public final zzj:Lcom/google/android/gms/common/internal/zzv;

.field public final zzk:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final zzl:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final zzm:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/google/android/gms/common/api/internal/zzi<",
            "*>;",
            "Lcom/google/android/gms/common/api/internal/zzbp<",
            "*>;>;"
        }
    .end annotation
.end field

.field public final zzo:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/google/android/gms/common/api/internal/zzi<",
            "*>;>;"
        }
    .end annotation
.end field

.field public final zzp:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/google/android/gms/common/api/internal/zzi<",
            "*>;>;"
        }
    .end annotation
.end field

.field public final zzq:Landroid/os/Handler;


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/google/android/gms/common/api/Status;

    const/4 v1, 0x4

    const-string v2, "Sign-out occurred while this API call was in progress."

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/common/api/internal/zzbn;->zza:Lcom/google/android/gms/common/api/Status;

    .line 2
    new-instance v0, Lcom/google/android/gms/common/api/Status;

    const-string v2, "The user must be signed in to make this API call."

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/common/api/internal/zzbn;->zzb:Lcom/google/android/gms/common/api/Status;

    .line 3
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/api/internal/zzbn;->zzf:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/GoogleApiAvailability;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x2710

    .line 2
    iput-wide v0, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zze:J

    .line 3
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzk:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v2, 0x0

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzl:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 5
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    const/4 v3, 0x5

    const/high16 v4, 0x3f400000    # 0.75f

    invoke-direct {v0, v3, v4, v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(IFI)V

    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzm:Ljava/util/Map;

    .line 6
    new-instance v0, Landroidx/collection/ArraySet;

    .line 7
    invoke-direct {v0, v2}, Landroidx/collection/ArraySet;-><init>(I)V

    .line 8
    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzo:Ljava/util/Set;

    .line 9
    new-instance v0, Landroidx/collection/ArraySet;

    .line 10
    invoke-direct {v0, v2}, Landroidx/collection/ArraySet;-><init>(I)V

    .line 11
    iput-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzp:Ljava/util/Set;

    .line 12
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzh:Landroid/content/Context;

    .line 13
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1, p2, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    .line 14
    iput-object p3, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzi:Lcom/google/android/gms/common/GoogleApiAvailability;

    .line 15
    new-instance p2, Lcom/google/android/gms/common/internal/zzv;

    invoke-direct {p2, p3}, Lcom/google/android/gms/common/internal/zzv;-><init>(Lcom/google/android/gms/common/GoogleApiAvailabilityLight;)V

    iput-object p2, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzj:Lcom/google/android/gms/common/internal/zzv;

    const/4 p0, 0x6

    .line 16
    invoke-virtual {p1, p0}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public static zza(Landroid/content/Context;)Lcom/google/android/gms/common/api/internal/zzbn;
    .locals 4

    .line 1
    sget-object v0, Lcom/google/android/gms/common/api/internal/zzbn;->zzf:Ljava/lang/Object;

    monitor-enter v0

    .line 2
    :try_start_0
    sget-object v1, Lcom/google/android/gms/common/api/internal/zzbn;->zzg:Lcom/google/android/gms/common/api/internal/zzbn;

    if-nez v1, :cond_0

    .line 3
    new-instance v1, Landroid/os/HandlerThread;

    const-string v2, "GoogleApiHandler"

    const/16 v3, 0x9

    invoke-direct {v1, v2, v3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    .line 4
    invoke-virtual {v1}, Landroid/os/HandlerThread;->start()V

    .line 5
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    .line 6
    new-instance v2, Lcom/google/android/gms/common/api/internal/zzbn;

    .line 7
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sget-object v3, Lcom/google/android/gms/common/GoogleApiAvailability;->zza:Ljava/lang/Object;

    sget-object v3, Lcom/google/android/gms/common/GoogleApiAvailability;->zzb:Lcom/google/android/gms/common/GoogleApiAvailability;

    invoke-direct {v2, p0, v1, v3}, Lcom/google/android/gms/common/api/internal/zzbn;-><init>(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/GoogleApiAvailability;)V

    sput-object v2, Lcom/google/android/gms/common/api/internal/zzbn;->zzg:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 8
    :cond_0
    sget-object p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzg:Lcom/google/android/gms/common/api/internal/zzbn;

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)Z
    .locals 7

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    const-wide/32 v1, 0x493e0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    packed-switch v0, :pswitch_data_0

    const-string p0, "GoogleApiManager"

    const/16 p1, 0x1f

    .line 2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string p1, "Unknown message id: "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v3

    .line 3
    :pswitch_0
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzm:Ljava/util/Map;

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 4
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzm:Ljava/util/Map;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/common/api/internal/zzbp;

    .line 5
    iget-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 6
    iget-object p1, p1, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    .line 7
    invoke-static {p1}, Landroidx/preference/R$string;->zza(Landroid/os/Handler;)V

    .line 8
    iget-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzc:Lcom/google/android/gms/common/api/Api$Client;

    invoke-interface {p1}, Lcom/google/android/gms/common/api/Api$Client;->isConnected()Z

    move-result p1

    if-eqz p1, :cond_10

    iget-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzh:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result p1

    if-nez p1, :cond_10

    .line 9
    iget-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzf:Lcom/google/android/gms/common/api/internal/zzaf;

    .line 10
    iget-object v0, p1, Lcom/google/android/gms/common/api/internal/zzaf;->zza:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p1, Lcom/google/android/gms/common/api/internal/zzaf;->zzb:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1

    :cond_0
    move v3, v5

    :cond_1
    if-eqz v3, :cond_2

    .line 11
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/internal/zzbp;->zzq()V

    goto/16 :goto_5

    .line 12
    :cond_2
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzc:Lcom/google/android/gms/common/api/Api$Client;

    invoke-interface {p0}, Lcom/google/android/gms/common/api/Api$Client;->disconnect()V

    goto/16 :goto_5

    .line 13
    :pswitch_1
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzm:Ljava/util/Map;

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 14
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzm:Ljava/util/Map;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/common/api/internal/zzbp;

    .line 15
    iget-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 16
    iget-object p1, p1, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    .line 17
    invoke-static {p1}, Landroidx/preference/R$string;->zza(Landroid/os/Handler;)V

    .line 18
    iget-boolean p1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzk:Z

    if-eqz p1, :cond_10

    .line 19
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/internal/zzbp;->zzp()V

    .line 20
    iget-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 21
    iget-object v0, p1, Lcom/google/android/gms/common/api/internal/zzbn;->zzi:Lcom/google/android/gms/common/GoogleApiAvailability;

    .line 22
    iget-object p1, p1, Lcom/google/android/gms/common/api/internal/zzbn;->zzh:Landroid/content/Context;

    .line 23
    invoke-virtual {v0, p1}, Lcom/google/android/gms/common/GoogleApiAvailability;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result p1

    const/16 v0, 0x12

    const/16 v1, 0x8

    if-ne p1, v0, :cond_3

    .line 24
    new-instance p1, Lcom/google/android/gms/common/api/Status;

    const-string v0, "Connection timed out while waiting for Google Play services update to complete."

    invoke-direct {p1, v1, v0}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    goto :goto_0

    .line 25
    :cond_3
    new-instance p1, Lcom/google/android/gms/common/api/Status;

    const-string v0, "API failed to connect while resuming due to an unknown error."

    invoke-direct {p1, v1, v0}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    .line 26
    :goto_0
    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/internal/zzbp;->zza(Lcom/google/android/gms/common/api/Status;)V

    .line 27
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzc:Lcom/google/android/gms/common/api/Api$Client;

    invoke-interface {p0}, Lcom/google/android/gms/common/api/Api$Client;->disconnect()V

    goto/16 :goto_5

    .line 28
    :pswitch_2
    iget-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzp:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/internal/zzi;

    .line 29
    iget-object v1, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzm:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/internal/zzbp;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/internal/zzbp;->zza()V

    goto :goto_1

    .line 30
    :cond_4
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzp:Ljava/util/Set;

    invoke-interface {p0}, Ljava/util/Set;->clear()V

    goto/16 :goto_5

    .line 31
    :pswitch_3
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzm:Ljava/util/Map;

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 32
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzm:Ljava/util/Map;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/common/api/internal/zzbp;

    .line 33
    iget-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 34
    iget-object p1, p1, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    .line 35
    invoke-static {p1}, Landroidx/preference/R$string;->zza(Landroid/os/Handler;)V

    .line 36
    iget-boolean p1, p0, Lcom/google/android/gms/common/api/internal/zzbp;->zzk:Z

    if-eqz p1, :cond_10

    .line 37
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/internal/zzbp;->zzi()V

    goto/16 :goto_5

    .line 38
    :pswitch_4
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/gms/common/api/GoogleApi;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/internal/zzbn;->zzb(Lcom/google/android/gms/common/api/GoogleApi;)V

    goto/16 :goto_5

    .line 39
    :pswitch_5
    iget-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzh:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    instance-of p1, p1, Landroid/app/Application;

    if-eqz p1, :cond_10

    .line 40
    iget-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzh:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Landroid/app/Application;

    .line 41
    sget-object v0, Lcom/google/android/gms/common/api/internal/zzl;->zza:Lcom/google/android/gms/common/api/internal/zzl;

    monitor-enter v0

    .line 42
    :try_start_0
    iget-boolean v3, v0, Lcom/google/android/gms/common/api/internal/zzl;->zze:Z

    if-nez v3, :cond_5

    .line 43
    invoke-virtual {p1, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 44
    invoke-virtual {p1, v0}, Landroid/app/Application;->registerComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 45
    iput-boolean v5, v0, Lcom/google/android/gms/common/api/internal/zzl;->zze:Z

    .line 46
    :cond_5
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 47
    new-instance p1, Lcom/google/android/gms/common/api/internal/zzbo;

    invoke-direct {p1, p0}, Lcom/google/android/gms/common/api/internal/zzbo;-><init>(Lcom/google/android/gms/common/api/internal/zzbn;)V

    .line 48
    monitor-enter v0

    .line 49
    :try_start_1
    iget-object v3, v0, Lcom/google/android/gms/common/api/internal/zzl;->zzd:Ljava/util/ArrayList;

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 51
    iget-object p1, v0, Lcom/google/android/gms/common/api/internal/zzl;->zzc:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p1

    if-nez p1, :cond_6

    .line 52
    new-instance p1, Landroid/app/ActivityManager$RunningAppProcessInfo;

    invoke-direct {p1}, Landroid/app/ActivityManager$RunningAppProcessInfo;-><init>()V

    .line 53
    invoke-static {p1}, Landroid/app/ActivityManager;->getMyMemoryState(Landroid/app/ActivityManager$RunningAppProcessInfo;)V

    .line 54
    iget-object v3, v0, Lcom/google/android/gms/common/api/internal/zzl;->zzc:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v3, v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v3

    if-nez v3, :cond_6

    iget p1, p1, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    const/16 v3, 0x64

    if-le p1, v3, :cond_6

    .line 55
    iget-object p1, v0, Lcom/google/android/gms/common/api/internal/zzl;->zzb:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1, v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 56
    :cond_6
    iget-object p1, v0, Lcom/google/android/gms/common/api/internal/zzl;->zzb:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p1

    if-nez p1, :cond_10

    .line 57
    iput-wide v1, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zze:J

    goto/16 :goto_5

    :catchall_0
    move-exception p0

    .line 58
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0

    :catchall_1
    move-exception p0

    .line 59
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw p0

    .line 60
    :pswitch_6
    iget v0, p1, Landroid/os/Message;->arg1:I

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/gms/common/ConnectionResult;

    .line 61
    iget-object v1, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzm:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_8

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/common/api/internal/zzbp;

    .line 62
    iget v3, v2, Lcom/google/android/gms/common/api/internal/zzbp;->zzi:I

    if-ne v3, v0, :cond_7

    move-object v4, v2

    :cond_8
    if-eqz v4, :cond_9

    .line 63
    new-instance v0, Lcom/google/android/gms/common/api/Status;

    const/16 v1, 0x11

    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzi:Lcom/google/android/gms/common/GoogleApiAvailability;

    .line 64
    iget v2, p1, Lcom/google/android/gms/common/ConnectionResult;->zzc:I

    .line 65
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    sget-object p0, Lcom/google/android/gms/common/GooglePlayServicesUtilLight;->zza:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 67
    invoke-static {v2}, Lcom/google/android/gms/common/ConnectionResult;->zza(I)Ljava/lang/String;

    move-result-object p0

    .line 68
    iget-object p1, p1, Lcom/google/android/gms/common/ConnectionResult;->zze:Ljava/lang/String;

    const/16 v2, 0x45

    .line 69
    invoke-static {p0, v2}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v2

    invoke-static {p1, v2}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v2

    const-string v3, "Error resolution was canceled by the user, original error message: "

    const-string v6, ": "

    invoke-static {v2, v3, p0, v6, p1}, Lcom/bumptech/glide/Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline1;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    .line 70
    invoke-virtual {v4, v0}, Lcom/google/android/gms/common/api/internal/zzbp;->zza(Lcom/google/android/gms/common/api/Status;)V

    goto/16 :goto_5

    :cond_9
    const-string p0, "GoogleApiManager"

    const/16 p1, 0x4c

    .line 71
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string p1, "Could not find API instance "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " while trying to fail enqueued calls."

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    invoke-static {p0, p1, v0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_5

    .line 72
    :pswitch_7
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/gms/common/api/internal/zzcu;

    .line 73
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzm:Ljava/util/Map;

    iget-object v1, p1, Lcom/google/android/gms/common/api/internal/zzcu;->zzc:Lcom/google/android/gms/common/api/GoogleApi;

    .line 74
    iget-object v1, v1, Lcom/google/android/gms/common/api/GoogleApi;->zze:Lcom/google/android/gms/common/api/internal/zzi;

    .line 75
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/internal/zzbp;

    if-nez v0, :cond_a

    .line 76
    iget-object v0, p1, Lcom/google/android/gms/common/api/internal/zzcu;->zzc:Lcom/google/android/gms/common/api/GoogleApi;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/api/internal/zzbn;->zzb(Lcom/google/android/gms/common/api/GoogleApi;)V

    .line 77
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzm:Ljava/util/Map;

    iget-object v1, p1, Lcom/google/android/gms/common/api/internal/zzcu;->zzc:Lcom/google/android/gms/common/api/GoogleApi;

    .line 78
    iget-object v1, v1, Lcom/google/android/gms/common/api/GoogleApi;->zze:Lcom/google/android/gms/common/api/internal/zzi;

    .line 79
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/internal/zzbp;

    .line 80
    :cond_a
    invoke-virtual {v0}, Lcom/google/android/gms/common/api/internal/zzbp;->zzk()Z

    move-result v1

    if-eqz v1, :cond_b

    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzl:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p0

    iget v1, p1, Lcom/google/android/gms/common/api/internal/zzcu;->zzb:I

    if-eq p0, v1, :cond_b

    .line 81
    iget-object p0, p1, Lcom/google/android/gms/common/api/internal/zzcu;->zza:Lcom/google/android/gms/common/api/internal/zzb;

    sget-object p1, Lcom/google/android/gms/common/api/internal/zzbn;->zza:Lcom/google/android/gms/common/api/Status;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/internal/zzb;->zza(Lcom/google/android/gms/common/api/Status;)V

    .line 82
    invoke-virtual {v0}, Lcom/google/android/gms/common/api/internal/zzbp;->zza()V

    goto/16 :goto_5

    .line 83
    :cond_b
    iget-object p0, p1, Lcom/google/android/gms/common/api/internal/zzcu;->zza:Lcom/google/android/gms/common/api/internal/zzb;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/common/api/internal/zzbp;->zza(Lcom/google/android/gms/common/api/internal/zzb;)V

    goto/16 :goto_5

    .line 84
    :pswitch_8
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzm:Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_10

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/common/api/internal/zzbp;

    .line 85
    invoke-virtual {p1}, Lcom/google/android/gms/common/api/internal/zzbp;->zzd()V

    .line 86
    invoke-virtual {p1}, Lcom/google/android/gms/common/api/internal/zzbp;->zzi()V

    goto :goto_2

    .line 87
    :pswitch_9
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/gms/common/api/internal/zzk;

    .line 88
    iget-object v0, p1, Lcom/google/android/gms/common/api/internal/zzk;->zza:Landroidx/collection/ArrayMap;

    invoke-virtual {v0}, Landroidx/collection/ArrayMap;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 89
    check-cast v0, Landroidx/collection/ArrayMap$KeySet;

    invoke-virtual {v0}, Landroidx/collection/ArrayMap$KeySet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    move-object v1, v0

    check-cast v1, Landroidx/collection/IndexBasedArrayIterator;

    invoke-virtual {v1}, Landroidx/collection/IndexBasedArrayIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_10

    invoke-virtual {v1}, Landroidx/collection/IndexBasedArrayIterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/common/api/internal/zzi;

    .line 90
    iget-object v2, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzm:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/common/api/internal/zzbp;

    if-nez v2, :cond_c

    .line 91
    new-instance p0, Lcom/google/android/gms/common/ConnectionResult;

    const/16 v0, 0xd

    invoke-direct {p0, v0}, Lcom/google/android/gms/common/ConnectionResult;-><init>(I)V

    .line 92
    invoke-virtual {p1, v1, p0, v4}, Lcom/google/android/gms/common/api/internal/zzk;->zza(Lcom/google/android/gms/common/api/internal/zzi;Lcom/google/android/gms/common/ConnectionResult;Ljava/lang/String;)V

    goto :goto_5

    .line 93
    :cond_c
    iget-object v3, v2, Lcom/google/android/gms/common/api/internal/zzbp;->zzc:Lcom/google/android/gms/common/api/Api$Client;

    invoke-interface {v3}, Lcom/google/android/gms/common/api/Api$Client;->isConnected()Z

    move-result v3

    if-eqz v3, :cond_d

    .line 94
    sget-object v3, Lcom/google/android/gms/common/ConnectionResult;->zza:Lcom/google/android/gms/common/ConnectionResult;

    .line 95
    iget-object v2, v2, Lcom/google/android/gms/common/api/internal/zzbp;->zzc:Lcom/google/android/gms/common/api/Api$Client;

    .line 96
    invoke-interface {v2}, Lcom/google/android/gms/common/api/Api$Client;->zzab()Ljava/lang/String;

    move-result-object v2

    .line 97
    invoke-virtual {p1, v1, v3, v2}, Lcom/google/android/gms/common/api/internal/zzk;->zza(Lcom/google/android/gms/common/api/internal/zzi;Lcom/google/android/gms/common/ConnectionResult;Ljava/lang/String;)V

    goto :goto_3

    .line 98
    :cond_d
    iget-object v3, v2, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 99
    iget-object v3, v3, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    .line 100
    invoke-static {v3}, Landroidx/preference/R$string;->zza(Landroid/os/Handler;)V

    .line 101
    iget-object v3, v2, Lcom/google/android/gms/common/api/internal/zzbp;->zzm:Lcom/google/android/gms/common/ConnectionResult;

    if-eqz v3, :cond_e

    .line 102
    iget-object v3, v2, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 103
    iget-object v3, v3, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    .line 104
    invoke-static {v3}, Landroidx/preference/R$string;->zza(Landroid/os/Handler;)V

    .line 105
    iget-object v2, v2, Lcom/google/android/gms/common/api/internal/zzbp;->zzm:Lcom/google/android/gms/common/ConnectionResult;

    .line 106
    invoke-virtual {p1, v1, v2, v4}, Lcom/google/android/gms/common/api/internal/zzk;->zza(Lcom/google/android/gms/common/api/internal/zzi;Lcom/google/android/gms/common/ConnectionResult;Ljava/lang/String;)V

    goto :goto_3

    .line 107
    :cond_e
    iget-object v1, v2, Lcom/google/android/gms/common/api/internal/zzbp;->zza:Lcom/google/android/gms/common/api/internal/zzbn;

    .line 108
    iget-object v1, v1, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    .line 109
    invoke-static {v1}, Landroidx/preference/R$string;->zza(Landroid/os/Handler;)V

    .line 110
    iget-object v1, v2, Lcom/google/android/gms/common/api/internal/zzbp;->zzg:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 111
    :pswitch_a
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_f

    const-wide/16 v1, 0x2710

    .line 112
    :cond_f
    iput-wide v1, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zze:J

    .line 113
    iget-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    const/16 v0, 0xc

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeMessages(I)V

    .line 114
    iget-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzm:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_10

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/common/api/internal/zzi;

    .line 115
    iget-object v2, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzq:Landroid/os/Handler;

    .line 116
    invoke-virtual {v2, v0, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    iget-wide v3, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zze:J

    .line 117
    invoke-virtual {v2, v1, v3, v4}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_4

    :cond_10
    :goto_5
    return v5

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_7
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_7
    .end packed-switch
.end method

.method public final zza(Lcom/google/android/gms/common/ConnectionResult;I)Z
    .locals 5

    .line 10
    iget-object v0, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzi:Lcom/google/android/gms/common/GoogleApiAvailability;

    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzh:Landroid/content/Context;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    invoke-virtual {p1}, Lcom/google/android/gms/common/ConnectionResult;->hasResolution()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 12
    iget-object v1, p1, Lcom/google/android/gms/common/ConnectionResult;->zzd:Landroid/app/PendingIntent;

    goto :goto_0

    .line 13
    :cond_0
    iget v1, p1, Lcom/google/android/gms/common/ConnectionResult;->zzc:I

    const/4 v3, 0x0

    .line 14
    invoke-virtual {v0, p0, v1, v2, v3}, Lcom/google/android/gms/common/GoogleApiAvailability;->getErrorResolutionPendingIntent(Landroid/content/Context;IILjava/lang/String;)Landroid/app/PendingIntent;

    move-result-object v1

    :goto_0
    if-eqz v1, :cond_1

    .line 15
    iget p1, p1, Lcom/google/android/gms/common/ConnectionResult;->zzc:I

    .line 16
    sget v3, Lcom/google/android/gms/common/api/GoogleApiActivity;->$r8$clinit:I

    .line 17
    new-instance v3, Landroid/content/Intent;

    const-class v4, Lcom/google/android/gms/common/api/GoogleApiActivity;

    invoke-direct {v3, p0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v4, "pending_intent"

    .line 18
    invoke-virtual {v3, v4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string v1, "failing_client_id"

    .line 19
    invoke-virtual {v3, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/4 p2, 0x1

    const-string v1, "notify_manager"

    .line 20
    invoke-virtual {v3, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const/high16 v1, 0x8000000

    .line 21
    invoke-static {p0, v2, v3, v1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    .line 22
    invoke-virtual {v0, p0, p1, v1}, Lcom/google/android/gms/common/GoogleApiAvailability;->zza(Landroid/content/Context;ILandroid/app/PendingIntent;)V

    move v2, p2

    :cond_1
    return v2
.end method

.method public final zzb(Lcom/google/android/gms/common/api/GoogleApi;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApi<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/google/android/gms/common/api/GoogleApi;->zze:Lcom/google/android/gms/common/api/internal/zzi;

    .line 2
    iget-object v1, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzm:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/common/api/internal/zzbp;

    if-nez v1, :cond_0

    .line 3
    new-instance v1, Lcom/google/android/gms/common/api/internal/zzbp;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/common/api/internal/zzbp;-><init>(Lcom/google/android/gms/common/api/internal/zzbn;Lcom/google/android/gms/common/api/GoogleApi;)V

    .line 4
    iget-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzm:Ljava/util/Map;

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    :cond_0
    invoke-virtual {v1}, Lcom/google/android/gms/common/api/internal/zzbp;->zzk()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 6
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbn;->zzp:Ljava/util/Set;

    invoke-interface {p0, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 7
    :cond_1
    invoke-virtual {v1}, Lcom/google/android/gms/common/api/internal/zzbp;->zzi()V

    return-void
.end method
