.class public Lcom/bumptech/glide/gifdecoder/GifHeader;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public bgColor:I

.field public bgIndex:I

.field public currentFrame:Lcom/bumptech/glide/gifdecoder/GifFrame;

.field public frameCount:I

.field public final frames:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/bumptech/glide/gifdecoder/GifFrame;",
            ">;"
        }
    .end annotation
.end field

.field public gct:[I

.field public gctFlag:Z

.field public gctSize:I

.field public height:I

.field public status:I

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/bumptech/glide/gifdecoder/GifHeader;->gct:[I

    const/4 v0, 0x0

    .line 3
    iput v0, p0, Lcom/bumptech/glide/gifdecoder/GifHeader;->status:I

    .line 4
    iput v0, p0, Lcom/bumptech/glide/gifdecoder/GifHeader;->frameCount:I

    .line 5
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/gifdecoder/GifHeader;->frames:Ljava/util/List;

    return-void
.end method
