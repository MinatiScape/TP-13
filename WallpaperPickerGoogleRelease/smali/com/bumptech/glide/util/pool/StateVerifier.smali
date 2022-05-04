.class public abstract Lcom/bumptech/glide/util/pool/StateVerifier;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/util/pool/StateVerifier$DefaultStateVerifier;
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/util/pool/StateVerifier$1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract throwIfRecycled()V
.end method
