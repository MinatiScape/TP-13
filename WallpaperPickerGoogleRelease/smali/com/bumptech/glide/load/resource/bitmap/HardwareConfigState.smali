.class public final Lcom/bumptech/glide/load/resource/bitmap/HardwareConfigState;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final FD_SIZE_LIST:Ljava/io/File;

.field public static volatile instance:Lcom/bumptech/glide/load/resource/bitmap/HardwareConfigState;


# instance fields
.field public volatile decodesSinceLastFdCheck:I

.field public volatile isHardwareConfigAllowed:Z


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/io/File;

    const-string v1, "/proc/self/fd"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/bumptech/glide/load/resource/bitmap/HardwareConfigState;->FD_SIZE_LIST:Ljava/io/File;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/bumptech/glide/load/resource/bitmap/HardwareConfigState;->isHardwareConfigAllowed:Z

    return-void
.end method
