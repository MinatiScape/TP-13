.class public final synthetic Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$$Lambda$8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$ThrowableSupplier;


# static fields
.field public static final $instance:Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$ThrowableSupplier;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$$Lambda$8;

    invoke-direct {v0}, Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$$Lambda$8;-><init>()V

    sput-object v0, Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$$Lambda$8;->$instance:Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata$ThrowableSupplier;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public get()Ljava/lang/Object;
    .locals 0

    const-string p0, "determining file format version"

    .line 1
    invoke-static {p0}, Lcom/google/android/libraries/microvideo/MicrovideoXmpMetadata;->requiredValueMissing(Ljava/lang/String;)Ljava/lang/Object;

    const/4 p0, 0x0

    throw p0
.end method
