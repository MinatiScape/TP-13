.class public Lcom/adobe/xmp/impl/XMPMetaImpl$2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic val$value:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Lcom/adobe/xmp/impl/XMPNode;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            "this$0",
            "val$value",
            "val$propNode"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/adobe/xmp/impl/XMPMetaImpl$2;->val$value:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/adobe/xmp/impl/XMPMetaImpl$2;->val$value:Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
