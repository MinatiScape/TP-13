.class public final Lcom/google/android/gms/internal/zzgrs;
.super Ljava/io/IOException;
.source "SourceFile"


# direct methods
.method public constructor <init>(II)V
    .locals 3

    const/16 v0, 0x6c

    const-string v1, "CodedOutputStream was writing to a flat byte array and ran out of space (pos "

    const-string v2, " limit "

    .line 1
    invoke-static {v0, v1, p1, v2, p2}, Lcom/bumptech/glide/gifdecoder/GifHeaderParser$$ExternalSyntheticOutline0;->m(ILjava/lang/String;ILjava/lang/String;I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, ")."

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    return-void
.end method
