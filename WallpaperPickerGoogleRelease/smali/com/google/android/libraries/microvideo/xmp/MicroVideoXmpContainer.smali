.class public Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainer;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final items:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainerItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/libraries/microvideo/xmp/MicroVideoXmpContainer;->items:Ljava/util/List;

    return-void
.end method
