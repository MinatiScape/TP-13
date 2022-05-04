.class public final Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type$TypeVerifier;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/protobuf/Internal$EnumVerifier;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "TypeVerifier"
.end annotation


# static fields
.field public static final INSTANCE:Lcom/google/protobuf/Internal$EnumVerifier;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type$TypeVerifier;

    invoke-direct {v0}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type$TypeVerifier;-><init>()V

    sput-object v0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type$TypeVerifier;->INSTANCE:Lcom/google/protobuf/Internal$EnumVerifier;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isInRange(I)Z
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->forNumber(I)Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
