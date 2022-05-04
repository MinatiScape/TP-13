.class public Lcom/google/common/collect/ImmutableSortedMap$SerializedForm;
.super Lcom/google/common/collect/ImmutableMap$SerializedForm;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/ImmutableSortedMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SerializedForm"
.end annotation


# static fields
.field private static final serialVersionUID:J


# instance fields
.field private final comparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/common/collect/ImmutableSortedMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "sortedMap"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableSortedMap<",
            "**>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/google/common/collect/ImmutableMap$SerializedForm;-><init>(Lcom/google/common/collect/ImmutableMap;)V

    .line 2
    iget-object p1, p1, Lcom/google/common/collect/ImmutableSortedMap;->keySet:Lcom/google/common/collect/RegularImmutableSortedSet;

    .line 3
    iget-object p1, p1, Lcom/google/common/collect/ImmutableSortedSet;->comparator:Ljava/util/Comparator;

    .line 4
    iput-object p1, p0, Lcom/google/common/collect/ImmutableSortedMap$SerializedForm;->comparator:Ljava/util/Comparator;

    return-void
.end method


# virtual methods
.method public readResolve()Ljava/lang/Object;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/common/collect/ImmutableSortedMap$Builder;

    iget-object v1, p0, Lcom/google/common/collect/ImmutableSortedMap$SerializedForm;->comparator:Ljava/util/Comparator;

    invoke-direct {v0, v1}, Lcom/google/common/collect/ImmutableSortedMap$Builder;-><init>(Ljava/util/Comparator;)V

    .line 2
    invoke-virtual {p0, v0}, Lcom/google/common/collect/ImmutableMap$SerializedForm;->createMap(Lcom/google/common/collect/ImmutableMap$Builder;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
