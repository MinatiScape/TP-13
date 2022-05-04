.class public final Lcom/davemorrissey/labs/subscaleview/ImageSource;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final bitmap:Landroid/graphics/Bitmap;

.field public cached:Z

.field public final resource:Ljava/lang/Integer;

.field public sHeight:I

.field public sWidth:I

.field public tile:Z

.field public final uri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 20
    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->bitmap:Landroid/graphics/Bitmap;

    .line 21
    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->uri:Landroid/net/Uri;

    .line 22
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->resource:Ljava/lang/Integer;

    const/4 p1, 0x1

    .line 23
    iput-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->tile:Z

    return-void
.end method

.method public constructor <init>(Landroid/graphics/Bitmap;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->bitmap:Landroid/graphics/Bitmap;

    const/4 v0, 0x0

    .line 3
    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->uri:Landroid/net/Uri;

    .line 4
    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->resource:Ljava/lang/Integer;

    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->tile:Z

    .line 6
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->sWidth:I

    .line 7
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->sHeight:I

    .line 8
    iput-boolean p2, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->cached:Z

    return-void
.end method

.method public constructor <init>(Landroid/net/Uri;)V
    .locals 3

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "file:///"

    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 12
    new-instance v1, Ljava/io/File;

    const/4 v2, 0x7

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 13
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    :try_start_0
    const-string v1, "UTF-8"

    .line 14
    invoke-static {v0, v1}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->bitmap:Landroid/graphics/Bitmap;

    .line 16
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->uri:Landroid/net/Uri;

    .line 17
    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->resource:Ljava/lang/Integer;

    const/4 p1, 0x1

    .line 18
    iput-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/ImageSource;->tile:Z

    return-void
.end method
