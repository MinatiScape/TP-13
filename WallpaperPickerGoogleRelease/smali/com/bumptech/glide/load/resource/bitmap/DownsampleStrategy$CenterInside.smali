.class public Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy$CenterInside;
.super Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CenterInside"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;-><init>()V

    return-void
.end method


# virtual methods
.method public getSampleSizeRounding$enumunboxing$(IIII)I
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "sourceWidth",
            "sourceHeight",
            "requestedWidth",
            "requestedHeight"
        }
    .end annotation

    const/4 p0, 0x2

    return p0
.end method

.method public getScaleFactor(IIII)F
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "sourceWidth",
            "sourceHeight",
            "requestedWidth",
            "requestedHeight"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;->FIT_CENTER:Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;

    .line 2
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;->getScaleFactor(IIII)F

    move-result p0

    const/high16 p1, 0x3f800000    # 1.0f

    .line 3
    invoke-static {p1, p0}, Ljava/lang/Math;->min(FF)F

    move-result p0

    return p0
.end method
