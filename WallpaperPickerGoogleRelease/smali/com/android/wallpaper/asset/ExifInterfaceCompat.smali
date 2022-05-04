.class public Lcom/android/wallpaper/asset/ExifInterfaceCompat;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public mFrameworkExifInterface:Landroid/media/ExifInterface;

.field public mSupportExifInterface:Landroidx/exifinterface/media/ExifInterface;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    sget v0, Lcom/android/wallpaper/compat/BuildCompat;->sSdk:I

    const/16 v1, 0x1b

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 3
    new-instance v0, Landroid/media/ExifInterface;

    invoke-direct {v0, p1}, Landroid/media/ExifInterface;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lcom/android/wallpaper/asset/ExifInterfaceCompat;->mFrameworkExifInterface:Landroid/media/ExifInterface;

    goto :goto_1

    .line 4
    :cond_1
    new-instance v0, Landroidx/exifinterface/media/ExifInterface;

    invoke-direct {v0, p1}, Landroidx/exifinterface/media/ExifInterface;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lcom/android/wallpaper/asset/ExifInterfaceCompat;->mSupportExifInterface:Landroidx/exifinterface/media/ExifInterface;

    :goto_1
    return-void
.end method
