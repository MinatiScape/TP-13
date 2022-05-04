.class public Lcom/adobe/xmp/impl/xpath/XMPPath;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public segments:Ljava/util/List;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/adobe/xmp/impl/xpath/XMPPath;->segments:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getSegment(I)Lcom/adobe/xmp/impl/xpath/XMPPathSegment;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/adobe/xmp/impl/xpath/XMPPath;->segments:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;

    return-object p0
.end method

.method public size()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/adobe/xmp/impl/xpath/XMPPath;->segments:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v1, 0x1

    move v2, v1

    .line 2
    :goto_0
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/xpath/XMPPath;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 3
    invoke-virtual {p0, v2}, Lcom/adobe/xmp/impl/xpath/XMPPath;->getSegment(I)Lcom/adobe/xmp/impl/xpath/XMPPathSegment;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 4
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/xpath/XMPPath;->size()I

    move-result v3

    sub-int/2addr v3, v1

    if-ge v2, v3, :cond_1

    add-int/lit8 v3, v2, 0x1

    .line 5
    invoke-virtual {p0, v3}, Lcom/adobe/xmp/impl/xpath/XMPPath;->getSegment(I)Lcom/adobe/xmp/impl/xpath/XMPPathSegment;

    move-result-object v3

    .line 6
    iget v3, v3, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->kind:I

    if-eq v3, v1, :cond_0

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    :cond_0
    const/16 v3, 0x2f

    .line 7
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 8
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
