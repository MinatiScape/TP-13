.class public Lcom/google/android/apps/wallpaper/asset/NetworkAsset$1;
.super Lcom/bumptech/glide/request/target/SimpleTarget;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/apps/wallpaper/asset/NetworkAsset;->decodeRawDimensions(Landroid/app/Activity;Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bumptech/glide/request/target/SimpleTarget<",
        "Ljava/io/File;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/google/android/apps/wallpaper/asset/NetworkAsset;

.field public final synthetic val$receiver:Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;


# direct methods
.method public constructor <init>(Lcom/google/android/apps/wallpaper/asset/NetworkAsset;Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset$1;->this$0:Lcom/google/android/apps/wallpaper/asset/NetworkAsset;

    iput-object p2, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset$1;->val$receiver:Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;

    invoke-direct {p0}, Lcom/bumptech/glide/request/target/SimpleTarget;-><init>()V

    return-void
.end method


# virtual methods
.method public onLoadFailed(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset$1;->val$receiver:Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;

    const/4 p1, 0x0

    invoke-interface {p0, p1}, Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;->onDimensionsDecoded(Landroid/graphics/Point;)V

    return-void
.end method

.method public onResourceReady(Ljava/lang/Object;Lcom/bumptech/glide/request/transition/Transition;)V
    .locals 1

    .line 1
    check-cast p1, Ljava/io/File;

    .line 2
    new-instance p2, Lcom/google/android/apps/wallpaper/asset/NetworkAsset$DecodeDimensionsAsyncTask;

    iget-object v0, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset$1;->this$0:Lcom/google/android/apps/wallpaper/asset/NetworkAsset;

    iget-object p0, p0, Lcom/google/android/apps/wallpaper/asset/NetworkAsset$1;->val$receiver:Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;

    invoke-direct {p2, v0, p1, p0}, Lcom/google/android/apps/wallpaper/asset/NetworkAsset$DecodeDimensionsAsyncTask;-><init>(Lcom/google/android/apps/wallpaper/asset/NetworkAsset;Ljava/io/File;Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;)V

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Void;

    .line 3
    invoke-virtual {p2, p0}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method
