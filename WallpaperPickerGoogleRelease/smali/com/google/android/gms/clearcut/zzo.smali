.class public final synthetic Lcom/google/android/gms/clearcut/zzo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic $r8$classId:I

.field public final zza:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/internal/zzdb;)V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, Lcom/google/android/gms/clearcut/zzo;->$r8$classId:I

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/clearcut/zzo;->zza:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget v0, p0, Lcom/google/android/gms/clearcut/zzo;->$r8$classId:I

    packed-switch v0, :pswitch_data_0

    goto :goto_1

    .line 1
    :pswitch_0
    iget-object p0, p0, Lcom/google/android/gms/clearcut/zzo;->zza:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/gms/common/api/internal/zzap;

    .line 2
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzap;->zzc:Landroid/content/Context;

    .line 3
    sget v0, Lcom/google/android/gms/common/GoogleApiAvailabilityLight;->GOOGLE_PLAY_SERVICES_VERSION_CODE:I

    .line 4
    sget-object v0, Lcom/google/android/gms/common/GooglePlayServicesUtilLight;->zza:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    :try_start_0
    const-string v0, "notification"

    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/NotificationManager;

    if-eqz p0, :cond_1

    const/16 v0, 0x28c4

    .line 6
    invoke-virtual {p0, v0}, Landroid/app/NotificationManager;->cancel(I)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_1
    :goto_0
    return-void

    .line 7
    :goto_1
    iget-object p0, p0, Lcom/google/android/gms/clearcut/zzo;->zza:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/gms/common/api/internal/zzdb;

    .line 8
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzdb;->zzh:Lcom/google/android/gms/common/api/internal/zzde;

    .line 9
    new-instance v0, Lcom/google/android/gms/common/ConnectionResult;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lcom/google/android/gms/common/ConnectionResult;-><init>(I)V

    check-cast p0, Lcom/google/android/gms/common/api/internal/zzbv;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/api/internal/zzbv;->zza(Lcom/google/android/gms/common/ConnectionResult;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
