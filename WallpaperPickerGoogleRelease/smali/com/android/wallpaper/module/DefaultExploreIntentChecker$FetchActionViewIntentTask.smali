.class public Lcom/android/wallpaper/module/DefaultExploreIntentChecker$FetchActionViewIntentTask;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/module/DefaultExploreIntentChecker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "FetchActionViewIntentTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Landroid/content/Intent;",
        ">;"
    }
.end annotation


# instance fields
.field public mAppContext:Landroid/content/Context;

.field public mReceiver:Lcom/android/wallpaper/module/ExploreIntentChecker$IntentReceiver;

.field public mUri:Landroid/net/Uri;

.field public final synthetic this$0:Lcom/android/wallpaper/module/DefaultExploreIntentChecker;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/module/DefaultExploreIntentChecker;Landroid/content/Context;Landroid/net/Uri;Lcom/android/wallpaper/module/ExploreIntentChecker$IntentReceiver;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultExploreIntentChecker$FetchActionViewIntentTask;->this$0:Lcom/android/wallpaper/module/DefaultExploreIntentChecker;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2
    iput-object p2, p0, Lcom/android/wallpaper/module/DefaultExploreIntentChecker$FetchActionViewIntentTask;->mAppContext:Landroid/content/Context;

    .line 3
    iput-object p3, p0, Lcom/android/wallpaper/module/DefaultExploreIntentChecker$FetchActionViewIntentTask;->mUri:Landroid/net/Uri;

    .line 4
    iput-object p4, p0, Lcom/android/wallpaper/module/DefaultExploreIntentChecker$FetchActionViewIntentTask;->mReceiver:Lcom/android/wallpaper/module/ExploreIntentChecker$IntentReceiver;

    return-void
.end method


# virtual methods
.method public doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    check-cast p1, [Ljava/lang/Void;

    .line 2
    new-instance p1, Landroid/content/Intent;

    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultExploreIntentChecker$FetchActionViewIntentTask;->mUri:Landroid/net/Uri;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {p1, v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 3
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultExploreIntentChecker$FetchActionViewIntentTask;->mAppContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, p1, v1}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultExploreIntentChecker$FetchActionViewIntentTask;->this$0:Lcom/android/wallpaper/module/DefaultExploreIntentChecker;

    .line 7
    iget-object v0, v0, Lcom/android/wallpaper/module/DefaultExploreIntentChecker;->mUriToActionViewIntentMap:Ljava/util/Map;

    .line 8
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultExploreIntentChecker$FetchActionViewIntentTask;->mUri:Landroid/net/Uri;

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p1
.end method

.method public onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/content/Intent;

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultExploreIntentChecker$FetchActionViewIntentTask;->mReceiver:Lcom/android/wallpaper/module/ExploreIntentChecker$IntentReceiver;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/module/ExploreIntentChecker$IntentReceiver;->onIntentReceived(Landroid/content/Intent;)V

    return-void
.end method
