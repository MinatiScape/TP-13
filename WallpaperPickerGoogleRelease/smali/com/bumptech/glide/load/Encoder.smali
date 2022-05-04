.class public interface abstract Lcom/bumptech/glide/load/Encoder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract encode(Ljava/lang/Object;Ljava/io/File;Lcom/bumptech/glide/load/Options;)Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "data",
            "file",
            "options"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/io/File;",
            "Lcom/bumptech/glide/load/Options;",
            ")Z"
        }
    .end annotation
.end method
