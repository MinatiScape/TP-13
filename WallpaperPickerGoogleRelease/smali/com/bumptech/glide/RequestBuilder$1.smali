.class public Lcom/bumptech/glide/RequestBuilder$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic this$0:Lcom/bumptech/glide/RequestBuilder;

.field public final synthetic val$target:Lcom/bumptech/glide/request/RequestFutureTarget;


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/RequestBuilder;Lcom/bumptech/glide/request/RequestFutureTarget;)V
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
    iput-object p1, p0, Lcom/bumptech/glide/RequestBuilder$1;->this$0:Lcom/bumptech/glide/RequestBuilder;

    iput-object p2, p0, Lcom/bumptech/glide/RequestBuilder$1;->val$target:Lcom/bumptech/glide/request/RequestFutureTarget;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/bumptech/glide/RequestBuilder$1;->val$target:Lcom/bumptech/glide/request/RequestFutureTarget;

    invoke-virtual {v0}, Lcom/bumptech/glide/request/RequestFutureTarget;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2
    iget-object v0, p0, Lcom/bumptech/glide/RequestBuilder$1;->this$0:Lcom/bumptech/glide/RequestBuilder;

    iget-object p0, p0, Lcom/bumptech/glide/RequestBuilder$1;->val$target:Lcom/bumptech/glide/request/RequestFutureTarget;

    .line 3
    invoke-virtual {v0, p0, p0, v0}, Lcom/bumptech/glide/RequestBuilder;->into(Lcom/bumptech/glide/request/target/Target;Lcom/bumptech/glide/request/RequestListener;Lcom/bumptech/glide/request/BaseRequestOptions;)Lcom/bumptech/glide/request/target/Target;

    :cond_0
    return-void
.end method
