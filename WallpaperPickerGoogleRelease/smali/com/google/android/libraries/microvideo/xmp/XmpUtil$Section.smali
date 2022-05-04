.class public Lcom/google/android/libraries/microvideo/xmp/XmpUtil$Section;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final data:[B

.field public final length:I

.field public final offset:I


# direct methods
.method public constructor <init>([BIII)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "data",
            "marker",
            "offset",
            "length"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p2, 0x1

    const/4 v0, 0x0

    if-ltz p3, :cond_0

    move v1, p2

    goto :goto_0

    :cond_0
    move v1, v0

    :goto_0
    const-string v2, "offset must be >= 0"

    .line 2
    invoke-static {v1, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    if-lez p4, :cond_1

    move v1, p2

    goto :goto_1

    :cond_1
    move v1, v0

    :goto_1
    const-string v2, "length must be > 0"

    .line 3
    invoke-static {v1, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 4
    array-length v1, p1

    if-gt p4, v1, :cond_2

    goto :goto_2

    :cond_2
    move p2, v0

    :goto_2
    const-string v0, "length exceeds data length"

    invoke-static {p2, v0}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 5
    iput-object p1, p0, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$Section;->data:[B

    .line 6
    iput p3, p0, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$Section;->offset:I

    .line 7
    iput p4, p0, Lcom/google/android/libraries/microvideo/xmp/XmpUtil$Section;->length:I

    return-void
.end method
