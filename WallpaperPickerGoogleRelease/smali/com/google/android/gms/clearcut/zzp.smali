.class public final Lcom/google/android/gms/clearcut/zzp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "[B>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 3

    .line 1
    check-cast p1, [B

    check-cast p2, [B

    const/4 p0, 0x0

    if-nez p1, :cond_0

    if-nez p2, :cond_0

    return p0

    :cond_0
    if-nez p1, :cond_1

    const/4 p0, -0x1

    return p0

    :cond_1
    if-nez p2, :cond_2

    const/4 p0, 0x1

    return p0

    .line 2
    :cond_2
    array-length v0, p1

    array-length v1, p2

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    :goto_0
    if-ge p0, v0, :cond_4

    .line 3
    aget-byte v1, p1, p0

    aget-byte v2, p2, p0

    if-eq v1, v2, :cond_3

    .line 4
    aget-byte p1, p1, p0

    aget-byte p0, p2, p0

    sub-int/2addr p1, p0

    return p1

    :cond_3
    add-int/lit8 p0, p0, 0x1

    goto :goto_0

    .line 5
    :cond_4
    array-length p0, p1

    array-length p1, p2

    sub-int/2addr p0, p1

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "what are you doing?"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
