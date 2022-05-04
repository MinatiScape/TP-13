.class public Lcom/android/wallpaper/picker/ImagePreviewFragment$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/wallpaper/module/BitmapCropper$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/wallpaper/picker/ImagePreviewFragment;->recalculateColors()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;


# direct methods
.method public constructor <init>(Lcom/android/wallpaper/picker/ImagePreviewFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$4;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBitmapCropped(Landroid/graphics/Bitmap;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/wallpaper/picker/ImagePreviewFragment$4;->this$0:Lcom/android/wallpaper/picker/ImagePreviewFragment;

    .line 2
    iget-object v0, v0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->mRecalculateColorCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 4
    sget-object v0, Lcom/android/wallpaper/picker/ImagePreviewFragment;->sExecutor:Ljava/util/concurrent/Executor;

    .line 5
    new-instance v1, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1}, Lcom/android/customization/picker/WallpaperPreviewer$$ExternalSyntheticLambda1;-><init>(Lcom/android/wallpaper/picker/ImagePreviewFragment$4;Landroid/graphics/Bitmap;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    const-string p0, "ImagePreviewFragment"

    const-string v0, "Recalculate colors, crop and scale bitmap failed."

    .line 1
    invoke-static {p0, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method
