.class public final Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/internal/GmsClientSupervisor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ConnectionStatusConfig"
.end annotation


# instance fields
.field public final zza:Ljava/lang/String;

.field public final zzb:Ljava/lang/String;

.field public final zzd:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-static {p1}, Landroidx/preference/R$string;->zza(Ljava/lang/String;)Ljava/lang/String;

    iput-object p1, p0, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;->zza:Ljava/lang/String;

    .line 3
    invoke-static {p2}, Landroidx/preference/R$string;->zza(Ljava/lang/String;)Ljava/lang/String;

    iput-object p2, p0, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;->zzb:Ljava/lang/String;

    .line 4
    iput p3, p0, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;->zzd:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 1
    :cond_0
    instance-of v1, p1, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 2
    :cond_1
    check-cast p1, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;

    .line 3
    iget-object v1, p0, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;->zza:Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;->zza:Ljava/lang/String;

    invoke-static {v1, v3}, Landroidx/core/R$id;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;->zzb:Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;->zzb:Ljava/lang/String;

    .line 4
    invoke-static {v1, v3}, Landroidx/core/R$id;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v1, 0x0

    .line 5
    invoke-static {v1, v1}, Landroidx/core/R$id;->zza(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget p0, p0, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;->zzd:I

    iget p1, p1, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;->zzd:I

    if-ne p0, p1, :cond_2

    return v0

    :cond_2
    return v2
.end method

.method public final getStartServiceIntent()Landroid/content/Intent;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;->zza:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 2
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;->zza:Ljava/lang/String;

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;->zzb:Ljava/lang/String;

    invoke-virtual {v0, p0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    goto :goto_0

    .line 3
    :cond_0
    new-instance p0, Landroid/content/Intent;

    invoke-direct {p0}, Landroid/content/Intent;-><init>()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method public final hashCode()I
    .locals 3

    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Object;

    .line 1
    iget-object v1, p0, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;->zza:Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;->zzb:Ljava/lang/String;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const/4 v1, 0x2

    const/4 v2, 0x0

    aput-object v2, v0, v1

    iget p0, p0, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;->zzd:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const/4 v1, 0x3

    aput-object p0, v0, v1

    .line 2
    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/gms/common/internal/GmsClientSupervisor$ConnectionStatusConfig;->zza:Ljava/lang/String;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method
