.class public final Lcom/android/systemui/flags/FlagManager$getFlagsFuture$1$1;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/systemui/flags/FlagManager$getFlagsFuture$1;->attachCompleter(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field public final synthetic $completer:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/android/systemui/flags/FlagManager$getFlagsFuture$1$1;->$completer:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/content/Intent;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "intent"

    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 1
    invoke-virtual {p0, p1}, Landroid/content/BroadcastReceiver;->getResultExtras(Z)Landroid/os/Bundle;

    move-result-object p2

    const/4 v0, 0x0

    if-nez p2, :cond_0

    move-object p2, v0

    goto :goto_0

    :cond_0
    const-string v1, "flags"

    .line 2
    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p2

    :goto_0
    const/4 v1, 0x1

    if-eqz p2, :cond_2

    .line 3
    iget-object p0, p0, Lcom/android/systemui/flags/FlagManager$getFlagsFuture$1$1;->$completer:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 4
    iput-boolean v1, p0, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->attemptedSetting:Z

    .line 5
    iget-object v2, p0, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->future:Landroidx/concurrent/futures/CallbackToFutureAdapter$SafeFuture;

    if-eqz v2, :cond_1

    .line 6
    iget-object v2, v2, Landroidx/concurrent/futures/CallbackToFutureAdapter$SafeFuture;->delegate:Landroidx/concurrent/futures/AbstractResolvableFuture;

    invoke-virtual {v2, p2}, Landroidx/concurrent/futures/AbstractResolvableFuture;->set(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    move p1, v1

    :cond_1
    if-eqz p1, :cond_4

    .line 7
    iput-object v0, p0, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->tag:Ljava/lang/Object;

    .line 8
    iput-object v0, p0, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->future:Landroidx/concurrent/futures/CallbackToFutureAdapter$SafeFuture;

    .line 9
    iput-object v0, p0, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->cancellationFuture:Landroidx/concurrent/futures/ResolvableFuture;

    goto :goto_1

    .line 10
    :cond_2
    iget-object p0, p0, Lcom/android/systemui/flags/FlagManager$getFlagsFuture$1$1;->$completer:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    new-instance p2, Lcom/android/systemui/flags/NoFlagResultsException;

    invoke-direct {p2}, Lcom/android/systemui/flags/NoFlagResultsException;-><init>()V

    .line 11
    iput-boolean v1, p0, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->attemptedSetting:Z

    .line 12
    iget-object v2, p0, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->future:Landroidx/concurrent/futures/CallbackToFutureAdapter$SafeFuture;

    if-eqz v2, :cond_3

    .line 13
    iget-object v2, v2, Landroidx/concurrent/futures/CallbackToFutureAdapter$SafeFuture;->delegate:Landroidx/concurrent/futures/AbstractResolvableFuture;

    invoke-virtual {v2, p2}, Landroidx/concurrent/futures/AbstractResolvableFuture;->setException(Ljava/lang/Throwable;)Z

    move-result p2

    if-eqz p2, :cond_3

    move p1, v1

    :cond_3
    if-eqz p1, :cond_4

    .line 14
    iput-object v0, p0, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->tag:Ljava/lang/Object;

    .line 15
    iput-object v0, p0, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->future:Landroidx/concurrent/futures/CallbackToFutureAdapter$SafeFuture;

    .line 16
    iput-object v0, p0, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->cancellationFuture:Landroidx/concurrent/futures/ResolvableFuture;

    :cond_4
    :goto_1
    return-void
.end method
