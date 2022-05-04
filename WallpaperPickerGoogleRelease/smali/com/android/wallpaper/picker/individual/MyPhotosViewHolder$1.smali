.class public Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder$1;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lcom/android/wallpaper/asset/Asset;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic val$context:Landroid/content/Context;

.field public final synthetic val$listener:Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder$AssetListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder$AssetListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder$1;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder$1;->val$listener:Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder$AssetListener;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method public doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    .line 1
    check-cast p1, [Ljava/lang/Void;

    const-string p1, "_id"

    const-string v0, "datetaken"

    .line 2
    filled-new-array {p1, v0}, [Ljava/lang/String;

    move-result-object v3

    .line 3
    iget-object p1, p0, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder$1;->val$context:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const-string v6, "datetaken DESC LIMIT 1"

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 4
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 5
    new-instance v0, Lcom/android/wallpaper/asset/ContentUriAsset;

    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder$1;->val$context:Landroid/content/Context;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v2, 0x0

    .line 6
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 7
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 8
    invoke-direct {v0, p0, v1, v2}, Lcom/android/wallpaper/asset/ContentUriAsset;-><init>(Landroid/content/Context;Landroid/net/Uri;Z)V

    .line 9
    :cond_0
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    :cond_1
    return-object v0
.end method

.method public onPostExecute(Ljava/lang/Object;)V
    .locals 2

    .line 1
    check-cast p1, Lcom/android/wallpaper/asset/Asset;

    .line 2
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder$1;->val$listener:Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder$AssetListener;

    check-cast p0, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder$2;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    if-nez p1, :cond_0

    goto :goto_0

    .line 3
    :cond_0
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder$2;->this$0:Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder;

    .line 4
    iget-object v0, p0, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder;->mActivity:Landroid/app/Activity;

    .line 5
    iget-object p0, p0, Lcom/android/wallpaper/picker/individual/MyPhotosViewHolder;->mThumbnailView:Landroid/widget/ImageView;

    const v1, 0x1010530

    .line 6
    invoke-static {v0, v1}, Landroidx/transition/R$id;->getColorAttr(Landroid/content/Context;I)I

    move-result v1

    .line 7
    invoke-virtual {p1, v0, p0, v1}, Lcom/android/wallpaper/asset/Asset;->loadDrawable(Landroid/content/Context;Landroid/widget/ImageView;I)V

    :goto_0
    return-void
.end method
