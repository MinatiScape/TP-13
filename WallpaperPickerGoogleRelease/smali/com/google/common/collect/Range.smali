.class public final Lcom/google/common/collect/Range;
.super Lcom/google/common/collect/RangeGwtSerializationDependencies;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<C::",
        "Ljava/lang/Comparable;",
        ">",
        "Lcom/google/common/collect/RangeGwtSerializationDependencies;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field public static final ALL:Lcom/google/common/collect/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/Range<",
            "Ljava/lang/Comparable;",
            ">;"
        }
    .end annotation
.end field

.field private static final serialVersionUID:J


# instance fields
.field public final lowerBound:Lcom/google/common/collect/Cut;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/Cut<",
            "TC;>;"
        }
    .end annotation
.end field

.field public final upperBound:Lcom/google/common/collect/Cut;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/Cut<",
            "TC;>;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/google/common/collect/Range;

    .line 2
    sget-object v1, Lcom/google/common/collect/Cut$BelowAll;->INSTANCE:Lcom/google/common/collect/Cut$BelowAll;

    .line 3
    sget-object v2, Lcom/google/common/collect/Cut$AboveAll;->INSTANCE:Lcom/google/common/collect/Cut$AboveAll;

    .line 4
    invoke-direct {v0, v1, v2}, Lcom/google/common/collect/Range;-><init>(Lcom/google/common/collect/Cut;Lcom/google/common/collect/Cut;)V

    sput-object v0, Lcom/google/common/collect/Range;->ALL:Lcom/google/common/collect/Range;

    return-void
.end method

.method public constructor <init>(Lcom/google/common/collect/Cut;Lcom/google/common/collect/Cut;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "lowerBound",
            "upperBound"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/Cut<",
            "TC;>;",
            "Lcom/google/common/collect/Cut<",
            "TC;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/google/common/collect/RangeGwtSerializationDependencies;-><init>()V

    .line 2
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iput-object p1, p0, Lcom/google/common/collect/Range;->lowerBound:Lcom/google/common/collect/Cut;

    .line 4
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    iput-object p2, p0, Lcom/google/common/collect/Range;->upperBound:Lcom/google/common/collect/Cut;

    .line 6
    invoke-virtual {p1, p2}, Lcom/google/common/collect/Cut;->compareTo(Lcom/google/common/collect/Cut;)I

    move-result p0

    if-gtz p0, :cond_1

    .line 7
    sget-object p0, Lcom/google/common/collect/Cut$AboveAll;->INSTANCE:Lcom/google/common/collect/Cut$AboveAll;

    if-eq p1, p0, :cond_1

    .line 8
    sget-object p0, Lcom/google/common/collect/Cut$BelowAll;->INSTANCE:Lcom/google/common/collect/Cut$BelowAll;

    if-ne p2, p0, :cond_0

    goto :goto_0

    :cond_0
    return-void

    .line 9
    :cond_1
    :goto_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Invalid range: "

    .line 10
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0x10

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 11
    invoke-virtual {p1, v1}, Lcom/google/common/collect/Cut;->describeAsLowerBound(Ljava/lang/StringBuilder;)V

    const-string p1, ".."

    .line 12
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    invoke-virtual {p2, v1}, Lcom/google/common/collect/Cut;->describeAsUpperBound(Ljava/lang/StringBuilder;)V

    .line 14
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 15
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    if-eqz p2, :cond_2

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_2
    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, v0}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_1
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "object"
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/common/collect/Range;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    check-cast p1, Lcom/google/common/collect/Range;

    .line 3
    iget-object v0, p0, Lcom/google/common/collect/Range;->lowerBound:Lcom/google/common/collect/Cut;

    iget-object v2, p1, Lcom/google/common/collect/Range;->lowerBound:Lcom/google/common/collect/Cut;

    invoke-virtual {v0, v2}, Lcom/google/common/collect/Cut;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/common/collect/Range;->upperBound:Lcom/google/common/collect/Cut;

    iget-object p1, p1, Lcom/google/common/collect/Range;->upperBound:Lcom/google/common/collect/Cut;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/Cut;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public hashCode()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/common/collect/Range;->lowerBound:Lcom/google/common/collect/Cut;

    invoke-virtual {v0}, Lcom/google/common/collect/Cut;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lcom/google/common/collect/Range;->upperBound:Lcom/google/common/collect/Cut;

    invoke-virtual {p0}, Lcom/google/common/collect/Cut;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public readResolve()Ljava/lang/Object;
    .locals 2

    .line 1
    sget-object v0, Lcom/google/common/collect/Range;->ALL:Lcom/google/common/collect/Range;

    invoke-virtual {p0, v0}, Lcom/google/common/collect/Range;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_0
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/common/collect/Range;->lowerBound:Lcom/google/common/collect/Cut;

    iget-object p0, p0, Lcom/google/common/collect/Range;->upperBound:Lcom/google/common/collect/Cut;

    .line 2
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0x10

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 3
    invoke-virtual {v0, v1}, Lcom/google/common/collect/Cut;->describeAsLowerBound(Ljava/lang/StringBuilder;)V

    const-string v0, ".."

    .line 4
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 5
    invoke-virtual {p0, v1}, Lcom/google/common/collect/Cut;->describeAsUpperBound(Ljava/lang/StringBuilder;)V

    .line 6
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
