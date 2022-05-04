.class public Lcom/google/common/collect/FluentIterable$3$1;
.super Lcom/google/common/collect/AbstractIndexedListIterator;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/FluentIterable$3;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/AbstractIndexedListIterator<",
        "Ljava/util/Iterator<",
        "*>;>;"
    }
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/google/common/collect/FluentIterable$3;


# direct methods
.method public constructor <init>(Lcom/google/common/collect/FluentIterable$3;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            "this$0",
            "size"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/google/common/collect/FluentIterable$3$1;->this$0:Lcom/google/common/collect/FluentIterable$3;

    invoke-direct {p0, p2}, Lcom/google/common/collect/AbstractIndexedListIterator;-><init>(I)V

    return-void
.end method


# virtual methods
.method public get(I)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "i"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/common/collect/FluentIterable$3$1;->this$0:Lcom/google/common/collect/FluentIterable$3;

    iget-object p0, p0, Lcom/google/common/collect/FluentIterable$3;->val$inputs:[Ljava/lang/Iterable;

    aget-object p0, p0, p1

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method
