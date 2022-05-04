.class public Lcom/bumptech/glide/request/transition/DrawableCrossFadeTransition;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/request/transition/Transition;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/request/transition/Transition<",
        "Landroid/graphics/drawable/Drawable;",
        ">;"
    }
.end annotation


# instance fields
.field public final duration:I

.field public final isCrossFadeEnabled:Z


# direct methods
.method public constructor <init>(IZ)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "duration",
            "isCrossFadeEnabled"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput p1, p0, Lcom/bumptech/glide/request/transition/DrawableCrossFadeTransition;->duration:I

    .line 3
    iput-boolean p2, p0, Lcom/bumptech/glide/request/transition/DrawableCrossFadeTransition;->isCrossFadeEnabled:Z

    return-void
.end method


# virtual methods
.method public transition(Ljava/lang/Object;Lcom/bumptech/glide/request/transition/Transition$ViewAdapter;)Z
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "current",
            "adapter"
        }
    .end annotation

    .line 1
    check-cast p1, Landroid/graphics/drawable/Drawable;

    .line 2
    check-cast p2, Lcom/bumptech/glide/request/target/ImageViewTarget;

    .line 3
    iget-object v0, p2, Lcom/bumptech/glide/request/target/ViewTarget;->view:Landroid/view/View;

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 4
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 5
    :cond_0
    new-instance v2, Landroid/graphics/drawable/TransitionDrawable;

    const/4 v3, 0x2

    new-array v3, v3, [Landroid/graphics/drawable/Drawable;

    aput-object v0, v3, v1

    const/4 v0, 0x1

    aput-object p1, v3, v0

    invoke-direct {v2, v3}, Landroid/graphics/drawable/TransitionDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 6
    iget-boolean p1, p0, Lcom/bumptech/glide/request/transition/DrawableCrossFadeTransition;->isCrossFadeEnabled:Z

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/TransitionDrawable;->setCrossFadeEnabled(Z)V

    .line 7
    iget p0, p0, Lcom/bumptech/glide/request/transition/DrawableCrossFadeTransition;->duration:I

    invoke-virtual {v2, p0}, Landroid/graphics/drawable/TransitionDrawable;->startTransition(I)V

    .line 8
    iget-object p0, p2, Lcom/bumptech/glide/request/target/ViewTarget;->view:Landroid/view/View;

    check-cast p0, Landroid/widget/ImageView;

    invoke-virtual {p0, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return v0
.end method
