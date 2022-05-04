.class public Lcom/google/android/apps/wallpaper/model/MicropaperWallpaperInfo;
.super Lcom/android/wallpaper/model/ImageWallpaperInfo;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/apps/wallpaper/model/MicropaperWallpaperInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final sAssetUri:Landroid/net/Uri;


# instance fields
.field public final mInfo:Landroid/app/WallpaperInfo;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/apps/wallpaper/model/MicropaperWallpaperInfo$1;

    invoke-direct {v0}, Lcom/google/android/apps/wallpaper/model/MicropaperWallpaperInfo$1;-><init>()V

    sput-object v0, Lcom/google/android/apps/wallpaper/model/MicropaperWallpaperInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 2
    sget-object v0, Lwireless/android/learning/acmi/micropaper/frontend/MicropaperFrontend;->MICROPAPER_SERVICE:Landroid/content/ComponentName;

    .line 3
    new-instance v0, Landroid/net/Uri$Builder;

    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    const-string v1, "content"

    .line 4
    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "com.google.pixel.dynamicwallpapers.parameters"

    .line 5
    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "home"

    .line 6
    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    .line 8
    sput-object v0, Lcom/google/android/apps/wallpaper/model/MicropaperWallpaperInfo;->sAssetUri:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>(Landroid/app/WallpaperInfo;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/google/android/apps/wallpaper/model/MicropaperWallpaperInfo;->sAssetUri:Landroid/net/Uri;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/android/wallpaper/model/ImageWallpaperInfo;-><init>(Landroid/net/Uri;Z)V

    .line 2
    iput-object p1, p0, Lcom/google/android/apps/wallpaper/model/MicropaperWallpaperInfo;->mInfo:Landroid/app/WallpaperInfo;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 3
    invoke-direct {p0, p1}, Lcom/android/wallpaper/model/ImageWallpaperInfo;-><init>(Landroid/os/Parcel;)V

    .line 4
    const-class v0, Landroid/app/WallpaperInfo;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/app/WallpaperInfo;

    iput-object p1, p0, Lcom/google/android/apps/wallpaper/model/MicropaperWallpaperInfo;->mInfo:Landroid/app/WallpaperInfo;

    return-void
.end method


# virtual methods
.method public getAttributions(Landroid/content/Context;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lwireless/android/learning/acmi/micropaper/frontend/MicropaperFrontend;->MICROPAPER_SERVICE:Landroid/content/ComponentName;

    .line 2
    new-instance p0, Landroid/net/Uri$Builder;

    invoke-direct {p0}, Landroid/net/Uri$Builder;-><init>()V

    const-string v0, "content"

    .line 3
    invoke-virtual {p0, v0}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v0, "com.google.pixel.dynamicwallpapers.parameters"

    .line 4
    invoke-virtual {p0, v0}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    .line 6
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const/4 v0, 0x0

    const-string v1, "PROVIDER_GET_HOME_IMAGE_LABELS"

    invoke-virtual {p1, p0, v1, v0, v0}, Landroid/content/ContentResolver;->call(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object p0

    const-string p1, "EXTRA_IMAGE_LABELS"

    .line 7
    invoke-virtual {p0, p1}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 1
    iget p2, p0, Lcom/android/wallpaper/model/WallpaperInfo;->mPlaceholderColor:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 2
    iget-object p2, p0, Lcom/android/wallpaper/model/ImageWallpaperInfo;->mUri:Landroid/net/Uri;

    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 3
    iget-object p0, p0, Lcom/google/android/apps/wallpaper/model/MicropaperWallpaperInfo;->mInfo:Landroid/app/WallpaperInfo;

    const/4 p2, 0x0

    invoke-virtual {p1, p0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    return-void
.end method
