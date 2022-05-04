.class public final enum Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/wallpaper/model/SetWallpaperViewModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SetWallpaperStatus"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;",
        ">;"
    }
.end annotation


# static fields
.field public static final synthetic $VALUES:[Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;

.field public static final enum ERROR:Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;

.field public static final enum SUCCESS:Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;

.field public static final enum UNKNOWN:Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;


# direct methods
.method public static constructor <clinit>()V
    .locals 9

    .line 1
    new-instance v0, Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;

    const-string v1, "UNKNOWN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;->UNKNOWN:Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;

    new-instance v1, Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;

    const-string v3, "PENDING"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;-><init>(Ljava/lang/String;I)V

    new-instance v3, Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;

    const-string v5, "SUCCESS"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;->SUCCESS:Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;

    new-instance v5, Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;

    const-string v7, "ERROR"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;->ERROR:Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;

    const/4 v7, 0x4

    new-array v7, v7, [Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    .line 2
    sput-object v7, Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;->$VALUES:[Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;
    .locals 1

    .line 1
    const-class v0, Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;

    return-object p0
.end method

.method public static values()[Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;->$VALUES:[Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;

    invoke-virtual {v0}, [Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/wallpaper/model/SetWallpaperViewModel$SetWallpaperStatus;

    return-object v0
.end method
