.class public Lcom/android/wallpaper/asset/StreamableAsset$1;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/io/InputStream;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/asset/StreamableAsset;

.field public final synthetic val$streamReceiver:Lcom/android/wallpaper/asset/StreamableAsset$StreamReceiver;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/asset/StreamableAsset;Lcom/android/wallpaper/asset/StreamableAsset$StreamReceiver;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/asset/StreamableAsset$1;->this$0:Lcom/android/wallpaper/asset/StreamableAsset;

    iput-object p2, p0, Lcom/android/wallpaper/asset/StreamableAsset$1;->val$streamReceiver:Lcom/android/wallpaper/asset/StreamableAsset$StreamReceiver;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method public doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, [Ljava/lang/Void;

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/asset/StreamableAsset$1;->this$0:Lcom/android/wallpaper/asset/StreamableAsset;

    invoke-virtual {p0}, Lcom/android/wallpaper/asset/StreamableAsset;->openInputStream()Ljava/io/InputStream;

    move-result-object p0

    return-object p0
.end method

.method public onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/io/InputStream;

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/asset/StreamableAsset$1;->val$streamReceiver:Lcom/android/wallpaper/asset/StreamableAsset$StreamReceiver;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/asset/StreamableAsset$StreamReceiver;->onInputStreamOpened(Ljava/io/InputStream;)V

    return-void
.end method
