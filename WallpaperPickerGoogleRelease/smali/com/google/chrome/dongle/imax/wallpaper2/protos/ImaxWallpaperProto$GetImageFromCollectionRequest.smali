.class public final Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/google/protobuf/MessageLiteOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;",
        "Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest$Builder;",
        ">;"
    }
.end annotation


# static fields
.field public static final COLLECTION_IDS_FIELD_NUMBER:I = 0x1

.field private static final DEFAULT_INSTANCE:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;

.field public static final FILTERING_LABEL_FIELD_NUMBER:I = 0x5

.field public static final LANGUAGE_FIELD_NUMBER:I = 0x3

.field private static volatile PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;",
            ">;"
        }
    .end annotation
.end field

.field public static final REGION_FIELD_NUMBER:I = 0x4

.field public static final RESUME_TOKEN_FIELD_NUMBER:I = 0x2


# instance fields
.field private bitField0_:I

.field private collectionIds_:Lcom/google/protobuf/Internal$ProtobufList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Internal$ProtobufList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private filteringLabel_:Lcom/google/protobuf/Internal$ProtobufList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Internal$ProtobufList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private language_:Ljava/lang/String;

.field private region_:Ljava/lang/String;

.field private resumeToken_:Ljava/lang/String;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;

    invoke-direct {v0}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;-><init>()V

    .line 2
    sput-object v0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->DEFAULT_INSTANCE:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;

    .line 3
    const-class v1, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;

    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 2
    sget-object v0, Lcom/google/protobuf/ProtobufArrayList;->EMPTY_LIST:Lcom/google/protobuf/ProtobufArrayList;

    .line 3
    iput-object v0, p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->collectionIds_:Lcom/google/protobuf/Internal$ProtobufList;

    const-string v1, ""

    .line 4
    iput-object v1, p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->resumeToken_:Ljava/lang/String;

    .line 5
    iput-object v1, p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->language_:Ljava/lang/String;

    .line 6
    iput-object v1, p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->region_:Ljava/lang/String;

    .line 7
    iput-object v0, p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->filteringLabel_:Lcom/google/protobuf/Internal$ProtobufList;

    return-void
.end method

.method public static access$10000(Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iget v0, p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->bitField0_:I

    .line 4
    iput-object p1, p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->resumeToken_:Ljava/lang/String;

    return-void
.end method

.method public static access$10300(Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iget v0, p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->bitField0_:I

    .line 4
    iput-object p1, p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->language_:Ljava/lang/String;

    return-void
.end method

.method public static access$11100(Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;Ljava/lang/Iterable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->filteringLabel_:Lcom/google/protobuf/Internal$ProtobufList;

    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->isModifiable()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2
    iget-object v0, p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->filteringLabel_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 3
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/Internal$ProtobufList;)Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->filteringLabel_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 4
    :cond_0
    iget-object p0, p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->filteringLabel_:Lcom/google/protobuf/Internal$ProtobufList;

    invoke-static {p1, p0}, Lcom/google/protobuf/AbstractMessageLite;->addAll(Ljava/lang/Iterable;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic access$9400()Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->DEFAULT_INSTANCE:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;

    return-object v0
.end method

.method public static access$9600(Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iget-object v0, p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->collectionIds_:Lcom/google/protobuf/Internal$ProtobufList;

    invoke-interface {v0}, Lcom/google/protobuf/Internal$ProtobufList;->isModifiable()Z

    move-result v0

    if-nez v0, :cond_0

    .line 4
    iget-object v0, p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->collectionIds_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 5
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/Internal$ProtobufList;)Lcom/google/protobuf/Internal$ProtobufList;

    move-result-object v0

    iput-object v0, p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->collectionIds_:Lcom/google/protobuf/Internal$ProtobufList;

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->collectionIds_:Lcom/google/protobuf/Internal$ProtobufList;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static newBuilder()Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->DEFAULT_INSTANCE:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest$Builder;

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
    sget-object p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p0, :cond_1

    .line 4
    const-class p1, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;

    monitor-enter p1

    .line 5
    :try_start_0
    sget-object p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p0, :cond_0

    .line 6
    new-instance p0, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p2, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->DEFAULT_INSTANCE:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;

    invoke-direct {p0, p2}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 7
    sput-object p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->PARSER:Lcom/google/protobuf/Parser;

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
    sget-object p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->DEFAULT_INSTANCE:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;

    return-object p0

    .line 10
    :pswitch_2
    new-instance p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest$Builder;

    invoke-direct {p0, p2}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest$Builder;-><init>(Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$1;)V

    return-object p0

    .line 11
    :pswitch_3
    new-instance p0, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;

    invoke-direct {p0}, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;-><init>()V

    return-object p0

    :pswitch_4
    const/4 p0, 0x6

    new-array p0, p0, [Ljava/lang/Object;

    const/4 p2, 0x0

    const-string p3, "bitField0_"

    aput-object p3, p0, p2

    const-string p2, "collectionIds_"

    aput-object p2, p0, p1

    const/4 p1, 0x2

    const-string p2, "resumeToken_"

    aput-object p2, p0, p1

    const/4 p1, 0x3

    const-string p2, "language_"

    aput-object p2, p0, p1

    const/4 p1, 0x4

    const-string p2, "region_"

    aput-object p2, p0, p1

    const/4 p1, 0x5

    const-string p2, "filteringLabel_"

    aput-object p2, p0, p1

    const-string p1, "\u0001\u0005\u0000\u0001\u0001\u0005\u0005\u0000\u0002\u0000\u0001\u001a\u0002\u0008\u0000\u0003\u0008\u0001\u0004\u0008\u0002\u0005\u001a"

    .line 12
    sget-object p2, Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;->DEFAULT_INSTANCE:Lcom/google/chrome/dongle/imax/wallpaper2/protos/ImaxWallpaperProto$GetImageFromCollectionRequest;

    .line 13
    new-instance p3, Lcom/google/protobuf/RawMessageInfo;

    invoke-direct {p3, p2, p1, p0}, Lcom/google/protobuf/RawMessageInfo;-><init>(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)V

    return-object p3

    :pswitch_5
    return-object p2

    .line 14
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
