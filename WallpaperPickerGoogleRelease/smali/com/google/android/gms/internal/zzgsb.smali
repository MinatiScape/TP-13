.class public final Lcom/google/android/gms/internal/zzgsb;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 2

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 1
    :cond_0
    instance-of p0, p1, Lcom/google/android/gms/internal/zzgsb;

    const/4 v1, 0x0

    if-nez p0, :cond_1

    return v1

    .line 2
    :cond_1
    check-cast p1, Lcom/google/android/gms/internal/zzgsb;

    .line 3
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p0, 0x0

    invoke-static {p0, p0}, Ljava/util/Arrays;->equals([B[B)Z

    move-result p0

    if-eqz p0, :cond_2

    return v0

    :cond_2
    return v1
.end method

.method public final hashCode()I
    .locals 0

    const/4 p0, 0x0

    .line 1
    invoke-static {p0}, Ljava/util/Arrays;->hashCode([B)I

    move-result p0

    add-int/lit16 p0, p0, 0x3fd1

    return p0
.end method
