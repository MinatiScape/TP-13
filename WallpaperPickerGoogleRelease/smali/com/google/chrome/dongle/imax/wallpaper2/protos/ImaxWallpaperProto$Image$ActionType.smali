.class public final enum Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Lcom/google/protobuf/Internal$EnumLite;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ActionType"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType$ActionTypeVerifier;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;",
        ">;",
        "Lcom/google/protobuf/Internal$EnumLite;"
    }
.end annotation


# static fields
.field public static final synthetic $VALUES:[Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;

.field public static final enum EXPLORE:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;

.field public static final enum LIVE_CASE:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;

.field public static final enum UNKNOWN:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;


# instance fields
.field private final value:I


# direct methods
.method public static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;

    const-string v1, "UNKNOWN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;->UNKNOWN:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;

    .line 2
    new-instance v1, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;

    const-string v3, "EXPLORE"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4, v4}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;->EXPLORE:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;

    .line 3
    new-instance v3, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;

    const-string v5, "LIVE_CASE"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6, v6}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;->LIVE_CASE:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;

    const/4 v5, 0x3

    new-array v5, v5, [Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    .line 4
    sput-object v5, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;->$VALUES:[Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    iput p3, p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;->value:I

    return-void
.end method

.method public static forNumber(I)Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;
    .locals 1

    if-eqz p0, :cond_2

    const/4 v0, 0x1

    if-eq p0, v0, :cond_1

    const/4 v0, 0x2

    if-eq p0, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 1
    :cond_0
    sget-object p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;->LIVE_CASE:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;

    return-object p0

    .line 2
    :cond_1
    sget-object p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;->EXPLORE:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;

    return-object p0

    .line 3
    :cond_2
    sget-object p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;->UNKNOWN:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;
    .locals 1

    .line 1
    const-class v0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;

    return-object p0
.end method

.method public static values()[Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;->$VALUES:[Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;

    invoke-virtual {v0}, [Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;

    return-object v0
.end method


# virtual methods
.method public final getNumber()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image$ActionType;->value:I

    return p0
.end method
