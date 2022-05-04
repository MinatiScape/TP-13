.class public Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/module/DefaultWallpaperPersister;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SetWallpaperTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field public mBitmap:Landroid/graphics/Bitmap;

.field public final mCallback:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

.field public final mDestination:I

.field public mFillSize:Landroid/graphics/Point;

.field public mInputStream:Ljava/io/InputStream;

.field public mStretchSize:Landroid/graphics/Point;

.field public final mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

.field public final synthetic this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/module/DefaultWallpaperPersister;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/graphics/Bitmap;ILcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 2
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 3
    iput-object p2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 4
    iput-object p3, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mBitmap:Landroid/graphics/Bitmap;

    .line 5
    iput p4, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mDestination:I

    .line 6
    iput-object p5, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mCallback:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

    return-void
.end method

.method public constructor <init>(Lcom/android/wallpaper/module/DefaultWallpaperPersister;Lcom/android/wallpaper/model/WallpaperInfo;Ljava/io/InputStream;ILcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;)V
    .locals 0

    .line 7
    iput-object p1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 8
    iput-object p2, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 9
    iput-object p3, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mInputStream:Ljava/io/InputStream;

    .line 10
    iput p4, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mDestination:I

    .line 11
    iput-object p5, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mCallback:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

    return-void
.end method


# virtual methods
.method public doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 25

    move-object/from16 v0, p0

    .line 1
    move-object/from16 v1, p1

    check-cast v1, [Ljava/lang/Void;

    .line 2
    iget v1, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mDestination:I

    const/4 v2, 0x1

    const/4 v3, 0x2

    if-nez v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    if-ne v1, v2, :cond_1

    move v1, v3

    goto :goto_0

    :cond_1
    const/4 v1, 0x3

    .line 3
    :goto_0
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object v4

    invoke-interface {v4}, Lcom/android/wallpaper/module/Injector;->getWallpaperStatusChecker()Lcom/google/android/material/shape/EdgeTreatment;

    move-result-object v4

    iget-object v5, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 4
    iget-object v5, v5, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mAppContext:Landroid/content/Context;

    .line 5
    invoke-virtual {v4, v5}, Lcom/google/android/material/shape/EdgeTreatment;->isLockWallpaperSet(Landroid/content/Context;)Z

    move-result v4

    .line 6
    iget-object v5, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    invoke-virtual {v5}, Lcom/android/wallpaper/model/WallpaperInfo;->getBackupPermission()I

    move-result v5

    const/4 v6, 0x0

    if-ne v5, v2, :cond_2

    move v5, v2

    goto :goto_1

    :cond_2
    move v5, v6

    .line 7
    :goto_1
    iget-object v15, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mBitmap:Landroid/graphics/Bitmap;

    const-string v14, "WallpaperPersister"

    const/4 v13, 0x0

    if-eqz v15, :cond_5

    .line 8
    iget-object v7, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mFillSize:Landroid/graphics/Point;

    if-eqz v7, :cond_3

    .line 9
    iget v8, v7, Landroid/graphics/Point;->x:I

    iget v7, v7, Landroid/graphics/Point;->y:I

    sget-object v9, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v8, v7, v9}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v12

    const/high16 v7, -0x1000000

    .line 10
    invoke-virtual {v12, v7}, Landroid/graphics/Bitmap;->eraseColor(I)V

    .line 11
    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    invoke-virtual {v12}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    sub-int/2addr v7, v8

    div-int/lit8 v11, v7, 0x2

    .line 12
    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    invoke-virtual {v12}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    sub-int/2addr v7, v8

    div-int/lit8 v10, v7, 0x2

    .line 13
    invoke-virtual {v12}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 14
    invoke-virtual {v12}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v9

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v8

    mul-int/2addr v8, v7

    .line 15
    new-array v9, v8, [I

    .line 16
    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v16

    .line 17
    invoke-static {v6, v11}, Ljava/lang/Math;->max(II)I

    move-result v17

    .line 18
    invoke-static {v6, v10}, Ljava/lang/Math;->max(II)I

    move-result v18

    .line 19
    invoke-virtual {v12}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v19

    .line 20
    invoke-virtual {v12}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v20

    const/16 v21, 0x0

    move-object v7, v15

    move-object v8, v9

    move-object/from16 v22, v9

    move/from16 v9, v21

    move/from16 v21, v10

    move/from16 v10, v16

    move/from16 v16, v11

    move/from16 v11, v17

    move-object/from16 p1, v12

    move/from16 v12, v18

    move-object v3, v13

    move/from16 v13, v19

    move-object/from16 v24, v14

    move/from16 v14, v20

    .line 21
    invoke-virtual/range {v7 .. v14}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 22
    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v19

    mul-int/lit8 v11, v16, -0x1

    .line 23
    invoke-static {v6, v11}, Ljava/lang/Math;->max(II)I

    move-result v20

    mul-int/lit8 v10, v21, -0x1

    .line 24
    invoke-static {v6, v10}, Ljava/lang/Math;->max(II)I

    move-result v21

    .line 25
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 26
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v23

    const/16 v18, 0x0

    move-object/from16 v16, p1

    move-object/from16 v17, v22

    move/from16 v22, v6

    .line 27
    invoke-virtual/range {v16 .. v23}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    move-object/from16 v6, p1

    .line 28
    iput-object v6, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mBitmap:Landroid/graphics/Bitmap;

    goto :goto_2

    :cond_3
    move-object v3, v13

    move-object/from16 v24, v14

    .line 29
    :goto_2
    iget-object v6, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mStretchSize:Landroid/graphics/Point;

    if-eqz v6, :cond_4

    .line 30
    iget-object v7, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mBitmap:Landroid/graphics/Bitmap;

    iget v8, v6, Landroid/graphics/Point;->x:I

    iget v6, v6, Landroid/graphics/Point;->y:I

    invoke-static {v7, v8, v6, v2}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v6

    iput-object v6, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mBitmap:Landroid/graphics/Bitmap;

    .line 31
    :cond_4
    iget-object v6, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    iget-object v7, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v6, v7, v5, v1}, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->setBitmapToWallpaperManagerCompat(Landroid/graphics/Bitmap;ZI)I

    move-result v6

    goto :goto_3

    :cond_5
    move-object v3, v13

    move-object/from16 v24, v14

    .line 32
    iget-object v7, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mInputStream:Ljava/io/InputStream;

    if-eqz v7, :cond_6

    .line 33
    iget-object v8, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 34
    invoke-static {v8}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    :try_start_0
    iget-object v8, v8, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperManagerCompat:Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    invoke-virtual {v8, v7, v3, v5, v1}, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->setStream(Ljava/io/InputStream;Landroid/graphics/Rect;ZI)I

    move-result v6
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :goto_3
    move-object/from16 v5, v24

    goto :goto_4

    :cond_6
    const-string v1, "Both the wallpaper bitmap and input stream are null so we\'re unable to set any kind of wallpaper here."

    move-object/from16 v5, v24

    .line 36
    invoke-static {v5, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_4
    if-lez v6, :cond_12

    .line 37
    iget v1, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mDestination:I

    if-nez v1, :cond_7

    iget-object v1, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 38
    iget-object v1, v1, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 39
    invoke-interface {v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getWallpaperPresentationMode()I

    move-result v1

    const/4 v7, 0x2

    if-ne v1, v7, :cond_8

    if-nez v4, :cond_7

    .line 40
    invoke-static {}, Lcom/android/wallpaper/compat/BuildCompat;->isAtLeastN()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 41
    iget-object v1, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 42
    iget-object v1, v1, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 43
    invoke-interface {v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperAttributions()Ljava/util/List;

    move-result-object v4

    .line 44
    invoke-interface {v1, v4}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLockWallpaperAttributions(Ljava/util/List;)V

    .line 45
    iget-object v1, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 46
    iget-object v1, v1, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 47
    invoke-interface {v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperActionUrl()Ljava/lang/String;

    move-result-object v4

    .line 48
    invoke-interface {v1, v4}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLockWallpaperActionUrl(Ljava/lang/String;)V

    .line 49
    iget-object v1, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 50
    iget-object v1, v1, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 51
    invoke-interface {v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperActionLabelRes()I

    move-result v4

    .line 52
    invoke-interface {v1, v4}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLockWallpaperActionLabelRes(I)V

    .line 53
    iget-object v1, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 54
    iget-object v1, v1, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 55
    invoke-interface {v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperActionIconRes()I

    move-result v4

    .line 56
    invoke-interface {v1, v4}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLockWallpaperActionIconRes(I)V

    .line 57
    iget-object v1, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 58
    iget-object v1, v1, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 59
    invoke-interface {v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->getHomeWallpaperCollectionId()Ljava/lang/String;

    move-result-object v4

    .line 60
    invoke-interface {v1, v4}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLockWallpaperCollectionId(Ljava/lang/String;)V

    .line 61
    iget-object v1, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 62
    iget-object v4, v1, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 63
    iget-object v1, v1, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperManagerCompat:Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    const/4 v7, 0x2

    .line 64
    invoke-virtual {v1, v7}, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->getWallpaperId(I)I

    move-result v1

    .line 65
    invoke-interface {v4, v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLockWallpaperId(I)V

    goto :goto_5

    :cond_7
    const/4 v7, 0x2

    .line 66
    :cond_8
    :goto_5
    iget v1, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mDestination:I

    if-eqz v1, :cond_9

    if-ne v1, v7, :cond_c

    .line 67
    :cond_9
    iget-object v4, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 68
    iget-object v4, v4, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 69
    invoke-interface {v4}, Lcom/android/wallpaper/module/WallpaperPreferences;->clearHomeWallpaperMetadata()V

    .line 70
    invoke-static {}, Lcom/android/wallpaper/compat/BuildCompat;->isAtLeastN()Z

    move-result v4

    if-eqz v4, :cond_a

    .line 71
    iget-object v4, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 72
    iget-object v4, v4, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 73
    invoke-interface {v4, v6}, Lcom/android/wallpaper/module/WallpaperPreferences;->setHomeWallpaperManagerId(I)V

    .line 74
    :cond_a
    iget-object v4, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 75
    iget-object v4, v4, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperManager:Landroid/app/WallpaperManager;

    .line 76
    invoke-virtual {v4}, Landroid/app/WallpaperManager;->forgetLoadedWallpaper()V

    .line 77
    iget-object v4, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 78
    iget-object v4, v4, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperManagerCompat:Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    .line 79
    invoke-virtual {v4}, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    check-cast v4, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v4}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v4

    iput-object v4, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mBitmap:Landroid/graphics/Bitmap;

    .line 80
    invoke-static {v4}, Landroidx/cardview/R$color;->generateHashCode(Landroid/graphics/Bitmap;)J

    move-result-wide v7

    .line 81
    iget-object v4, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mBitmap:Landroid/graphics/Bitmap;

    invoke-static {v4}, Landroid/app/WallpaperColors;->fromBitmap(Landroid/graphics/Bitmap;)Landroid/app/WallpaperColors;

    move-result-object v4

    .line 82
    iget-object v9, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 83
    iget-object v9, v9, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 84
    invoke-interface {v9, v7, v8}, Lcom/android/wallpaper/module/WallpaperPreferences;->setHomeWallpaperHashCode(J)V

    .line 85
    iget-object v9, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 86
    iget-object v10, v9, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 87
    iget-object v11, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 88
    iget-object v9, v9, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mAppContext:Landroid/content/Context;

    .line 89
    invoke-virtual {v11, v9}, Lcom/android/wallpaper/model/WallpaperInfo;->getAttributions(Landroid/content/Context;)Ljava/util/List;

    move-result-object v9

    .line 90
    invoke-interface {v10, v9}, Lcom/android/wallpaper/module/WallpaperPreferences;->setHomeWallpaperAttributions(Ljava/util/List;)V

    .line 91
    iget-object v9, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 92
    iget-object v9, v9, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 93
    iget-object v10, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    invoke-virtual {v10}, Lcom/android/wallpaper/model/WallpaperInfo;->getBaseImageUrl()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Lcom/android/wallpaper/module/WallpaperPreferences;->setHomeWallpaperBaseImageUrl(Ljava/lang/String;)V

    .line 94
    iget-object v9, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 95
    iget-object v10, v9, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 96
    iget-object v11, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 97
    iget-object v9, v9, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mAppContext:Landroid/content/Context;

    .line 98
    invoke-virtual {v11, v9}, Lcom/android/wallpaper/model/WallpaperInfo;->getActionUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v10, v9}, Lcom/android/wallpaper/module/WallpaperPreferences;->setHomeWallpaperActionUrl(Ljava/lang/String;)V

    .line 99
    iget-object v9, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 100
    iget-object v10, v9, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 101
    iget-object v11, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 102
    iget-object v9, v9, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mAppContext:Landroid/content/Context;

    .line 103
    invoke-virtual {v11, v9}, Lcom/android/wallpaper/model/WallpaperInfo;->getActionLabelRes(Landroid/content/Context;)I

    move-result v9

    .line 104
    invoke-interface {v10, v9}, Lcom/android/wallpaper/module/WallpaperPreferences;->setHomeWallpaperActionLabelRes(I)V

    .line 105
    iget-object v9, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 106
    iget-object v10, v9, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 107
    iget-object v11, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 108
    iget-object v9, v9, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mAppContext:Landroid/content/Context;

    .line 109
    invoke-virtual {v11, v9}, Lcom/android/wallpaper/model/WallpaperInfo;->getActionIconRes(Landroid/content/Context;)I

    move-result v9

    .line 110
    invoke-interface {v10, v9}, Lcom/android/wallpaper/module/WallpaperPreferences;->setHomeWallpaperActionIconRes(I)V

    .line 111
    iget-object v9, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 112
    iget-object v10, v9, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 113
    iget-object v11, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 114
    iget-object v9, v9, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mAppContext:Landroid/content/Context;

    .line 115
    invoke-virtual {v11, v9}, Lcom/android/wallpaper/model/WallpaperInfo;->getCollectionId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v9

    .line 116
    invoke-interface {v10, v9}, Lcom/android/wallpaper/module/WallpaperPreferences;->setHomeWallpaperCollectionId(Ljava/lang/String;)V

    .line 117
    iget-object v9, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 118
    iget-object v9, v9, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 119
    iget-object v10, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    invoke-virtual {v10}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperId()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Lcom/android/wallpaper/module/WallpaperPreferences;->setHomeWallpaperRemoteId(Ljava/lang/String;)V

    .line 120
    iget-object v9, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 121
    iget-object v9, v9, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 122
    iget-object v10, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    invoke-virtual {v10}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperId()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_b

    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    goto :goto_6

    .line 123
    :cond_b
    iget-object v7, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    invoke-virtual {v7}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperId()Ljava/lang/String;

    move-result-object v7

    :goto_6
    iget-object v8, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    iget-object v10, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mBitmap:Landroid/graphics/Bitmap;

    .line 124
    invoke-interface {v9, v7, v8, v10, v4}, Lcom/android/wallpaper/module/WallpaperPreferences;->storeLatestHomeWallpaper(Ljava/lang/String;Lcom/android/wallpaper/model/WallpaperInfo;Landroid/graphics/Bitmap;Landroid/app/WallpaperColors;)V

    .line 125
    iget-object v4, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 126
    iget-object v4, v4, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 127
    invoke-interface {v4, v2}, Lcom/android/wallpaper/module/WallpaperPreferences;->setWallpaperPresentationMode(I)V

    :cond_c
    if-eq v1, v2, :cond_d

    const/4 v2, 0x2

    if-ne v1, v2, :cond_10

    .line 128
    :cond_d
    iget-object v1, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 129
    iget-object v1, v1, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 130
    invoke-interface {v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->clearLockWallpaperMetadata()V

    .line 131
    iget-object v1, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 132
    iget-object v1, v1, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 133
    invoke-interface {v1, v6}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLockWallpaperId(I)V

    .line 134
    iget-object v1, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 135
    iget-object v2, v1, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 136
    iget-object v4, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 137
    iget-object v1, v1, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mAppContext:Landroid/content/Context;

    .line 138
    invoke-virtual {v4, v1}, Lcom/android/wallpaper/model/WallpaperInfo;->getAttributions(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    .line 139
    invoke-interface {v2, v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLockWallpaperAttributions(Ljava/util/List;)V

    .line 140
    iget-object v1, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 141
    iget-object v2, v1, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 142
    iget-object v4, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 143
    iget-object v1, v1, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mAppContext:Landroid/content/Context;

    .line 144
    invoke-virtual {v4, v1}, Lcom/android/wallpaper/model/WallpaperInfo;->getActionUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v2, v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLockWallpaperActionUrl(Ljava/lang/String;)V

    .line 145
    iget-object v1, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 146
    iget-object v2, v1, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 147
    iget-object v4, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 148
    iget-object v1, v1, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mAppContext:Landroid/content/Context;

    .line 149
    invoke-virtual {v4, v1}, Lcom/android/wallpaper/model/WallpaperInfo;->getActionLabelRes(Landroid/content/Context;)I

    move-result v1

    .line 150
    invoke-interface {v2, v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLockWallpaperActionLabelRes(I)V

    .line 151
    iget-object v1, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 152
    iget-object v2, v1, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 153
    iget-object v4, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 154
    iget-object v1, v1, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mAppContext:Landroid/content/Context;

    .line 155
    invoke-virtual {v4, v1}, Lcom/android/wallpaper/model/WallpaperInfo;->getActionIconRes(Landroid/content/Context;)I

    move-result v1

    .line 156
    invoke-interface {v2, v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLockWallpaperActionIconRes(I)V

    .line 157
    iget-object v1, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 158
    iget-object v2, v1, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 159
    iget-object v4, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 160
    iget-object v1, v1, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mAppContext:Landroid/content/Context;

    .line 161
    invoke-virtual {v4, v1}, Lcom/android/wallpaper/model/WallpaperInfo;->getCollectionId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 162
    invoke-interface {v2, v1}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLockWallpaperCollectionId(Ljava/lang/String;)V

    .line 163
    iget-object v1, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 164
    iget-object v1, v1, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 165
    iget-object v2, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    invoke-virtual {v2}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperId()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLockWallpaperRemoteId(Ljava/lang/String;)V

    const-string v1, "IO exception when closing the input stream for the lock screen WP."

    .line 166
    iget-object v2, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 167
    iget-object v2, v2, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperManagerCompat:Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;

    const/4 v4, 0x2

    .line 168
    invoke-virtual {v2, v4}, Lcom/android/wallpaper/compat/WallpaperManagerCompatV16;->getWallpaperFile(I)Landroid/os/ParcelFileDescriptor;

    move-result-object v2

    if-nez v2, :cond_e

    goto :goto_a

    .line 169
    :cond_e
    :try_start_1
    new-instance v4, Ljava/io/FileInputStream;

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v6

    invoke-direct {v4, v6}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 170
    :try_start_2
    invoke-static {v4}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v13
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 171
    :try_start_3
    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 172
    :try_start_4
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_9

    .line 173
    :catch_1
    invoke-static {v5, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_9

    :catchall_0
    move-exception v0

    goto :goto_c

    :catch_2
    move-object v13, v3

    :catch_3
    move-object v3, v13

    move-object v13, v4

    goto :goto_7

    :catchall_1
    move-exception v0

    move-object v13, v3

    goto :goto_b

    :catch_4
    move-object v13, v3

    :goto_7
    :try_start_5
    const-string v2, "IO exception when closing the file descriptor."

    .line 174
    invoke-static {v5, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    if-eqz v13, :cond_f

    .line 175
    :try_start_6
    invoke-virtual {v13}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_5

    goto :goto_8

    .line 176
    :catch_5
    invoke-static {v5, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_f
    :goto_8
    move-object v13, v3

    :goto_9
    if-eqz v13, :cond_10

    .line 177
    invoke-static {v13}, Landroidx/cardview/R$color;->generateHashCode(Landroid/graphics/Bitmap;)J

    move-result-wide v1

    .line 178
    iget-object v3, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 179
    iget-object v3, v3, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 180
    invoke-interface {v3, v1, v2}, Lcom/android/wallpaper/module/WallpaperPreferences;->setLockWallpaperHashCode(J)V

    .line 181
    :cond_10
    :goto_a
    iget-object v0, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 182
    iget-object v0, v0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperPreferences:Lcom/android/wallpaper/module/WallpaperPreferences;

    .line 183
    invoke-interface {v0}, Lcom/android/wallpaper/module/WallpaperPreferences;->clearDailyRotations()V

    .line 184
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_e

    :catchall_2
    move-exception v0

    :goto_b
    move-object v4, v13

    :goto_c
    if-eqz v4, :cond_11

    .line 185
    :try_start_7
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_6

    goto :goto_d

    .line 186
    :catch_6
    invoke-static {v5, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 187
    :cond_11
    :goto_d
    throw v0

    .line 188
    :cond_12
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    :goto_e
    return-object v0
.end method

.method public onPostExecute(Ljava/lang/Object;)V
    .locals 2

    .line 1
    check-cast p1, Ljava/lang/Boolean;

    .line 2
    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mInputStream:Ljava/io/InputStream;

    if-eqz v0, :cond_0

    .line 3
    :try_start_0
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Failed to close input stream "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "WallpaperPersister"

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 5
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mCallback:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 6
    :cond_0
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 7
    iget-object p1, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mCallback:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

    iget-object v0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    invoke-interface {p1, v0}, Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;->onSuccess(Lcom/android/wallpaper/model/WallpaperInfo;)V

    .line 8
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->this$0:Lcom/android/wallpaper/module/DefaultWallpaperPersister;

    .line 9
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister;->mWallpaperChangedNotifier:Lcom/android/wallpaper/module/WallpaperChangedNotifier;

    .line 10
    invoke-virtual {p0}, Lcom/android/wallpaper/module/WallpaperChangedNotifier;->notifyWallpaperChanged()V

    goto :goto_1

    .line 11
    :cond_1
    iget-object p0, p0, Lcom/android/wallpaper/module/DefaultWallpaperPersister$SetWallpaperTask;->mCallback:Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;

    const/4 p1, 0x0

    invoke-interface {p0, p1}, Lcom/android/wallpaper/module/WallpaperPersister$SetWallpaperCallback;->onError(Ljava/lang/Throwable;)V

    :goto_1
    return-void
.end method
