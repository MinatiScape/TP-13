.class public Lcom/google/common/collect/CompactHashMap$ValuesView;
.super Ljava/util/AbstractCollection;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/CompactHashMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ValuesView"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractCollection<",
        "TV;>;"
    }
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/google/common/collect/CompactHashMap;


# direct methods
.method public constructor <init>(Lcom/google/common/collect/CompactHashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/google/common/collect/CompactHashMap$ValuesView;->this$0:Lcom/google/common/collect/CompactHashMap;

    invoke-direct {p0}, Ljava/util/AbstractCollection;-><init>()V

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/common/collect/CompactHashMap$ValuesView;->this$0:Lcom/google/common/collect/CompactHashMap;

    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->clear()V

    return-void
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TV;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/common/collect/CompactHashMap$ValuesView;->this$0:Lcom/google/common/collect/CompactHashMap;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    new-instance v0, Lcom/google/common/collect/CompactHashMap$3;

    invoke-direct {v0, p0}, Lcom/google/common/collect/CompactHashMap$3;-><init>(Lcom/google/common/collect/CompactHashMap;)V

    return-object v0
.end method

.method public size()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/common/collect/CompactHashMap$ValuesView;->this$0:Lcom/google/common/collect/CompactHashMap;

    .line 2
    iget p0, p0, Lcom/google/common/collect/CompactHashMap;->size:I

    return p0
.end method
