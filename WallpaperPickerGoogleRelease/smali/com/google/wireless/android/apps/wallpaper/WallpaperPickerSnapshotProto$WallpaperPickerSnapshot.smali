.class public final Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/google/protobuf/MessageLiteOrBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;",
        "Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot$Builder;",
        ">;"
    }
.end annotation


# static fields
.field public static final APP_LAUNCH_COUNT_FIELD_NUMBER:I = 0x3

.field private static final DEFAULT_INSTANCE:Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;

.field public static final FIRST_LAUNCH_DATE_SINCE_SETUP_FIELD_NUMBER:I = 0x1

.field public static final FIRST_WALLPAPER_APPLY_DATE_SINCE_SETUP_FIELD_NUMBER:I = 0x2

.field public static final HOME_WALLPAPER_CATEGORY_FIELD_NUMBER:I = 0x4

.field public static final HOME_WALLPAPER_ID_FIELD_NUMBER:I = 0x5

.field public static final LOCK_SCREEN_WALLPAPER_CATEGORY_FIELD_NUMBER:I = 0x6

.field public static final LOCK_SCREEN_WALLPAPER_ID_FIELD_NUMBER:I = 0x7

.field private static volatile PARSER:Lcom/google/protobuf/Parser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Parser<",
            "Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private appLaunchCount_:I

.field private bitField0_:I

.field private firstLaunchDateSinceSetup_:I

.field private firstWallpaperApplyDateSinceSetup_:I

.field private homeWallpaperCategory_:Ljava/lang/String;

.field private homeWallpaperId_:Ljava/lang/String;

.field private lockScreenWallpaperCategory_:Ljava/lang/String;

.field private lockScreenWallpaperId_:Ljava/lang/String;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;

    invoke-direct {v0}, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;-><init>()V

    .line 2
    sput-object v0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->DEFAULT_INSTANCE:Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;

    .line 3
    const-class v1, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;

    invoke-static {v1, v0}, Lcom/google/protobuf/GeneratedMessageLite;->registerDefaultInstance(Ljava/lang/Class;Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    const-string v0, ""

    .line 2
    iput-object v0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->homeWallpaperCategory_:Ljava/lang/String;

    .line 3
    iput-object v0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->homeWallpaperId_:Ljava/lang/String;

    .line 4
    iput-object v0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->lockScreenWallpaperCategory_:Ljava/lang/String;

    .line 5
    iput-object v0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->lockScreenWallpaperId_:Ljava/lang/String;

    return-void
.end method

.method public static synthetic access$000()Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->DEFAULT_INSTANCE:Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;

    return-object v0
.end method

.method public static access$100(Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->bitField0_:I

    .line 2
    iput p1, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->firstLaunchDateSinceSetup_:I

    return-void
.end method

.method public static access$1000(Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iget v0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->bitField0_:I

    or-int/lit8 v0, v0, 0x10

    iput v0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->bitField0_:I

    .line 4
    iput-object p1, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->homeWallpaperId_:Ljava/lang/String;

    return-void
.end method

.method public static access$1300(Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iget v0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->bitField0_:I

    or-int/lit8 v0, v0, 0x20

    iput v0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->bitField0_:I

    .line 4
    iput-object p1, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->lockScreenWallpaperCategory_:Ljava/lang/String;

    return-void
.end method

.method public static access$1600(Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iget v0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->bitField0_:I

    or-int/lit8 v0, v0, 0x40

    iput v0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->bitField0_:I

    .line 4
    iput-object p1, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->lockScreenWallpaperId_:Ljava/lang/String;

    return-void
.end method

.method public static access$300(Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->bitField0_:I

    .line 2
    iput p1, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->firstWallpaperApplyDateSinceSetup_:I

    return-void
.end method

.method public static access$500(Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->bitField0_:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->bitField0_:I

    .line 2
    iput p1, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->appLaunchCount_:I

    return-void
.end method

.method public static access$700(Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iget v0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->bitField0_:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->bitField0_:I

    .line 4
    iput-object p1, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->homeWallpaperCategory_:Ljava/lang/String;

    return-void
.end method

.method public static newBuilder()Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->DEFAULT_INSTANCE:Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->createBuilder()Lcom/google/protobuf/GeneratedMessageLite$Builder;

    move-result-object v0

    check-cast v0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot$Builder;

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
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p0, :cond_1

    .line 4
    const-class p1, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;

    monitor-enter p1

    .line 5
    :try_start_0
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->PARSER:Lcom/google/protobuf/Parser;

    if-nez p0, :cond_0

    .line 6
    new-instance p0, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;

    sget-object p2, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->DEFAULT_INSTANCE:Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;

    invoke-direct {p0, p2}, Lcom/google/protobuf/GeneratedMessageLite$DefaultInstanceBasedParser;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 7
    sput-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->PARSER:Lcom/google/protobuf/Parser;

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
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->DEFAULT_INSTANCE:Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;

    return-object p0

    .line 10
    :pswitch_2
    new-instance p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot$Builder;

    invoke-direct {p0, p2}, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot$Builder;-><init>(Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$1;)V

    return-object p0

    .line 11
    :pswitch_3
    new-instance p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;

    invoke-direct {p0}, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;-><init>()V

    return-object p0

    :pswitch_4
    const/16 p0, 0x8

    new-array p0, p0, [Ljava/lang/Object;

    const/4 p2, 0x0

    const-string p3, "bitField0_"

    aput-object p3, p0, p2

    const-string p2, "firstLaunchDateSinceSetup_"

    aput-object p2, p0, p1

    const/4 p1, 0x2

    const-string p2, "firstWallpaperApplyDateSinceSetup_"

    aput-object p2, p0, p1

    const/4 p1, 0x3

    const-string p2, "appLaunchCount_"

    aput-object p2, p0, p1

    const/4 p1, 0x4

    const-string p2, "homeWallpaperCategory_"

    aput-object p2, p0, p1

    const/4 p1, 0x5

    const-string p2, "homeWallpaperId_"

    aput-object p2, p0, p1

    const/4 p1, 0x6

    const-string p2, "lockScreenWallpaperCategory_"

    aput-object p2, p0, p1

    const/4 p1, 0x7

    const-string p2, "lockScreenWallpaperId_"

    aput-object p2, p0, p1

    const-string p1, "\u0001\u0007\u0000\u0001\u0001\u0007\u0007\u0000\u0000\u0000\u0001\u0004\u0000\u0002\u0004\u0001\u0003\u0004\u0002\u0004\u0008\u0003\u0005\u0008\u0004\u0006\u0008\u0005\u0007\u0008\u0006"

    .line 12
    sget-object p2, Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;->DEFAULT_INSTANCE:Lcom/google/wireless/android/apps/wallpaper/WallpaperPickerSnapshotProto$WallpaperPickerSnapshot;

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
