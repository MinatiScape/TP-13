.class public interface abstract Lcom/bumptech/glide/load/Key;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final CHARSET:Ljava/nio/charset/Charset;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "UTF-8"

    .line 1
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/load/Key;->CHARSET:Ljava/nio/charset/Charset;

    return-void
.end method


# virtual methods
.method public abstract equals(Ljava/lang/Object;)Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation
.end method

.method public abstract hashCode()I
.end method

.method public abstract updateDiskCacheKey(Ljava/security/MessageDigest;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "messageDigest"
        }
    .end annotation
.end method
