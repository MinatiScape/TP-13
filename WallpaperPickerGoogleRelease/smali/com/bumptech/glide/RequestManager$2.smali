.class public Lcom/bumptech/glide/RequestManager$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bumptech/glide/RequestManager;->clear(Lcom/bumptech/glide/request/target/Target;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/bumptech/glide/RequestManager;

.field public final synthetic val$target:Lcom/bumptech/glide/request/target/Target;


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/RequestManager;Lcom/bumptech/glide/request/target/Target;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$target"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/bumptech/glide/RequestManager$2;->this$0:Lcom/bumptech/glide/RequestManager;

    iput-object p2, p0, Lcom/bumptech/glide/RequestManager$2;->val$target:Lcom/bumptech/glide/request/target/Target;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/RequestManager$2;->this$0:Lcom/bumptech/glide/RequestManager;

    iget-object p0, p0, Lcom/bumptech/glide/RequestManager$2;->val$target:Lcom/bumptech/glide/request/target/Target;

    invoke-virtual {v0, p0}, Lcom/bumptech/glide/RequestManager;->clear(Lcom/bumptech/glide/request/target/Target;)V

    return-void
.end method
