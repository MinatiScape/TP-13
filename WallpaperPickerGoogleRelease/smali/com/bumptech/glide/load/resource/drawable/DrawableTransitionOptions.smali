.class public final Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;
.super Lcom/bumptech/glide/TransitionOptions;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bumptech/glide/TransitionOptions<",
        "Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;",
        "Landroid/graphics/drawable/Drawable;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/bumptech/glide/TransitionOptions;-><init>()V

    return-void
.end method

.method public static withCrossFade()Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;
    .locals 4

    .line 1
    new-instance v0, Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;

    invoke-direct {v0}, Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;-><init>()V

    .line 2
    new-instance v1, Lcom/bumptech/glide/request/transition/DrawableCrossFadeFactory;

    const/16 v2, 0x12c

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lcom/bumptech/glide/request/transition/DrawableCrossFadeFactory;-><init>(IZ)V

    .line 3
    iput-object v1, v0, Lcom/bumptech/glide/TransitionOptions;->transitionFactory:Lcom/bumptech/glide/request/transition/TransitionFactory;

    return-object v0
.end method
