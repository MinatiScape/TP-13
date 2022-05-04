.class public Lcom/bumptech/glide/manager/RequestManagerFragment$FragmentRequestManagerTreeNode;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bumptech/glide/manager/RequestManagerTreeNode;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/manager/RequestManagerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "FragmentRequestManagerTreeNode"
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/bumptech/glide/manager/RequestManagerFragment;


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/manager/RequestManagerFragment;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/bumptech/glide/manager/RequestManagerFragment$FragmentRequestManagerTreeNode;->this$0:Lcom/bumptech/glide/manager/RequestManagerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object p0, p0, Lcom/bumptech/glide/manager/RequestManagerFragment$FragmentRequestManagerTreeNode;->this$0:Lcom/bumptech/glide/manager/RequestManagerFragment;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const/16 v1, 0xb

    invoke-static {v0, v1}, Lcom/adobe/xmp/XMPPathFactory$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)I

    move-result v1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, v1

    const-string v1, "{fragment="

    const-string v3, "}"

    invoke-static {v2, v0, v1, p0, v3}, Lcom/bumptech/glide/Registry$NoModelLoaderAvailableException$$ExternalSyntheticOutline1;->m(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
