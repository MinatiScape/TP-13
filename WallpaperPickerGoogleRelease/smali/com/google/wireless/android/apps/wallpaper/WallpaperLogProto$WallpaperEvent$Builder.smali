.class public final Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$Builder;
.source "SourceFile"

# interfaces
.implements Lcom/google/protobuf/MessageLiteOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$Builder<",
        "Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;",
        "Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Builder;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->access$000()Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/protobuf/GeneratedMessageLite$Builder;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method public constructor <init>(Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$1;)V
    .locals 0

    .line 2
    invoke-static {}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->access$000()Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/google/protobuf/GeneratedMessageLite$Builder;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method


# virtual methods
.method public setType(Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;)Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$Builder;->copyOnWrite()V

    .line 2
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;

    invoke-static {v0, p1}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->access$100(Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;)V

    return-object p0
.end method
