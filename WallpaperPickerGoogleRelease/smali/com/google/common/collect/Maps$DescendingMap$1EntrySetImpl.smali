.class public Lcom/google/common/collect/Maps$DescendingMap$1EntrySetImpl;
.super Lcom/google/common/collect/Maps$EntrySet;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/Maps$EntrySet<",
        "**>;"
    }
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/google/common/collect/Maps$DescendingMap;


# direct methods
.method public constructor <init>(Lcom/google/common/collect/Maps$DescendingMap;)V
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
    iput-object p1, p0, Lcom/google/common/collect/Maps$DescendingMap$1EntrySetImpl;->this$0:Lcom/google/common/collect/Maps$DescendingMap;

    invoke-direct {p0}, Lcom/google/common/collect/Maps$EntrySet;-><init>()V

    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/util/Map$Entry<",
            "**>;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/common/collect/Maps$DescendingMap$1EntrySetImpl;->this$0:Lcom/google/common/collect/Maps$DescendingMap;

    check-cast p0, Lcom/google/common/collect/AbstractNavigableMap$DescendingMap;

    .line 2
    iget-object p0, p0, Lcom/google/common/collect/AbstractNavigableMap$DescendingMap;->this$0:Lcom/google/common/collect/AbstractNavigableMap;

    invoke-virtual {p0}, Lcom/google/common/collect/AbstractNavigableMap;->descendingEntryIterator()Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method

.method public map()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "**>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/common/collect/Maps$DescendingMap$1EntrySetImpl;->this$0:Lcom/google/common/collect/Maps$DescendingMap;

    return-object p0
.end method
