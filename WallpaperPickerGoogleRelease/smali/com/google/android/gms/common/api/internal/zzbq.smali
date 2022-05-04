.class public final Lcom/google/android/gms/common/api/internal/zzbq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic zza:Lcom/google/android/gms/common/api/internal/zzbp;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/internal/zzbp;I)V
    .locals 1

    iput p2, p0, Lcom/google/android/gms/common/api/internal/zzbq;->$r8$classId:I

    const/4 v0, 0x1

    if-eq p2, v0, :cond_0

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbq;->zza:Lcom/google/android/gms/common/api/internal/zzbp;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void

    .line 2
    :cond_0
    iput-object p1, p0, Lcom/google/android/gms/common/api/internal/zzbq;->zza:Lcom/google/android/gms/common/api/internal/zzbp;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget v0, p0, Lcom/google/android/gms/common/api/internal/zzbq;->$r8$classId:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 1
    :pswitch_0
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbq;->zza:Lcom/google/android/gms/common/api/internal/zzbp;

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/internal/zzbp;->zzn()V

    return-void

    .line 3
    :goto_0
    iget-object p0, p0, Lcom/google/android/gms/common/api/internal/zzbq;->zza:Lcom/google/android/gms/common/api/internal/zzbp;

    .line 4
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/internal/zzbp;->zzo()V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
