.class public Lcom/android/customization/model/grid/GridOptionsManager$FetchTask;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/customization/model/grid/GridOptionsManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FetchTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/util/List<",
        "Lcom/android/customization/model/grid/GridOption;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final mCallback:Lcom/android/customization/model/CustomizationManager$OptionsFetchedListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/customization/model/CustomizationManager$OptionsFetchedListener<",
            "Lcom/android/customization/model/grid/GridOption;",
            ">;"
        }
    .end annotation
.end field

.field public final mProvider:Lcom/android/customization/model/grid/LauncherGridOptionsProvider;

.field public final mReload:Z


# direct methods
.method public constructor <init>(Lcom/android/customization/model/grid/LauncherGridOptionsProvider;Lcom/android/customization/model/CustomizationManager$OptionsFetchedListener;ZLcom/android/customization/model/grid/GridOptionsManager$1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2
    iput-object p2, p0, Lcom/android/customization/model/grid/GridOptionsManager$FetchTask;->mCallback:Lcom/android/customization/model/CustomizationManager$OptionsFetchedListener;

    .line 3
    iput-object p1, p0, Lcom/android/customization/model/grid/GridOptionsManager$FetchTask;->mProvider:Lcom/android/customization/model/grid/LauncherGridOptionsProvider;

    .line 4
    iput-boolean p3, p0, Lcom/android/customization/model/grid/GridOptionsManager$FetchTask;->mReload:Z

    return-void
.end method


# virtual methods
.method public doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 16

    move-object/from16 v0, p0

    .line 1
    move-object/from16 v1, p1

    check-cast v1, [Ljava/lang/Void;

    .line 2
    iget-object v1, v0, Lcom/android/customization/model/grid/GridOptionsManager$FetchTask;->mProvider:Lcom/android/customization/model/grid/LauncherGridOptionsProvider;

    iget-boolean v0, v0, Lcom/android/customization/model/grid/GridOptionsManager$FetchTask;->mReload:Z

    .line 3
    iget-object v2, v1, Lcom/android/customization/model/grid/LauncherGridOptionsProvider;->mPreviewUtils:Lcom/android/wallpaper/util/PreviewUtils;

    .line 4
    iget-object v2, v2, Lcom/android/wallpaper/util/PreviewUtils;->mProviderInfo:Landroid/content/pm/ProviderInfo;

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    move v2, v4

    :goto_0
    const/4 v5, 0x0

    if-nez v2, :cond_1

    goto/16 :goto_4

    .line 5
    :cond_1
    iget-object v2, v1, Lcom/android/customization/model/grid/LauncherGridOptionsProvider;->mOptions:Ljava/util/List;

    if-eqz v2, :cond_2

    if-nez v0, :cond_2

    move-object v5, v2

    goto/16 :goto_4

    .line 6
    :cond_2
    iget-object v0, v1, Lcom/android/customization/model/grid/LauncherGridOptionsProvider;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    .line 7
    iget-object v0, v1, Lcom/android/customization/model/grid/LauncherGridOptionsProvider;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v2

    const-string v7, "config_icon_mask"

    const-string v8, "string"

    const-string v9, "android"

    invoke-virtual {v2, v7, v8, v9}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 8
    :try_start_0
    iget-object v2, v1, Lcom/android/customization/model/grid/LauncherGridOptionsProvider;->mPreviewUtils:Lcom/android/wallpaper/util/PreviewUtils;

    const-string v7, "list_options"

    invoke-virtual {v2, v7}, Lcom/android/wallpaper/util/PreviewUtils;->getUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual/range {v6 .. v11}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    :try_start_1
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, v1, Lcom/android/customization/model/grid/LauncherGridOptionsProvider;->mOptions:Ljava/util/List;

    .line 10
    :goto_1
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-eqz v6, :cond_3

    const-string v6, "name"

    .line 11
    invoke-interface {v2, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v2, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    const-string v6, "rows"

    .line 12
    invoke-interface {v2, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v2, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v11

    const-string v6, "cols"

    .line 13
    invoke-interface {v2, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v2, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    const-string v6, "preview_count"

    .line 14
    invoke-interface {v2, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v2, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v14

    const-string v6, "is_default"

    .line 15
    invoke-interface {v2, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v2, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v10

    .line 16
    iget-object v6, v1, Lcom/android/customization/model/grid/LauncherGridOptionsProvider;->mContext:Landroid/content/Context;

    const v7, 0x7f110093

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v8, v4

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v8, v3

    invoke-virtual {v6, v7, v8}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 17
    iget-object v6, v1, Lcom/android/customization/model/grid/LauncherGridOptionsProvider;->mOptions:Ljava/util/List;

    new-instance v15, Lcom/android/customization/model/grid/GridOption;

    iget-object v7, v1, Lcom/android/customization/model/grid/LauncherGridOptionsProvider;->mPreviewUtils:Lcom/android/wallpaper/util/PreviewUtils;

    const-string v13, "preview"

    .line 18
    invoke-virtual {v7, v13}, Lcom/android/wallpaper/util/PreviewUtils;->getUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v13

    move-object v7, v15

    move-object v3, v15

    move-object v15, v0

    invoke-direct/range {v7 .. v15}, Lcom/android/customization/model/grid/GridOption;-><init>(Ljava/lang/String;Ljava/lang/String;ZIILandroid/net/Uri;ILjava/lang/String;)V

    .line 19
    invoke-interface {v6, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v3, 0x1

    goto :goto_1

    .line 20
    :cond_3
    :try_start_2
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_3

    :catchall_0
    move-exception v0

    move-object v3, v0

    if-eqz v2, :cond_4

    .line 21
    :try_start_3
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v0

    move-object v2, v0

    :try_start_4
    invoke-virtual {v3, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_4
    :goto_2
    throw v3
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 22
    :catch_0
    iput-object v5, v1, Lcom/android/customization/model/grid/LauncherGridOptionsProvider;->mOptions:Ljava/util/List;

    .line 23
    :goto_3
    iget-object v5, v1, Lcom/android/customization/model/grid/LauncherGridOptionsProvider;->mOptions:Ljava/util/List;

    :goto_4
    return-object v5
.end method

.method public onCancelled()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/os/AsyncTask;->onCancelled()V

    .line 2
    iget-object p0, p0, Lcom/android/customization/model/grid/GridOptionsManager$FetchTask;->mCallback:Lcom/android/customization/model/CustomizationManager$OptionsFetchedListener;

    if-eqz p0, :cond_0

    const/4 v0, 0x0

    .line 3
    invoke-interface {p0, v0}, Lcom/android/customization/model/CustomizationManager$OptionsFetchedListener;->onError(Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public onPostExecute(Ljava/lang/Object;)V
    .locals 1

    .line 1
    check-cast p1, Ljava/util/List;

    .line 2
    iget-object v0, p0, Lcom/android/customization/model/grid/GridOptionsManager$FetchTask;->mCallback:Lcom/android/customization/model/CustomizationManager$OptionsFetchedListener;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    .line 3
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 4
    iget-object p0, p0, Lcom/android/customization/model/grid/GridOptionsManager$FetchTask;->mCallback:Lcom/android/customization/model/CustomizationManager$OptionsFetchedListener;

    invoke-interface {p0, p1}, Lcom/android/customization/model/CustomizationManager$OptionsFetchedListener;->onOptionsLoaded(Ljava/util/List;)V

    goto :goto_0

    .line 5
    :cond_0
    iget-object p0, p0, Lcom/android/customization/model/grid/GridOptionsManager$FetchTask;->mCallback:Lcom/android/customization/model/CustomizationManager$OptionsFetchedListener;

    const/4 p1, 0x0

    invoke-interface {p0, p1}, Lcom/android/customization/model/CustomizationManager$OptionsFetchedListener;->onError(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    return-void
.end method
