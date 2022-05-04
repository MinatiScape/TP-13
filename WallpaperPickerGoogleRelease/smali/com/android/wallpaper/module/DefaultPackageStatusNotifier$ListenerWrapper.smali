.class public Lcom/android/wallpaper/module/DefaultPackageStatusNotifier$ListenerWrapper;
.super Landroid/content/pm/LauncherApps$Callback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ListenerWrapper"
.end annotation


# instance fields
.field public final mAppContext:Landroid/content/Context;

.field public final mIntentFilter:Landroid/content/Intent;

.field public final mListener:Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/content/pm/LauncherApps$Callback;-><init>()V

    .line 2
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier$ListenerWrapper;->mAppContext:Landroid/content/Context;

    .line 3
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier$ListenerWrapper;->mIntentFilter:Landroid/content/Intent;

    .line 4
    iput-object p3, p0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier$ListenerWrapper;->mListener:Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;

    return-void
.end method


# virtual methods
.method public final isValidPackage(Ljava/lang/String;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier$ListenerWrapper;->mIntentFilter:Landroid/content/Intent;

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    iget-object p1, p0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier$ListenerWrapper;->mAppContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    .line 3
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier$ListenerWrapper;->mIntentFilter:Landroid/content/Intent;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier$ListenerWrapper;->mIntentFilter:Landroid/content/Intent;

    .line 4
    invoke-virtual {p1, p0, v1}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_1

    :cond_0
    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method public onPackageAdded(Ljava/lang/String;Landroid/os/UserHandle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier$ListenerWrapper;->isValidPackage(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier$ListenerWrapper;->mListener:Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;

    const/4 p2, 0x1

    invoke-interface {p0, p1, p2}, Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;->onPackageChanged(Ljava/lang/String;I)V

    :cond_0
    return-void
.end method

.method public onPackageChanged(Ljava/lang/String;Landroid/os/UserHandle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier$ListenerWrapper;->isValidPackage(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier$ListenerWrapper;->mListener:Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;

    const/4 p2, 0x2

    invoke-interface {p0, p1, p2}, Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;->onPackageChanged(Ljava/lang/String;I)V

    :cond_0
    return-void
.end method

.method public onPackageRemoved(Ljava/lang/String;Landroid/os/UserHandle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier$ListenerWrapper;->mListener:Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;

    const/4 p2, 0x3

    invoke-interface {p0, p1, p2}, Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;->onPackageChanged(Ljava/lang/String;I)V

    return-void
.end method

.method public onPackagesAvailable([Ljava/lang/String;Landroid/os/UserHandle;Z)V
    .locals 4

    .line 1
    array-length p2, p1

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p2, :cond_2

    aget-object v1, p1, v0

    .line 2
    invoke-virtual {p0, v1}, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier$ListenerWrapper;->isValidPackage(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 3
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier$ListenerWrapper;->mListener:Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;

    if-eqz p3, :cond_0

    const/4 v3, 0x2

    goto :goto_1

    :cond_0
    const/4 v3, 0x1

    :goto_1
    invoke-interface {v2, v1, v3}, Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;->onPackageChanged(Ljava/lang/String;I)V

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public onPackagesSuspended([Ljava/lang/String;Landroid/os/UserHandle;)V
    .locals 4

    .line 1
    array-length p2, p1

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p2, :cond_1

    aget-object v1, p1, v0

    .line 2
    invoke-virtual {p0, v1}, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier$ListenerWrapper;->isValidPackage(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 3
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier$ListenerWrapper;->mListener:Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;

    const/4 v3, 0x3

    invoke-interface {v2, v1, v3}, Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;->onPackageChanged(Ljava/lang/String;I)V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public onPackagesUnavailable([Ljava/lang/String;Landroid/os/UserHandle;Z)V
    .locals 4

    .line 1
    array-length p2, p1

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p2, :cond_1

    aget-object v1, p1, v0

    if-nez p3, :cond_0

    .line 2
    invoke-virtual {p0, v1}, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier$ListenerWrapper;->isValidPackage(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 3
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier$ListenerWrapper;->mListener:Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;

    const/4 v3, 0x3

    invoke-interface {v2, v1, v3}, Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;->onPackageChanged(Ljava/lang/String;I)V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public onPackagesUnsuspended([Ljava/lang/String;Landroid/os/UserHandle;)V
    .locals 4

    .line 1
    array-length p2, p1

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p2, :cond_1

    aget-object v1, p1, v0

    .line 2
    invoke-virtual {p0, v1}, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier$ListenerWrapper;->isValidPackage(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 3
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier$ListenerWrapper;->mListener:Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;

    const/4 v3, 0x1

    invoke-interface {v2, v1, v3}, Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;->onPackageChanged(Ljava/lang/String;I)V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method
