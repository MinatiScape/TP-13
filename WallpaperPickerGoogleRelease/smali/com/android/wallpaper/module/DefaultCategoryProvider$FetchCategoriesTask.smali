.class public Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/module/DefaultCategoryProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FetchCategoriesTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Lcom/android/wallpaper/model/Category;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# static fields
.field public static final synthetic $r8$clinit:I


# instance fields
.field public final mAppContext:Landroid/content/Context;

.field public mPartnerProvider:Lcom/android/wallpaper/module/PartnerProvider;

.field public mReceiver:Lcom/android/wallpaper/model/CategoryReceiver;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/model/CategoryReceiver;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->mReceiver:Lcom/android/wallpaper/model/CategoryReceiver;

    .line 3
    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->mAppContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Void;

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->mReceiver:Lcom/android/wallpaper/model/CategoryReceiver;

    invoke-interface {p0}, Lcom/android/wallpaper/model/CategoryReceiver;->doneFetchingCategories()V

    return-void
.end method

.method public onProgressUpdate([Ljava/lang/Object;)V
    .locals 3

    .line 1
    check-cast p1, [Lcom/android/wallpaper/model/Category;

    .line 2
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onProgressUpdate([Ljava/lang/Object;)V

    const/4 v0, 0x0

    .line 3
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_1

    .line 4
    aget-object v1, p1, v0

    if-eqz v1, :cond_0

    .line 5
    iget-object v2, p0, Lcom/android/wallpaper/module/DefaultCategoryProvider$FetchCategoriesTask;->mReceiver:Lcom/android/wallpaper/model/CategoryReceiver;

    invoke-interface {v2, v1}, Lcom/android/wallpaper/model/CategoryReceiver;->onCategoryReceived(Lcom/android/wallpaper/model/Category;)V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method
