.class public Landroid/support/v4/util/ArrayMap$1;
.super Landroid/support/v4/util/MapCollections;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/util/ArrayMap;->getCollection()Landroid/support/v4/util/MapCollections;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v4/util/MapCollections<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field public final synthetic this$0:Landroid/support/v4/util/ArrayMap;


# direct methods
.method public constructor <init>(Landroid/support/v4/util/ArrayMap;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroid/support/v4/util/ArrayMap$1;->this$0:Landroid/support/v4/util/ArrayMap;

    invoke-direct {p0}, Landroid/support/v4/util/MapCollections;-><init>()V

    return-void
.end method


# virtual methods
.method public colGetEntry(II)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/util/ArrayMap$1;->this$0:Landroid/support/v4/util/ArrayMap;

    iget-object p0, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 p1, p1, 0x1

    add-int/2addr p1, p2

    aget-object p0, p0, p1

    return-object p0
.end method

.method public colIndexOfKey(Ljava/lang/Object;)I
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/support/v4/util/ArrayMap$1;->this$0:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {p0, p1}, Landroid/support/v4/util/SimpleArrayMap;->indexOfKey(Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
