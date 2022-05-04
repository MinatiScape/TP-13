.class public final Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/google/protobuf/MessageLiteOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;",
        "Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse$Builder;",
        ">;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;

.field public static final IMAGES_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Lcom/google/protobuf/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private images_:Lcom/google/protobuf/Internal$ProtobufList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Internal$ProtobufList<",
            "Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;

    invoke-direct {v0}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;-><init>()V

    .line 2
    sput-object v0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;->DEFAULT_INSTANCE:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;

    .line 3
    const-class v1, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;

    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 2
    sget-object v0, Lcom/google/protobuf/ProtobufArrayList;->EMPTY_LIST:Lcom/google/protobuf/ProtobufArrayList;

    .line 3
    iput-object v0, p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;->images_:Lcom/google/protobuf/Internal$ProtobufList;

    return-void
.end method

.method public static synthetic access$8300()Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;->DEFAULT_INSTANCE:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;

    return-object v0
.end method

.method public static parser()Lcom/google/protobuf/Parser;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;->DEFAULT_INSTANCE:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->getParserForType()Lcom/google/protobuf/Parser;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    const/4 p1, 0x1

    const/4 p2, 0x0

    packed-switch p0, :pswitch_data_0

    .line 2
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0

    .line 3
    :pswitch_0
    sget-object p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p0, :cond_1

    .line 4
    const-class p1, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;

    monitor-enter p1

    .line 5
    :try_start_0
    sget-object p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p0, :cond_0

    .line 6
    new-instance p0, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p2, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;->DEFAULT_INSTANCE:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;

    invoke-direct {p0, p2}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 7
    sput-object p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;->PARSER:Lcom/google/protobuf/Parser;

    .line 8
    :cond_0
    monitor-exit p1

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_1
    :goto_0
    return-object p0

    .line 9
    :pswitch_1
    sget-object p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;->DEFAULT_INSTANCE:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;

    return-object p0

    .line 10
    :pswitch_2
    new-instance p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse$Builder;

    invoke-direct {p0, p2}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse$Builder;-><init>(Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$1;)V

    return-object p0

    .line 11
    :pswitch_3
    new-instance p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;

    invoke-direct {p0}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;-><init>()V

    return-object p0

    :pswitch_4
    const/4 p0, 0x2

    new-array p0, p0, [Ljava/lang/Object;

    const/4 p2, 0x0

    const-string p3, "images_"

    aput-object p3, p0, p2

    .line 12
    const-class p2, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;

    aput-object p2, p0, p1

    const-string p1, "\u0001\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0001\u0000\u0001\u001b"

    .line 13
    sget-object p2, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;->DEFAULT_INSTANCE:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;

    .line 14
    new-instance p3, Lcom/google/protobuf/RawMessageInfo;

    invoke-direct {p3, p2, p1, p0}, Lcom/google/protobuf/RawMessageInfo;-><init>(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)V

    return-object p3

    :pswitch_5
    return-object p2

    .line 15
    :pswitch_6
    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p0

    return-object p0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getImagesList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImagesInCollectionResponse;->images_:Lcom/google/protobuf/Internal$ProtobufList;

    return-object p0
.end method
