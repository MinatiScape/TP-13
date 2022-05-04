.class public Lcom/bumptech/glide/manager/DefaultConnectivityMonitor$1;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/manager/DefaultConnectivityMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/bumptech/glide/manager/DefaultConnectivityMonitor;


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/manager/DefaultConnectivityMonitor;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/bumptech/glide/manager/DefaultConnectivityMonitor$1;->this$0:Lcom/bumptech/glide/manager/DefaultConnectivityMonitor;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "intent"
        }
    .end annotation

    .line 1
    iget-object p2, p0, Lcom/bumptech/glide/manager/DefaultConnectivityMonitor$1;->this$0:Lcom/bumptech/glide/manager/DefaultConnectivityMonitor;

    iget-boolean v0, p2, Lcom/bumptech/glide/manager/DefaultConnectivityMonitor;->isConnected:Z

    .line 2
    invoke-virtual {p2, p1}, Lcom/bumptech/glide/manager/DefaultConnectivityMonitor;->isConnected(Landroid/content/Context;)Z

    move-result p1

    iput-boolean p1, p2, Lcom/bumptech/glide/manager/DefaultConnectivityMonitor;->isConnected:Z

    .line 3
    iget-object p1, p0, Lcom/bumptech/glide/manager/DefaultConnectivityMonitor$1;->this$0:Lcom/bumptech/glide/manager/DefaultConnectivityMonitor;

    iget-boolean p1, p1, Lcom/bumptech/glide/manager/DefaultConnectivityMonitor;->isConnected:Z

    if-eq v0, p1, :cond_3

    const/4 p1, 0x3

    const-string p2, "ConnectivityMonitor"

    .line 4
    invoke-static {p2, p1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 5
    iget-object p1, p0, Lcom/bumptech/glide/manager/DefaultConnectivityMonitor$1;->this$0:Lcom/bumptech/glide/manager/DefaultConnectivityMonitor;

    iget-boolean p1, p1, Lcom/bumptech/glide/manager/DefaultConnectivityMonitor;->isConnected:Z

    const/16 v0, 0x28

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v0, "connectivity changed, isConnected: "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/bumptech/glide/manager/DefaultConnectivityMonitor$1;->this$0:Lcom/bumptech/glide/manager/DefaultConnectivityMonitor;

    iget-object p1, p0, Lcom/bumptech/glide/manager/DefaultConnectivityMonitor;->listener:Lcom/bumptech/glide/manager/ConnectivityMonitor$ConnectivityListener;

    iget-boolean p0, p0, Lcom/bumptech/glide/manager/DefaultConnectivityMonitor;->isConnected:Z

    check-cast p1, Lcom/bumptech/glide/RequestManager$RequestManagerConnectivityListener;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p0, :cond_3

    .line 7
    iget-object p0, p1, Lcom/bumptech/glide/RequestManager$RequestManagerConnectivityListener;->requestTracker:Lcom/bumptech/glide/manager/RequestTracker;

    .line 8
    iget-object p1, p0, Lcom/bumptech/glide/manager/RequestTracker;->requests:Ljava/util/Set;

    invoke-static {p1}, Lcom/bumptech/glide/util/Util;->getSnapshot(Ljava/util/Collection;)Ljava/util/List;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/bumptech/glide/request/Request;

    .line 9
    invoke-interface {p2}, Lcom/bumptech/glide/request/Request;->isComplete()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-interface {p2}, Lcom/bumptech/glide/request/Request;->isCleared()Z

    move-result v0

    if-nez v0, :cond_1

    .line 10
    invoke-interface {p2}, Lcom/bumptech/glide/request/Request;->clear()V

    .line 11
    iget-boolean v0, p0, Lcom/bumptech/glide/manager/RequestTracker;->isPaused:Z

    if-nez v0, :cond_2

    .line 12
    invoke-interface {p2}, Lcom/bumptech/glide/request/Request;->begin()V

    goto :goto_0

    .line 13
    :cond_2
    iget-object v0, p0, Lcom/bumptech/glide/manager/RequestTracker;->pendingRequests:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    return-void
.end method
