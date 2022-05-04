.class public final synthetic Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/wallpaper/asset/Asset$BitmapReceiver;


# instance fields
.field public final synthetic f$0:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;


# direct methods
.method public synthetic constructor <init>(Lcom/android/wallpaper/asset/Asset$BitmapReceiver;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

    return-void
.end method


# virtual methods
.method public final onBitmapDecoded(Landroid/graphics/Bitmap;)V
    .locals 0

    iget-object p0, p0, Lcom/android/wallpaper/asset/BitmapCachingAsset$$ExternalSyntheticLambda0;->f$0:Lcom/android/wallpaper/asset/Asset$BitmapReceiver;

    invoke-interface {p0, p1}, Lcom/android/wallpaper/asset/Asset$BitmapReceiver;->onBitmapDecoded(Landroid/graphics/Bitmap;)V

    return-void
.end method
