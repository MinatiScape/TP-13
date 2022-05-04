.class public final enum Lcom/google/photos/base/ImageUrlOptionsEnum;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/photos/base/ImageUrlOptionsEnum;",
        ">;"
    }
.end annotation


# static fields
.field public static final synthetic $VALUES:[Lcom/google/photos/base/ImageUrlOptionsEnum;

.field public static final enum CENTER_CROP:Lcom/google/photos/base/ImageUrlOptionsEnum;

.field public static final enum HEIGHT:Lcom/google/photos/base/ImageUrlOptionsEnum;

.field public static final enum QUALITY_BUCKET:Lcom/google/photos/base/ImageUrlOptionsEnum;

.field public static final enum QUALITY_LEVEL:Lcom/google/photos/base/ImageUrlOptionsEnum;

.field public static final enum SIZE:Lcom/google/photos/base/ImageUrlOptionsEnum;

.field public static final enum WIDTH:Lcom/google/photos/base/ImageUrlOptionsEnum;


# instance fields
.field private optionKey:Ljava/lang/String;

.field private optionTag:I

.field private optionType:Lcom/google/photos/base/ImageUrlOptionType;

.field private signedOptionKey:Ljava/lang/String;


# direct methods
.method public static constructor <clinit>()V
    .locals 101

    .line 1
    new-instance v7, Lcom/google/photos/base/ImageUrlOptionsEnum;

    sget-object v8, Lcom/google/photos/base/ImageUrlOptionType;->INTEGER:Lcom/google/photos/base/ImageUrlOptionType;

    const-string v1, "SIZE"

    const/4 v2, 0x0

    const-string v3, "s"

    const-string v4, "S"

    const/4 v6, 0x1

    move-object v0, v7

    move-object v5, v8

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    sput-object v7, Lcom/google/photos/base/ImageUrlOptionsEnum;->SIZE:Lcom/google/photos/base/ImageUrlOptionsEnum;

    .line 2
    new-instance v9, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "WIDTH"

    const/4 v2, 0x1

    const-string v3, "w"

    const-string v4, "W"

    const/16 v6, 0xc

    move-object v0, v9

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    sput-object v9, Lcom/google/photos/base/ImageUrlOptionsEnum;->WIDTH:Lcom/google/photos/base/ImageUrlOptionsEnum;

    .line 3
    new-instance v17, Lcom/google/photos/base/ImageUrlOptionsEnum;

    sget-object v18, Lcom/google/photos/base/ImageUrlOptionType;->BOOLEAN:Lcom/google/photos/base/ImageUrlOptionType;

    const-string v11, "CROP"

    const/4 v12, 0x2

    const-string v13, "c"

    const-string v14, "C"

    const/16 v16, 0x2

    move-object/from16 v10, v17

    move-object/from16 v15, v18

    invoke-direct/range {v10 .. v16}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 4
    new-instance v10, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "DOWNLOAD"

    const/4 v2, 0x3

    const-string v3, "d"

    const-string v4, "D"

    const/4 v6, 0x3

    move-object v0, v10

    move-object/from16 v5, v18

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 5
    new-instance v11, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "HEIGHT"

    const/4 v2, 0x4

    const-string v3, "h"

    const-string v4, "H"

    const/16 v6, 0xd

    move-object v0, v11

    move-object v5, v8

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    sput-object v11, Lcom/google/photos/base/ImageUrlOptionsEnum;->HEIGHT:Lcom/google/photos/base/ImageUrlOptionsEnum;

    .line 6
    new-instance v12, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "STRETCH"

    const/4 v2, 0x5

    const-string v3, "s"

    const-string v4, "S"

    const/16 v6, 0x21

    move-object v0, v12

    move-object/from16 v5, v18

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 7
    new-instance v13, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "HTML"

    const/4 v2, 0x6

    const-string v3, "h"

    const-string v4, "H"

    const/4 v6, 0x4

    move-object v0, v13

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 8
    new-instance v14, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "SMART_CROP"

    const/4 v2, 0x7

    const-string v3, "p"

    const-string v4, "P"

    const/16 v6, 0x13

    move-object v0, v14

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 9
    new-instance v15, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "SMART_CROP_NO_CLIP"

    const/16 v2, 0x8

    const-string v3, "pp"

    const-string v4, "Pp"

    const/16 v6, 0x34

    move-object v0, v15

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 10
    new-instance v16, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "SMART_CROP_USE_FACE"

    const/16 v2, 0x9

    const-string v3, "pf"

    const-string v4, "Pf"

    const/16 v6, 0x43

    move-object/from16 v0, v16

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 11
    new-instance v19, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "CENTER_CROP"

    const/16 v2, 0xa

    const-string v3, "n"

    const-string v4, "N"

    const/16 v6, 0x14

    move-object/from16 v0, v19

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    sput-object v19, Lcom/google/photos/base/ImageUrlOptionsEnum;->CENTER_CROP:Lcom/google/photos/base/ImageUrlOptionsEnum;

    .line 12
    new-instance v20, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "ROTATE"

    const/16 v2, 0xb

    const-string v3, "r"

    const-string v4, "R"

    const/16 v6, 0x1a

    move-object/from16 v0, v20

    move-object v5, v8

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 13
    new-instance v21, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "SKIP_REFERER_CHECK"

    const/16 v2, 0xc

    const-string v3, "r"

    const-string v4, "R"

    const/4 v6, 0x6

    move-object/from16 v0, v21

    move-object/from16 v5, v18

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 14
    new-instance v22, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "OVERLAY"

    const/16 v2, 0xd

    const-string v3, "o"

    const-string v4, "O"

    const/16 v6, 0x1b

    move-object/from16 v0, v22

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 15
    new-instance v30, Lcom/google/photos/base/ImageUrlOptionsEnum;

    sget-object v5, Lcom/google/photos/base/ImageUrlOptionType;->FIXED_LENGTH_BASE_64:Lcom/google/photos/base/ImageUrlOptionType;

    const-string v24, "OBJECT_ID"

    const/16 v25, 0xe

    const-string v26, "o"

    const-string v27, "O"

    const/16 v29, 0x7

    move-object/from16 v23, v30

    move-object/from16 v28, v5

    invoke-direct/range {v23 .. v29}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 16
    new-instance v23, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "FRAME_ID"

    const/16 v2, 0xf

    const-string v3, "j"

    const-string v4, "J"

    const/16 v6, 0x1d

    move-object/from16 v0, v23

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 17
    new-instance v24, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "TILE_X"

    const/16 v2, 0x10

    const-string v3, "x"

    const-string v4, "X"

    const/16 v6, 0x9

    move-object/from16 v0, v24

    move-object v5, v8

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 18
    new-instance v25, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "TILE_Y"

    const/16 v2, 0x11

    const-string v3, "y"

    const-string v4, "Y"

    const/16 v6, 0xa

    move-object/from16 v0, v25

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 19
    new-instance v26, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "TILE_ZOOM"

    const/16 v2, 0x12

    const-string v3, "z"

    const-string v4, "Z"

    const/16 v6, 0xb

    move-object/from16 v0, v26

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 20
    new-instance v27, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "TILE_GENERATION"

    const/16 v2, 0x13

    const-string v3, "g"

    const-string v4, "G"

    const/16 v6, 0xe

    move-object/from16 v0, v27

    move-object/from16 v5, v18

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 21
    new-instance v28, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "EXPIRATION_TIME"

    const/16 v2, 0x14

    const-string v3, "e"

    const-string v4, "E"

    const/16 v6, 0xf

    move-object/from16 v0, v28

    move-object v5, v8

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 22
    new-instance v29, Lcom/google/photos/base/ImageUrlOptionsEnum;

    sget-object v38, Lcom/google/photos/base/ImageUrlOptionType;->STRING:Lcom/google/photos/base/ImageUrlOptionType;

    const-string v32, "IMAGE_FILTER"

    const/16 v33, 0x15

    const-string v34, "f"

    const-string v35, "F"

    const/16 v37, 0x10

    move-object/from16 v31, v29

    move-object/from16 v36, v38

    invoke-direct/range {v31 .. v37}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 23
    new-instance v31, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "KILL_ANIMATION"

    const/16 v2, 0x16

    const-string v3, "k"

    const-string v4, "K"

    const/16 v6, 0x11

    move-object/from16 v0, v31

    move-object/from16 v5, v18

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 24
    new-instance v32, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "UNFILTERED"

    const/16 v2, 0x17

    const-string v3, "u"

    const-string v4, "U"

    const/16 v6, 0x12

    move-object/from16 v0, v32

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 25
    new-instance v33, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "UNFILTERED_WITH_TRANSFORMS"

    const/16 v2, 0x18

    const-string v3, "ut"

    const-string v4, "Ut"

    const/16 v6, 0x2d

    move-object/from16 v0, v33

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 26
    new-instance v34, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "INCLUDE_METADATA"

    const/16 v2, 0x19

    const-string v3, "i"

    const-string v4, "I"

    const/16 v6, 0x16

    move-object/from16 v0, v34

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 27
    new-instance v35, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "ES_PORTRAIT_APPROVED_ONLY"

    const/16 v2, 0x1a

    const-string v3, "a"

    const-string v4, "A"

    const/16 v6, 0x15

    move-object/from16 v0, v35

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 28
    new-instance v36, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "BYPASS_TAKEDOWN"

    const/16 v2, 0x1b

    const-string v3, "b"

    const-string v4, "B"

    const/16 v6, 0x17

    move-object/from16 v0, v36

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 29
    new-instance v37, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "BORDER_SIZE"

    const/16 v2, 0x1c

    const-string v3, "b"

    const-string v4, "B"

    const/16 v6, 0x26

    move-object/from16 v0, v37

    move-object v5, v8

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 30
    new-instance v46, Lcom/google/photos/base/ImageUrlOptionsEnum;

    sget-object v47, Lcom/google/photos/base/ImageUrlOptionType;->PREFIX_HEX:Lcom/google/photos/base/ImageUrlOptionType;

    const-string v40, "BORDER_COLOR"

    const/16 v41, 0x1d

    const-string v42, "c"

    const-string v43, "C"

    const/16 v45, 0x27

    move-object/from16 v39, v46

    move-object/from16 v44, v47

    invoke-direct/range {v39 .. v45}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 31
    new-instance v39, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "QUERY_STRING"

    const/16 v2, 0x1e

    const-string v3, "q"

    const-string v4, "Q"

    const/16 v6, 0x1c

    move-object/from16 v0, v39

    move-object/from16 v5, v38

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 32
    new-instance v40, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "HORIZONTAL_FLIP"

    const/16 v2, 0x1f

    const-string v3, "fh"

    const-string v4, "Fh"

    const/16 v6, 0x1e

    move-object/from16 v0, v40

    move-object/from16 v5, v18

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 33
    new-instance v41, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "VERTICAL_FLIP"

    const/16 v2, 0x20

    const-string v3, "fv"

    const-string v4, "Fv"

    const/16 v6, 0x1f

    move-object/from16 v0, v41

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 34
    new-instance v42, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "FORCE_TILE_GENERATION"

    const/16 v2, 0x21

    const-string v3, "fg"

    const-string v4, "Fg"

    const/16 v6, 0x22

    move-object/from16 v0, v42

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 35
    new-instance v43, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "IMAGE_CROP"

    const/16 v2, 0x22

    const-string v3, "ci"

    const-string v4, "Ci"

    const/16 v6, 0x20

    move-object/from16 v0, v43

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 36
    new-instance v44, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "REQUEST_WEBP"

    const/16 v2, 0x23

    const-string v3, "rw"

    const-string v4, "Rw"

    const/16 v6, 0x23

    move-object/from16 v0, v44

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 37
    new-instance v45, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "REQUEST_WEBP_UNLESS_MAYBE_TRANSPARENT"

    const/16 v2, 0x24

    const-string v3, "rwu"

    const-string v4, "Rwu"

    const/16 v6, 0x29

    move-object/from16 v0, v45

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 38
    new-instance v48, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "REQUEST_ANIMATED_WEBP"

    const/16 v2, 0x25

    const-string v3, "rwa"

    const-string v4, "Rwa"

    const/16 v6, 0x40

    move-object/from16 v0, v48

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 39
    new-instance v49, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "NO_WEBP"

    const/16 v2, 0x26

    const-string v3, "nw"

    const-string v4, "Nw"

    const/16 v6, 0x30

    move-object/from16 v0, v49

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 40
    new-instance v50, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "REQUEST_H264"

    const/16 v2, 0x27

    const-string v3, "rh"

    const-string v4, "Rh"

    const/16 v6, 0x31

    move-object/from16 v0, v50

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 41
    new-instance v51, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "NO_OVERLAY"

    const/16 v2, 0x28

    const-string v3, "no"

    const-string v4, "No"

    const/16 v6, 0x25

    move-object/from16 v0, v51

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 42
    new-instance v52, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "NO_SILHOUETTE"

    const/16 v2, 0x29

    const-string v3, "ns"

    const-string v4, "Ns"

    const/16 v6, 0x28

    move-object/from16 v0, v52

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 43
    new-instance v53, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "FOCUS_BLUR"

    const/16 v2, 0x2a

    const-string v3, "k"

    const-string v4, "K"

    const/16 v6, 0x2a

    move-object/from16 v0, v53

    move-object v5, v8

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 44
    new-instance v54, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "FOCAL_PLANE"

    const/16 v2, 0x2b

    const-string v3, "p"

    const-string v4, "P"

    const/16 v6, 0x2b

    move-object/from16 v0, v54

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 45
    new-instance v55, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "QUALITY_LEVEL"

    const/16 v2, 0x2c

    const-string v3, "l"

    const-string v4, "L"

    const/16 v6, 0x2c

    move-object/from16 v0, v55

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    sput-object v55, Lcom/google/photos/base/ImageUrlOptionsEnum;->QUALITY_LEVEL:Lcom/google/photos/base/ImageUrlOptionsEnum;

    .line 46
    new-instance v56, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "QUALITY_BUCKET"

    const/16 v2, 0x2d

    const-string v3, "v"

    const-string v4, "V"

    const/16 v6, 0x3e

    move-object/from16 v0, v56

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    sput-object v56, Lcom/google/photos/base/ImageUrlOptionsEnum;->QUALITY_BUCKET:Lcom/google/photos/base/ImageUrlOptionsEnum;

    .line 47
    new-instance v57, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "NO_UPSCALE"

    const/16 v2, 0x2e

    const-string v3, "nu"

    const-string v4, "Nu"

    const/16 v6, 0x2e

    move-object/from16 v0, v57

    move-object/from16 v5, v18

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 48
    new-instance v58, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "FORCE_TRANSFORMATION"

    const/16 v2, 0x2f

    const-string v3, "ft"

    const-string v4, "Ft"

    const/16 v6, 0x32

    move-object/from16 v0, v58

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 49
    new-instance v59, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "CIRCLE_CROP"

    const/16 v2, 0x30

    const-string v3, "cc"

    const-string v4, "Cc"

    const/16 v6, 0x33

    move-object/from16 v0, v59

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 50
    new-instance v60, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "NO_DEFAULT_IMAGE"

    const/16 v2, 0x31

    const-string v3, "nd"

    const-string v4, "Nd"

    const/16 v6, 0x35

    move-object/from16 v0, v60

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 51
    new-instance v61, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "INCLUDE_PUBLIC_METADATA"

    const/16 v2, 0x32

    const-string v3, "ip"

    const-string v4, "Ip"

    const/16 v6, 0x36

    move-object/from16 v0, v61

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 52
    new-instance v62, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "NO_CORRECT_EXIF_ORIENTATION"

    const/16 v2, 0x33

    const-string v3, "nc"

    const-string v4, "Nc"

    const/16 v6, 0x37

    move-object/from16 v0, v62

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 53
    new-instance v63, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "SELECT_FRAME_NUMBER"

    const/16 v2, 0x34

    const-string v3, "a"

    const-string v4, "A"

    const/16 v6, 0x38

    move-object/from16 v0, v63

    move-object v5, v8

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 54
    new-instance v64, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "REQUEST_JPEG"

    const/16 v2, 0x35

    const-string v3, "rj"

    const-string v4, "Rj"

    const/16 v6, 0x39

    move-object/from16 v0, v64

    move-object/from16 v5, v18

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 55
    new-instance v65, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "REQUEST_PNG"

    const/16 v2, 0x36

    const-string v3, "rp"

    const-string v4, "Rp"

    const/16 v6, 0x3a

    move-object/from16 v0, v65

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 56
    new-instance v66, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "REQUEST_GIF"

    const/16 v2, 0x37

    const-string v3, "rg"

    const-string v4, "Rg"

    const/16 v6, 0x3b

    move-object/from16 v0, v66

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 57
    new-instance v67, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "PAD"

    const/16 v2, 0x38

    const-string v3, "pd"

    const-string v4, "Pd"

    const/16 v6, 0x3c

    move-object/from16 v0, v67

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 58
    new-instance v68, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "PRESERVE_ASPECT_RATIO"

    const/16 v2, 0x39

    const-string v3, "pa"

    const-string v4, "Pa"

    const/16 v6, 0x3d

    move-object/from16 v0, v68

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 59
    new-instance v69, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "VIDEO_FORMAT"

    const/16 v2, 0x3a

    const-string v3, "m"

    const-string v4, "M"

    const/16 v6, 0x3f

    move-object/from16 v0, v69

    move-object v5, v8

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 60
    new-instance v77, Lcom/google/photos/base/ImageUrlOptionsEnum;

    sget-object v78, Lcom/google/photos/base/ImageUrlOptionType;->LONG:Lcom/google/photos/base/ImageUrlOptionType;

    const-string v71, "VIDEO_BEGIN"

    const/16 v72, 0x3b

    const-string v73, "vb"

    const-string v74, "Vb"

    const/16 v76, 0x44

    move-object/from16 v70, v77

    move-object/from16 v75, v78

    invoke-direct/range {v70 .. v76}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 61
    new-instance v70, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "VIDEO_LENGTH"

    const/16 v2, 0x3c

    const-string v3, "vl"

    const-string v4, "Vl"

    const/16 v6, 0x45

    move-object/from16 v0, v70

    move-object/from16 v5, v78

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 62
    new-instance v71, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "LOOSE_FACE_CROP"

    const/16 v2, 0x3d

    const-string v3, "lf"

    const-string v4, "Lf"

    const/16 v6, 0x41

    move-object/from16 v0, v71

    move-object/from16 v5, v18

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 63
    new-instance v72, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "MATCH_VERSION"

    const/16 v2, 0x3e

    const-string v3, "mv"

    const-string v4, "Mv"

    const/16 v6, 0x42

    move-object/from16 v0, v72

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 64
    new-instance v73, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "IMAGE_DIGEST"

    const/16 v2, 0x3f

    const-string v3, "id"

    const-string v4, "Id"

    const/16 v6, 0x46

    move-object/from16 v0, v73

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 65
    new-instance v74, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "AUTOLOOP"

    const/16 v2, 0x40

    const-string v3, "al"

    const-string v4, "Al"

    const/16 v6, 0x4a

    move-object/from16 v0, v74

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 66
    new-instance v75, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "INTERNAL_CLIENT"

    const/16 v2, 0x41

    const-string v3, "ic"

    const-string v4, "Ic"

    const/16 v6, 0x47

    move-object/from16 v0, v75

    move-object v5, v8

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 67
    new-instance v76, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "TILE_PYRAMID_AS_PROTO"

    const/16 v2, 0x42

    const-string v3, "pg"

    const-string v4, "Pg"

    const/16 v6, 0x48

    move-object/from16 v0, v76

    move-object/from16 v5, v18

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 68
    new-instance v79, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "MONOGRAM"

    const/16 v2, 0x43

    const-string v3, "mo"

    const-string v4, "Mo"

    const/16 v6, 0x49

    move-object/from16 v0, v79

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 69
    new-instance v80, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "VERSIONED_TOKEN"

    const/16 v2, 0x44

    const-string v3, "nt0"

    const-string v4, "Nt0"

    const/16 v6, 0x24

    move-object/from16 v0, v80

    move-object/from16 v5, v38

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 70
    new-instance v81, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "IMAGE_VERSION"

    const/16 v2, 0x45

    const-string v3, "iv"

    const-string v4, "Iv"

    const/16 v6, 0x4b

    move-object/from16 v0, v81

    move-object/from16 v5, v78

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 71
    new-instance v78, Lcom/google/photos/base/ImageUrlOptionsEnum;

    sget-object v89, Lcom/google/photos/base/ImageUrlOptionType;->FLOAT:Lcom/google/photos/base/ImageUrlOptionType;

    const-string v83, "PITCH_DEGREES"

    const/16 v84, 0x46

    const-string v85, "pi"

    const-string v86, "Pi"

    const/16 v88, 0x4c

    move-object/from16 v82, v78

    move-object/from16 v87, v89

    invoke-direct/range {v82 .. v88}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 72
    new-instance v82, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "YAW_DEGREES"

    const/16 v2, 0x47

    const-string v3, "ya"

    const-string v4, "Ya"

    const/16 v6, 0x4d

    move-object/from16 v0, v82

    move-object/from16 v5, v89

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 73
    new-instance v83, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "ROLL_DEGREES"

    const/16 v2, 0x48

    const-string v3, "ro"

    const-string v4, "Ro"

    const/16 v6, 0x4e

    move-object/from16 v0, v83

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 74
    new-instance v84, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "FOV_DEGREES"

    const/16 v2, 0x49

    const-string v3, "fo"

    const-string v4, "Fo"

    const/16 v6, 0x4f

    move-object/from16 v0, v84

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 75
    new-instance v85, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "DETECT_FACES"

    const/16 v2, 0x4a

    const-string v3, "df"

    const-string v4, "Df"

    const/16 v6, 0x50

    move-object/from16 v0, v85

    move-object/from16 v5, v18

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 76
    new-instance v86, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "VIDEO_MULTI_FORMAT"

    const/16 v2, 0x4b

    const-string v3, "mm"

    const-string v4, "Mm"

    const/16 v6, 0x51

    move-object/from16 v0, v86

    move-object/from16 v5, v38

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 77
    new-instance v38, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "STRIP_GOOGLE_DATA"

    const/16 v2, 0x4c

    const-string v3, "sg"

    const-string v4, "Sg"

    const/16 v6, 0x52

    move-object/from16 v0, v38

    move-object/from16 v5, v18

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 78
    new-instance v87, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "PRESERVE_GOOGLE_DATA"

    const/16 v2, 0x4d

    const-string v3, "gd"

    const-string v4, "Gd"

    const/16 v6, 0x53

    move-object/from16 v0, v87

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 79
    new-instance v88, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "FORCE_MONOGRAM"

    const/16 v2, 0x4e

    const-string v3, "fm"

    const-string v4, "Fm"

    const/16 v6, 0x54

    move-object/from16 v0, v88

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 80
    new-instance v89, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "BADGE"

    const/16 v2, 0x4f

    const-string v3, "ba"

    const-string v4, "Ba"

    const/16 v6, 0x55

    move-object/from16 v0, v89

    move-object v5, v8

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 81
    new-instance v90, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "BORDER_RADIUS"

    const/16 v2, 0x50

    const-string v3, "br"

    const-string v4, "Br"

    const/16 v6, 0x56

    move-object/from16 v0, v90

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 82
    new-instance v91, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "BACKGROUND_COLOR"

    const/16 v2, 0x51

    const-string v3, "bc"

    const-string v4, "Bc"

    const/16 v6, 0x57

    move-object/from16 v0, v91

    move-object/from16 v5, v47

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 83
    new-instance v92, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "PAD_COLOR"

    const/16 v2, 0x52

    const-string v3, "pc"

    const-string v4, "Pc"

    const/16 v6, 0x58

    move-object/from16 v0, v92

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 84
    new-instance v93, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "SUBSTITUTION_COLOR"

    const/16 v2, 0x53

    const-string v3, "sc"

    const-string v4, "Sc"

    const/16 v6, 0x59

    move-object/from16 v0, v93

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 85
    new-instance v47, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "DOWNLOAD_VIDEO"

    const/16 v2, 0x54

    const-string v3, "dv"

    const-string v4, "Dv"

    const/16 v6, 0x5a

    move-object/from16 v0, v47

    move-object/from16 v5, v18

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 86
    new-instance v94, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "MONOGRAM_DOGFOOD"

    const/16 v2, 0x55

    const-string v3, "md"

    const-string v4, "Md"

    const/16 v6, 0x5b

    move-object/from16 v0, v94

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 87
    new-instance v95, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "COLOR_PROFILE"

    const/16 v2, 0x56

    const-string v3, "cp"

    const-string v4, "Cp"

    const/16 v6, 0x5c

    move-object/from16 v0, v95

    move-object v5, v8

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 88
    new-instance v96, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "STRIP_METADATA"

    const/16 v2, 0x57

    const-string v3, "sm"

    const-string v4, "Sm"

    const/16 v6, 0x5d

    move-object/from16 v0, v96

    move-object/from16 v5, v18

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 89
    new-instance v97, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "FACE_CROP_VERSION"

    const/16 v2, 0x58

    const-string v3, "cv"

    const-string v4, "Cv"

    const/16 v6, 0x5e

    move-object/from16 v0, v97

    move-object v5, v8

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 90
    new-instance v8, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "STRIP_GEOINFO"

    const/16 v2, 0x59

    const-string v3, "ng"

    const-string v4, "Ng"

    const/16 v6, 0x5f

    move-object v0, v8

    move-object/from16 v5, v18

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 91
    new-instance v98, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "IGNORE_LOW_RES_PROFILE_PHOTO"

    const/16 v2, 0x5a

    const-string v3, "il"

    const-string v4, "Il"

    const/16 v6, 0x60

    move-object/from16 v0, v98

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 92
    new-instance v99, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "LOSSY"

    const/16 v2, 0x5b

    const-string v3, "lo"

    const-string v4, "Lo"

    const/16 v6, 0x61

    move-object/from16 v0, v99

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    .line 93
    new-instance v100, Lcom/google/photos/base/ImageUrlOptionsEnum;

    const-string v1, "VIDEO_MANIFEST"

    const/16 v2, 0x5c

    const-string v3, "vm"

    const-string v4, "Vm"

    const/16 v6, 0x62

    move-object/from16 v0, v100

    invoke-direct/range {v0 .. v6}, Lcom/google/photos/base/ImageUrlOptionsEnum;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V

    const/16 v0, 0x5d

    new-array v0, v0, [Lcom/google/photos/base/ImageUrlOptionsEnum;

    const/4 v1, 0x0

    aput-object v7, v0, v1

    const/4 v1, 0x1

    aput-object v9, v0, v1

    const/4 v1, 0x2

    aput-object v17, v0, v1

    const/4 v1, 0x3

    aput-object v10, v0, v1

    const/4 v1, 0x4

    aput-object v11, v0, v1

    const/4 v1, 0x5

    aput-object v12, v0, v1

    const/4 v1, 0x6

    aput-object v13, v0, v1

    const/4 v1, 0x7

    aput-object v14, v0, v1

    const/16 v1, 0x8

    aput-object v15, v0, v1

    const/16 v1, 0x9

    aput-object v16, v0, v1

    const/16 v1, 0xa

    aput-object v19, v0, v1

    const/16 v1, 0xb

    aput-object v20, v0, v1

    const/16 v1, 0xc

    aput-object v21, v0, v1

    const/16 v1, 0xd

    aput-object v22, v0, v1

    const/16 v1, 0xe

    aput-object v30, v0, v1

    const/16 v1, 0xf

    aput-object v23, v0, v1

    const/16 v1, 0x10

    aput-object v24, v0, v1

    const/16 v1, 0x11

    aput-object v25, v0, v1

    const/16 v1, 0x12

    aput-object v26, v0, v1

    const/16 v1, 0x13

    aput-object v27, v0, v1

    const/16 v1, 0x14

    aput-object v28, v0, v1

    const/16 v1, 0x15

    aput-object v29, v0, v1

    const/16 v1, 0x16

    aput-object v31, v0, v1

    const/16 v1, 0x17

    aput-object v32, v0, v1

    const/16 v1, 0x18

    aput-object v33, v0, v1

    const/16 v1, 0x19

    aput-object v34, v0, v1

    const/16 v1, 0x1a

    aput-object v35, v0, v1

    const/16 v1, 0x1b

    aput-object v36, v0, v1

    const/16 v1, 0x1c

    aput-object v37, v0, v1

    const/16 v1, 0x1d

    aput-object v46, v0, v1

    const/16 v1, 0x1e

    aput-object v39, v0, v1

    const/16 v1, 0x1f

    aput-object v40, v0, v1

    const/16 v1, 0x20

    aput-object v41, v0, v1

    const/16 v1, 0x21

    aput-object v42, v0, v1

    const/16 v1, 0x22

    aput-object v43, v0, v1

    const/16 v1, 0x23

    aput-object v44, v0, v1

    const/16 v1, 0x24

    aput-object v45, v0, v1

    const/16 v1, 0x25

    aput-object v48, v0, v1

    const/16 v1, 0x26

    aput-object v49, v0, v1

    const/16 v1, 0x27

    aput-object v50, v0, v1

    const/16 v1, 0x28

    aput-object v51, v0, v1

    const/16 v1, 0x29

    aput-object v52, v0, v1

    const/16 v1, 0x2a

    aput-object v53, v0, v1

    const/16 v1, 0x2b

    aput-object v54, v0, v1

    const/16 v1, 0x2c

    aput-object v55, v0, v1

    const/16 v1, 0x2d

    aput-object v56, v0, v1

    const/16 v1, 0x2e

    aput-object v57, v0, v1

    const/16 v1, 0x2f

    aput-object v58, v0, v1

    const/16 v1, 0x30

    aput-object v59, v0, v1

    const/16 v1, 0x31

    aput-object v60, v0, v1

    const/16 v1, 0x32

    aput-object v61, v0, v1

    const/16 v1, 0x33

    aput-object v62, v0, v1

    const/16 v1, 0x34

    aput-object v63, v0, v1

    const/16 v1, 0x35

    aput-object v64, v0, v1

    const/16 v1, 0x36

    aput-object v65, v0, v1

    const/16 v1, 0x37

    aput-object v66, v0, v1

    const/16 v1, 0x38

    aput-object v67, v0, v1

    const/16 v1, 0x39

    aput-object v68, v0, v1

    const/16 v1, 0x3a

    aput-object v69, v0, v1

    const/16 v1, 0x3b

    aput-object v77, v0, v1

    const/16 v1, 0x3c

    aput-object v70, v0, v1

    const/16 v1, 0x3d

    aput-object v71, v0, v1

    const/16 v1, 0x3e

    aput-object v72, v0, v1

    const/16 v1, 0x3f

    aput-object v73, v0, v1

    const/16 v1, 0x40

    aput-object v74, v0, v1

    const/16 v1, 0x41

    aput-object v75, v0, v1

    const/16 v1, 0x42

    aput-object v76, v0, v1

    const/16 v1, 0x43

    aput-object v79, v0, v1

    const/16 v1, 0x44

    aput-object v80, v0, v1

    const/16 v1, 0x45

    aput-object v81, v0, v1

    const/16 v1, 0x46

    aput-object v78, v0, v1

    const/16 v1, 0x47

    aput-object v82, v0, v1

    const/16 v1, 0x48

    aput-object v83, v0, v1

    const/16 v1, 0x49

    aput-object v84, v0, v1

    const/16 v1, 0x4a

    aput-object v85, v0, v1

    const/16 v1, 0x4b

    aput-object v86, v0, v1

    const/16 v1, 0x4c

    aput-object v38, v0, v1

    const/16 v1, 0x4d

    aput-object v87, v0, v1

    const/16 v1, 0x4e

    aput-object v88, v0, v1

    const/16 v1, 0x4f

    aput-object v89, v0, v1

    const/16 v1, 0x50

    aput-object v90, v0, v1

    const/16 v1, 0x51

    aput-object v91, v0, v1

    const/16 v1, 0x52

    aput-object v92, v0, v1

    const/16 v1, 0x53

    aput-object v93, v0, v1

    const/16 v1, 0x54

    aput-object v47, v0, v1

    const/16 v1, 0x55

    aput-object v94, v0, v1

    const/16 v1, 0x56

    aput-object v95, v0, v1

    const/16 v1, 0x57

    aput-object v96, v0, v1

    const/16 v1, 0x58

    aput-object v97, v0, v1

    const/16 v1, 0x59

    aput-object v8, v0, v1

    const/16 v1, 0x5a

    aput-object v98, v0, v1

    const/16 v1, 0x5b

    aput-object v99, v0, v1

    const/16 v1, 0x5c

    aput-object v100, v0, v1

    .line 94
    sput-object v0, Lcom/google/photos/base/ImageUrlOptionsEnum;->$VALUES:[Lcom/google/photos/base/ImageUrlOptionsEnum;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/google/photos/base/ImageUrlOptionType;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "$enum$name",
            "$enum$ordinal",
            "optionKey",
            "signedOptionKey",
            "optionType",
            "optionTag"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/google/photos/base/ImageUrlOptionType;",
            "I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    iput-object p3, p0, Lcom/google/photos/base/ImageUrlOptionsEnum;->optionKey:Ljava/lang/String;

    .line 3
    iput-object p4, p0, Lcom/google/photos/base/ImageUrlOptionsEnum;->signedOptionKey:Ljava/lang/String;

    .line 4
    iput-object p5, p0, Lcom/google/photos/base/ImageUrlOptionsEnum;->optionType:Lcom/google/photos/base/ImageUrlOptionType;

    .line 5
    iput p6, p0, Lcom/google/photos/base/ImageUrlOptionsEnum;->optionTag:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/photos/base/ImageUrlOptionsEnum;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            "name"
        }
    .end annotation

    .line 1
    const-class v0, Lcom/google/photos/base/ImageUrlOptionsEnum;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/photos/base/ImageUrlOptionsEnum;

    return-object p0
.end method

.method public static values()[Lcom/google/photos/base/ImageUrlOptionsEnum;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/photos/base/ImageUrlOptionsEnum;->$VALUES:[Lcom/google/photos/base/ImageUrlOptionsEnum;

    invoke-virtual {v0}, [Lcom/google/photos/base/ImageUrlOptionsEnum;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/photos/base/ImageUrlOptionsEnum;

    return-object v0
.end method


# virtual methods
.method public getOptionKey()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/photos/base/ImageUrlOptionsEnum;->optionKey:Ljava/lang/String;

    return-object p0
.end method

.method public getOptionType()Lcom/google/photos/base/ImageUrlOptionType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/photos/base/ImageUrlOptionsEnum;->optionType:Lcom/google/photos/base/ImageUrlOptionType;

    return-object p0
.end method

.method public getSignedOptionKey()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/photos/base/ImageUrlOptionsEnum;->signedOptionKey:Ljava/lang/String;

    return-object p0
.end method
