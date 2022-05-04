.class public final Lcom/bumptech/glide/disklrucache/DiskLruCache$Entry;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/disklrucache/DiskLruCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "Entry"
.end annotation


# instance fields
.field public cleanFiles:[Ljava/io/File;

.field public currentEditor:Lcom/bumptech/glide/disklrucache/DiskLruCache$Editor;

.field public dirtyFiles:[Ljava/io/File;

.field public final key:Ljava/lang/String;

.field public final lengths:[J

.field public readable:Z

.field public sequenceNumber:J

.field public final synthetic this$0:Lcom/bumptech/glide/disklrucache/DiskLruCache;


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/disklrucache/DiskLruCache;Ljava/lang/String;Lcom/bumptech/glide/disklrucache/DiskLruCache$1;)V
    .locals 5

    .line 1
    iput-object p1, p0, Lcom/bumptech/glide/disklrucache/DiskLruCache$Entry;->this$0:Lcom/bumptech/glide/disklrucache/DiskLruCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p2, p0, Lcom/bumptech/glide/disklrucache/DiskLruCache$Entry;->key:Ljava/lang/String;

    .line 3
    iget p3, p1, Lcom/bumptech/glide/disklrucache/DiskLruCache;->valueCount:I

    .line 4
    new-array v0, p3, [J

    iput-object v0, p0, Lcom/bumptech/glide/disklrucache/DiskLruCache$Entry;->lengths:[J

    .line 5
    new-array v0, p3, [Ljava/io/File;

    iput-object v0, p0, Lcom/bumptech/glide/disklrucache/DiskLruCache$Entry;->cleanFiles:[Ljava/io/File;

    .line 6
    new-array p3, p3, [Ljava/io/File;

    iput-object p3, p0, Lcom/bumptech/glide/disklrucache/DiskLruCache$Entry;->dirtyFiles:[Ljava/io/File;

    .line 7
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 p2, 0x2e

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 8
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->length()I

    move-result p2

    const/4 v0, 0x0

    .line 9
    :goto_0
    iget v1, p1, Lcom/bumptech/glide/disklrucache/DiskLruCache;->valueCount:I

    if-ge v0, v1, :cond_0

    .line 10
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    iget-object v1, p0, Lcom/bumptech/glide/disklrucache/DiskLruCache$Entry;->cleanFiles:[Ljava/io/File;

    new-instance v2, Ljava/io/File;

    .line 12
    iget-object v3, p1, Lcom/bumptech/glide/disklrucache/DiskLruCache;->directory:Ljava/io/File;

    .line 13
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    aput-object v2, v1, v0

    const-string v1, ".tmp"

    .line 14
    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    iget-object v1, p0, Lcom/bumptech/glide/disklrucache/DiskLruCache$Entry;->dirtyFiles:[Ljava/io/File;

    new-instance v2, Ljava/io/File;

    .line 16
    iget-object v3, p1, Lcom/bumptech/glide/disklrucache/DiskLruCache;->directory:Ljava/io/File;

    .line 17
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    aput-object v2, v1, v0

    .line 18
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->setLength(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public getLengths()Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2
    iget-object p0, p0, Lcom/bumptech/glide/disklrucache/DiskLruCache$Entry;->lengths:[J

    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-wide v3, p0, v2

    const/16 v5, 0x20

    .line 3
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final invalidLengths([Ljava/lang/String;)Ljava/io/IOException;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "strings"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/io/IOException;

    invoke-static {p1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const-string v1, "unexpected journal line: "

    if-eqz v0, :cond_0

    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
