.class public Lcom/android/wallpaper/module/DefaultExploreIntentChecker;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/ExploreIntentChecker;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/wallpaper/module/DefaultExploreIntentChecker$FetchActionViewIntentTask;
    }
.end annotation


# instance fields
.field public mAppContext:Landroid/content/Context;

.field public mUriToActionViewIntentMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/net/Uri;",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultExploreIntentChecker;->mAppContext:Landroid/content/Context;

    .line 3
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultExploreIntentChecker;->mUriToActionViewIntentMap:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public fetchValidActionViewIntent(Landroid/net/Uri;Lcom/android/wallpaper/module/ExploreIntentChecker$IntentReceiver;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultExploreIntentChecker;->mUriToActionViewIntentMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultExploreIntentChecker;->mUriToActionViewIntentMap:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/Intent;

    invoke-interface {p2, p0}, Lcom/android/wallpaper/module/ExploreIntentChecker$IntentReceiver;->onIntentReceived(Landroid/content/Intent;)V

    return-void

    .line 3
    :cond_0
    new-instance v0, Lcom/android/wallpaper/module/DefaultExploreIntentChecker$FetchActionViewIntentTask;

    iget-object v1, p0, Lcom/android/wallpaper/module/DefaultExploreIntentChecker;->mAppContext:Landroid/content/Context;

    invoke-direct {v0, p0, v1, p1, p2}, Lcom/android/wallpaper/module/DefaultExploreIntentChecker$FetchActionViewIntentTask;-><init>(Lcom/android/wallpaper/module/DefaultExploreIntentChecker;Landroid/content/Context;Landroid/net/Uri;Lcom/android/wallpaper/module/ExploreIntentChecker$IntentReceiver;)V

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Void;

    invoke-virtual {v0, p0}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method
