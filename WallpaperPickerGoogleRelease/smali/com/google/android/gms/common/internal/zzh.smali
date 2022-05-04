.class public final Lcom/google/android/gms/common/internal/zzh;
.super Lcom/google/android/gms/common/internal/zzg;
.source "SourceFile"


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic zza:Landroid/content/Intent;

.field public final synthetic zzb:Ljava/lang/Object;

.field public final synthetic zzc:I


# direct methods
.method public constructor <init>(Landroid/content/Intent;Landroid/app/Activity;I)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/gms/common/internal/zzh;->$r8$classId:I

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/internal/zzh;->zza:Landroid/content/Intent;

    iput-object p2, p0, Lcom/google/android/gms/common/internal/zzh;->zzb:Ljava/lang/Object;

    iput p3, p0, Lcom/google/android/gms/common/internal/zzh;->zzc:I

    invoke-direct {p0}, Lcom/google/android/gms/common/internal/zzg;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza()V
    .locals 2

    iget v0, p0, Lcom/google/android/gms/common/internal/zzh;->$r8$classId:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 1
    :pswitch_0
    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzh;->zza:Landroid/content/Intent;

    if-eqz v0, :cond_0

    .line 2
    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzh;->zzb:Ljava/lang/Object;

    check-cast v1, Landroid/app/Activity;

    iget p0, p0, Lcom/google/android/gms/common/internal/zzh;->zzc:I

    invoke-virtual {v1, v0, p0}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    :cond_0
    return-void

    .line 3
    :goto_0
    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzh;->zza:Landroid/content/Intent;

    if-eqz v0, :cond_1

    .line 4
    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzh;->zzb:Ljava/lang/Object;

    check-cast v1, Lcom/google/android/gms/common/api/internal/zzcf;

    iget p0, p0, Lcom/google/android/gms/common/internal/zzh;->zzc:I

    invoke-interface {v1, v0, p0}, Lcom/google/android/gms/common/api/internal/zzcf;->startActivityForResult(Landroid/content/Intent;I)V

    :cond_1
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
