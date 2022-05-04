.class public final Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/google/protobuf/MessageLiteOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;",
        "Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection$Builder;",
        ">;"
    }
.end annotation


# static fields
.field public static final COLLECTION_ID_FIELD_NUMBER:I = 0x1

.field public static final COLLECTION_NAME_FIELD_NUMBER:I = 0x2

.field private static final DEFAULT_INSTANCE:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;

.field private static volatile PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;",
            ">;"
        }
    .end annotation
.end field

.field public static final PREVIEW_FIELD_NUMBER:I = 0x3


# instance fields
.field private bitField0_:I

.field private collectionId_:Ljava/lang/String;

.field private collectionName_:Ljava/lang/String;

.field private preview_:Lcom/google/protobuf/Internal$ProtobufList;
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
    new-instance v0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;

    invoke-direct {v0}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;-><init>()V

    .line 2
    sput-object v0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;->DEFAULT_INSTANCE:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;

    .line 3
    const-class v1, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;

    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const-string v0, ""

    .line 2
    iput-object v0, p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;->collectionId_:Ljava/lang/String;

    .line 3
    iput-object v0, p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;->collectionName_:Ljava/lang/String;

    .line 4
    sget-object v0, Lcom/google/protobuf/ProtobufArrayList;->EMPTY_LIST:Lcom/google/protobuf/ProtobufArrayList;

    .line 5
    iput-object v0, p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;->preview_:Lcom/google/protobuf/Internal$ProtobufList;

    return-void
.end method

.method public static synthetic access$2600()Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;->DEFAULT_INSTANCE:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;

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
    sget-object p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p0, :cond_1

    .line 4
    const-class p1, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;

    monitor-enter p1

    .line 5
    :try_start_0
    sget-object p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p0, :cond_0

    .line 6
    new-instance p0, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p2, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;->DEFAULT_INSTANCE:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;

    invoke-direct {p0, p2}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 7
    sput-object p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;->PARSER:Lcom/google/protobuf/Parser;

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
    sget-object p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;->DEFAULT_INSTANCE:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;

    return-object p0

    .line 10
    :pswitch_2
    new-instance p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection$Builder;

    invoke-direct {p0, p2}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection$Builder;-><init>(Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$1;)V

    return-object p0

    .line 11
    :pswitch_3
    new-instance p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;

    invoke-direct {p0}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;-><init>()V

    return-object p0

    :pswitch_4
    const/4 p0, 0x5

    new-array p0, p0, [Ljava/lang/Object;

    const/4 p2, 0x0

    const-string p3, "bitField0_"

    aput-object p3, p0, p2

    const-string p2, "collectionId_"

    aput-object p2, p0, p1

    const/4 p1, 0x2

    const-string p2, "collectionName_"

    aput-object p2, p0, p1

    const/4 p1, 0x3

    const-string p2, "preview_"

    aput-object p2, p0, p1

    const/4 p1, 0x4

    .line 12
    const-class p2, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;

    aput-object p2, p0, p1

    const-string p1, "\u0001\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0001\u0000\u0001\u0008\u0000\u0002\u0008\u0001\u0003\u001b"

    .line 13
    sget-object p2, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;->DEFAULT_INSTANCE:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;

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

    nop

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

.method public getCollectionId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;->collectionId_:Ljava/lang/String;

    return-object p0
.end method

.method public getCollectionName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;->collectionName_:Ljava/lang/String;

    return-object p0
.end method

.method public getPreview(I)Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Collection;->preview_:Lcom/google/protobuf/Internal$ProtobufList;

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$Image;

    return-object p0
.end method
