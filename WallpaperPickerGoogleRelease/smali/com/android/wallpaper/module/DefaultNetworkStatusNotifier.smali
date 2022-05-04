.class public Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/NetworkStatusNotifier;


# instance fields
.field public mAppContext:Landroid/content/Context;

.field public mConnectivityManager:Landroid/net/ConnectivityManager;

.field public mListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/wallpaper/module/NetworkStatusNotifier$Listener;",
            ">;"
        }
    .end annotation
.end field

.field public mReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;->mAppContext:Landroid/content/Context;

    const-string v0, "connectivity"

    .line 3
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/ConnectivityManager;

    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;->mConnectivityManager:Landroid/net/ConnectivityManager;

    .line 4
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;->mListeners:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getNetworkStatus()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;->mConnectivityManager:Landroid/net/ConnectivityManager;

    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 2
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public registerListener(Lcom/android/wallpaper/module/NetworkStatusNotifier$Listener;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;->mReceiver:Landroid/content/BroadcastReceiver;

    if-nez v0, :cond_1

    .line 2
    new-instance v0, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier$1;

    invoke-direct {v0, p0}, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier$1;-><init>(Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;)V

    iput-object v0, p0, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 3
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    .line 4
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 5
    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;->mListeners:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 6
    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;->mListeners:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 7
    :cond_0
    iget-object p1, p0, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;->mAppContext:Landroid/content/Context;

    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, p0, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void

    .line 8
    :cond_1
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;->mListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 9
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;->mListeners:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    return-void
.end method

.method public unregisterListener(Lcom/android/wallpaper/module/NetworkStatusNotifier$Listener;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;->mListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;->mListeners:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;->mReceiver:Landroid/content/BroadcastReceiver;

    if-nez p1, :cond_0

    goto :goto_0

    .line 3
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;->mAppContext:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultNetworkStatusNotifier;->mReceiver:Landroid/content/BroadcastReceiver;

    :cond_1
    :goto_0
    return-void
.end method
