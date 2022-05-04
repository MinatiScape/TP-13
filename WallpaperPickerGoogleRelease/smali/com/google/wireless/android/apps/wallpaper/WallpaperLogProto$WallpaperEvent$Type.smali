.class public final enum Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;
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
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type$TypeVerifier;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;",
        ">;",
        "Lcom/google/protobuf/Internal$EnumLite;"
    }
.end annotation


# static fields
.field public static final synthetic $VALUES:[Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

.field public static final enum APP_LAUNCHED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

.field public static final enum BUILD_CASE_CLICKED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

.field public static final enum CATEGORY_SELECTED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

.field public static final enum CLOCKFACE_APPLIED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

.field public static final enum CLOCKFACE_SELECTED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

.field public static final enum CURRENT_THUMBNAIL_PREVIEWED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

.field public static final enum DAILY_REFRESH_TURNED_ON:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

.field public static final enum EXPLORE_CLICKED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

.field public static final enum GRID_APPLIED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

.field public static final enum GRID_SELECTED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

.field public static final enum INDIVIDUAL_WALLPAPER_SELECTED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

.field public static final enum LIVE_WALLPAPER_CUSTOMIZE_SELECT:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

.field public static final enum LIVE_WALLPAPER_INFO_SELECT:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

.field public static final enum ONRESUME_STYLE:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

.field public static final enum ONRESUME_STYLE_SUW:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

.field public static final enum ONRESUME_WP:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

.field public static final enum ONRESUME_WP_SUW:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

.field public static final enum ONSTOP:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

.field public static final enum SNAPSHOT:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

.field public static final enum THEMEBUNDLE_APPLIED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

.field public static final enum THEMEBUNDLE_SELECTED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

.field public static final enum TYPE_UNSPECIFIED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

.field public static final enum WALLPAPER_SET:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;


# instance fields
.field private final value:I


# direct methods
.method public static constructor <clinit>()V
    .locals 26

    .line 1
    new-instance v0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    const-string v1, "TYPE_UNSPECIFIED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->TYPE_UNSPECIFIED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    .line 2
    new-instance v1, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    const-string v3, "APP_LAUNCHED"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4, v4}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->APP_LAUNCHED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    .line 3
    new-instance v3, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    const-string v5, "WALLPAPER_SET"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6, v6}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->WALLPAPER_SET:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    .line 4
    new-instance v5, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    const-string v7, "DAILY_REFRESH_TURNED_ON"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8, v8}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->DAILY_REFRESH_TURNED_ON:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    .line 5
    new-instance v7, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    const-string v9, "CATEGORY_SELECTED"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10, v10}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;-><init>(Ljava/lang/String;II)V

    sput-object v7, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->CATEGORY_SELECTED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    .line 6
    new-instance v9, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    const-string v11, "INDIVIDUAL_WALLPAPER_SELECTED"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12, v12}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;-><init>(Ljava/lang/String;II)V

    sput-object v9, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->INDIVIDUAL_WALLPAPER_SELECTED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    .line 7
    new-instance v11, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    const-string v13, "CURRENT_THUMBNAIL_PREVIEWED"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14, v14}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;-><init>(Ljava/lang/String;II)V

    sput-object v11, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->CURRENT_THUMBNAIL_PREVIEWED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    .line 8
    new-instance v13, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    const-string v15, "EXPLORE_CLICKED"

    const/4 v14, 0x7

    invoke-direct {v13, v15, v14, v14}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;-><init>(Ljava/lang/String;II)V

    sput-object v13, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->EXPLORE_CLICKED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    .line 9
    new-instance v15, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    const-string v14, "BUILD_CASE_CLICKED"

    const/16 v12, 0x8

    invoke-direct {v15, v14, v12, v12}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;-><init>(Ljava/lang/String;II)V

    sput-object v15, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->BUILD_CASE_CLICKED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    .line 10
    new-instance v14, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    const-string v12, "CLOCKFACE_SELECTED"

    const/16 v10, 0x9

    invoke-direct {v14, v12, v10, v10}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;-><init>(Ljava/lang/String;II)V

    sput-object v14, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->CLOCKFACE_SELECTED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    .line 11
    new-instance v12, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    const-string v10, "CLOCKFACE_APPLIED"

    const/16 v8, 0xa

    invoke-direct {v12, v10, v8, v8}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;-><init>(Ljava/lang/String;II)V

    sput-object v12, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->CLOCKFACE_APPLIED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    .line 12
    new-instance v10, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    const-string v8, "THEMEBUNDLE_SELECTED"

    const/16 v6, 0xb

    invoke-direct {v10, v8, v6, v6}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;-><init>(Ljava/lang/String;II)V

    sput-object v10, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->THEMEBUNDLE_SELECTED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    .line 13
    new-instance v8, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    const-string v6, "THEMEBUNDLE_APPLIED"

    const/16 v4, 0xc

    invoke-direct {v8, v6, v4, v4}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;-><init>(Ljava/lang/String;II)V

    sput-object v8, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->THEMEBUNDLE_APPLIED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    .line 14
    new-instance v6, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    const-string v4, "GRID_SELECTED"

    const/16 v2, 0xd

    invoke-direct {v6, v4, v2, v2}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->GRID_SELECTED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    .line 15
    new-instance v4, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    const-string v2, "GRID_APPLIED"

    move-object/from16 v16, v6

    const/16 v6, 0xe

    invoke-direct {v4, v2, v6, v6}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->GRID_APPLIED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    .line 16
    new-instance v2, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    const-string v6, "ONRESUME_WP_SUW"

    move-object/from16 v17, v4

    const/16 v4, 0xf

    invoke-direct {v2, v6, v4, v4}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->ONRESUME_WP_SUW:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    .line 17
    new-instance v6, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    const-string v4, "ONRESUME_STYLE_SUW"

    move-object/from16 v18, v2

    const/16 v2, 0x10

    invoke-direct {v6, v4, v2, v2}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->ONRESUME_STYLE_SUW:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    .line 18
    new-instance v4, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    const-string v2, "ONRESUME_WP"

    move-object/from16 v19, v6

    const/16 v6, 0x11

    invoke-direct {v4, v2, v6, v6}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->ONRESUME_WP:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    .line 19
    new-instance v2, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    const-string v6, "ONRESUME_STYLE"

    move-object/from16 v20, v4

    const/16 v4, 0x12

    invoke-direct {v2, v6, v4, v4}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->ONRESUME_STYLE:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    .line 20
    new-instance v6, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    const-string v4, "ONSTOP"

    move-object/from16 v21, v2

    const/16 v2, 0x13

    invoke-direct {v6, v4, v2, v2}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->ONSTOP:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    .line 21
    new-instance v4, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    const-string v2, "LIVE_WALLPAPER_INFO_SELECT"

    move-object/from16 v22, v6

    const/16 v6, 0x14

    invoke-direct {v4, v2, v6, v6}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->LIVE_WALLPAPER_INFO_SELECT:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    .line 22
    new-instance v2, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    const-string v6, "LIVE_WALLPAPER_CUSTOMIZE_SELECT"

    move-object/from16 v23, v4

    const/16 v4, 0x15

    invoke-direct {v2, v6, v4, v4}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->LIVE_WALLPAPER_CUSTOMIZE_SELECT:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    .line 23
    new-instance v6, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    const-string v4, "SNAPSHOT"

    move-object/from16 v24, v2

    const/16 v2, 0x16

    move-object/from16 v25, v8

    const/16 v8, 0x16

    invoke-direct {v6, v4, v2, v8}, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->SNAPSHOT:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    const/16 v2, 0x17

    new-array v2, v2, [Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    const/4 v4, 0x0

    aput-object v0, v2, v4

    const/4 v0, 0x1

    aput-object v1, v2, v0

    const/4 v0, 0x2

    aput-object v3, v2, v0

    const/4 v0, 0x3

    aput-object v5, v2, v0

    const/4 v0, 0x4

    aput-object v7, v2, v0

    const/4 v0, 0x5

    aput-object v9, v2, v0

    const/4 v0, 0x6

    aput-object v11, v2, v0

    const/4 v0, 0x7

    aput-object v13, v2, v0

    const/16 v0, 0x8

    aput-object v15, v2, v0

    const/16 v0, 0x9

    aput-object v14, v2, v0

    const/16 v0, 0xa

    aput-object v12, v2, v0

    const/16 v0, 0xb

    aput-object v10, v2, v0

    const/16 v0, 0xc

    aput-object v25, v2, v0

    const/16 v0, 0xd

    aput-object v16, v2, v0

    const/16 v0, 0xe

    aput-object v17, v2, v0

    const/16 v0, 0xf

    aput-object v18, v2, v0

    const/16 v0, 0x10

    aput-object v19, v2, v0

    const/16 v0, 0x11

    aput-object v20, v2, v0

    const/16 v0, 0x12

    aput-object v21, v2, v0

    const/16 v0, 0x13

    aput-object v22, v2, v0

    const/16 v0, 0x14

    aput-object v23, v2, v0

    const/16 v0, 0x15

    aput-object v24, v2, v0

    const/16 v0, 0x16

    aput-object v6, v2, v0

    .line 24
    sput-object v2, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->$VALUES:[Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

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
    iput p3, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->value:I

    return-void
.end method

.method public static forNumber(I)Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;
    .locals 0

    packed-switch p0, :pswitch_data_0

    const/4 p0, 0x0

    return-object p0

    .line 1
    :pswitch_0
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->SNAPSHOT:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    return-object p0

    .line 2
    :pswitch_1
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->LIVE_WALLPAPER_CUSTOMIZE_SELECT:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    return-object p0

    .line 3
    :pswitch_2
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->LIVE_WALLPAPER_INFO_SELECT:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    return-object p0

    .line 4
    :pswitch_3
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->ONSTOP:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    return-object p0

    .line 5
    :pswitch_4
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->ONRESUME_STYLE:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    return-object p0

    .line 6
    :pswitch_5
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->ONRESUME_WP:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    return-object p0

    .line 7
    :pswitch_6
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->ONRESUME_STYLE_SUW:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    return-object p0

    .line 8
    :pswitch_7
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->ONRESUME_WP_SUW:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    return-object p0

    .line 9
    :pswitch_8
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->GRID_APPLIED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    return-object p0

    .line 10
    :pswitch_9
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->GRID_SELECTED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    return-object p0

    .line 11
    :pswitch_a
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->THEMEBUNDLE_APPLIED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    return-object p0

    .line 12
    :pswitch_b
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->THEMEBUNDLE_SELECTED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    return-object p0

    .line 13
    :pswitch_c
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->CLOCKFACE_APPLIED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    return-object p0

    .line 14
    :pswitch_d
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->CLOCKFACE_SELECTED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    return-object p0

    .line 15
    :pswitch_e
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->BUILD_CASE_CLICKED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    return-object p0

    .line 16
    :pswitch_f
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->EXPLORE_CLICKED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    return-object p0

    .line 17
    :pswitch_10
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->CURRENT_THUMBNAIL_PREVIEWED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    return-object p0

    .line 18
    :pswitch_11
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->INDIVIDUAL_WALLPAPER_SELECTED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    return-object p0

    .line 19
    :pswitch_12
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->CATEGORY_SELECTED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    return-object p0

    .line 20
    :pswitch_13
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->DAILY_REFRESH_TURNED_ON:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    return-object p0

    .line 21
    :pswitch_14
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->WALLPAPER_SET:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    return-object p0

    .line 22
    :pswitch_15
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->APP_LAUNCHED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    return-object p0

    .line 23
    :pswitch_16
    sget-object p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->TYPE_UNSPECIFIED:Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    return-object p0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;
    .locals 1

    .line 1
    const-class v0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    return-object p0
.end method

.method public static values()[Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->$VALUES:[Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    invoke-virtual {v0}, [Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;

    return-object v0
.end method


# virtual methods
.method public final getNumber()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/wireless/android/apps/wallpaper/WallpaperLogProto$WallpaperEvent$Type;->value:I

    return p0
.end method
