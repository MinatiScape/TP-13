.class public final Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/google/protobuf/MessageLiteOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Builder;,
        Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource;,
        Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;",
        "Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Builder;",
        ">;"
    }
.end annotation


# static fields
.field public static final ACCENT_COLOR_HASH_FIELD_NUMBER:I = 0x7

.field public static final ADAPTIVE_SHAPE_HASH_FIELD_NUMBER:I = 0x6

.field public static final CATEGORY_COLLECTION_ID_FIELD_NUMBER:I = 0x4

.field public static final CATEGORY_TITLE_FIELD_NUMBER:I = 0x3

.field public static final CLOCKFACE_HASH_FIELD_NUMBER:I = 0xa

.field private static final DEFAULT_INSTANCE:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;

.field public static final FONT_TYPE_HASH_FIELD_NUMBER:I = 0x8

.field public static final GRIDNAME_HASH_FIELD_NUMBER:I = 0xb

.field public static final IS_CUSTOM_FIELD_NUMBER:I = 0x9

.field private static volatile PARSER:Lcom/google/protobuf/Parser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE_FIELD_NUMBER:I = 0x1

.field public static final WALLPAPER_ID_FIELD_NUMBER:I = 0x5

.field public static final WALLPAPER_PICKER_SNAPSHOT_FIELD_NUMBER:I = 0xc

.field public static final WALLPAPER_SET_SOURCE_FIELD_NUMBER:I = 0x2


# instance fields
.field private accentColorHash_:I

.field private adaptiveShapeHash_:I

.field private bitField0_:I

.field private categoryCollectionId_:Ljava/lang/String;

.field private categoryTitle_:Ljava/lang/String;

.field private clockfaceHash_:I

.field private fontTypeHash_:I

.field private gridnameHash_:I

.field private isCustom_:Z

.field private type_:I

.field private wallpaperId_:Ljava/lang/String;

.field private wallpaperPickerSnapshot_:Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;

.field private wallpaperSetSource_:I


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;

    invoke-direct {v0}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;-><init>()V

    .line 2
    sput-object v0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->DEFAULT_INSTANCE:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;

    .line 3
    const-class v1, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;

    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const-string v0, ""

    .line 2
    iput-object v0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->categoryTitle_:Ljava/lang/String;

    .line 3
    iput-object v0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->categoryCollectionId_:Ljava/lang/String;

    .line 4
    iput-object v0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->wallpaperId_:Ljava/lang/String;

    return-void
.end method

.method public static synthetic access$000()Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->DEFAULT_INSTANCE:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;

    return-object v0
.end method

.method public static access$100(Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iget v0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->bitField0_:I

    .line 4
    invoke-virtual {p1}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->getNumber()I

    move-result p1

    iput p1, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->type_:I

    return-void
.end method

.method public static access$1100(Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iget v0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->bitField0_:I

    or-int/lit8 v0, v0, 0x10

    iput v0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->bitField0_:I

    .line 4
    iput-object p1, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->wallpaperId_:Ljava/lang/String;

    return-void
.end method

.method public static access$2400(Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->bitField0_:I

    or-int/lit16 v0, v0, 0x400

    iput v0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->bitField0_:I

    .line 2
    iput p1, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->gridnameHash_:I

    return-void
.end method

.method public static access$2600(Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iput-object p1, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->wallpaperPickerSnapshot_:Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;

    .line 4
    iget p1, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->bitField0_:I

    or-int/lit16 p1, p1, 0x800

    iput p1, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->bitField0_:I

    return-void
.end method

.method public static access$800(Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iget v0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->bitField0_:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->bitField0_:I

    .line 4
    iput-object p1, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->categoryCollectionId_:Ljava/lang/String;

    return-void
.end method

.method public static newBuilder()Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->DEFAULT_INSTANCE:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Builder;

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
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p0, :cond_1

    .line 4
    const-class p1, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;

    monitor-enter p1

    .line 5
    :try_start_0
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p0, :cond_0

    .line 6
    new-instance p0, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p2, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->DEFAULT_INSTANCE:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;

    invoke-direct {p0, p2}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 7
    sput-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->PARSER:Lcom/google/protobuf/Parser;

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
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->DEFAULT_INSTANCE:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;

    return-object p0

    .line 10
    :pswitch_2
    new-instance p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Builder;

    invoke-direct {p0, p2}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Builder;-><init>(Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$1;)V

    return-object p0

    .line 11
    :pswitch_3
    new-instance p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;

    invoke-direct {p0}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;-><init>()V

    return-object p0

    :pswitch_4
    const/16 p0, 0xf

    new-array p0, p0, [Ljava/lang/Object;

    const/4 p2, 0x0

    const-string p3, "bitField0_"

    aput-object p3, p0, p2

    const-string p2, "type_"

    aput-object p2, p0, p1

    const/4 p1, 0x2

    .line 12
    sget-object p2, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type$TypeVerifier;->INSTANCE:Lcom/google/protobuf/Internal$EnumVerifier;

    aput-object p2, p0, p1

    const/4 p1, 0x3

    const-string p2, "wallpaperSetSource_"

    aput-object p2, p0, p1

    const/4 p1, 0x4

    .line 13
    sget-object p2, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$WallpaperSetSource$WallpaperSetSourceVerifier;->INSTANCE:Lcom/google/protobuf/Internal$EnumVerifier;

    aput-object p2, p0, p1

    const/4 p1, 0x5

    const-string p2, "categoryTitle_"

    aput-object p2, p0, p1

    const/4 p1, 0x6

    const-string p2, "categoryCollectionId_"

    aput-object p2, p0, p1

    const/4 p1, 0x7

    const-string p2, "wallpaperId_"

    aput-object p2, p0, p1

    const/16 p1, 0x8

    const-string p2, "adaptiveShapeHash_"

    aput-object p2, p0, p1

    const/16 p1, 0x9

    const-string p2, "accentColorHash_"

    aput-object p2, p0, p1

    const/16 p1, 0xa

    const-string p2, "fontTypeHash_"

    aput-object p2, p0, p1

    const/16 p1, 0xb

    const-string p2, "isCustom_"

    aput-object p2, p0, p1

    const/16 p1, 0xc

    const-string p2, "clockfaceHash_"

    aput-object p2, p0, p1

    const/16 p1, 0xd

    const-string p2, "gridnameHash_"

    aput-object p2, p0, p1

    const/16 p1, 0xe

    const-string p2, "wallpaperPickerSnapshot_"

    aput-object p2, p0, p1

    const-string p1, "\u0001\u000c\u0000\u0001\u0001\u000c\u000c\u0000\u0000\u0000\u0001\u000c\u0000\u0002\u000c\u0001\u0003\u0008\u0002\u0004\u0008\u0003\u0005\u0008\u0004\u0006\u0004\u0005\u0007\u0004\u0006\u0008\u0004\u0007\t\u0007\u0008\n\u0004\t\u000b\u0004\n\u000c\t\u000b"

    .line 14
    sget-object p2, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->DEFAULT_INSTANCE:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;

    .line 15
    new-instance p3, Lcom/google/protobuf/RawMessageInfo;

    invoke-direct {p3, p2, p1, p0}, Lcom/google/protobuf/RawMessageInfo;-><init>(Lcom/google/protobuf/MessageLite;Ljava/lang/String;[Ljava/lang/Object;)V

    return-object p3

    :pswitch_5
    return-object p2

    .line 16
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

.method public getType()Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent;->type_:I

    invoke-static {p0}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->forNumber(I)Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    move-result-object p0

    if-nez p0, :cond_0

    .line 2
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->TYPE_UNSPECIFIED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    :cond_0
    return-object p0
.end method
