.class public Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/PackageStatusNotifier;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/module/DefaultPackageStatusNotifier$ListenerWrapper;
    }
.end annotation


# instance fields
.field public final mAppContext:Landroid/content/Context;

.field public final mLauncherApps:Landroid/content/pm/LauncherApps;

.field public final mListeners:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;",
            "Lcom/android/wallpaper/module/DefaultPackageStatusNotifier$ListenerWrapper;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;->mListeners:Ljava/util/Map;

    .line 3
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;->mAppContext:Landroid/content/Context;

    const-string v0, "launcherapps"

    .line 4
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/pm/LauncherApps;

    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;->mLauncherApps:Landroid/content/pm/LauncherApps;

    return-void
.end method


# virtual methods
.method public addListener(Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier$ListenerWrapper;

    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;->mAppContext:Landroid/content/Context;

    invoke-direct {v0, v1, p2, p1}, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier$ListenerWrapper;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;)V

    .line 2
    iget-object p2, p0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;->mListeners:Ljava/util/Map;

    invoke-interface {p2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier$ListenerWrapper;

    if-eqz p2, :cond_0

    .line 3
    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;->mLauncherApps:Landroid/content/pm/LauncherApps;

    invoke-virtual {v1, p2}, Landroid/content/pm/LauncherApps;->unregisterCallback(Landroid/content/pm/LauncherApps$Callback;)V

    .line 4
    :cond_0
    iget-object p2, p0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;->mListeners:Ljava/util/Map;

    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;->mLauncherApps:Landroid/content/pm/LauncherApps;

    invoke-virtual {p0, v0}, Landroid/content/pm/LauncherApps;->registerCallback(Landroid/content/pm/LauncherApps$Callback;)V

    return-void
.end method

.method public removeListener(Lcom/android/wallpaper/module/PackageStatusNotifier$Listener;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;->mListeners:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier$ListenerWrapper;

    if-eqz p1, :cond_0

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultPackageStatusNotifier;->mLauncherApps:Landroid/content/pm/LauncherApps;

    invoke-virtual {p0, p1}, Landroid/content/pm/LauncherApps;->unregisterCallback(Landroid/content/pm/LauncherApps$Callback;)V

    :cond_0
    return-void
.end method
