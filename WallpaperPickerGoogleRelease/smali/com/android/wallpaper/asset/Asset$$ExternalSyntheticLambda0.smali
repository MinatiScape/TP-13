.class public final synthetic Lcom/android/wallpaper/asset/Asset$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/asset/Asset$DimensionsReceiver;


# instance fields
.field public final synthetic f$0:Lcom/android/wallpaper/asset/Asset;

.field public final synthetic f$1:Landroid/app/Activity;

.field public final synthetic f$2:Landroid/widget/ImageView;

.field public final synthetic f$3:I

.field public final synthetic f$4:Z

.field public final synthetic f$5:Landroid/graphics/drawable/Drawable;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/asset/Asset;Landroid/app/Activity;Landroid/widget/ImageView;IZLandroid/graphics/drawable/Drawable;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/asset/Asset$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/asset/Asset;

    iput-object p2, p0, Lcom/android/wallpaper/asset/Asset$$ExternalSyntheticLambda0;->f$1:Landroid/app/Activity;

    iput-object p3, p0, Lcom/android/wallpaper/asset/Asset$$ExternalSyntheticLambda0;->f$2:Landroid/widget/ImageView;

    iput p4, p0, Lcom/android/wallpaper/asset/Asset$$ExternalSyntheticLambda0;->f$3:I

    iput-boolean p5, p0, Lcom/android/wallpaper/asset/Asset$$ExternalSyntheticLambda0;->f$4:Z

    iput-object p6, p0, Lcom/android/wallpaper/asset/Asset$$ExternalSyntheticLambda0;->f$5:Landroid/graphics/drawable/Drawable;

    return-void
.end method


# virtual methods
.method public final onDimensionsDecoded(Landroid/graphics/Point;)V
    .locals 10

    iget-object v6, p0, Lcom/android/wallpaper/asset/Asset$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/asset/Asset;

    iget-object v4, p0, Lcom/android/wallpaper/asset/Asset$$ExternalSyntheticLambda0;->f$1:Landroid/app/Activity;

    iget-object v2, p0, Lcom/android/wallpaper/asset/Asset$$ExternalSyntheticLambda0;->f$2:Landroid/widget/ImageView;

    iget v0, p0, Lcom/android/wallpaper/asset/Asset$$ExternalSyntheticLambda0;->f$3:I

    iget-boolean v3, p0, Lcom/android/wallpaper/asset/Asset$$ExternalSyntheticLambda0;->f$4:Z

    iget-object v5, p0, Lcom/android/wallpaper/asset/Asset$$ExternalSyntheticLambda0;->f$5:Landroid/graphics/drawable/Drawable;

    invoke-static {v6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    if-nez p1, :cond_0

    .line 1
    invoke-virtual {v6, v4, v2, v0}, Lcom/android/wallpaper/asset/Asset;->loadDrawable(Landroid/content/Context;Landroid/widget/ImageView;I)V

    goto :goto_0

    .line 2
    :cond_0
    invoke-virtual {v4}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object p0

    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p0

    .line 3
    invoke-static {}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getInstance()Lcom/android/wallpaper/util/ScreenSizeCalculator;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/wallpaper/util/ScreenSizeCalculator;->getScreenSize(Landroid/view/Display;)Landroid/graphics/Point;

    move-result-object p0

    .line 4
    invoke-static {p1, p0}, Lcom/android/wallpaper/util/WallpaperCropUtils;->calculateVisibleRect(Landroid/graphics/Point;Landroid/graphics/Point;)Landroid/graphics/Rect;

    move-result-object p0

    .line 5
    invoke-virtual {v6, v4, p1, p0}, Lcom/android/wallpaper/asset/Asset;->adjustCropRect(Landroid/content/Context;Landroid/graphics/Point;Landroid/graphics/Rect;)V

    .line 6
    invoke-static {}, Lcom/android/wallpaper/module/InjectorProvider;->getInjector()Lcom/android/wallpaper/module/Injector;

    move-result-object p1

    invoke-interface {p1}, Lcom/android/wallpaper/module/Injector;->getBitmapCropper()Lcom/android/wallpaper/module/BitmapCropper;

    move-result-object p1

    const/high16 v7, 0x3f800000    # 1.0f

    .line 7
    invoke-static {v4}, Lcom/android/wallpaper/util/WallpaperCropUtils;->isRtl(Landroid/content/Context;)Z

    move-result v8

    new-instance v9, Lcom/android/wallpaper/asset/Asset$3;

    move-object v0, v9

    move-object v1, v6

    invoke-direct/range {v0 .. v5}, Lcom/android/wallpaper/asset/Asset$3;-><init>(Lcom/android/wallpaper/asset/Asset;Landroid/widget/ImageView;ZLandroid/app/Activity;Landroid/graphics/drawable/Drawable;)V

    .line 8
    move-object v0, p1

    check-cast v0, Lcom/android/wallpaper/module/DefaultBitmapCropper;

    move v2, v7

    move-object v3, p0

    move v4, v8

    move-object v5, v9

    invoke-virtual/range {v0 .. v5}, Lcom/android/wallpaper/module/DefaultBitmapCropper;->cropAndScaleBitmap(Lcom/android/wallpaper/asset/Asset;FLandroid/graphics/Rect;ZLcom/android/wallpaper/module/BitmapCropper$Callback;)V

    :goto_0
    return-void
.end method
