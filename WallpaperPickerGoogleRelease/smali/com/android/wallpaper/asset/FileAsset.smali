.class public final Lcom/android/wallpaper/asset/FileAsset;
.super Lcom/android/wallpaper/asset/StreamableAsset;
.source "SourceFile"


# instance fields
.field public final mFile:Ljava/io/File;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/asset/StreamableAsset;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/wallpaper/asset/FileAsset;->mFile:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public openInputStream()Ljava/io/InputStream;
    .locals 2

    .line 1
    :try_start_0
    new-instance v0, Ljava/io/FileInputStream;

    iget-object p0, p0, Lcom/android/wallpaper/asset/FileAsset;->mFile:Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p0

    const-string v0, "FileAsset"

    const-string v1, "Image file not found"

    .line 2
    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p0, 0x0

    return-object p0
.end method
