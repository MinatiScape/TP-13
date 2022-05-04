.class public final Lcom/bumptech/glide/util/pool/FactoryPools;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/util/pool/FactoryPools$FactoryPool;,
        Lcom/bumptech/glide/util/pool/FactoryPools$Poolable;,
        Lcom/bumptech/glide/util/pool/FactoryPools$Resetter;,
        Lcom/bumptech/glide/util/pool/FactoryPools$Factory;
    }
.end annotation


# static fields
.field public static final EMPTY_RESETTER:Lcom/bumptech/glide/util/pool/FactoryPools$Resetter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/util/pool/FactoryPools$Resetter<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/bumptech/glide/util/pool/FactoryPools$1;

    invoke-direct {v0}, Lcom/bumptech/glide/util/pool/FactoryPools$1;-><init>()V

    sput-object v0, Lcom/bumptech/glide/util/pool/FactoryPools;->EMPTY_RESETTER:Lcom/bumptech/glide/util/pool/FactoryPools$Resetter;

    return-void
.end method

.method public static simple(ILcom/bumptech/glide/util/pool/FactoryPools$Factory;)Landroidx/core/util/Pools$Pool;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "size",
            "factory"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/bumptech/glide/util/pool/FactoryPools$Poolable;",
            ">(I",
            "Lcom/bumptech/glide/util/pool/FactoryPools$Factory<",
            "TT;>;)",
            "Landroidx/core/util/Pools$Pool<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroidx/core/util/Pools$SimplePool;

    invoke-direct {v0, p0}, Landroidx/core/util/Pools$SimplePool;-><init>(I)V

    .line 2
    sget-object p0, Lcom/bumptech/glide/util/pool/FactoryPools;->EMPTY_RESETTER:Lcom/bumptech/glide/util/pool/FactoryPools$Resetter;

    .line 3
    new-instance v1, Lcom/bumptech/glide/util/pool/FactoryPools$FactoryPool;

    invoke-direct {v1, v0, p1, p0}, Lcom/bumptech/glide/util/pool/FactoryPools$FactoryPool;-><init>(Landroidx/core/util/Pools$Pool;Lcom/bumptech/glide/util/pool/FactoryPools$Factory;Lcom/bumptech/glide/util/pool/FactoryPools$Resetter;)V

    return-object v1
.end method
