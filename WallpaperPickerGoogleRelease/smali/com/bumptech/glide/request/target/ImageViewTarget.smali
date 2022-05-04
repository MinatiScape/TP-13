.class public abstract Lcom/bumptech/glide/request/target/ImageViewTarget;
.super Lcom/bumptech/glide/request/target/ViewTarget;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/request/transition/Transition$ViewAdapter;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Z:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/bumptech/glide/request/target/ViewTarget<",
        "Landroid/widget/ImageView;",
        "TZ;>;",
        "Lcom/bumptech/glide/request/transition/Transition$ViewAdapter;"
    }
.end annotation


# instance fields
.field public animatable:Landroid/graphics/drawable/Animatable;


# direct methods
.method public constructor <init>(Landroid/widget/ImageView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "view"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/bumptech/glide/request/target/ViewTarget;-><init>(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public onLoadCleared(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "placeholder"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/request/target/ViewTarget;->sizeDeterminer:Lcom/bumptech/glide/request/target/ViewTarget$SizeDeterminer;

    invoke-virtual {v0}, Lcom/bumptech/glide/request/target/ViewTarget$SizeDeterminer;->clearCallbacksAndListener()V

    .line 2
    iget-object v0, p0, Lcom/bumptech/glide/request/target/ImageViewTarget;->animatable:Landroid/graphics/drawable/Animatable;

    if-eqz v0, :cond_0

    .line 3
    invoke-interface {v0}, Landroid/graphics/drawable/Animatable;->stop()V

    :cond_0
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lcom/bumptech/glide/request/target/ImageViewTarget;->setResourceInternal(Ljava/lang/Object;)V

    .line 5
    iget-object p0, p0, Lcom/bumptech/glide/request/target/ViewTarget;->view:Landroid/view/View;

    check-cast p0, Landroid/widget/ImageView;

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public onLoadFailed(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "errorDrawable"
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, v0}, Lcom/bumptech/glide/request/target/ImageViewTarget;->setResourceInternal(Ljava/lang/Object;)V

    .line 2
    iget-object p0, p0, Lcom/bumptech/glide/request/target/ViewTarget;->view:Landroid/view/View;

    check-cast p0, Landroid/widget/ImageView;

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public onLoadStarted(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "placeholder"
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, v0}, Lcom/bumptech/glide/request/target/ImageViewTarget;->setResourceInternal(Ljava/lang/Object;)V

    .line 2
    iget-object p0, p0, Lcom/bumptech/glide/request/target/ViewTarget;->view:Landroid/view/View;

    check-cast p0, Landroid/widget/ImageView;

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public onResourceReady(Ljava/lang/Object;Lcom/bumptech/glide/request/transition/Transition;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "resource",
            "transition"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TZ;",
            "Lcom/bumptech/glide/request/transition/Transition<",
            "-TZ;>;)V"
        }
    .end annotation

    if-eqz p2, :cond_2

    .line 1
    invoke-interface {p2, p1, p0}, Lcom/bumptech/glide/request/transition/Transition;->transition(Ljava/lang/Object;Lcom/bumptech/glide/request/transition/Transition$ViewAdapter;)Z

    move-result p2

    if-nez p2, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    instance-of p2, p1, Landroid/graphics/drawable/Animatable;

    if-eqz p2, :cond_1

    .line 3
    check-cast p1, Landroid/graphics/drawable/Animatable;

    iput-object p1, p0, Lcom/bumptech/glide/request/target/ImageViewTarget;->animatable:Landroid/graphics/drawable/Animatable;

    .line 4
    invoke-interface {p1}, Landroid/graphics/drawable/Animatable;->start()V

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/bumptech/glide/request/target/ImageViewTarget;->animatable:Landroid/graphics/drawable/Animatable;

    goto :goto_1

    .line 6
    :cond_2
    :goto_0
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/request/target/ImageViewTarget;->setResourceInternal(Ljava/lang/Object;)V

    :goto_1
    return-void
.end method

.method public onStart()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/request/target/ImageViewTarget;->animatable:Landroid/graphics/drawable/Animatable;

    if-eqz p0, :cond_0

    .line 2
    invoke-interface {p0}, Landroid/graphics/drawable/Animatable;->start()V

    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/request/target/ImageViewTarget;->animatable:Landroid/graphics/drawable/Animatable;

    if-eqz p0, :cond_0

    .line 2
    invoke-interface {p0}, Landroid/graphics/drawable/Animatable;->stop()V

    :cond_0
    return-void
.end method

.method public abstract setResource(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "resource"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TZ;)V"
        }
    .end annotation
.end method

.method public final setResourceInternal(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "resource"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TZ;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/request/target/ImageViewTarget;->setResource(Ljava/lang/Object;)V

    .line 2
    instance-of v0, p1, Landroid/graphics/drawable/Animatable;

    if-eqz v0, :cond_0

    .line 3
    check-cast p1, Landroid/graphics/drawable/Animatable;

    iput-object p1, p0, Lcom/bumptech/glide/request/target/ImageViewTarget;->animatable:Landroid/graphics/drawable/Animatable;

    .line 4
    invoke-interface {p1}, Landroid/graphics/drawable/Animatable;->start()V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/bumptech/glide/request/target/ImageViewTarget;->animatable:Landroid/graphics/drawable/Animatable;

    :goto_0
    return-void
.end method
