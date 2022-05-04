.class public abstract Lcom/bumptech/glide/request/target/SimpleTarget;
.super Lcom/bumptech/glide/request/target/BaseTarget;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Z:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/bumptech/glide/request/target/BaseTarget<",
        "TZ;>;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final height:I

.field public final width:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/bumptech/glide/request/target/BaseTarget;-><init>()V

    const/high16 v0, -0x80000000

    .line 2
    iput v0, p0, Lcom/bumptech/glide/request/target/SimpleTarget;->width:I

    .line 3
    iput v0, p0, Lcom/bumptech/glide/request/target/SimpleTarget;->height:I

    return-void
.end method


# virtual methods
.method public final getSize(Lcom/bumptech/glide/request/target/SizeReadyCallback;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "cb"
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/bumptech/glide/request/target/SimpleTarget;->width:I

    iget v1, p0, Lcom/bumptech/glide/request/target/SimpleTarget;->height:I

    invoke-static {v0, v1}, Lcom/bumptech/glide/util/Util;->isValidDimensions(II)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2
    iget v0, p0, Lcom/bumptech/glide/request/target/SimpleTarget;->width:I

    iget p0, p0, Lcom/bumptech/glide/request/target/SimpleTarget;->height:I

    check-cast p1, Lcom/bumptech/glide/request/SingleRequest;

    invoke-virtual {p1, v0, p0}, Lcom/bumptech/glide/request/SingleRequest;->onSizeReady(II)V

    return-void

    .line 3
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    iget v0, p0, Lcom/bumptech/glide/request/target/SimpleTarget;->width:I

    iget p0, p0, Lcom/bumptech/glide/request/target/SimpleTarget;->height:I

    const/16 v1, 0xb0

    const-string v2, "Width and height must both be > 0 or Target#SIZE_ORIGINAL, but given width: "

    const-string v3, " and height: "

    invoke-static {v1, v2, v0, v3, p0}, Lcom/bumptech/glide/gifdecoder/GifHeaderParser$$ExternalSyntheticOutline0;->m(ILjava/lang/String;ILjava/lang/String;I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, ", either provide dimensions in the constructor or call override()"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public removeCallback(Lcom/bumptech/glide/request/target/SizeReadyCallback;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "cb"
        }
    .end annotation

    return-void
.end method
