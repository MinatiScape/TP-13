.class public final Lcom/google/android/gms/internal/zzgrw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field public zzb:Ljava/lang/Object;

.field public zzc:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/gms/internal/zzgsb;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgrw;->zzc:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgrw;->zzc()Lcom/google/android/gms/internal/zzgrw;

    move-result-object p0

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 2

    if-ne p1, p0, :cond_0

    const/4 p0, 0x1

    return p0

    .line 1
    :cond_0
    instance-of v0, p1, Lcom/google/android/gms/internal/zzgrw;

    if-nez v0, :cond_1

    const/4 p0, 0x0

    return p0

    .line 2
    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/zzgrw;

    .line 3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgrw;->zzb:Ljava/lang/Object;

    if-eqz v0, :cond_3

    iget-object v0, p1, Lcom/google/android/gms/internal/zzgrw;->zzb:Ljava/lang/Object;

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    const/4 p0, 0x0

    .line 4
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    throw p0

    .line 5
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgrw;->zzc:Ljava/util/List;

    if-eqz v0, :cond_4

    iget-object v1, p1, Lcom/google/android/gms/internal/zzgrw;->zzc:Ljava/util/List;

    if-eqz v1, :cond_4

    .line 6
    invoke-interface {v0, v1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    .line 7
    :cond_4
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgrw;->zzb()[B

    move-result-object p0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzgrw;->zzb()[B

    move-result-object p1

    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 8
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw p1
.end method

.method public final hashCode()I
    .locals 1

    .line 1
    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgrw;->zzb()[B

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->hashCode([B)I

    move-result p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit16 p0, p0, 0x20f

    return p0

    :catch_0
    move-exception p0

    .line 2
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method public final zza()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgrw;->zzb:Ljava/lang/Object;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 2
    iget-object p0, p0, Lcom/google/android/gms/internal/zzgrw;->zzc:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/zzgsb;

    .line 3
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    throw v1

    .line 5
    :cond_1
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    throw v1
.end method

.method public final zza(Lcom/google/android/gms/internal/zzgrr;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 6
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgrw;->zzb:Ljava/lang/Object;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 7
    iget-object p0, p0, Lcom/google/android/gms/internal/zzgrw;->zzc:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/zzgsb;

    .line 8
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Lcom/google/android/gms/internal/zzgrr;->zzc(I)V

    .line 9
    invoke-virtual {p1, v1}, Lcom/google/android/gms/internal/zzgrr;->zzd([B)V

    throw v1

    .line 10
    :cond_1
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    throw v1
.end method

.method public final zzb()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgrw;->zza()I

    const/4 v0, 0x0

    new-array v1, v0, [B

    .line 2
    new-instance v2, Lcom/google/android/gms/internal/zzgrr;

    invoke-direct {v2, v1, v0, v0}, Lcom/google/android/gms/internal/zzgrr;-><init>([BII)V

    .line 3
    invoke-virtual {p0, v2}, Lcom/google/android/gms/internal/zzgrw;->zza(Lcom/google/android/gms/internal/zzgrr;)V

    return-object v1
.end method

.method public final zzc()Lcom/google/android/gms/internal/zzgrw;
    .locals 4

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/zzgrw;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzgrw;-><init>()V

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgrw;->zzc:Ljava/util/List;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    .line 3
    iput-object v1, v0, Lcom/google/android/gms/internal/zzgrw;->zzc:Ljava/util/List;

    goto :goto_0

    .line 4
    :cond_0
    iget-object v2, v0, Lcom/google/android/gms/internal/zzgrw;->zzc:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 5
    :goto_0
    iget-object p0, p0, Lcom/google/android/gms/internal/zzgrw;->zzb:Ljava/lang/Object;

    if-eqz p0, :cond_9

    .line 6
    instance-of v1, p0, Lcom/google/android/gms/internal/zzgrz;

    if-eqz v1, :cond_1

    .line 7
    check-cast p0, Lcom/google/android/gms/internal/zzgrz;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzgrz;->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/internal/zzgrz;

    iput-object p0, v0, Lcom/google/android/gms/internal/zzgrw;->zzb:Ljava/lang/Object;

    goto/16 :goto_3

    .line 8
    :cond_1
    instance-of v1, p0, [B

    if-eqz v1, :cond_2

    .line 9
    check-cast p0, [B

    invoke-virtual {p0}, [B->clone()Ljava/lang/Object;

    move-result-object p0

    iput-object p0, v0, Lcom/google/android/gms/internal/zzgrw;->zzb:Ljava/lang/Object;

    goto/16 :goto_3

    .line 10
    :cond_2
    instance-of v1, p0, [[B

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    .line 11
    check-cast p0, [[B

    .line 12
    array-length v1, p0

    new-array v1, v1, [[B

    .line 13
    iput-object v1, v0, Lcom/google/android/gms/internal/zzgrw;->zzb:Ljava/lang/Object;

    .line 14
    :goto_1
    array-length v3, p0

    if-ge v2, v3, :cond_9

    .line 15
    aget-object v3, p0, v2

    invoke-virtual {v3}, [B->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 16
    :cond_3
    instance-of v1, p0, [Z

    if-eqz v1, :cond_4

    .line 17
    check-cast p0, [Z

    invoke-virtual {p0}, [Z->clone()Ljava/lang/Object;

    move-result-object p0

    iput-object p0, v0, Lcom/google/android/gms/internal/zzgrw;->zzb:Ljava/lang/Object;

    goto :goto_3

    .line 18
    :cond_4
    instance-of v1, p0, [I

    if-eqz v1, :cond_5

    .line 19
    check-cast p0, [I

    invoke-virtual {p0}, [I->clone()Ljava/lang/Object;

    move-result-object p0

    iput-object p0, v0, Lcom/google/android/gms/internal/zzgrw;->zzb:Ljava/lang/Object;

    goto :goto_3

    .line 20
    :cond_5
    instance-of v1, p0, [J

    if-eqz v1, :cond_6

    .line 21
    check-cast p0, [J

    invoke-virtual {p0}, [J->clone()Ljava/lang/Object;

    move-result-object p0

    iput-object p0, v0, Lcom/google/android/gms/internal/zzgrw;->zzb:Ljava/lang/Object;

    goto :goto_3

    .line 22
    :cond_6
    instance-of v1, p0, [F

    if-eqz v1, :cond_7

    .line 23
    check-cast p0, [F

    invoke-virtual {p0}, [F->clone()Ljava/lang/Object;

    move-result-object p0

    iput-object p0, v0, Lcom/google/android/gms/internal/zzgrw;->zzb:Ljava/lang/Object;

    goto :goto_3

    .line 24
    :cond_7
    instance-of v1, p0, [D

    if-eqz v1, :cond_8

    .line 25
    check-cast p0, [D

    invoke-virtual {p0}, [D->clone()Ljava/lang/Object;

    move-result-object p0

    iput-object p0, v0, Lcom/google/android/gms/internal/zzgrw;->zzb:Ljava/lang/Object;

    goto :goto_3

    .line 26
    :cond_8
    instance-of v1, p0, [Lcom/google/android/gms/internal/zzgrz;

    if-eqz v1, :cond_9

    .line 27
    check-cast p0, [Lcom/google/android/gms/internal/zzgrz;

    .line 28
    array-length v1, p0

    new-array v1, v1, [Lcom/google/android/gms/internal/zzgrz;

    .line 29
    iput-object v1, v0, Lcom/google/android/gms/internal/zzgrw;->zzb:Ljava/lang/Object;

    .line 30
    :goto_2
    array-length v3, p0

    if-ge v2, v3, :cond_9

    .line 31
    aget-object v3, p0, v2

    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzgrz;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/gms/internal/zzgrz;

    aput-object v3, v1, v2
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_9
    :goto_3
    return-object v0

    :catch_0
    move-exception p0

    .line 32
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method
