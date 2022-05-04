.class public Lcom/google/common/collect/CompactHashMap$2;
.super Lcom/google/common/collect/CompactHashMap$Itr;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/CompactHashMap<",
        "**>.Itr<",
        "Ljava/util/Map$Entry<",
        "**>;>;"
    }
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/google/common/collect/CompactHashMap;


# direct methods
.method public constructor <init>(Lcom/google/common/collect/CompactHashMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/google/common/collect/CompactHashMap$2;->this$0:Lcom/google/common/collect/CompactHashMap;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/common/collect/CompactHashMap$Itr;-><init>(Lcom/google/common/collect/CompactHashMap;Lcom/google/common/collect/CompactHashMap$1;)V

    return-void
.end method


# virtual methods
.method public getOutput(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "entry"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/google/common/collect/CompactHashMap$MapEntry;

    iget-object p0, p0, Lcom/google/common/collect/CompactHashMap$2;->this$0:Lcom/google/common/collect/CompactHashMap;

    invoke-direct {v0, p0, p1}, Lcom/google/common/collect/CompactHashMap$MapEntry;-><init>(Lcom/google/common/collect/CompactHashMap;I)V

    return-object v0
.end method
