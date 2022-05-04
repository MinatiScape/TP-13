.class public final enum Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Lcom/google/protobuf/Internal$EnumLite;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "WallpaperSetSource"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource$WallpaperSetSourceVerifier;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;",
        ">;",
        "Lcom/google/protobuf/Internal$EnumLite;"
    }
.end annotation


# static fields
.field public static final synthetic $VALUES:[Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;

.field public static final enum MY_PHOTOS:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;

.field public static final enum ON_DEVICE:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;

.field public static final enum REMOTE:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;

.field public static final enum WALLPAPER_SET_SOURCE_UNSPECIFIED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;


# instance fields
.field private final value:I


# direct methods
.method public static constructor <clinit>()V
    .locals 9

    .line 1
    new-instance v0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;

    const-string v1, "WALLPAPER_SET_SOURCE_UNSPECIFIED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;->WALLPAPER_SET_SOURCE_UNSPECIFIED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;

    .line 2
    new-instance v1, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;

    const-string v3, "MY_PHOTOS"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4, v4}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;->MY_PHOTOS:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;

    .line 3
    new-instance v3, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;

    const-string v5, "ON_DEVICE"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6, v6}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;->ON_DEVICE:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;

    .line 4
    new-instance v5, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;

    const-string v7, "REMOTE"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8, v8}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;->REMOTE:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;

    const/4 v7, 0x4

    new-array v7, v7, [Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    .line 5
    sput-object v7, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;->$VALUES:[Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;

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
    iput p3, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;->value:I

    return-void
.end method

.method public static forNumber(I)Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;
    .locals 1

    if-eqz p0, :cond_3

    const/4 v0, 0x1

    if-eq p0, v0, :cond_2

    const/4 v0, 0x2

    if-eq p0, v0, :cond_1

    const/4 v0, 0x3

    if-eq p0, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 1
    :cond_0
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;->REMOTE:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;

    return-object p0

    .line 2
    :cond_1
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;->ON_DEVICE:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;

    return-object p0

    .line 3
    :cond_2
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;->MY_PHOTOS:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;

    return-object p0

    .line 4
    :cond_3
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;->WALLPAPER_SET_SOURCE_UNSPECIFIED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;
    .locals 1

    .line 1
    const-class v0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;

    return-object p0
.end method

.method public static values()[Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;->$VALUES:[Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;

    invoke-virtual {v0}, [Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;

    return-object v0
.end method


# virtual methods
.method public final getNumber()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;->value:I

    return p0
.end method
