.class public Landroid/support/v4/util/SparseArrayCompat;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Cloneable;"
    }
.end annotation


# static fields
.field public static final DELETED:Ljava/lang/Object;


# instance fields
.field public mKeys:[I

.field public mSize:I

.field public mValues:[Ljava/lang/Object;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroid/support/v4/util/SparseArrayCompat;->DELETED:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x4

    move v1, v0

    :goto_0
    const/16 v2, 0x20

    const/16 v3, 0x28

    if-ge v1, v2, :cond_1

    const/4 v2, 0x1

    shl-int/2addr v2, v1

    add-int/lit8 v2, v2, -0xc

    if-gt v3, v2, :cond_0

    move v3, v2

    goto :goto_1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 2
    :cond_1
    :goto_1
    div-int/2addr v3, v0

    .line 3
    new-array v0, v3, [I

    iput-object v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    .line 4
    new-array v0, v3, [Ljava/lang/Object;

    iput-object v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    const/4 v0, 0x0

    .line 5
    iput v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/util/SparseArrayCompat;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_1

    .line 2
    :try_start_1
    iget-object v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    invoke-virtual {v0}, [I->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    iput-object v0, v1, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    .line 3
    iget-object p0, p0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    invoke-virtual {p0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/Object;

    iput-object p0, v1, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-object v0, v1

    :catch_1
    move-object v1, v0

    :goto_0
    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    iget v0, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    if-gtz v0, :cond_0

    const-string p0, "{}"

    return-object p0

    .line 2
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    mul-int/lit8 v0, v0, 0x1c

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    const/16 v0, 0x7b

    .line 3
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 v0, 0x0

    .line 4
    :goto_0
    iget v2, p0, Landroid/support/v4/util/SparseArrayCompat;->mSize:I

    if-ge v0, v2, :cond_3

    if-lez v0, :cond_1

    const-string v2, ", "

    .line 5
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 6
    :cond_1
    iget-object v2, p0, Landroid/support/v4/util/SparseArrayCompat;->mKeys:[I

    aget v2, v2, v0

    .line 7
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v2, 0x3d

    .line 8
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 9
    iget-object v2, p0, Landroid/support/v4/util/SparseArrayCompat;->mValues:[Ljava/lang/Object;

    aget-object v2, v2, v0

    if-eq v2, p0, :cond_2

    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_1

    :cond_2
    const-string v2, "(this Map)"

    .line 11
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    const/16 p0, 0x7d

    .line 12
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
