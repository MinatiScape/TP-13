.class public final Lcom/bumptech/glide/load/model/DataUrlLoader$DataUriFetcher;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/load/data/DataFetcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/model/DataUrlLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "DataUriFetcher"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Data:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/data/DataFetcher<",
        "TData;>;"
    }
.end annotation


# instance fields
.field public data:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TData;"
        }
    .end annotation
.end field

.field public final dataUri:Ljava/lang/String;

.field public final reader:Lcom/bumptech/glide/load/model/DataUrlLoader$DataDecoder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/model/DataUrlLoader$DataDecoder<",
            "TData;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/bumptech/glide/load/model/DataUrlLoader$DataDecoder;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dataUri",
            "reader"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/bumptech/glide/load/model/DataUrlLoader$DataDecoder<",
            "TData;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/bumptech/glide/load/model/DataUrlLoader$DataUriFetcher;->dataUri:Ljava/lang/String;

    .line 3
    iput-object p2, p0, Lcom/bumptech/glide/load/model/DataUrlLoader$DataUriFetcher;->reader:Lcom/bumptech/glide/load/model/DataUrlLoader$DataDecoder;

    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 0

    return-void
.end method

.method public cleanup()V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/bumptech/glide/load/model/DataUrlLoader$DataUriFetcher;->reader:Lcom/bumptech/glide/load/model/DataUrlLoader$DataDecoder;

    iget-object p0, p0, Lcom/bumptech/glide/load/model/DataUrlLoader$DataUriFetcher;->data:Ljava/lang/Object;

    check-cast v0, Lcom/bumptech/glide/load/model/DataUrlLoader$StreamFactory$1;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    check-cast p0, Ljava/io/InputStream;

    .line 3
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public getDataClass()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "TData;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/load/model/DataUrlLoader$DataUriFetcher;->reader:Lcom/bumptech/glide/load/model/DataUrlLoader$DataDecoder;

    check-cast p0, Lcom/bumptech/glide/load/model/DataUrlLoader$StreamFactory$1;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    const-class p0, Ljava/io/InputStream;

    return-object p0
.end method

.method public getDataSource()Lcom/bumptech/glide/load/DataSource;
    .locals 0

    .line 1
    sget-object p0, Lcom/bumptech/glide/load/DataSource;->LOCAL:Lcom/bumptech/glide/load/DataSource;

    return-object p0
.end method

.method public loadData(Lcom/bumptech/glide/Priority;Lcom/bumptech/glide/load/data/DataFetcher$DataCallback;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "priority",
            "callback"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/Priority;",
            "Lcom/bumptech/glide/load/data/DataFetcher$DataCallback<",
            "-TData;>;)V"
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object p1, p0, Lcom/bumptech/glide/load/model/DataUrlLoader$DataUriFetcher;->reader:Lcom/bumptech/glide/load/model/DataUrlLoader$DataDecoder;

    iget-object v0, p0, Lcom/bumptech/glide/load/model/DataUrlLoader$DataUriFetcher;->dataUri:Ljava/lang/String;

    check-cast p1, Lcom/bumptech/glide/load/model/DataUrlLoader$StreamFactory$1;

    invoke-virtual {p1, v0}, Lcom/bumptech/glide/load/model/DataUrlLoader$StreamFactory$1;->decode(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lcom/bumptech/glide/load/model/DataUrlLoader$DataUriFetcher;->data:Ljava/lang/Object;

    .line 2
    invoke-interface {p2, p1}, Lcom/bumptech/glide/load/data/DataFetcher$DataCallback;->onDataReady(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 3
    invoke-interface {p2, p0}, Lcom/bumptech/glide/load/data/DataFetcher$DataCallback;->onLoadFailed(Ljava/lang/Exception;)V

    :goto_0
    return-void
.end method
