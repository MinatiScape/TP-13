.class public abstract Lcom/google/common/collect/Cut;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/Cut$AboveValue;,
        Lcom/google/common/collect/Cut$BelowValue;,
        Lcom/google/common/collect/Cut$AboveAll;,
        Lcom/google/common/collect/Cut$BelowAll;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<C::",
        "Ljava/lang/Comparable;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lcom/google/common/collect/Cut<",
        "TC;>;>;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J


# instance fields
.field public final endpoint:Ljava/lang/Comparable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TC;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Comparable;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "endpoint"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/google/common/collect/Cut;->endpoint:Ljava/lang/Comparable;

    return-void
.end method


# virtual methods
.method public compareTo(Lcom/google/common/collect/Cut;)I
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "that"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/Cut<",
            "TC;>;)I"
        }
    .end annotation

    .line 2
    sget-object v0, Lcom/google/common/collect/Cut$BelowAll;->INSTANCE:Lcom/google/common/collect/Cut$BelowAll;

    const/4 v1, 0x1

    if-ne p1, v0, :cond_0

    return v1

    .line 3
    :cond_0
    sget-object v0, Lcom/google/common/collect/Cut$AboveAll;->INSTANCE:Lcom/google/common/collect/Cut$AboveAll;

    const/4 v2, -0x1

    if-ne p1, v0, :cond_1

    return v2

    .line 4
    :cond_1
    iget-object v0, p0, Lcom/google/common/collect/Cut;->endpoint:Ljava/lang/Comparable;

    iget-object v3, p1, Lcom/google/common/collect/Cut;->endpoint:Ljava/lang/Comparable;

    sget-object v4, Lcom/google/common/collect/Range;->ALL:Lcom/google/common/collect/Range;

    .line 5
    invoke-interface {v0, v3}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v0

    if-eqz v0, :cond_2

    return v0

    .line 6
    :cond_2
    instance-of p0, p0, Lcom/google/common/collect/Cut$AboveValue;

    instance-of p1, p1, Lcom/google/common/collect/Cut$AboveValue;

    if-ne p0, p1, :cond_3

    const/4 v1, 0x0

    goto :goto_0

    :cond_3
    if-eqz p0, :cond_4

    goto :goto_0

    :cond_4
    move v1, v2

    :goto_0
    return v1
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "that"
        }
    .end annotation

    .line 1
    check-cast p1, Lcom/google/common/collect/Cut;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/Cut;->compareTo(Lcom/google/common/collect/Cut;)I

    move-result p0

    return p0
.end method

.method public abstract describeAsLowerBound(Ljava/lang/StringBuilder;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "sb"
        }
    .end annotation
.end method

.method public abstract describeAsUpperBound(Ljava/lang/StringBuilder;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "sb"
        }
    .end annotation
.end method

.method public endpoint()Ljava/lang/Comparable;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TC;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/common/collect/Cut;->endpoint:Ljava/lang/Comparable;

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "obj"
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/google/common/collect/Cut;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2
    check-cast p1, Lcom/google/common/collect/Cut;

    .line 3
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/google/common/collect/Cut;->compareTo(Lcom/google/common/collect/Cut;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez p0, :cond_0

    const/4 v1, 0x1

    :catch_0
    :cond_0
    return v1
.end method

.method public abstract hashCode()I
.end method

.method public abstract isLessThan(Ljava/lang/Comparable;)Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;)Z"
        }
    .end annotation
.end method
