.class public final Lcom/google/protobuf/ArrayDecoders$Registers;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/protobuf/ArrayDecoders;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Registers"
.end annotation


# instance fields
.field public final extensionRegistry:Lcom/google/protobuf/ExtensionRegistryLite;

.field public int1:I

.field public long1:J

.field public object1:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/google/protobuf/ExtensionRegistryLite;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iput-object p1, p0, Lcom/google/protobuf/ArrayDecoders$Registers;->extensionRegistry:Lcom/google/protobuf/ExtensionRegistryLite;

    return-void
.end method
