.class public Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier$1;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;->registerListener(Lcom/android/wallpaper/module/NetworkStatusNotifier$Listener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier$1;->this$0:Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier$1;->this$0:Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;

    invoke-virtual {p1}, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;->getNetworkStatus()I

    move-result p1

    const/4 p2, 0x0

    .line 2
    :goto_0
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier$1;->this$0:Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;

    .line 3
    iget-object v0, v0, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;->mListeners:Ljava/util/List;

    .line 4
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p2, v0, :cond_0

    .line 5
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier$1;->this$0:Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;

    .line 6
    iget-object v0, v0, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;->mListeners:Ljava/util/List;

    .line 7
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/wallpaper/module/NetworkStatusNotifier$Listener;

    invoke-interface {v0, p1}, Lcom/android/wallpaper/module/NetworkStatusNotifier$Listener;->onNetworkChanged(I)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
