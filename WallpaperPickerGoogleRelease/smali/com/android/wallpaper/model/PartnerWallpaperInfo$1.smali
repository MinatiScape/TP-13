.class public Lcom/android/wallpaper/model/PartnerWallpaperInfo$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/model/PartnerWallpaperInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/android/wallpaper/model/PartnerWallpaperInfo;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1

    .line 1
    new-instance p0, Lcom/android/wallpaper/model/PartnerWallpaperInfo;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/wallpaper/model/PartnerWallpaperInfo;-><init>(Landroid/os/Parcel;Lcom/android/wallpaper/model/PartnerWallpaperInfo$1;)V

    return-object p0
.end method

.method public newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 1
    new-array p0, p1, [Lcom/android/wallpaper/model/PartnerWallpaperInfo;

    return-object p0
.end method
