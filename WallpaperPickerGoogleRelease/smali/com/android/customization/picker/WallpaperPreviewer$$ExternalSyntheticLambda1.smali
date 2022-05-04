.class public final synthetic Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic $r8$classId:I

.field public final synthetic f$0:Ljava/lang/Object;

.field public final synthetic f$1:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/android/customization/picker/WallpaperPreviewer;Landroid/widget/ImageView;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda1;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/systemui/shared/plugins/PluginActionManager;Lcom/android/systemui/shared/plugins/PluginInstance;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda1;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/systemui/shared/plugins/PluginActionManager;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda1;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/wallpaper/picker/ImagePreviewFragment$4;Landroid/graphics/Bitmap;)V
    .locals 1

    const/4 v0, 0x3

    iput v0, p0, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda1;->$r8$classId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    iget v0, p0, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda1;->$r8$classId:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_2

    :pswitch_0
    iget-object v0, p0, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/android/systemui/shared/plugins/PluginActionManager;

    iget-object p0, p0, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-static {v0, p0}, Lcom/android/systemui/shared/plugins/PluginActionManager;->$r8$lambda$tRQyi7k9O-R4crA50YERIw8utIE(Lcom/android/systemui/shared/plugins/PluginActionManager;Ljava/lang/String;)V

    return-void

    :pswitch_1
    iget-object v0, p0, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/android/systemui/shared/plugins/PluginActionManager;

    iget-object p0, p0, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    check-cast p0, Lcom/android/systemui/shared/plugins/PluginInstance;

    invoke-static {v0, p0}, Lcom/android/systemui/shared/plugins/PluginActionManager;->$r8$lambda$UWzagWxnH7QoNH7ZAC9-VqRJxlg(Lcom/android/systemui/shared/plugins/PluginActionManager;Lcom/android/systemui/shared/plugins/PluginInstance;)V

    return-void

    :pswitch_2
    iget-object v0, p0, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/android/customization/picker/WallpaperPreviewer;

    iget-object p0, p0, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    check-cast p0, Landroid/widget/ImageView;

    .line 1
    iget-object v3, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mActivity:Landroid/app/Activity;

    if-eqz v3, :cond_7

    invoke-virtual {v3}, Landroid/app/Activity;->isDestroyed()Z

    move-result v3

    if-eqz v3, :cond_0

    goto/16 :goto_1

    .line 2
    :cond_0
    iget-object v3, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    instance-of v4, v3, Lcom/android/wallpaper/model/LiveWallpaperInfo;

    xor-int/2addr v4, v2

    .line 3
    iget-object v5, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mActivity:Landroid/app/Activity;

    invoke-virtual {v5}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/android/wallpaper/model/WallpaperInfo;->getThumbAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;

    move-result-object v3

    iget-object v5, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mActivity:Landroid/app/Activity;

    if-eqz v4, :cond_1

    move-object v4, p0

    goto :goto_0

    .line 4
    :cond_1
    iget-object v4, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mHomePreview:Landroid/widget/ImageView;

    :goto_0
    const v6, 0x1010530

    .line 5
    invoke-static {v5, v6}, Landroidx/transition/R$id;->getColorAttr(Landroid/content/Context;I)I

    move-result v7

    .line 6
    invoke-virtual {v3, v5, v4, v7}, Lcom/android/wallpaper/asset/Asset;->loadPreviewImage(Landroid/app/Activity;Landroid/widget/ImageView;I)V

    .line 7
    iget-object v3, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    instance-of v4, v3, Lcom/android/wallpaper/model/LiveWallpaperInfo;

    if-eqz v4, :cond_5

    .line 8
    iget-object v4, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mActivity:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/android/wallpaper/model/WallpaperInfo;->getThumbAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;

    move-result-object v3

    iget-object v4, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mActivity:Landroid/app/Activity;

    .line 9
    invoke-static {v4, v6}, Landroidx/transition/R$id;->getColorAttr(Landroid/content/Context;I)I

    move-result v5

    .line 10
    invoke-virtual {v3, v4, p0, v5}, Lcom/android/wallpaper/asset/Asset;->loadPreviewImage(Landroid/app/Activity;Landroid/widget/ImageView;I)V

    .line 11
    iget-object p0, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 12
    iget-object v3, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mActivity:Landroid/app/Activity;

    if-eqz v3, :cond_7

    invoke-virtual {v3}, Landroid/app/Activity;->isFinishing()Z

    move-result v3

    if-eqz v3, :cond_2

    goto/16 :goto_1

    .line 13
    :cond_2
    iget-object v3, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    if-eqz v3, :cond_3

    .line 14
    invoke-virtual {v3}, Lcom/android/wallpaper/util/WallpaperConnection;->disconnect()V

    .line 15
    :cond_3
    invoke-static {}, Lcom/android/wallpaper/util/WallpaperConnection;->isPreviewAvailable()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 16
    iget-object v3, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mHomePreview:Landroid/widget/ImageView;

    iget-object v4, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mLivePreviewLocation:[I

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->getLocationOnScreen([I)V

    .line 17
    iget-object v3, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mPreviewGlobalRect:Landroid/graphics/Rect;

    iget-object v4, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mHomePreview:Landroid/widget/ImageView;

    invoke-virtual {v4}, Landroid/widget/ImageView;->getMeasuredWidth()I

    move-result v4

    iget-object v5, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mHomePreview:Landroid/widget/ImageView;

    .line 18
    invoke-virtual {v5}, Landroid/widget/ImageView;->getMeasuredHeight()I

    move-result v5

    .line 19
    invoke-virtual {v3, v1, v1, v4, v5}, Landroid/graphics/Rect;->set(IIII)V

    .line 20
    iget-object v3, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mPreviewLocalRect:Landroid/graphics/Rect;

    iget-object v4, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mPreviewGlobalRect:Landroid/graphics/Rect;

    invoke-virtual {v3, v4}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 21
    iget-object v3, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mPreviewGlobalRect:Landroid/graphics/Rect;

    iget-object v4, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mLivePreviewLocation:[I

    aget v1, v4, v1

    aget v4, v4, v2

    invoke-virtual {v3, v1, v4}, Landroid/graphics/Rect;->offset(II)V

    .line 22
    new-instance v1, Lcom/android/wallpaper/util/WallpaperConnection;

    .line 23
    invoke-virtual {p0}, Lcom/android/wallpaper/model/WallpaperInfo;->getWallpaperComponent()Landroid/app/WallpaperInfo;

    move-result-object p0

    .line 24
    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.service.wallpaper.WallpaperService"

    invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 25
    invoke-virtual {p0}, Landroid/app/WallpaperInfo;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Landroid/app/WallpaperInfo;->getServiceName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v3, v4, p0}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    .line 26
    iget-object v3, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mActivity:Landroid/app/Activity;

    new-instance v4, Lcom/android/customization/picker/WallpaperPreviewer$2;

    invoke-direct {v4, v0}, Lcom/android/customization/picker/WallpaperPreviewer$2;-><init>(Lcom/android/customization/picker/WallpaperPreviewer;)V

    iget-object v5, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaperSurface:Landroid/view/SurfaceView;

    invoke-direct {v1, p0, v3, v4, v5}, Lcom/android/wallpaper/util/WallpaperConnection;-><init>(Landroid/content/Intent;Landroid/content/Context;Lcom/android/wallpaper/util/WallpaperConnection$WallpaperConnectionListener;Landroid/view/SurfaceView;)V

    iput-object v1, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    .line 27
    iput-boolean v2, v1, Lcom/android/wallpaper/util/WallpaperConnection;->mIsVisible:Z

    .line 28
    invoke-virtual {v1, v2}, Lcom/android/wallpaper/util/WallpaperConnection;->setEngineVisibility(Z)V

    .line 29
    iget-object p0, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mHomePreview:Landroid/widget/ImageView;

    new-instance v1, Lcom/android/wallpaper/util/DiskBasedLogger$$ExternalSyntheticLambda1;

    invoke-direct {v1, v0}, Lcom/android/wallpaper/util/DiskBasedLogger$$ExternalSyntheticLambda1;-><init>(Lcom/android/customization/picker/WallpaperPreviewer;)V

    invoke-virtual {p0, v1}, Landroid/widget/ImageView;->post(Ljava/lang/Runnable;)Z

    goto :goto_1

    .line 30
    :cond_4
    iget-object p0, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaperColorsListener:Lcom/android/customization/picker/WallpaperPreviewer$WallpaperColorsListener;

    if-eqz p0, :cond_7

    .line 31
    iget-object p0, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mActivity:Landroid/app/Activity;

    iget-object v1, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 32
    invoke-virtual {v1, p0}, Lcom/android/wallpaper/model/WallpaperInfo;->getThumbAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;

    move-result-object v1

    iget-object v0, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaperColorsListener:Lcom/android/customization/picker/WallpaperPreviewer$WallpaperColorsListener;

    .line 33
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v3, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda0;

    invoke-direct {v3, v0, v2}, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda0;-><init>(Lcom/android/customization/picker/WallpaperPreviewer$WallpaperColorsListener;I)V

    .line 34
    invoke-static {p0, v1, v3}, Lcom/android/wallpaper/widget/WallpaperColorsLoader;->getWallpaperColors(Landroid/content/Context;Lcom/android/wallpaper/asset/Asset;Lcom/android/wallpaper/widget/WallpaperColorsLoader$Callback;)V

    goto :goto_1

    .line 35
    :cond_5
    iget-object p0, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    if-eqz p0, :cond_6

    .line 36
    invoke-virtual {p0}, Lcom/android/wallpaper/util/WallpaperConnection;->disconnect()V

    const/4 p0, 0x0

    .line 37
    iput-object p0, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaperConnection:Lcom/android/wallpaper/util/WallpaperConnection;

    .line 38
    :cond_6
    iget-object p0, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaperColorsListener:Lcom/android/customization/picker/WallpaperPreviewer$WallpaperColorsListener;

    if-eqz p0, :cond_7

    .line 39
    iget-object p0, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mActivity:Landroid/app/Activity;

    iget-object v2, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaper:Lcom/android/wallpaper/model/WallpaperInfo;

    .line 40
    invoke-virtual {v2, p0}, Lcom/android/wallpaper/model/WallpaperInfo;->getThumbAsset(Landroid/content/Context;)Lcom/android/wallpaper/asset/Asset;

    move-result-object v2

    iget-object v0, v0, Lcom/android/customization/picker/WallpaperPreviewer;->mWallpaperColorsListener:Lcom/android/customization/picker/WallpaperPreviewer$WallpaperColorsListener;

    .line 41
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v3, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda0;

    invoke-direct {v3, v0, v1}, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda0;-><init>(Lcom/android/customization/picker/WallpaperPreviewer$WallpaperColorsListener;I)V

    .line 42
    invoke-static {p0, v2, v3}, Lcom/android/wallpaper/widget/WallpaperColorsLoader;->getWallpaperColors(Landroid/content/Context;Lcom/android/wallpaper/asset/Asset;Lcom/android/wallpaper/widget/WallpaperColorsLoader$Callback;)V

    :cond_7
    :goto_1
    return-void

    .line 43
    :goto_2
    iget-object v0, p0, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda1;->f$0:Ljava/lang/Object;

    check-cast v0, Lcom/android/wallpaper/picker/ImagePreviewFragment$4;

    iget-object p0, p0, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/Bitmap;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 45
    sget-object v4, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v5, 0x64

    invoke-virtual {p0, v4, v5, v3}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 46
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    .line 47
    new-instance v3, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v3}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 48
    sget-object v4, Landroid/graphics/ColorSpace$Named;->SRGB:Landroid/graphics/ColorSpace$Named;

    .line 49
    invoke-static {v4}, Landroid/graphics/ColorSpace;->get(Landroid/graphics/ColorSpace$Named;)Landroid/graphics/ColorSpace;

    move-result-object v4

    iput-object v4, v3, Landroid/graphics/BitmapFactory$Options;->inPreferredColorSpace:Landroid/graphics/ColorSpace;

    .line 50
    array-length v3, p0

    invoke-static {p0, v1, v3}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object p0

    .line 51
    :cond_8
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v3

    sget-object v4, Landroid/graphics/Bitmap$Config;->HARDWARE:Landroid/graphics/Bitmap$Config;

    if-ne v3, v4, :cond_9

    .line 52
    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-virtual {p0, v3, v1}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object p0

    move v1, v2

    .line 53
    :cond_9
    invoke-static {p0}, Landroid/app/WallpaperColors;->fromBitmap(Landroid/graphics/Bitmap;)Landroid/app/WallpaperColors;

    move-result-object v2

    if-eqz v1, :cond_a

    .line 54
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    .line 55
    :cond_a
    iget-object p0, v0, Lcom/android/wallpaper/picker/ImagePreviewFragment$4;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    .line 56
    iget-object p0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mRecalculateColorCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 57
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result p0

    if-nez p0, :cond_b

    .line 58
    invoke-static {}, Landroid/os/Handler;->getMain()Landroid/os/Handler;

    move-result-object p0

    new-instance v1, Lcom/android/wallpaper/picker/ImagePreviewFragment$4$$ExternalSyntheticLambda0;

    invoke-direct {v1, v0, v2}, Lcom/android/wallpaper/picker/ImagePreviewFragment$4$$ExternalSyntheticLambda0;-><init>(Lcom/android/wallpaper/picker/ImagePreviewFragment$4;Landroid/app/WallpaperColors;)V

    invoke-virtual {p0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_b
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
