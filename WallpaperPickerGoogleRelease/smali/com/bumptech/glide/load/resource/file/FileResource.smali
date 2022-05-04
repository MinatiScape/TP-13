.class public Lcom/bumptech/glide/load/resource/file/FileResource;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/load/engine/Resource;


# instance fields
.field public final data:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "file"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "Argument must not be null"

    .line 2
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 3
    iput-object p1, p0, Lcom/bumptech/glide/load/resource/file/FileResource;->data:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/load/resource/file/FileResource;->data:Ljava/lang/Object;

    return-object p0
.end method

.method public getResourceClass()Ljava/lang/Class;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bumptech/glide/load/resource/file/FileResource;->data:Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    return-object p0
.end method

.method public final bridge synthetic getSize()I
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public bridge synthetic recycle()V
    .locals 0

    return-void
.end method
