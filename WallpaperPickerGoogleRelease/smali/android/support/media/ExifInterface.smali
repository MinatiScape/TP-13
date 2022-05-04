.class public Landroid/support/media/ExifInterface;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;,
        Landroid/support/media/ExifInterface$ExifTag;,
        Landroid/support/media/ExifInterface$ExifAttribute;,
        Landroid/support/media/ExifInterface$Rational;
    }
.end annotation


# static fields
.field public static final ASCII:Ljava/nio/charset/Charset;

.field public static final BITS_PER_SAMPLE_GREYSCALE_2:[I

.field public static final BITS_PER_SAMPLE_RGB:[I

.field public static final EXIF_ASCII_PREFIX:[B

.field public static final EXIF_POINTER_TAGS:[Landroid/support/media/ExifInterface$ExifTag;

.field public static final EXIF_TAGS:[[Landroid/support/media/ExifInterface$ExifTag;

.field public static final FLIPPED_ROTATION_ORDER:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final IDENTIFIER_EXIF_APP1:[B

.field public static final IFD_FORMAT_BYTES_PER_FORMAT:[I

.field public static final IFD_FORMAT_NAMES:[Ljava/lang/String;

.field public static final JPEG_SIGNATURE:[B

.field public static final ORF_MAKER_NOTE_HEADER_1:[B

.field public static final ORF_MAKER_NOTE_HEADER_2:[B

.field public static final ROTATION_ORDER:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final TAG_RAF_IMAGE_SIZE:Landroid/support/media/ExifInterface$ExifTag;

.field public static final sExifPointerTagMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final sExifTagMapsForReading:[Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Landroid/support/media/ExifInterface$ExifTag;",
            ">;"
        }
    .end annotation
.end field

.field public static final sExifTagMapsForWriting:[Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/support/media/ExifInterface$ExifTag;",
            ">;"
        }
    .end annotation
.end field

.field public static final sTagSetForCompatibility:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final mAttributes:[Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/support/media/ExifInterface$ExifAttribute;",
            ">;"
        }
    .end annotation
.end field

.field public mExifByteOrder:Ljava/nio/ByteOrder;

.field public mExifOffset:I

.field public final mFilename:Ljava/lang/String;

.field public mMimeType:I

.field public mOrfMakerNoteOffset:I

.field public mOrfThumbnailLength:I

.field public mOrfThumbnailOffset:I

.field public mRw2JpgFromRawOffset:I


# direct methods
.method public static constructor <clinit>()V
    .locals 42

    const/4 v0, 0x4

    new-array v1, v0, [Ljava/lang/Integer;

    const/4 v2, 0x1

    .line 1
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v1, v4

    const/4 v5, 0x6

    .line 2
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v1, v2

    const/4 v6, 0x3

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/4 v8, 0x2

    .line 3
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v7, v1, v8

    const/16 v10, 0x8

    .line 4
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v1, v6

    .line 5
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    sput-object v1, Landroid/support/media/ExifInterface;->ROTATION_ORDER:Ljava/util/List;

    new-array v1, v0, [Ljava/lang/Integer;

    aput-object v9, v1, v4

    const/4 v12, 0x7

    .line 6
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v1, v2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v1, v8

    const/4 v14, 0x5

    .line 7
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v1, v6

    .line 8
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    sput-object v1, Landroid/support/media/ExifInterface;->FLIPPED_ROTATION_ORDER:Ljava/util/List;

    new-array v1, v6, [I

    .line 9
    fill-array-data v1, :array_0

    sput-object v1, Landroid/support/media/ExifInterface;->BITS_PER_SAMPLE_RGB:[I

    new-array v1, v2, [I

    aput v10, v1, v4

    .line 10
    sput-object v1, Landroid/support/media/ExifInterface;->BITS_PER_SAMPLE_GREYSCALE_2:[I

    new-array v1, v6, [B

    .line 11
    fill-array-data v1, :array_1

    sput-object v1, Landroid/support/media/ExifInterface;->JPEG_SIGNATURE:[B

    new-array v1, v5, [B

    .line 12
    fill-array-data v1, :array_2

    sput-object v1, Landroid/support/media/ExifInterface;->ORF_MAKER_NOTE_HEADER_1:[B

    const/16 v1, 0xa

    new-array v12, v1, [B

    .line 13
    fill-array-data v12, :array_3

    sput-object v12, Landroid/support/media/ExifInterface;->ORF_MAKER_NOTE_HEADER_2:[B

    const-string v16, ""

    const-string v17, "BYTE"

    const-string v18, "STRING"

    const-string v19, "USHORT"

    const-string v20, "ULONG"

    const-string v21, "URATIONAL"

    const-string v22, "SBYTE"

    const-string v23, "UNDEFINED"

    const-string v24, "SSHORT"

    const-string v25, "SLONG"

    const-string v26, "SRATIONAL"

    const-string v27, "SINGLE"

    const-string v28, "DOUBLE"

    .line 14
    filled-new-array/range {v16 .. v28}, [Ljava/lang/String;

    move-result-object v12

    sput-object v12, Landroid/support/media/ExifInterface;->IFD_FORMAT_NAMES:[Ljava/lang/String;

    const/16 v12, 0xe

    new-array v1, v12, [I

    .line 15
    fill-array-data v1, :array_4

    sput-object v1, Landroid/support/media/ExifInterface;->IFD_FORMAT_BYTES_PER_FORMAT:[I

    new-array v1, v10, [B

    .line 16
    fill-array-data v1, :array_5

    sput-object v1, Landroid/support/media/ExifInterface;->EXIF_ASCII_PREFIX:[B

    const/16 v1, 0x29

    new-array v1, v1, [Landroid/support/media/ExifInterface$ExifTag;

    .line 17
    new-instance v12, Landroid/support/media/ExifInterface$ExifTag;

    const-string v10, "NewSubfileType"

    const/16 v5, 0xfe

    const/4 v14, 0x0

    invoke-direct {v12, v10, v5, v0, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v12, v1, v4

    new-instance v5, Landroid/support/media/ExifInterface$ExifTag;

    const-string v10, "SubfileType"

    const/16 v12, 0xff

    invoke-direct {v5, v10, v12, v0, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v5, v1, v2

    new-instance v5, Landroid/support/media/ExifInterface$ExifTag;

    const-string v22, "ImageWidth"

    const/16 v23, 0x100

    const/16 v24, 0x3

    const/16 v25, 0x4

    const/16 v26, 0x0

    move-object/from16 v21, v5

    invoke-direct/range {v21 .. v26}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IIILandroid/support/media/ExifInterface$1;)V

    aput-object v5, v1, v8

    new-instance v5, Landroid/support/media/ExifInterface$ExifTag;

    const-string v28, "ImageLength"

    const/16 v29, 0x101

    const/16 v30, 0x3

    const/16 v31, 0x4

    const/16 v32, 0x0

    move-object/from16 v27, v5

    invoke-direct/range {v27 .. v32}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IIILandroid/support/media/ExifInterface$1;)V

    aput-object v5, v1, v6

    new-instance v5, Landroid/support/media/ExifInterface$ExifTag;

    const-string v10, "BitsPerSample"

    const/16 v12, 0x102

    invoke-direct {v5, v10, v12, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v5, v1, v0

    new-instance v5, Landroid/support/media/ExifInterface$ExifTag;

    const-string v10, "Compression"

    const/16 v12, 0x103

    invoke-direct {v5, v10, v12, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/4 v10, 0x5

    aput-object v5, v1, v10

    new-instance v5, Landroid/support/media/ExifInterface$ExifTag;

    const-string v10, "PhotometricInterpretation"

    const/16 v12, 0x106

    invoke-direct {v5, v10, v12, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/4 v10, 0x6

    aput-object v5, v1, v10

    new-instance v5, Landroid/support/media/ExifInterface$ExifTag;

    const-string v10, "ImageDescription"

    const/16 v12, 0x10e

    invoke-direct {v5, v10, v12, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/4 v10, 0x7

    aput-object v5, v1, v10

    new-instance v5, Landroid/support/media/ExifInterface$ExifTag;

    const-string v10, "Make"

    const/16 v12, 0x10f

    invoke-direct {v5, v10, v12, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v10, 0x8

    aput-object v5, v1, v10

    new-instance v5, Landroid/support/media/ExifInterface$ExifTag;

    const-string v10, "Model"

    const/16 v12, 0x110

    invoke-direct {v5, v10, v12, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v10, 0x9

    aput-object v5, v1, v10

    new-instance v5, Landroid/support/media/ExifInterface$ExifTag;

    const-string v22, "StripOffsets"

    const/16 v23, 0x111

    move-object/from16 v21, v5

    invoke-direct/range {v21 .. v26}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IIILandroid/support/media/ExifInterface$1;)V

    const/16 v12, 0xa

    aput-object v5, v1, v12

    new-instance v5, Landroid/support/media/ExifInterface$ExifTag;

    const-string v12, "Orientation"

    const/16 v10, 0x112

    invoke-direct {v5, v12, v10, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v10, 0xb

    aput-object v5, v1, v10

    new-instance v5, Landroid/support/media/ExifInterface$ExifTag;

    const-string v10, "SamplesPerPixel"

    const/16 v12, 0x115

    invoke-direct {v5, v10, v12, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v10, 0xc

    aput-object v5, v1, v10

    new-instance v5, Landroid/support/media/ExifInterface$ExifTag;

    const-string v23, "RowsPerStrip"

    const/16 v24, 0x116

    const/16 v25, 0x3

    const/16 v26, 0x4

    const/16 v27, 0x0

    move-object/from16 v22, v5

    invoke-direct/range {v22 .. v27}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IIILandroid/support/media/ExifInterface$1;)V

    const/16 v10, 0xd

    aput-object v5, v1, v10

    new-instance v5, Landroid/support/media/ExifInterface$ExifTag;

    const-string v23, "StripByteCounts"

    const/16 v24, 0x117

    move-object/from16 v22, v5

    invoke-direct/range {v22 .. v27}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IIILandroid/support/media/ExifInterface$1;)V

    const/16 v10, 0xe

    aput-object v5, v1, v10

    new-instance v5, Landroid/support/media/ExifInterface$ExifTag;

    const-string v10, "XResolution"

    const/16 v12, 0x11a

    const/4 v2, 0x5

    invoke-direct {v5, v10, v12, v2, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v10, 0xf

    aput-object v5, v1, v10

    new-instance v5, Landroid/support/media/ExifInterface$ExifTag;

    const-string v10, "YResolution"

    const/16 v12, 0x11b

    invoke-direct {v5, v10, v12, v2, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v2, 0x10

    aput-object v5, v1, v2

    new-instance v2, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "PlanarConfiguration"

    const/16 v10, 0x11c

    invoke-direct {v2, v5, v10, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v5, 0x11

    aput-object v2, v1, v5

    new-instance v2, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "ResolutionUnit"

    const/16 v10, 0x128

    invoke-direct {v2, v5, v10, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v5, 0x12

    aput-object v2, v1, v5

    new-instance v2, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "TransferFunction"

    const/16 v10, 0x12d

    invoke-direct {v2, v5, v10, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v5, 0x13

    aput-object v2, v1, v5

    new-instance v2, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "Software"

    const/16 v10, 0x131

    invoke-direct {v2, v5, v10, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v5, 0x14

    aput-object v2, v1, v5

    new-instance v2, Landroid/support/media/ExifInterface$ExifTag;

    const-string v10, "DateTime"

    const/16 v12, 0x132

    invoke-direct {v2, v10, v12, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v10, 0x15

    aput-object v2, v1, v10

    new-instance v2, Landroid/support/media/ExifInterface$ExifTag;

    const-string v12, "Artist"

    const/16 v10, 0x13b

    invoke-direct {v2, v12, v10, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v10, 0x16

    aput-object v2, v1, v10

    new-instance v2, Landroid/support/media/ExifInterface$ExifTag;

    const-string v12, "WhitePoint"

    const/16 v10, 0x13e

    const/4 v5, 0x5

    invoke-direct {v2, v12, v10, v5, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v10, 0x17

    aput-object v2, v1, v10

    new-instance v2, Landroid/support/media/ExifInterface$ExifTag;

    const-string v12, "PrimaryChromaticities"

    const/16 v4, 0x13f

    invoke-direct {v2, v12, v4, v5, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x18

    aput-object v2, v1, v4

    new-instance v2, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "SubIFDPointer"

    const/16 v12, 0x14a

    invoke-direct {v2, v5, v12, v0, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v5, 0x19

    aput-object v2, v1, v5

    new-instance v2, Landroid/support/media/ExifInterface$ExifTag;

    const-string v12, "JPEGInterchangeFormat"

    const/16 v5, 0x201

    invoke-direct {v2, v12, v5, v0, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v5, 0x1a

    aput-object v2, v1, v5

    new-instance v2, Landroid/support/media/ExifInterface$ExifTag;

    const-string v12, "JPEGInterchangeFormatLength"

    const/16 v5, 0x202

    invoke-direct {v2, v12, v5, v0, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v5, 0x1b

    aput-object v2, v1, v5

    new-instance v2, Landroid/support/media/ExifInterface$ExifTag;

    const-string v12, "YCbCrCoefficients"

    const/16 v5, 0x211

    const/4 v4, 0x5

    invoke-direct {v2, v12, v5, v4, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x1c

    aput-object v2, v1, v4

    new-instance v2, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "YCbCrSubSampling"

    const/16 v12, 0x212

    invoke-direct {v2, v5, v12, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v5, 0x1d

    aput-object v2, v1, v5

    new-instance v2, Landroid/support/media/ExifInterface$ExifTag;

    const-string v12, "YCbCrPositioning"

    const/16 v5, 0x213

    invoke-direct {v2, v12, v5, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v5, 0x1e

    aput-object v2, v1, v5

    new-instance v2, Landroid/support/media/ExifInterface$ExifTag;

    const-string v12, "ReferenceBlackWhite"

    const/16 v5, 0x214

    const/4 v4, 0x5

    invoke-direct {v2, v12, v5, v4, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x1f

    aput-object v2, v1, v4

    new-instance v2, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "Copyright"

    const v5, 0x8298

    invoke-direct {v2, v4, v5, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x20

    aput-object v2, v1, v4

    new-instance v2, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "ExifIFDPointer"

    const v5, 0x8769

    invoke-direct {v2, v4, v5, v0, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x21

    aput-object v2, v1, v4

    new-instance v2, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "GPSInfoIFDPointer"

    const v5, 0x8825

    invoke-direct {v2, v4, v5, v0, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x22

    aput-object v2, v1, v4

    new-instance v2, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "SensorTopBorder"

    invoke-direct {v2, v4, v0, v0, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x23

    aput-object v2, v1, v4

    new-instance v2, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "SensorLeftBorder"

    const/4 v5, 0x5

    invoke-direct {v2, v4, v5, v0, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x24

    aput-object v2, v1, v4

    new-instance v2, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "SensorBottomBorder"

    const/4 v5, 0x6

    invoke-direct {v2, v4, v5, v0, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x25

    aput-object v2, v1, v4

    new-instance v2, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "SensorRightBorder"

    const/4 v5, 0x7

    invoke-direct {v2, v4, v5, v0, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x26

    aput-object v2, v1, v4

    new-instance v2, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "ISO"

    invoke-direct {v2, v4, v10, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x27

    aput-object v2, v1, v4

    new-instance v2, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "JpgFromRaw"

    const/16 v10, 0x2e

    invoke-direct {v2, v4, v10, v5, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x28

    aput-object v2, v1, v4

    const/16 v2, 0x3b

    new-array v2, v2, [Landroid/support/media/ExifInterface$ExifTag;

    .line 18
    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "ExposureTime"

    const v10, 0x829a

    const/4 v12, 0x5

    invoke-direct {v4, v5, v10, v12, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/4 v5, 0x0

    aput-object v4, v2, v5

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "FNumber"

    const v10, 0x829d

    invoke-direct {v4, v5, v10, v12, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/4 v5, 0x1

    aput-object v4, v2, v5

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "ExposureProgram"

    const v10, 0x8822

    invoke-direct {v4, v5, v10, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v2, v8

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "SpectralSensitivity"

    const v10, 0x8824

    invoke-direct {v4, v5, v10, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v2, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "PhotographicSensitivity"

    const v10, 0x8827

    invoke-direct {v4, v5, v10, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v2, v0

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "OECF"

    const v10, 0x8828

    const/4 v12, 0x7

    invoke-direct {v4, v5, v10, v12, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/4 v5, 0x5

    aput-object v4, v2, v5

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "ExifVersion"

    const v10, 0x9000

    invoke-direct {v4, v5, v10, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/4 v5, 0x6

    aput-object v4, v2, v5

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "DateTimeOriginal"

    const v10, 0x9003

    invoke-direct {v4, v5, v10, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v2, v12

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "DateTimeDigitized"

    const v10, 0x9004

    invoke-direct {v4, v5, v10, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v5, 0x8

    aput-object v4, v2, v5

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "ComponentsConfiguration"

    const v10, 0x9101

    invoke-direct {v4, v5, v10, v12, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v5, 0x9

    aput-object v4, v2, v5

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "CompressedBitsPerPixel"

    const v10, 0x9102

    const/4 v12, 0x5

    invoke-direct {v4, v5, v10, v12, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v5, 0xa

    aput-object v4, v2, v5

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v10, "ShutterSpeedValue"

    const v0, 0x9201

    invoke-direct {v4, v10, v0, v5, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v0, 0xb

    aput-object v4, v2, v0

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "ApertureValue"

    const v5, 0x9202

    invoke-direct {v0, v4, v5, v12, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0xc

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "BrightnessValue"

    const v5, 0x9203

    const/16 v10, 0xa

    invoke-direct {v0, v4, v5, v10, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0xd

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "ExposureBiasValue"

    const v5, 0x9204

    invoke-direct {v0, v4, v5, v10, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0xe

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "MaxApertureValue"

    const v5, 0x9205

    const/4 v10, 0x5

    invoke-direct {v0, v4, v5, v10, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0xf

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "SubjectDistance"

    const v5, 0x9206

    invoke-direct {v0, v4, v5, v10, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x10

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "MeteringMode"

    const v5, 0x9207

    invoke-direct {v0, v4, v5, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x11

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "LightSource"

    const v5, 0x9208

    invoke-direct {v0, v4, v5, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x12

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "Flash"

    const v5, 0x9209

    invoke-direct {v0, v4, v5, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x13

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "FocalLength"

    const v5, 0x920a

    const/4 v10, 0x5

    invoke-direct {v0, v4, v5, v10, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x14

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "SubjectArea"

    const v5, 0x9214

    invoke-direct {v0, v4, v5, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x15

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "MakerNote"

    const v5, 0x927c

    const/4 v10, 0x7

    invoke-direct {v0, v4, v5, v10, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x16

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "UserComment"

    const v5, 0x9286

    invoke-direct {v0, v4, v5, v10, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x17

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "SubSecTime"

    const v5, 0x9290

    invoke-direct {v0, v4, v5, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x18

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "SubSecTimeOriginal"

    const v5, 0x9291

    invoke-direct {v0, v4, v5, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x19

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "SubSecTimeDigitized"

    const v5, 0x9292

    invoke-direct {v0, v4, v5, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x1a

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "FlashpixVersion"

    const v5, 0xa000

    const/4 v10, 0x7

    invoke-direct {v0, v4, v5, v10, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x1b

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "ColorSpace"

    const v5, 0xa001

    invoke-direct {v0, v4, v5, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x1c

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v34, "PixelXDimension"

    const v35, 0xa002

    const/16 v36, 0x3

    const/16 v37, 0x4

    const/16 v38, 0x0

    move-object/from16 v33, v0

    invoke-direct/range {v33 .. v38}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IIILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x1d

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v34, "PixelYDimension"

    const v35, 0xa003

    move-object/from16 v33, v0

    invoke-direct/range {v33 .. v38}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IIILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x1e

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "RelatedSoundFile"

    const v5, 0xa004

    invoke-direct {v0, v4, v5, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x1f

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "InteroperabilityIFDPointer"

    const v5, 0xa005

    const/4 v10, 0x4

    invoke-direct {v0, v4, v5, v10, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x20

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "FlashEnergy"

    const v5, 0xa20b

    const/4 v10, 0x5

    invoke-direct {v0, v4, v5, v10, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x21

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "SpatialFrequencyResponse"

    const v5, 0xa20c

    const/4 v10, 0x7

    invoke-direct {v0, v4, v5, v10, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x22

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "FocalPlaneXResolution"

    const v5, 0xa20e

    const/4 v10, 0x5

    invoke-direct {v0, v4, v5, v10, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x23

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "FocalPlaneYResolution"

    const v5, 0xa20f

    invoke-direct {v0, v4, v5, v10, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x24

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "FocalPlaneResolutionUnit"

    const v5, 0xa210

    invoke-direct {v0, v4, v5, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x25

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "SubjectLocation"

    const v5, 0xa214

    invoke-direct {v0, v4, v5, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x26

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "ExposureIndex"

    const v5, 0xa215

    const/4 v10, 0x5

    invoke-direct {v0, v4, v5, v10, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x27

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "SensingMethod"

    const v5, 0xa217

    invoke-direct {v0, v4, v5, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x28

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "FileSource"

    const v5, 0xa300

    const/4 v10, 0x7

    invoke-direct {v0, v4, v5, v10, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x29

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "SceneType"

    const v5, 0xa301

    invoke-direct {v0, v4, v5, v10, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x2a

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "CFAPattern"

    const v5, 0xa302

    invoke-direct {v0, v4, v5, v10, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x2b

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "CustomRendered"

    const v5, 0xa401

    invoke-direct {v0, v4, v5, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x2c

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "ExposureMode"

    const v5, 0xa402

    invoke-direct {v0, v4, v5, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x2d

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "WhiteBalance"

    const v5, 0xa403

    invoke-direct {v0, v4, v5, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x2e

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "DigitalZoomRatio"

    const v5, 0xa404

    const/4 v10, 0x5

    invoke-direct {v0, v4, v5, v10, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x2f

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "FocalLengthIn35mmFilm"

    const v5, 0xa405

    invoke-direct {v0, v4, v5, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x30

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "SceneCaptureType"

    const v5, 0xa406

    invoke-direct {v0, v4, v5, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x31

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "GainControl"

    const v5, 0xa407

    invoke-direct {v0, v4, v5, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x32

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "Contrast"

    const v5, 0xa408

    invoke-direct {v0, v4, v5, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x33

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "Saturation"

    const v5, 0xa409

    invoke-direct {v0, v4, v5, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x34

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "Sharpness"

    const v5, 0xa40a

    invoke-direct {v0, v4, v5, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x35

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "DeviceSettingDescription"

    const v5, 0xa40b

    const/4 v10, 0x7

    invoke-direct {v0, v4, v5, v10, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x36

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "SubjectDistanceRange"

    const v5, 0xa40c

    invoke-direct {v0, v4, v5, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x37

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "ImageUniqueID"

    const v5, 0xa420

    invoke-direct {v0, v4, v5, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x38

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "DNGVersion"

    const v5, 0xc612

    const/4 v10, 0x1

    invoke-direct {v0, v4, v5, v10, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x39

    aput-object v0, v2, v4

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v34, "DefaultCropSize"

    const v35, 0xc620

    move-object/from16 v33, v0

    invoke-direct/range {v33 .. v38}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IIILandroid/support/media/ExifInterface$1;)V

    const/16 v4, 0x3a

    aput-object v0, v2, v4

    const/16 v0, 0x1f

    new-array v0, v0, [Landroid/support/media/ExifInterface$ExifTag;

    .line 19
    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSVersionID"

    const/4 v10, 0x0

    const/4 v12, 0x1

    invoke-direct {v4, v5, v10, v12, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v10

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSLatitudeRef"

    invoke-direct {v4, v5, v12, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v12

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSLatitude"

    const/4 v10, 0x5

    invoke-direct {v4, v5, v8, v10, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v8

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSLongitudeRef"

    invoke-direct {v4, v5, v6, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSLongitude"

    const/4 v12, 0x4

    invoke-direct {v4, v5, v12, v10, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v12

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSAltitudeRef"

    const/4 v12, 0x1

    invoke-direct {v4, v5, v10, v12, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v10

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSAltitude"

    const/4 v12, 0x6

    invoke-direct {v4, v5, v12, v10, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v12

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSTimeStamp"

    const/4 v12, 0x7

    invoke-direct {v4, v5, v12, v10, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v12

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSSatellites"

    const/16 v10, 0x8

    invoke-direct {v4, v5, v10, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v10

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSStatus"

    const/16 v10, 0x9

    invoke-direct {v4, v5, v10, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v10

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSMeasureMode"

    const/16 v10, 0xa

    invoke-direct {v4, v5, v10, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v10

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSDOP"

    const/16 v10, 0xb

    const/4 v12, 0x5

    invoke-direct {v4, v5, v10, v12, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v10

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSSpeedRef"

    const/16 v10, 0xc

    invoke-direct {v4, v5, v10, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v10

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSSpeed"

    const/16 v10, 0xd

    invoke-direct {v4, v5, v10, v12, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v10

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSTrackRef"

    const/16 v10, 0xe

    invoke-direct {v4, v5, v10, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v10

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSTrack"

    const/16 v10, 0xf

    invoke-direct {v4, v5, v10, v12, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v10

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSImgDirectionRef"

    const/16 v10, 0x10

    invoke-direct {v4, v5, v10, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v10

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSImgDirection"

    const/16 v10, 0x11

    invoke-direct {v4, v5, v10, v12, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v10

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSMapDatum"

    const/16 v10, 0x12

    invoke-direct {v4, v5, v10, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v10

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSDestLatitudeRef"

    const/16 v10, 0x13

    invoke-direct {v4, v5, v10, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v10

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSDestLatitude"

    const/16 v10, 0x14

    const/4 v12, 0x5

    invoke-direct {v4, v5, v10, v12, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v10

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSDestLongitudeRef"

    const/16 v10, 0x15

    invoke-direct {v4, v5, v10, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v10

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSDestLongitude"

    const/16 v10, 0x16

    invoke-direct {v4, v5, v10, v12, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v10

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSDestBearingRef"

    const/16 v10, 0x17

    invoke-direct {v4, v5, v10, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v10

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSDestBearing"

    const/16 v10, 0x18

    invoke-direct {v4, v5, v10, v12, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v10

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSDestDistanceRef"

    const/16 v10, 0x19

    invoke-direct {v4, v5, v10, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v10

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSDestDistance"

    const/16 v10, 0x1a

    invoke-direct {v4, v5, v10, v12, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v10

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSProcessingMethod"

    const/16 v10, 0x1b

    const/4 v12, 0x7

    invoke-direct {v4, v5, v10, v12, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v10

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSAreaInformation"

    const/16 v10, 0x1c

    invoke-direct {v4, v5, v10, v12, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v10

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSDateStamp"

    const/16 v10, 0x1d

    invoke-direct {v4, v5, v10, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v10

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v5, "GPSDifferential"

    const/16 v10, 0x1e

    invoke-direct {v4, v5, v10, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v4, v0, v10

    const/4 v4, 0x1

    new-array v5, v4, [Landroid/support/media/ExifInterface$ExifTag;

    .line 20
    new-instance v10, Landroid/support/media/ExifInterface$ExifTag;

    const-string v12, "InteroperabilityIndex"

    invoke-direct {v10, v12, v4, v8, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/4 v4, 0x0

    aput-object v10, v5, v4

    const/16 v10, 0x25

    new-array v10, v10, [Landroid/support/media/ExifInterface$ExifTag;

    .line 21
    new-instance v12, Landroid/support/media/ExifInterface$ExifTag;

    const-string v6, "NewSubfileType"

    const/16 v8, 0xfe

    move-object/from16 v35, v11

    const/4 v11, 0x4

    invoke-direct {v12, v6, v8, v11, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v12, v10, v4

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v6, "SubfileType"

    const/16 v8, 0xff

    invoke-direct {v4, v6, v8, v11, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/4 v6, 0x1

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v37, "ThumbnailImageWidth"

    const/16 v38, 0x100

    const/16 v39, 0x3

    const/16 v40, 0x4

    const/16 v41, 0x0

    move-object/from16 v36, v4

    invoke-direct/range {v36 .. v41}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IIILandroid/support/media/ExifInterface$1;)V

    const/4 v6, 0x2

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v37, "ThumbnailImageLength"

    const/16 v38, 0x101

    move-object/from16 v36, v4

    invoke-direct/range {v36 .. v41}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IIILandroid/support/media/ExifInterface$1;)V

    const/4 v6, 0x3

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v8, "BitsPerSample"

    const/16 v11, 0x102

    invoke-direct {v4, v8, v11, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/4 v8, 0x4

    aput-object v4, v10, v8

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v8, "Compression"

    const/16 v11, 0x103

    invoke-direct {v4, v8, v11, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/4 v8, 0x5

    aput-object v4, v10, v8

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v8, "PhotometricInterpretation"

    const/16 v11, 0x106

    invoke-direct {v4, v8, v11, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/4 v6, 0x6

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v6, "ImageDescription"

    const/16 v8, 0x10e

    const/4 v11, 0x2

    invoke-direct {v4, v6, v8, v11, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/4 v6, 0x7

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v6, "Make"

    const/16 v8, 0x10f

    invoke-direct {v4, v6, v8, v11, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v6, 0x8

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v6, "Model"

    const/16 v8, 0x110

    invoke-direct {v4, v6, v8, v11, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v6, 0x9

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v37, "StripOffsets"

    const/16 v38, 0x111

    move-object/from16 v36, v4

    invoke-direct/range {v36 .. v41}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IIILandroid/support/media/ExifInterface$1;)V

    const/16 v6, 0xa

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v6, "Orientation"

    const/16 v8, 0x112

    const/4 v11, 0x3

    invoke-direct {v4, v6, v8, v11, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v6, 0xb

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v6, "SamplesPerPixel"

    const/16 v8, 0x115

    invoke-direct {v4, v6, v8, v11, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v6, 0xc

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v37, "RowsPerStrip"

    const/16 v38, 0x116

    move-object/from16 v36, v4

    invoke-direct/range {v36 .. v41}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IIILandroid/support/media/ExifInterface$1;)V

    const/16 v6, 0xd

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v37, "StripByteCounts"

    const/16 v38, 0x117

    move-object/from16 v36, v4

    invoke-direct/range {v36 .. v41}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IIILandroid/support/media/ExifInterface$1;)V

    const/16 v6, 0xe

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v6, "XResolution"

    const/16 v8, 0x11a

    const/4 v11, 0x5

    invoke-direct {v4, v6, v8, v11, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v6, 0xf

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v6, "YResolution"

    const/16 v8, 0x11b

    invoke-direct {v4, v6, v8, v11, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v6, 0x10

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v6, "PlanarConfiguration"

    const/16 v8, 0x11c

    const/4 v11, 0x3

    invoke-direct {v4, v6, v8, v11, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v6, 0x11

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v6, "ResolutionUnit"

    const/16 v8, 0x128

    invoke-direct {v4, v6, v8, v11, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v6, 0x12

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v6, "TransferFunction"

    const/16 v8, 0x12d

    invoke-direct {v4, v6, v8, v11, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v6, 0x13

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v6, "Software"

    const/16 v8, 0x131

    const/4 v11, 0x2

    invoke-direct {v4, v6, v8, v11, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v6, 0x14

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v6, "DateTime"

    const/16 v8, 0x132

    invoke-direct {v4, v6, v8, v11, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v6, 0x15

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v6, "Artist"

    const/16 v8, 0x13b

    invoke-direct {v4, v6, v8, v11, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v6, 0x16

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v6, "WhitePoint"

    const/16 v8, 0x13e

    const/4 v11, 0x5

    invoke-direct {v4, v6, v8, v11, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v6, 0x17

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v6, "PrimaryChromaticities"

    const/16 v8, 0x13f

    invoke-direct {v4, v6, v8, v11, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v6, 0x18

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v6, "SubIFDPointer"

    const/16 v8, 0x14a

    const/4 v11, 0x4

    invoke-direct {v4, v6, v8, v11, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v6, 0x19

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v6, "JPEGInterchangeFormat"

    const/16 v8, 0x201

    invoke-direct {v4, v6, v8, v11, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v6, 0x1a

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v6, "JPEGInterchangeFormatLength"

    const/16 v8, 0x202

    invoke-direct {v4, v6, v8, v11, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v6, 0x1b

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v6, "YCbCrCoefficients"

    const/16 v8, 0x211

    const/4 v11, 0x5

    invoke-direct {v4, v6, v8, v11, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v6, 0x1c

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v6, "YCbCrSubSampling"

    const/16 v8, 0x212

    const/4 v11, 0x3

    invoke-direct {v4, v6, v8, v11, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v6, 0x1d

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v6, "YCbCrPositioning"

    const/16 v8, 0x213

    invoke-direct {v4, v6, v8, v11, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v6, 0x1e

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v6, "ReferenceBlackWhite"

    const/16 v8, 0x214

    const/4 v11, 0x5

    invoke-direct {v4, v6, v8, v11, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v6, 0x1f

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v6, "Copyright"

    const v8, 0x8298

    const/4 v11, 0x2

    invoke-direct {v4, v6, v8, v11, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v6, 0x20

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v6, "ExifIFDPointer"

    const v8, 0x8769

    const/4 v11, 0x4

    invoke-direct {v4, v6, v8, v11, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v6, 0x21

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v6, "GPSInfoIFDPointer"

    const v8, 0x8825

    invoke-direct {v4, v6, v8, v11, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v6, 0x22

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v6, "DNGVersion"

    const v8, 0xc612

    const/4 v11, 0x1

    invoke-direct {v4, v6, v8, v11, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/16 v6, 0x23

    aput-object v4, v10, v6

    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v28, "DefaultCropSize"

    const v29, 0xc620

    move-object/from16 v27, v4

    invoke-direct/range {v27 .. v32}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IIILandroid/support/media/ExifInterface$1;)V

    const/16 v6, 0x24

    aput-object v4, v10, v6

    .line 22
    new-instance v4, Landroid/support/media/ExifInterface$ExifTag;

    const-string v6, "StripOffsets"

    const/16 v8, 0x111

    const/4 v11, 0x3

    invoke-direct {v4, v6, v8, v11, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    sput-object v4, Landroid/support/media/ExifInterface;->TAG_RAF_IMAGE_SIZE:Landroid/support/media/ExifInterface$ExifTag;

    new-array v4, v11, [Landroid/support/media/ExifInterface$ExifTag;

    .line 23
    new-instance v6, Landroid/support/media/ExifInterface$ExifTag;

    const-string v8, "ThumbnailImage"

    const/16 v11, 0x100

    const/4 v12, 0x7

    invoke-direct {v6, v8, v11, v12, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/4 v8, 0x0

    aput-object v6, v4, v8

    new-instance v6, Landroid/support/media/ExifInterface$ExifTag;

    const-string v8, "CameraSettingsIFDPointer"

    const/16 v11, 0x2020

    const/4 v12, 0x4

    invoke-direct {v6, v8, v11, v12, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/4 v8, 0x1

    aput-object v6, v4, v8

    new-instance v6, Landroid/support/media/ExifInterface$ExifTag;

    const-string v8, "ImageProcessingIFDPointer"

    const/16 v11, 0x2040

    invoke-direct {v6, v8, v11, v12, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/4 v8, 0x2

    aput-object v6, v4, v8

    new-array v6, v8, [Landroid/support/media/ExifInterface$ExifTag;

    .line 24
    new-instance v8, Landroid/support/media/ExifInterface$ExifTag;

    const-string v11, "PreviewImageStart"

    move-object/from16 v17, v13

    const/16 v13, 0x101

    invoke-direct {v8, v11, v13, v12, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/4 v11, 0x0

    aput-object v8, v6, v11

    new-instance v8, Landroid/support/media/ExifInterface$ExifTag;

    const-string v13, "PreviewImageLength"

    const/16 v11, 0x102

    invoke-direct {v8, v13, v11, v12, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/4 v11, 0x1

    aput-object v8, v6, v11

    new-array v8, v11, [Landroid/support/media/ExifInterface$ExifTag;

    .line 25
    new-instance v12, Landroid/support/media/ExifInterface$ExifTag;

    const-string v13, "AspectFrame"

    const/16 v11, 0x1113

    move-object/from16 v23, v7

    const/4 v7, 0x3

    invoke-direct {v12, v13, v11, v7, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/4 v11, 0x0

    aput-object v12, v8, v11

    const/4 v12, 0x1

    new-array v13, v12, [Landroid/support/media/ExifInterface$ExifTag;

    .line 26
    new-instance v12, Landroid/support/media/ExifInterface$ExifTag;

    const-string v11, "ColorSpace"

    move-object/from16 v24, v9

    const/16 v9, 0x37

    invoke-direct {v12, v11, v9, v7, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/4 v9, 0x0

    aput-object v12, v13, v9

    const/16 v11, 0xa

    new-array v12, v11, [[Landroid/support/media/ExifInterface$ExifTag;

    aput-object v1, v12, v9

    const/4 v9, 0x1

    aput-object v2, v12, v9

    const/4 v2, 0x2

    aput-object v0, v12, v2

    aput-object v5, v12, v7

    const/4 v0, 0x4

    aput-object v10, v12, v0

    const/4 v2, 0x5

    aput-object v1, v12, v2

    const/4 v1, 0x6

    aput-object v4, v12, v1

    const/4 v2, 0x7

    aput-object v6, v12, v2

    const/16 v2, 0x8

    aput-object v8, v12, v2

    const/16 v2, 0x9

    aput-object v13, v12, v2

    .line 27
    sput-object v12, Landroid/support/media/ExifInterface;->EXIF_TAGS:[[Landroid/support/media/ExifInterface$ExifTag;

    new-array v1, v1, [Landroid/support/media/ExifInterface$ExifTag;

    .line 28
    new-instance v2, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "SubIFDPointer"

    const/16 v5, 0x14a

    invoke-direct {v2, v4, v5, v0, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/4 v4, 0x0

    aput-object v2, v1, v4

    new-instance v2, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "ExifIFDPointer"

    const v5, 0x8769

    invoke-direct {v2, v4, v5, v0, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/4 v4, 0x1

    aput-object v2, v1, v4

    new-instance v2, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "GPSInfoIFDPointer"

    const v5, 0x8825

    invoke-direct {v2, v4, v5, v0, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/4 v4, 0x2

    aput-object v2, v1, v4

    new-instance v2, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "InteroperabilityIFDPointer"

    const v5, 0xa005

    invoke-direct {v2, v4, v5, v0, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/4 v4, 0x3

    aput-object v2, v1, v4

    new-instance v2, Landroid/support/media/ExifInterface$ExifTag;

    const-string v4, "CameraSettingsIFDPointer"

    const/16 v5, 0x2020

    const/4 v6, 0x1

    invoke-direct {v2, v4, v5, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    aput-object v2, v1, v0

    new-instance v0, Landroid/support/media/ExifInterface$ExifTag;

    const-string v2, "ImageProcessingIFDPointer"

    const/16 v4, 0x2040

    invoke-direct {v0, v2, v4, v6, v14}, Landroid/support/media/ExifInterface$ExifTag;-><init>(Ljava/lang/String;IILandroid/support/media/ExifInterface$1;)V

    const/4 v2, 0x5

    aput-object v0, v1, v2

    sput-object v1, Landroid/support/media/ExifInterface;->EXIF_POINTER_TAGS:[Landroid/support/media/ExifInterface$ExifTag;

    const/16 v0, 0xa

    new-array v1, v0, [Ljava/util/HashMap;

    .line 29
    sput-object v1, Landroid/support/media/ExifInterface;->sExifTagMapsForReading:[Ljava/util/HashMap;

    new-array v0, v0, [Ljava/util/HashMap;

    .line 30
    sput-object v0, Landroid/support/media/ExifInterface;->sExifTagMapsForWriting:[Ljava/util/HashMap;

    .line 31
    new-instance v0, Ljava/util/HashSet;

    const-string v1, "FNumber"

    const-string v2, "DigitalZoomRatio"

    const-string v4, "ExposureTime"

    const-string v5, "SubjectDistance"

    const-string v6, "GPSTimeStamp"

    filled-new-array {v1, v2, v4, v5, v6}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Landroid/support/media/ExifInterface;->sTagSetForCompatibility:Ljava/util/HashSet;

    .line 32
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Landroid/support/media/ExifInterface;->sExifPointerTagMap:Ljava/util/HashMap;

    const-string v0, "US-ASCII"

    .line 33
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Landroid/support/media/ExifInterface;->ASCII:Ljava/nio/charset/Charset;

    const-string v1, "Exif\u0000\u0000"

    .line 34
    invoke-virtual {v1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sput-object v0, Landroid/support/media/ExifInterface;->IDENTIFIER_EXIF_APP1:[B

    .line 35
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy:MM:dd HH:mm:ss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    const-string v1, "UTC"

    .line 36
    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    const/4 v5, 0x0

    .line 37
    :goto_0
    sget-object v0, Landroid/support/media/ExifInterface;->EXIF_TAGS:[[Landroid/support/media/ExifInterface$ExifTag;

    array-length v1, v0

    if-ge v5, v1, :cond_1

    .line 38
    sget-object v1, Landroid/support/media/ExifInterface;->sExifTagMapsForReading:[Ljava/util/HashMap;

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    aput-object v2, v1, v5

    .line 39
    sget-object v1, Landroid/support/media/ExifInterface;->sExifTagMapsForWriting:[Ljava/util/HashMap;

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    aput-object v2, v1, v5

    .line 40
    aget-object v0, v0, v5

    array-length v1, v0

    const/4 v2, 0x0

    :goto_1
    if-ge v2, v1, :cond_0

    aget-object v4, v0, v2

    .line 41
    sget-object v6, Landroid/support/media/ExifInterface;->sExifTagMapsForReading:[Ljava/util/HashMap;

    aget-object v6, v6, v5

    iget v7, v4, Landroid/support/media/ExifInterface$ExifTag;->number:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    sget-object v6, Landroid/support/media/ExifInterface;->sExifTagMapsForWriting:[Ljava/util/HashMap;

    aget-object v6, v6, v5

    iget-object v7, v4, Landroid/support/media/ExifInterface$ExifTag;->name:Ljava/lang/String;

    invoke-virtual {v6, v7, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 43
    :cond_1
    sget-object v0, Landroid/support/media/ExifInterface;->sExifPointerTagMap:Ljava/util/HashMap;

    sget-object v1, Landroid/support/media/ExifInterface;->EXIF_POINTER_TAGS:[Landroid/support/media/ExifInterface$ExifTag;

    const/4 v2, 0x0

    aget-object v2, v1, v2

    iget v2, v2, Landroid/support/media/ExifInterface$ExifTag;->number:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v2, 0x1

    .line 44
    aget-object v2, v1, v2

    iget v2, v2, Landroid/support/media/ExifInterface$ExifTag;->number:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v2, 0x2

    .line 45
    aget-object v2, v1, v2

    iget v2, v2, Landroid/support/media/ExifInterface$ExifTag;->number:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v3, v24

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v2, 0x3

    .line 46
    aget-object v2, v1, v2

    iget v2, v2, Landroid/support/media/ExifInterface$ExifTag;->number:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v3, v23

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v2, 0x4

    .line 47
    aget-object v2, v1, v2

    iget v2, v2, Landroid/support/media/ExifInterface$ExifTag;->number:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v3, v17

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v2, 0x5

    .line 48
    aget-object v1, v1, v2

    iget v1, v1, Landroid/support/media/ExifInterface$ExifTag;->number:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    move-object/from16 v2, v35

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, ".*[1-9].*"

    .line 49
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    const-string v0, "^([0-9][0-9]):([0-9][0-9]):([0-9][0-9])$"

    .line 50
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    return-void

    :array_0
    .array-data 4
        0x8
        0x8
        0x8
    .end array-data

    :array_1
    .array-data 1
        -0x1t
        -0x28t
        -0x1t
    .end array-data

    :array_2
    .array-data 1
        0x4ft
        0x4ct
        0x59t
        0x4dt
        0x50t
        0x0t
    .end array-data

    nop

    :array_3
    .array-data 1
        0x4ft
        0x4ct
        0x59t
        0x4dt
        0x50t
        0x55t
        0x53t
        0x0t
        0x49t
        0x49t
    .end array-data

    nop

    :array_4
    .array-data 4
        0x0
        0x1
        0x1
        0x2
        0x4
        0x8
        0x1
        0x1
        0x2
        0x4
        0x8
        0x4
        0x8
        0x1
    .end array-data

    :array_5
    .array-data 1
        0x41t
        0x53t
        0x43t
        0x49t
        0x49t
        0x0t
        0x0t
        0x0t
    .end array-data
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    sget-object v0, Landroid/support/media/ExifInterface;->EXIF_TAGS:[[Landroid/support/media/ExifInterface$ExifTag;

    array-length v0, v0

    new-array v0, v0, [Ljava/util/HashMap;

    iput-object v0, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    .line 3
    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    iput-object v0, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    if-eqz p1, :cond_1

    const/4 v0, 0x0

    .line 4
    iput-object p1, p0, Landroid/support/media/ExifInterface;->mFilename:Ljava/lang/String;

    .line 5
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 6
    :try_start_1
    invoke-virtual {p0, v1}, Landroid/support/media/ExifInterface;->loadAttributes(Ljava/io/InputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 7
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    return-void

    :catch_1
    move-exception p0

    .line 8
    throw p0

    :catchall_0
    move-exception p0

    move-object v0, v1

    goto :goto_0

    :catchall_1
    move-exception p0

    :goto_0
    if-eqz v0, :cond_0

    .line 9
    :try_start_3
    invoke-interface {v0}, Ljava/io/Closeable;->close()V
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_1

    :catch_2
    move-exception p0

    .line 10
    throw p0

    .line 11
    :catch_3
    :cond_0
    :goto_1
    throw p0

    .line 12
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "filename cannot be null"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static convertToLongArray(Ljava/lang/Object;)[J
    .locals 4

    .line 1
    instance-of v0, p0, [I

    if-eqz v0, :cond_1

    .line 2
    check-cast p0, [I

    .line 3
    array-length v0, p0

    new-array v0, v0, [J

    const/4 v1, 0x0

    .line 4
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_0

    .line 5
    aget v2, p0, v1

    int-to-long v2, v2

    aput-wide v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0

    .line 6
    :cond_1
    instance-of v0, p0, [J

    if-eqz v0, :cond_2

    .line 7
    check-cast p0, [J

    return-object p0

    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final addDefaultValuesForCompatibility()V
    .locals 6

    const-string v0, "DateTimeOriginal"

    .line 1
    invoke-virtual {p0, v0}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const-string v2, "DateTime"

    .line 2
    invoke-virtual {p0, v2}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_0

    .line 3
    iget-object v3, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v3, v3, v1

    .line 4
    invoke-static {v0}, Landroid/support/media/ExifInterface$ExifAttribute;->createString(Ljava/lang/String;)Landroid/support/media/ExifInterface$ExifAttribute;

    move-result-object v0

    .line 5
    invoke-virtual {v3, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    const-string v0, "ImageWidth"

    .line 6
    invoke-virtual {p0, v0}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-wide/16 v3, 0x0

    if-nez v2, :cond_1

    .line 7
    iget-object v2, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v2, v2, v1

    iget-object v5, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 8
    invoke-static {v3, v4, v5}, Landroid/support/media/ExifInterface$ExifAttribute;->createULong(JLjava/nio/ByteOrder;)Landroid/support/media/ExifInterface$ExifAttribute;

    move-result-object v5

    .line 9
    invoke-virtual {v2, v0, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    const-string v0, "ImageLength"

    .line 10
    invoke-virtual {p0, v0}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    .line 11
    iget-object v2, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v2, v2, v1

    iget-object v5, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 12
    invoke-static {v3, v4, v5}, Landroid/support/media/ExifInterface$ExifAttribute;->createULong(JLjava/nio/ByteOrder;)Landroid/support/media/ExifInterface$ExifAttribute;

    move-result-object v5

    .line 13
    invoke-virtual {v2, v0, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    const-string v0, "Orientation"

    .line 14
    invoke-virtual {p0, v0}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_3

    .line 15
    iget-object v2, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v1, v2, v1

    iget-object v2, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 16
    invoke-static {v3, v4, v2}, Landroid/support/media/ExifInterface$ExifAttribute;->createULong(JLjava/nio/ByteOrder;)Landroid/support/media/ExifInterface$ExifAttribute;

    move-result-object v2

    .line 17
    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    const-string v0, "LightSource"

    .line 18
    invoke-virtual {p0, v0}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_4

    .line 19
    iget-object v1, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    const/4 v2, 0x1

    aget-object v1, v1, v2

    iget-object p0, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 20
    invoke-static {v3, v4, p0}, Landroid/support/media/ExifInterface$ExifAttribute;->createULong(JLjava/nio/ByteOrder;)Landroid/support/media/ExifInterface$ExifAttribute;

    move-result-object p0

    .line 21
    invoke-virtual {v1, v0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    return-void
.end method

.method public getAttribute(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Landroid/support/media/ExifInterface;->getExifAttribute(Ljava/lang/String;)Landroid/support/media/ExifInterface$ExifAttribute;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_5

    .line 2
    sget-object v2, Landroid/support/media/ExifInterface;->sTagSetForCompatibility:Ljava/util/HashSet;

    invoke-virtual {v2, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 3
    iget-object p0, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    invoke-virtual {v0, p0}, Landroid/support/media/ExifInterface$ExifAttribute;->getStringValue(Ljava/nio/ByteOrder;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const-string v2, "GPSTimeStamp"

    .line 4
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 5
    iget p1, v0, Landroid/support/media/ExifInterface$ExifAttribute;->format:I

    const/4 v2, 0x5

    const-string v3, "ExifInterface"

    if-eq p1, v2, :cond_1

    const/16 v2, 0xa

    if-eq p1, v2, :cond_1

    const-string p0, "GPS Timestamp format is not rational. format="

    .line 6
    invoke-static {p0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    iget p1, v0, Landroid/support/media/ExifInterface$ExifAttribute;->format:I

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v3, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    .line 7
    :cond_1
    iget-object p0, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 8
    invoke-virtual {v0, p0}, Landroid/support/media/ExifInterface$ExifAttribute;->getValue(Ljava/nio/ByteOrder;)Ljava/lang/Object;

    move-result-object p0

    .line 9
    check-cast p0, [Landroid/support/media/ExifInterface$Rational;

    if-eqz p0, :cond_3

    .line 10
    array-length p1, p0

    const/4 v0, 0x3

    if-eq p1, v0, :cond_2

    goto :goto_0

    :cond_2
    new-array p1, v0, [Ljava/lang/Object;

    const/4 v0, 0x0

    .line 11
    aget-object v1, p0, v0

    iget-wide v1, v1, Landroid/support/media/ExifInterface$Rational;->numerator:J

    long-to-float v1, v1

    aget-object v2, p0, v0

    iget-wide v2, v2, Landroid/support/media/ExifInterface$Rational;->denominator:J

    long-to-float v2, v2

    div-float/2addr v1, v2

    float-to-int v1, v1

    .line 12
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, p1, v0

    const/4 v0, 0x1

    aget-object v1, p0, v0

    iget-wide v1, v1, Landroid/support/media/ExifInterface$Rational;->numerator:J

    long-to-float v1, v1

    aget-object v2, p0, v0

    iget-wide v2, v2, Landroid/support/media/ExifInterface$Rational;->denominator:J

    long-to-float v2, v2

    div-float/2addr v1, v2

    float-to-int v1, v1

    .line 13
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, p1, v0

    const/4 v0, 0x2

    aget-object v1, p0, v0

    iget-wide v1, v1, Landroid/support/media/ExifInterface$Rational;->numerator:J

    long-to-float v1, v1

    aget-object p0, p0, v0

    iget-wide v2, p0, Landroid/support/media/ExifInterface$Rational;->denominator:J

    long-to-float p0, v2

    div-float/2addr v1, p0

    float-to-int p0, v1

    .line 14
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    aput-object p0, p1, v0

    const-string p0, "%02d:%02d:%02d"

    .line 15
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_3
    :goto_0
    const-string p1, "Invalid GPS Timestamp array. array="

    .line 16
    invoke-static {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-static {p0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v3, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    .line 17
    :cond_4
    :try_start_0
    iget-object p0, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    invoke-virtual {v0, p0}, Landroid/support/media/ExifInterface$ExifAttribute;->getDoubleValue(Ljava/nio/ByteOrder;)D

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    :cond_5
    return-object v1
.end method

.method public final getExifAttribute(Ljava/lang/String;)Landroid/support/media/ExifInterface$ExifAttribute;
    .locals 2

    const-string v0, "ISOSpeedRatings"

    .line 1
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "PhotographicSensitivity"

    :cond_0
    const/4 v0, 0x0

    .line 2
    :goto_0
    sget-object v1, Landroid/support/media/ExifInterface;->EXIF_TAGS:[[Landroid/support/media/ExifInterface$ExifTag;

    array-length v1, v1

    if-ge v0, v1, :cond_2

    .line 3
    iget-object v1, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/media/ExifInterface$ExifAttribute;

    if-eqz v1, :cond_1

    return-object v1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method

.method public final getJpegAttributes(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;II)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 2
    iput-object v0, p1, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    int-to-long v0, p2

    .line 3
    invoke-virtual {p1, v0, v1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->seek(J)V

    .line 4
    invoke-virtual {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readByte()B

    move-result v0

    const-string v1, "Invalid marker: "

    const/4 v2, -0x1

    if-ne v0, v2, :cond_11

    const/4 v3, 0x1

    add-int/2addr p2, v3

    .line 5
    invoke-virtual {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readByte()B

    move-result v4

    const/16 v5, -0x28

    if-ne v4, v5, :cond_10

    add-int/2addr p2, v3

    .line 6
    :goto_0
    invoke-virtual {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readByte()B

    move-result v0

    if-ne v0, v2, :cond_f

    add-int/2addr p2, v3

    .line 7
    invoke-virtual {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readByte()B

    move-result v0

    add-int/2addr p2, v3

    const/16 v1, -0x27

    if-eq v0, v1, :cond_e

    const/16 v1, -0x26

    if-ne v0, v1, :cond_0

    goto/16 :goto_3

    .line 8
    :cond_0
    invoke-virtual {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readUnsignedShort()I

    move-result v1

    add-int/lit8 v1, v1, -0x2

    add-int/lit8 p2, p2, 0x2

    const-string v4, "Invalid length"

    if-ltz v1, :cond_d

    const/16 v5, -0x1f

    const/4 v6, 0x0

    const-string v7, "Invalid exif"

    if-eq v0, v5, :cond_4

    const/4 v5, -0x2

    if-eq v0, v5, :cond_2

    packed-switch v0, :pswitch_data_0

    packed-switch v0, :pswitch_data_1

    packed-switch v0, :pswitch_data_2

    packed-switch v0, :pswitch_data_3

    goto/16 :goto_2

    .line 9
    :pswitch_0
    invoke-virtual {p1, v3}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->skipBytes(I)I

    move-result v0

    if-ne v0, v3, :cond_1

    .line 10
    iget-object v0, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v0, v0, p3

    .line 11
    invoke-virtual {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readUnsignedShort()I

    move-result v5

    int-to-long v5, v5

    iget-object v7, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 12
    invoke-static {v5, v6, v7}, Landroid/support/media/ExifInterface$ExifAttribute;->createULong(JLjava/nio/ByteOrder;)Landroid/support/media/ExifInterface$ExifAttribute;

    move-result-object v5

    const-string v6, "ImageLength"

    invoke-virtual {v0, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    iget-object v0, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v0, v0, p3

    .line 14
    invoke-virtual {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readUnsignedShort()I

    move-result v5

    int-to-long v5, v5

    iget-object v7, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 15
    invoke-static {v5, v6, v7}, Landroid/support/media/ExifInterface$ExifAttribute;->createULong(JLjava/nio/ByteOrder;)Landroid/support/media/ExifInterface$ExifAttribute;

    move-result-object v5

    const-string v6, "ImageWidth"

    invoke-virtual {v0, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, -0x5

    goto :goto_2

    .line 16
    :cond_1
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Invalid SOFx"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 17
    :cond_2
    new-array v0, v1, [B

    .line 18
    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v5

    if-ne v5, v1, :cond_3

    const-string v1, "UserComment"

    .line 19
    invoke-virtual {p0, v1}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_7

    .line 20
    iget-object v5, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v5, v5, v3

    new-instance v7, Ljava/lang/String;

    sget-object v8, Landroid/support/media/ExifInterface;->ASCII:Ljava/nio/charset/Charset;

    invoke-direct {v7, v0, v8}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-static {v7}, Landroid/support/media/ExifInterface$ExifAttribute;->createString(Ljava/lang/String;)Landroid/support/media/ExifInterface$ExifAttribute;

    move-result-object v0

    invoke-virtual {v5, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 21
    :cond_3
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_4
    const/4 v0, 0x6

    if-ge v1, v0, :cond_5

    goto :goto_2

    :cond_5
    new-array v5, v0, [B

    .line 22
    invoke-virtual {p1, v5}, Ljava/io/InputStream;->read([B)I

    move-result v8

    if-ne v8, v0, :cond_c

    add-int/lit8 p2, p2, 0x6

    add-int/lit8 v1, v1, -0x6

    .line 23
    sget-object v0, Landroid/support/media/ExifInterface;->IDENTIFIER_EXIF_APP1:[B

    invoke-static {v5, v0}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-nez v0, :cond_6

    goto :goto_2

    :cond_6
    if-lez v1, :cond_b

    .line 24
    iput p2, p0, Landroid/support/media/ExifInterface;->mExifOffset:I

    .line 25
    new-array v0, v1, [B

    .line 26
    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v5

    if-ne v5, v1, :cond_a

    add-int/2addr p2, v1

    .line 27
    new-instance v5, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;

    invoke-direct {v5, v0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;-><init>([B)V

    .line 28
    invoke-virtual {p0, v5, v1}, Landroid/support/media/ExifInterface;->parseTiffHeaders(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;I)V

    .line 29
    invoke-virtual {p0, v5, p3}, Landroid/support/media/ExifInterface;->readImageFileDirectory(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;I)V

    :cond_7
    :goto_1
    move v1, v6

    :goto_2
    if-ltz v1, :cond_9

    .line 30
    invoke-virtual {p1, v1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->skipBytes(I)I

    move-result v0

    if-ne v0, v1, :cond_8

    add-int/2addr p2, v1

    goto/16 :goto_0

    .line 31
    :cond_8
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Invalid JPEG segment"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 32
    :cond_9
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 33
    :cond_a
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 34
    :cond_b
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 35
    :cond_c
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 36
    :cond_d
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 37
    :cond_e
    :goto_3
    iget-object p0, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 38
    iput-object p0, p1, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    return-void

    .line 39
    :cond_f
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Invalid marker:"

    invoke-static {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    and-int/lit16 p2, v0, 0xff

    invoke-static {p2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 40
    :cond_10
    new-instance p0, Ljava/io/IOException;

    invoke-static {v1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    and-int/lit16 p2, v0, 0xff

    invoke-static {p2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 41
    :cond_11
    new-instance p0, Ljava/io/IOException;

    invoke-static {v1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    and-int/lit16 p2, v0, 0xff

    invoke-static {p2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    nop

    :pswitch_data_0
    .packed-switch -0x40
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch -0x3b
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_2
    .packed-switch -0x37
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    :pswitch_data_3
    .packed-switch -0x33
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public final getMimeType(Ljava/io/BufferedInputStream;)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x1388

    .line 1
    invoke-virtual {p1, v0}, Ljava/io/BufferedInputStream;->mark(I)V

    new-array v0, v0, [B

    .line 2
    invoke-virtual {p1, v0}, Ljava/io/BufferedInputStream;->read([B)I

    .line 3
    invoke-virtual {p1}, Ljava/io/BufferedInputStream;->reset()V

    const/4 p1, 0x0

    move v1, p1

    .line 4
    :goto_0
    sget-object v2, Landroid/support/media/ExifInterface;->JPEG_SIGNATURE:[B

    array-length v3, v2

    const/4 v4, 0x1

    if-ge v1, v3, :cond_1

    .line 5
    aget-byte v3, v0, v1

    aget-byte v2, v2, v1

    if-eq v3, v2, :cond_0

    move v1, p1

    goto :goto_1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    move v1, v4

    :goto_1
    if-eqz v1, :cond_2

    const/4 p0, 0x4

    return p0

    .line 6
    :cond_2
    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object v1

    const-string v2, "FUJIFILMCCD-RAW"

    invoke-virtual {v2, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    move v2, p1

    .line 7
    :goto_2
    array-length v3, v1

    if-ge v2, v3, :cond_4

    .line 8
    aget-byte v3, v0, v2

    aget-byte v5, v1, v2

    if-eq v3, v5, :cond_3

    move v1, p1

    goto :goto_3

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_4
    move v1, v4

    :goto_3
    if-eqz v1, :cond_5

    const/16 p0, 0x9

    return p0

    .line 9
    :cond_5
    new-instance v1, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;

    invoke-direct {v1, v0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;-><init>([B)V

    .line 10
    invoke-virtual {p0, v1}, Landroid/support/media/ExifInterface;->readByteOrder(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;)Ljava/nio/ByteOrder;

    move-result-object v2

    iput-object v2, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 11
    iput-object v2, v1, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    .line 12
    invoke-virtual {v1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readShort()S

    move-result v2

    .line 13
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    const/16 v1, 0x4f52

    if-eq v2, v1, :cond_7

    const/16 v1, 0x5352

    if-ne v2, v1, :cond_6

    goto :goto_4

    :cond_6
    move v1, p1

    goto :goto_5

    :cond_7
    :goto_4
    move v1, v4

    :goto_5
    if-eqz v1, :cond_8

    const/4 p0, 0x7

    return p0

    .line 14
    :cond_8
    new-instance v1, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;

    invoke-direct {v1, v0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;-><init>([B)V

    .line 15
    invoke-virtual {p0, v1}, Landroid/support/media/ExifInterface;->readByteOrder(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;)Ljava/nio/ByteOrder;

    move-result-object v0

    iput-object v0, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 16
    iput-object v0, v1, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    .line 17
    invoke-virtual {v1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readShort()S

    move-result p0

    .line 18
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    const/16 v0, 0x55

    if-ne p0, v0, :cond_9

    goto :goto_6

    :cond_9
    move v4, p1

    :goto_6
    if-eqz v4, :cond_a

    const/16 p0, 0xa

    return p0

    :cond_a
    return p1
.end method

.method public final getOrfAttributes(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Landroid/support/media/ExifInterface;->getRawAttributes(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;)V

    .line 2
    iget-object p1, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    const/4 v0, 0x1

    aget-object p1, p1, v0

    const-string v1, "MakerNote"

    .line 3
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/media/ExifInterface$ExifAttribute;

    if-eqz p1, :cond_6

    .line 4
    new-instance v1, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;

    iget-object p1, p1, Landroid/support/media/ExifInterface$ExifAttribute;->bytes:[B

    invoke-direct {v1, p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;-><init>([B)V

    .line 5
    iget-object p1, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 6
    iput-object p1, v1, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    .line 7
    sget-object p1, Landroid/support/media/ExifInterface;->ORF_MAKER_NOTE_HEADER_1:[B

    array-length v2, p1

    new-array v2, v2, [B

    .line 8
    invoke-virtual {v1, v2}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readFully([B)V

    const-wide/16 v3, 0x0

    .line 9
    invoke-virtual {v1, v3, v4}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->seek(J)V

    .line 10
    sget-object v3, Landroid/support/media/ExifInterface;->ORF_MAKER_NOTE_HEADER_2:[B

    array-length v4, v3

    new-array v4, v4, [B

    .line 11
    invoke-virtual {v1, v4}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readFully([B)V

    .line 12
    invoke-static {v2, p1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result p1

    if-eqz p1, :cond_0

    const-wide/16 v2, 0x8

    .line 13
    invoke-virtual {v1, v2, v3}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->seek(J)V

    goto :goto_0

    .line 14
    :cond_0
    invoke-static {v4, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result p1

    if-eqz p1, :cond_1

    const-wide/16 v2, 0xc

    .line 15
    invoke-virtual {v1, v2, v3}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->seek(J)V

    :cond_1
    :goto_0
    const/4 p1, 0x6

    .line 16
    invoke-virtual {p0, v1, p1}, Landroid/support/media/ExifInterface;->readImageFileDirectory(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;I)V

    .line 17
    iget-object p1, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    const/4 v1, 0x7

    aget-object p1, p1, v1

    const-string v2, "PreviewImageStart"

    .line 18
    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/media/ExifInterface$ExifAttribute;

    .line 19
    iget-object v2, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v1, v2, v1

    const-string v2, "PreviewImageLength"

    .line 20
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/media/ExifInterface$ExifAttribute;

    if-eqz p1, :cond_2

    if-eqz v1, :cond_2

    .line 21
    iget-object v2, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    const/4 v3, 0x5

    aget-object v2, v2, v3

    const-string v4, "JPEGInterchangeFormat"

    invoke-virtual {v2, v4, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    iget-object p1, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object p1, p1, v3

    const-string v2, "JPEGInterchangeFormatLength"

    invoke-virtual {p1, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    :cond_2
    iget-object p1, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    const/16 v1, 0x8

    aget-object p1, p1, v1

    const-string v1, "AspectFrame"

    .line 24
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/media/ExifInterface$ExifAttribute;

    if-eqz p1, :cond_6

    .line 25
    iget-object v1, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 26
    invoke-virtual {p1, v1}, Landroid/support/media/ExifInterface$ExifAttribute;->getValue(Ljava/nio/ByteOrder;)Ljava/lang/Object;

    move-result-object p1

    .line 27
    check-cast p1, [I

    if-eqz p1, :cond_5

    .line 28
    array-length v1, p1

    const/4 v2, 0x4

    if-eq v1, v2, :cond_3

    goto :goto_1

    :cond_3
    const/4 v1, 0x2

    .line 29
    aget v2, p1, v1

    const/4 v3, 0x0

    aget v4, p1, v3

    if-le v2, v4, :cond_6

    const/4 v2, 0x3

    aget v4, p1, v2

    aget v5, p1, v0

    if-le v4, v5, :cond_6

    .line 30
    aget v1, p1, v1

    aget v4, p1, v3

    sub-int/2addr v1, v4

    add-int/2addr v1, v0

    .line 31
    aget v2, p1, v2

    aget p1, p1, v0

    sub-int/2addr v2, p1

    add-int/2addr v2, v0

    if-ge v1, v2, :cond_4

    add-int/2addr v1, v2

    sub-int v2, v1, v2

    sub-int/2addr v1, v2

    .line 32
    :cond_4
    iget-object p1, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 33
    invoke-static {v1, p1}, Landroid/support/media/ExifInterface$ExifAttribute;->createUShort(ILjava/nio/ByteOrder;)Landroid/support/media/ExifInterface$ExifAttribute;

    move-result-object p1

    .line 34
    iget-object v0, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 35
    invoke-static {v2, v0}, Landroid/support/media/ExifInterface$ExifAttribute;->createUShort(ILjava/nio/ByteOrder;)Landroid/support/media/ExifInterface$ExifAttribute;

    move-result-object v0

    .line 36
    iget-object v1, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v1, v1, v3

    const-string v2, "ImageWidth"

    invoke-virtual {v1, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    iget-object p0, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object p0, p0, v3

    const-string p1, "ImageLength"

    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    :cond_5
    :goto_1
    const-string p0, "Invalid aspect frame values. frame="

    .line 38
    invoke-static {p0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 39
    invoke-static {p1}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "ExifInterface"

    .line 40
    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_6
    :goto_2
    return-void
.end method

.method public final getRafAttributes(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x54

    .line 1
    invoke-virtual {p1, v0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->skipBytes(I)I

    const/4 v0, 0x4

    new-array v1, v0, [B

    new-array v2, v0, [B

    .line 2
    invoke-virtual {p1, v1}, Ljava/io/InputStream;->read([B)I

    .line 3
    invoke-virtual {p1, v0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->skipBytes(I)I

    .line 4
    invoke-virtual {p1, v2}, Ljava/io/InputStream;->read([B)I

    .line 5
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    .line 6
    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    const/4 v2, 0x5

    .line 7
    invoke-virtual {p0, p1, v0, v2}, Landroid/support/media/ExifInterface;->getJpegAttributes(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;II)V

    int-to-long v0, v1

    .line 8
    invoke-virtual {p1, v0, v1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->seek(J)V

    .line 9
    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 10
    iput-object v0, p1, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    .line 11
    invoke-virtual {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readInt()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_1

    .line 12
    invoke-virtual {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readUnsignedShort()I

    move-result v3

    .line 13
    invoke-virtual {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readUnsignedShort()I

    move-result v4

    .line 14
    sget-object v5, Landroid/support/media/ExifInterface;->TAG_RAF_IMAGE_SIZE:Landroid/support/media/ExifInterface$ExifTag;

    iget v5, v5, Landroid/support/media/ExifInterface$ExifTag;->number:I

    if-ne v3, v5, :cond_0

    .line 15
    invoke-virtual {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readShort()S

    move-result v0

    .line 16
    invoke-virtual {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readShort()S

    move-result p1

    .line 17
    iget-object v2, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 18
    invoke-static {v0, v2}, Landroid/support/media/ExifInterface$ExifAttribute;->createUShort(ILjava/nio/ByteOrder;)Landroid/support/media/ExifInterface$ExifAttribute;

    move-result-object v0

    .line 19
    iget-object v2, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 20
    invoke-static {p1, v2}, Landroid/support/media/ExifInterface$ExifAttribute;->createUShort(ILjava/nio/ByteOrder;)Landroid/support/media/ExifInterface$ExifAttribute;

    move-result-object p1

    .line 21
    iget-object v2, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v2, v2, v1

    const-string v3, "ImageLength"

    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    iget-object p0, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object p0, p0, v1

    const-string v0, "ImageWidth"

    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    .line 23
    :cond_0
    invoke-virtual {p1, v4}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->skipBytes(I)I

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public final getRawAttributes(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->available()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Landroid/support/media/ExifInterface;->parseTiffHeaders(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;I)V

    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Landroid/support/media/ExifInterface;->readImageFileDirectory(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;I)V

    .line 3
    invoke-virtual {p0, p1, v0}, Landroid/support/media/ExifInterface;->updateImageSizeValues(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;I)V

    const/4 v1, 0x5

    .line 4
    invoke-virtual {p0, p1, v1}, Landroid/support/media/ExifInterface;->updateImageSizeValues(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;I)V

    const/4 v2, 0x4

    .line 5
    invoke-virtual {p0, p1, v2}, Landroid/support/media/ExifInterface;->updateImageSizeValues(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;I)V

    .line 6
    invoke-virtual {p0, v0, v1}, Landroid/support/media/ExifInterface;->swapBasedOnImageSize(II)V

    .line 7
    invoke-virtual {p0, v0, v2}, Landroid/support/media/ExifInterface;->swapBasedOnImageSize(II)V

    .line 8
    invoke-virtual {p0, v1, v2}, Landroid/support/media/ExifInterface;->swapBasedOnImageSize(II)V

    .line 9
    iget-object p1, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    const/4 v3, 0x1

    aget-object p1, p1, v3

    const-string v4, "PixelXDimension"

    .line 10
    invoke-virtual {p1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/media/ExifInterface$ExifAttribute;

    .line 11
    iget-object v4, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v4, v4, v3

    const-string v5, "PixelYDimension"

    .line 12
    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/media/ExifInterface$ExifAttribute;

    if-eqz p1, :cond_0

    if-eqz v4, :cond_0

    .line 13
    iget-object v5, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v5, v5, v0

    const-string v6, "ImageWidth"

    invoke-virtual {v5, v6, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    iget-object p1, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object p1, p1, v0

    const-string v0, "ImageLength"

    invoke-virtual {p1, v0, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    :cond_0
    iget-object p1, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object p1, p1, v2

    invoke-virtual {p1}, Ljava/util/HashMap;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 16
    iget-object p1, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object p1, p1, v1

    invoke-virtual {p0, p1}, Landroid/support/media/ExifInterface;->isThumbnail(Ljava/util/HashMap;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 17
    iget-object p1, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v0, p1, v1

    aput-object v0, p1, v2

    .line 18
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    aput-object v0, p1, v1

    .line 19
    :cond_1
    iget-object p1, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object p1, p1, v2

    invoke-virtual {p0, p1}, Landroid/support/media/ExifInterface;->isThumbnail(Ljava/util/HashMap;)Z

    move-result p1

    if-nez p1, :cond_2

    const-string p1, "ExifInterface"

    const-string v0, "No image meets the size requirements of a thumbnail image."

    .line 20
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    :cond_2
    iget p1, p0, Landroid/support/media/ExifInterface;->mMimeType:I

    const/16 v0, 0x8

    if-ne p1, v0, :cond_3

    .line 22
    iget-object p1, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object p1, p1, v3

    const-string v0, "MakerNote"

    .line 23
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/media/ExifInterface$ExifAttribute;

    if-eqz p1, :cond_3

    .line 24
    new-instance v0, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;

    iget-object p1, p1, Landroid/support/media/ExifInterface$ExifAttribute;->bytes:[B

    invoke-direct {v0, p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;-><init>([B)V

    .line 25
    iget-object p1, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 26
    iput-object p1, v0, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    const-wide/16 v1, 0x6

    .line 27
    invoke-virtual {v0, v1, v2}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->seek(J)V

    const/16 p1, 0x9

    .line 28
    invoke-virtual {p0, v0, p1}, Landroid/support/media/ExifInterface;->readImageFileDirectory(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;I)V

    .line 29
    iget-object v0, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object p1, v0, p1

    const-string v0, "ColorSpace"

    .line 30
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/media/ExifInterface$ExifAttribute;

    if-eqz p1, :cond_3

    .line 31
    iget-object p0, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object p0, p0, v3

    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    return-void
.end method

.method public final getRw2Attributes(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Landroid/support/media/ExifInterface;->getRawAttributes(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;)V

    .line 2
    iget-object v0, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    const-string v2, "JpgFromRaw"

    .line 3
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/media/ExifInterface$ExifAttribute;

    if-eqz v0, :cond_0

    .line 4
    iget v0, p0, Landroid/support/media/ExifInterface;->mRw2JpgFromRawOffset:I

    const/4 v2, 0x5

    invoke-virtual {p0, p1, v0, v2}, Landroid/support/media/ExifInterface;->getJpegAttributes(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;II)V

    .line 5
    :cond_0
    iget-object p1, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object p1, p1, v1

    const-string v0, "ISO"

    .line 6
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/media/ExifInterface$ExifAttribute;

    .line 7
    iget-object v0, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    const/4 v1, 0x1

    aget-object v0, v0, v1

    const-string v2, "PhotographicSensitivity"

    .line 8
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/media/ExifInterface$ExifAttribute;

    if-eqz p1, :cond_1

    if-nez v0, :cond_1

    .line 9
    iget-object p0, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object p0, p0, v1

    invoke-virtual {p0, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-void
.end method

.method public final handleThumbnailFromJfif(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;Ljava/util/HashMap;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "JPEGInterchangeFormat"

    .line 1
    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/media/ExifInterface$ExifAttribute;

    const-string v1, "JPEGInterchangeFormatLength"

    .line 2
    invoke-virtual {p2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/support/media/ExifInterface$ExifAttribute;

    if-eqz v0, :cond_3

    if-eqz p2, :cond_3

    .line 3
    iget-object v1, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Landroid/support/media/ExifInterface$ExifAttribute;->getIntValue(Ljava/nio/ByteOrder;)I

    move-result v0

    .line 4
    iget-object v1, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    invoke-virtual {p2, v1}, Landroid/support/media/ExifInterface$ExifAttribute;->getIntValue(Ljava/nio/ByteOrder;)I

    move-result p2

    .line 5
    invoke-virtual {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->available()I

    move-result v1

    sub-int/2addr v1, v0

    invoke-static {p2, v1}, Ljava/lang/Math;->min(II)I

    move-result p2

    .line 6
    iget v1, p0, Landroid/support/media/ExifInterface;->mMimeType:I

    const/4 v2, 0x4

    if-eq v1, v2, :cond_1

    const/16 v2, 0x9

    if-eq v1, v2, :cond_1

    const/16 v2, 0xa

    if-ne v1, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x7

    if-ne v1, v2, :cond_2

    .line 7
    iget v1, p0, Landroid/support/media/ExifInterface;->mOrfMakerNoteOffset:I

    goto :goto_1

    .line 8
    :cond_1
    :goto_0
    iget v1, p0, Landroid/support/media/ExifInterface;->mExifOffset:I

    :goto_1
    add-int/2addr v0, v1

    :cond_2
    if-lez v0, :cond_3

    if-lez p2, :cond_3

    .line 9
    iget-object p0, p0, Landroid/support/media/ExifInterface;->mFilename:Ljava/lang/String;

    if-nez p0, :cond_3

    .line 10
    new-array p0, p2, [B

    int-to-long v0, v0

    .line 11
    invoke-virtual {p1, v0, v1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->seek(J)V

    .line 12
    invoke-virtual {p1, p0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readFully([B)V

    :cond_3
    return-void
.end method

.method public final isThumbnail(Ljava/util/HashMap;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "ImageLength"

    .line 1
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/media/ExifInterface$ExifAttribute;

    const-string v1, "ImageWidth"

    .line 2
    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/media/ExifInterface$ExifAttribute;

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    .line 3
    iget-object v1, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Landroid/support/media/ExifInterface$ExifAttribute;->getIntValue(Ljava/nio/ByteOrder;)I

    move-result v0

    .line 4
    iget-object p0, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    invoke-virtual {p1, p0}, Landroid/support/media/ExifInterface$ExifAttribute;->getIntValue(Ljava/nio/ByteOrder;)I

    move-result p0

    const/16 p1, 0x200

    if-gt v0, p1, :cond_0

    if-gt p0, p1, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final loadAttributes(Ljava/io/InputStream;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    move v1, v0

    .line 1
    :goto_0
    :try_start_0
    sget-object v2, Landroid/support/media/ExifInterface;->EXIF_TAGS:[[Landroid/support/media/ExifInterface$ExifTag;

    array-length v2, v2

    if-ge v1, v2, :cond_0

    .line 2
    iget-object v2, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    aput-object v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 3
    :cond_0
    new-instance v1, Ljava/io/BufferedInputStream;

    const/16 v2, 0x1388

    invoke-direct {v1, p1, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 4
    invoke-virtual {p0, v1}, Landroid/support/media/ExifInterface;->getMimeType(Ljava/io/BufferedInputStream;)I

    move-result p1

    iput p1, p0, Landroid/support/media/ExifInterface;->mMimeType:I

    .line 5
    new-instance p1, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;

    invoke-direct {p1, v1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 6
    iget v1, p0, Landroid/support/media/ExifInterface;->mMimeType:I

    packed-switch v1, :pswitch_data_0

    goto :goto_1

    .line 7
    :pswitch_0
    invoke-virtual {p0, p1}, Landroid/support/media/ExifInterface;->getRw2Attributes(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;)V

    goto :goto_1

    .line 8
    :pswitch_1
    invoke-virtual {p0, p1}, Landroid/support/media/ExifInterface;->getRafAttributes(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;)V

    goto :goto_1

    .line 9
    :pswitch_2
    invoke-virtual {p0, p1}, Landroid/support/media/ExifInterface;->getOrfAttributes(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;)V

    goto :goto_1

    .line 10
    :pswitch_3
    invoke-virtual {p0, p1, v0, v0}, Landroid/support/media/ExifInterface;->getJpegAttributes(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;II)V

    goto :goto_1

    .line 11
    :pswitch_4
    invoke-virtual {p0, p1}, Landroid/support/media/ExifInterface;->getRawAttributes(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;)V

    .line 12
    :goto_1
    invoke-virtual {p0, p1}, Landroid/support/media/ExifInterface;->setThumbnailData(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception p1

    .line 13
    invoke-virtual {p0}, Landroid/support/media/ExifInterface;->addDefaultValuesForCompatibility()V

    throw p1

    :catch_0
    :goto_2
    invoke-virtual {p0}, Landroid/support/media/ExifInterface;->addDefaultValuesForCompatibility()V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_4
        :pswitch_2
        :pswitch_4
        :pswitch_1
        :pswitch_0
        :pswitch_4
    .end packed-switch
.end method

.method public final parseTiffHeaders(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Landroid/support/media/ExifInterface;->readByteOrder(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;)Ljava/nio/ByteOrder;

    move-result-object v0

    iput-object v0, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 2
    iput-object v0, p1, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->mByteOrder:Ljava/nio/ByteOrder;

    .line 3
    invoke-virtual {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readUnsignedShort()I

    move-result v0

    .line 4
    iget p0, p0, Landroid/support/media/ExifInterface;->mMimeType:I

    const/4 v1, 0x7

    if-eq p0, v1, :cond_1

    const/16 v1, 0xa

    if-eq p0, v1, :cond_1

    const/16 p0, 0x2a

    if-ne v0, p0, :cond_0

    goto :goto_0

    .line 5
    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Invalid start code: "

    invoke-static {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 6
    :cond_1
    :goto_0
    invoke-virtual {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readInt()I

    move-result p0

    const/16 v0, 0x8

    if-lt p0, v0, :cond_4

    if-ge p0, p2, :cond_4

    add-int/lit8 p0, p0, -0x8

    if-lez p0, :cond_3

    .line 7
    invoke-virtual {p1, p0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->skipBytes(I)I

    move-result p1

    if-ne p1, p0, :cond_2

    goto :goto_1

    .line 8
    :cond_2
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Couldn\'t jump to first Ifd: "

    invoke-static {p2, p0}, Landroid/support/media/ExifInterface$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    :goto_1
    return-void

    .line 9
    :cond_4
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Invalid first Ifd offset: "

    invoke-static {p2, p0}, Landroid/support/media/ExifInterface$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final readByteOrder(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;)Ljava/nio/ByteOrder;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readShort()S

    move-result p0

    const/16 p1, 0x4949

    if-eq p0, p1, :cond_1

    const/16 p1, 0x4d4d

    if-ne p0, p1, :cond_0

    .line 2
    sget-object p0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    return-object p0

    .line 3
    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string v0, "Invalid byte order: "

    invoke-static {v0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 4
    :cond_1
    sget-object p0, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    return-object p0
.end method

.method public final readImageFileDirectory(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;I)V
    .locals 24
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    .line 1
    iget v3, v1, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    add-int/lit8 v3, v3, 0x2

    .line 2
    iget v4, v1, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->mLength:I

    if-le v3, v4, :cond_0

    return-void

    .line 3
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readShort()S

    move-result v3

    .line 4
    iget v4, v1, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    mul-int/lit8 v5, v3, 0xc

    add-int/2addr v5, v4

    .line 5
    iget v4, v1, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->mLength:I

    if-le v5, v4, :cond_1

    return-void

    :cond_1
    const/4 v4, 0x0

    :goto_0
    const/4 v5, 0x4

    if-ge v4, v3, :cond_25

    .line 6
    invoke-virtual/range {p1 .. p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readUnsignedShort()I

    move-result v6

    .line 7
    invoke-virtual/range {p1 .. p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readUnsignedShort()I

    move-result v7

    .line 8
    invoke-virtual/range {p1 .. p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readInt()I

    move-result v8

    .line 9
    iget v9, v1, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    int-to-long v9, v9

    const-wide/16 v11, 0x4

    add-long/2addr v9, v11

    .line 10
    sget-object v11, Landroid/support/media/ExifInterface;->sExifTagMapsForReading:[Ljava/util/HashMap;

    aget-object v11, v11, v2

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/support/media/ExifInterface$ExifTag;

    const-string v14, "ExifInterface"

    const/4 v15, 0x7

    if-nez v11, :cond_2

    .line 11
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Skip the tag entry since tag number is not defined: "

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v14, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    move v5, v3

    move v15, v4

    goto/16 :goto_7

    :cond_2
    if-lez v7, :cond_11

    .line 12
    sget-object v12, Landroid/support/media/ExifInterface;->IFD_FORMAT_BYTES_PER_FORMAT:[I

    array-length v13, v12

    if-lt v7, v13, :cond_3

    goto/16 :goto_6

    .line 13
    :cond_3
    iget v13, v11, Landroid/support/media/ExifInterface$ExifTag;->primaryFormat:I

    if-eq v13, v15, :cond_c

    if-ne v7, v15, :cond_4

    goto :goto_2

    :cond_4
    if-eq v13, v7, :cond_c

    .line 14
    iget v15, v11, Landroid/support/media/ExifInterface$ExifTag;->secondaryFormat:I

    if-ne v15, v7, :cond_5

    goto :goto_2

    :cond_5
    if-eq v13, v5, :cond_6

    if-ne v15, v5, :cond_7

    :cond_6
    const/4 v5, 0x3

    if-ne v7, v5, :cond_7

    goto :goto_2

    :cond_7
    const/16 v5, 0x9

    if-eq v13, v5, :cond_8

    if-ne v15, v5, :cond_9

    :cond_8
    const/16 v5, 0x8

    if-ne v7, v5, :cond_9

    goto :goto_2

    :cond_9
    const/16 v5, 0xc

    if-eq v13, v5, :cond_a

    if-ne v15, v5, :cond_b

    :cond_a
    const/16 v5, 0xb

    if-ne v7, v5, :cond_b

    goto :goto_2

    :cond_b
    const/4 v5, 0x0

    goto :goto_3

    :cond_c
    :goto_2
    const/4 v5, 0x1

    :goto_3
    if-nez v5, :cond_d

    const-string v5, "Skip the tag entry since data format ("

    .line 15
    invoke-static {v5}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v12, Landroid/support/media/ExifInterface;->IFD_FORMAT_NAMES:[Ljava/lang/String;

    aget-object v12, v12, v7

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v12, ") is unexpected for tag: "

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v12, v11, Landroid/support/media/ExifInterface$ExifTag;->name:Ljava/lang/String;

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v14, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_d
    const/4 v5, 0x7

    if-ne v7, v5, :cond_e

    move v5, v3

    move v7, v13

    goto :goto_4

    :cond_e
    move v5, v3

    :goto_4
    move v13, v4

    int-to-long v3, v8

    .line 16
    aget v12, v12, v7

    move v15, v13

    int-to-long v12, v12

    mul-long/2addr v3, v12

    const-wide/16 v12, 0x0

    cmp-long v17, v3, v12

    if-ltz v17, :cond_10

    const-wide/32 v12, 0x7fffffff

    cmp-long v12, v3, v12

    if-lez v12, :cond_f

    goto :goto_5

    :cond_f
    const/16 v16, 0x1

    goto :goto_9

    .line 17
    :cond_10
    :goto_5
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Skip the tag entry since the number of components is invalid: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v14, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_8

    :cond_11
    :goto_6
    move v5, v3

    move v15, v4

    .line 18
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Skip the tag entry since data format is invalid: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v14, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_7
    const-wide/16 v3, 0x0

    :goto_8
    const/4 v12, 0x0

    move/from16 v16, v12

    :goto_9
    if-nez v16, :cond_12

    .line 19
    invoke-virtual {v1, v9, v10}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->seek(J)V

    move/from16 v16, v5

    move/from16 v17, v15

    goto/16 :goto_10

    :cond_12
    const-wide/16 v12, 0x4

    cmp-long v12, v3, v12

    const-string v13, "Compression"

    if-lez v12, :cond_18

    .line 20
    invoke-virtual/range {p1 .. p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readInt()I

    move-result v12

    move/from16 v16, v5

    .line 21
    iget v5, v0, Landroid/support/media/ExifInterface;->mMimeType:I

    move/from16 v17, v15

    const/4 v15, 0x7

    if-ne v5, v15, :cond_15

    .line 22
    iget-object v5, v11, Landroid/support/media/ExifInterface$ExifTag;->name:Ljava/lang/String;

    const-string v15, "MakerNote"

    invoke-virtual {v15, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_13

    .line 23
    iput v12, v0, Landroid/support/media/ExifInterface;->mOrfMakerNoteOffset:I

    goto :goto_a

    :cond_13
    const/4 v5, 0x6

    if-ne v2, v5, :cond_14

    .line 24
    iget-object v5, v11, Landroid/support/media/ExifInterface$ExifTag;->name:Ljava/lang/String;

    const-string v15, "ThumbnailImage"

    .line 25
    invoke-virtual {v15, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_14

    .line 26
    iput v12, v0, Landroid/support/media/ExifInterface;->mOrfThumbnailOffset:I

    .line 27
    iput v8, v0, Landroid/support/media/ExifInterface;->mOrfThumbnailLength:I

    .line 28
    iget-object v5, v0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    const/4 v15, 0x6

    .line 29
    invoke-static {v15, v5}, Landroid/support/media/ExifInterface$ExifAttribute;->createUShort(ILjava/nio/ByteOrder;)Landroid/support/media/ExifInterface$ExifAttribute;

    move-result-object v5

    .line 30
    iget v15, v0, Landroid/support/media/ExifInterface;->mOrfThumbnailOffset:I

    move/from16 v19, v7

    move/from16 v18, v8

    int-to-long v7, v15

    iget-object v15, v0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 31
    invoke-static {v7, v8, v15}, Landroid/support/media/ExifInterface$ExifAttribute;->createULong(JLjava/nio/ByteOrder;)Landroid/support/media/ExifInterface$ExifAttribute;

    move-result-object v7

    .line 32
    iget v8, v0, Landroid/support/media/ExifInterface;->mOrfThumbnailLength:I

    move-wide/from16 v20, v9

    int-to-long v8, v8

    iget-object v10, v0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 33
    invoke-static {v8, v9, v10}, Landroid/support/media/ExifInterface$ExifAttribute;->createULong(JLjava/nio/ByteOrder;)Landroid/support/media/ExifInterface$ExifAttribute;

    move-result-object v8

    .line 34
    iget-object v9, v0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    const/4 v10, 0x4

    aget-object v9, v9, v10

    invoke-virtual {v9, v13, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    iget-object v5, v0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v5, v5, v10

    const-string v9, "JPEGInterchangeFormat"

    invoke-virtual {v5, v9, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    iget-object v5, v0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v5, v5, v10

    const-string v7, "JPEGInterchangeFormatLength"

    invoke-virtual {v5, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_b

    :cond_14
    :goto_a
    move/from16 v19, v7

    move/from16 v18, v8

    move-wide/from16 v20, v9

    goto :goto_b

    :cond_15
    move/from16 v19, v7

    move/from16 v18, v8

    move-wide/from16 v20, v9

    const/16 v7, 0xa

    if-ne v5, v7, :cond_16

    .line 37
    iget-object v5, v11, Landroid/support/media/ExifInterface$ExifTag;->name:Ljava/lang/String;

    const-string v7, "JpgFromRaw"

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_16

    .line 38
    iput v12, v0, Landroid/support/media/ExifInterface;->mRw2JpgFromRawOffset:I

    :cond_16
    :goto_b
    int-to-long v7, v12

    add-long v9, v7, v3

    .line 39
    iget v5, v1, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->mLength:I

    move-wide/from16 v22, v3

    int-to-long v2, v5

    cmp-long v2, v9, v2

    if-gtz v2, :cond_17

    .line 40
    invoke-virtual {v1, v7, v8}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->seek(J)V

    move-wide/from16 v9, v20

    goto :goto_c

    .line 41
    :cond_17
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Skip the tag entry since data offset is invalid: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v14, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-wide/from16 v9, v20

    .line 42
    invoke-virtual {v1, v9, v10}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->seek(J)V

    goto/16 :goto_10

    :cond_18
    move-wide/from16 v22, v3

    move/from16 v16, v5

    move/from16 v19, v7

    move/from16 v18, v8

    move/from16 v17, v15

    .line 43
    :goto_c
    sget-object v2, Landroid/support/media/ExifInterface;->sExifPointerTagMap:Ljava/util/HashMap;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    if-eqz v2, :cond_1e

    const-wide/16 v3, -0x1

    const/4 v5, 0x3

    move/from16 v7, v19

    if-eq v7, v5, :cond_1c

    const/4 v5, 0x4

    if-eq v7, v5, :cond_1b

    const/16 v5, 0x8

    if-eq v7, v5, :cond_1a

    const/16 v5, 0x9

    if-eq v7, v5, :cond_19

    const/16 v5, 0xd

    if-eq v7, v5, :cond_19

    goto :goto_e

    .line 44
    :cond_19
    invoke-virtual/range {p1 .. p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readInt()I

    move-result v3

    goto :goto_d

    .line 45
    :cond_1a
    invoke-virtual/range {p1 .. p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readShort()S

    move-result v3

    goto :goto_d

    .line 46
    :cond_1b
    invoke-virtual/range {p1 .. p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readUnsignedInt()J

    move-result-wide v3

    goto :goto_e

    .line 47
    :cond_1c
    invoke-virtual/range {p1 .. p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readUnsignedShort()I

    move-result v3

    :goto_d
    int-to-long v3, v3

    :goto_e
    const-wide/16 v5, 0x0

    cmp-long v5, v3, v5

    if-lez v5, :cond_1d

    .line 48
    iget v5, v1, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->mLength:I

    int-to-long v5, v5

    cmp-long v5, v3, v5

    if-gez v5, :cond_1d

    .line 49
    invoke-virtual {v1, v3, v4}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->seek(J)V

    .line 50
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/support/media/ExifInterface;->readImageFileDirectory(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;I)V

    goto :goto_f

    .line 51
    :cond_1d
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Skip jump into the IFD since its offset is invalid: "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v14, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    :goto_f
    invoke-virtual {v1, v9, v10}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->seek(J)V

    goto :goto_10

    :cond_1e
    move/from16 v7, v19

    move-wide/from16 v3, v22

    long-to-int v2, v3

    .line 53
    new-array v2, v2, [B

    .line 54
    invoke-virtual {v1, v2}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readFully([B)V

    .line 55
    new-instance v3, Landroid/support/media/ExifInterface$ExifAttribute;

    const/4 v4, 0x0

    move/from16 v5, v18

    invoke-direct {v3, v7, v5, v2, v4}, Landroid/support/media/ExifInterface$ExifAttribute;-><init>(II[BLandroid/support/media/ExifInterface$1;)V

    .line 56
    iget-object v2, v0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v2, v2, p2

    iget-object v4, v11, Landroid/support/media/ExifInterface$ExifTag;->name:Ljava/lang/String;

    invoke-virtual {v2, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    iget-object v2, v11, Landroid/support/media/ExifInterface$ExifTag;->name:Ljava/lang/String;

    const-string v4, "DNGVersion"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1f

    const/4 v2, 0x3

    .line 58
    iput v2, v0, Landroid/support/media/ExifInterface;->mMimeType:I

    .line 59
    :cond_1f
    iget-object v2, v11, Landroid/support/media/ExifInterface$ExifTag;->name:Ljava/lang/String;

    const-string v4, "Make"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_20

    iget-object v2, v11, Landroid/support/media/ExifInterface$ExifTag;->name:Ljava/lang/String;

    const-string v4, "Model"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_21

    :cond_20
    iget-object v2, v0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 60
    invoke-virtual {v3, v2}, Landroid/support/media/ExifInterface$ExifAttribute;->getStringValue(Ljava/nio/ByteOrder;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "PENTAX"

    invoke-virtual {v2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_22

    :cond_21
    iget-object v2, v11, Landroid/support/media/ExifInterface$ExifTag;->name:Ljava/lang/String;

    .line 61
    invoke-virtual {v13, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_23

    iget-object v2, v0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 62
    invoke-virtual {v3, v2}, Landroid/support/media/ExifInterface$ExifAttribute;->getIntValue(Ljava/nio/ByteOrder;)I

    move-result v2

    const v3, 0xffff

    if-ne v2, v3, :cond_23

    :cond_22
    const/16 v2, 0x8

    .line 63
    iput v2, v0, Landroid/support/media/ExifInterface;->mMimeType:I

    .line 64
    :cond_23
    iget v2, v1, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    int-to-long v2, v2

    cmp-long v2, v2, v9

    if-eqz v2, :cond_24

    .line 65
    invoke-virtual {v1, v9, v10}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->seek(J)V

    :cond_24
    :goto_10
    add-int/lit8 v4, v17, 0x1

    int-to-short v4, v4

    move/from16 v2, p2

    move/from16 v3, v16

    goto/16 :goto_0

    .line 66
    :cond_25
    iget v2, v1, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->mPosition:I

    const/4 v3, 0x4

    add-int/2addr v2, v3

    .line 67
    iget v4, v1, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->mLength:I

    if-gt v2, v4, :cond_27

    .line 68
    invoke-virtual/range {p1 .. p1}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->readInt()I

    move-result v2

    const/16 v4, 0x8

    if-le v2, v4, :cond_27

    .line 69
    iget v4, v1, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->mLength:I

    if-ge v2, v4, :cond_27

    int-to-long v4, v2

    .line 70
    invoke-virtual {v1, v4, v5}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->seek(J)V

    .line 71
    iget-object v2, v0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v2, v2, v3

    invoke-virtual {v2}, Ljava/util/HashMap;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_26

    .line 72
    invoke-virtual {v0, v1, v3}, Landroid/support/media/ExifInterface;->readImageFileDirectory(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;I)V

    goto :goto_11

    .line 73
    :cond_26
    iget-object v2, v0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    const/4 v3, 0x5

    aget-object v2, v2, v3

    invoke-virtual {v2}, Ljava/util/HashMap;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_27

    .line 74
    invoke-virtual {v0, v1, v3}, Landroid/support/media/ExifInterface;->readImageFileDirectory(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;I)V

    :cond_27
    :goto_11
    return-void
.end method

.method public final setThumbnailData(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;)V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    const/4 v1, 0x4

    aget-object v0, v0, v1

    const-string v1, "Compression"

    .line 2
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/media/ExifInterface$ExifAttribute;

    if-eqz v1, :cond_a

    .line 3
    iget-object v2, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    invoke-virtual {v1, v2}, Landroid/support/media/ExifInterface$ExifAttribute;->getIntValue(Ljava/nio/ByteOrder;)I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x6

    if-eq v1, v2, :cond_1

    if-eq v1, v3, :cond_0

    const/4 v4, 0x7

    if-eq v1, v4, :cond_1

    goto/16 :goto_3

    .line 4
    :cond_0
    invoke-virtual {p0, p1, v0}, Landroid/support/media/ExifInterface;->handleThumbnailFromJfif(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;Ljava/util/HashMap;)V

    goto/16 :goto_3

    :cond_1
    const-string v1, "BitsPerSample"

    .line 5
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/media/ExifInterface$ExifAttribute;

    const/4 v4, 0x0

    if-eqz v1, :cond_4

    .line 6
    iget-object v5, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 7
    invoke-virtual {v1, v5}, Landroid/support/media/ExifInterface$ExifAttribute;->getValue(Ljava/nio/ByteOrder;)Ljava/lang/Object;

    move-result-object v1

    .line 8
    check-cast v1, [I

    .line 9
    sget-object v5, Landroid/support/media/ExifInterface;->BITS_PER_SAMPLE_RGB:[I

    invoke-static {v5, v1}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v6

    if-eqz v6, :cond_2

    goto :goto_0

    .line 10
    :cond_2
    iget v6, p0, Landroid/support/media/ExifInterface;->mMimeType:I

    const/4 v7, 0x3

    if-ne v6, v7, :cond_4

    const-string v6, "PhotometricInterpretation"

    .line 11
    invoke-virtual {v0, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/support/media/ExifInterface$ExifAttribute;

    if-eqz v6, :cond_4

    .line 12
    iget-object v7, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 13
    invoke-virtual {v6, v7}, Landroid/support/media/ExifInterface$ExifAttribute;->getIntValue(Ljava/nio/ByteOrder;)I

    move-result v6

    if-ne v6, v2, :cond_3

    .line 14
    sget-object v7, Landroid/support/media/ExifInterface;->BITS_PER_SAMPLE_GREYSCALE_2:[I

    .line 15
    invoke-static {v1, v7}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v7

    if-nez v7, :cond_5

    :cond_3
    if-ne v6, v3, :cond_4

    .line 16
    invoke-static {v1, v5}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v1

    if-eqz v1, :cond_4

    goto :goto_0

    :cond_4
    move v2, v4

    :cond_5
    :goto_0
    if-eqz v2, :cond_b

    const-string v1, "StripOffsets"

    .line 17
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/media/ExifInterface$ExifAttribute;

    const-string v2, "StripByteCounts"

    .line 18
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/media/ExifInterface$ExifAttribute;

    if-eqz v1, :cond_b

    if-eqz v0, :cond_b

    .line 19
    iget-object v2, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 20
    invoke-virtual {v1, v2}, Landroid/support/media/ExifInterface$ExifAttribute;->getValue(Ljava/nio/ByteOrder;)Ljava/lang/Object;

    move-result-object v1

    .line 21
    invoke-static {v1}, Landroid/support/media/ExifInterface;->convertToLongArray(Ljava/lang/Object;)[J

    move-result-object v1

    .line 22
    iget-object p0, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 23
    invoke-virtual {v0, p0}, Landroid/support/media/ExifInterface$ExifAttribute;->getValue(Ljava/nio/ByteOrder;)Ljava/lang/Object;

    move-result-object p0

    .line 24
    invoke-static {p0}, Landroid/support/media/ExifInterface;->convertToLongArray(Ljava/lang/Object;)[J

    move-result-object p0

    const-string v0, "ExifInterface"

    if-nez v1, :cond_6

    const-string p0, "stripOffsets should not be null."

    .line 25
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    :cond_6
    if-nez p0, :cond_7

    const-string p0, "stripByteCounts should not be null."

    .line 26
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    :cond_7
    const-wide/16 v2, 0x0

    .line 27
    array-length v5, p0

    move v6, v4

    :goto_1
    if-ge v6, v5, :cond_8

    aget-wide v7, p0, v6

    add-long/2addr v2, v7

    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_8
    long-to-int v2, v2

    .line 28
    new-array v2, v2, [B

    move v3, v4

    move v5, v3

    move v6, v5

    .line 29
    :goto_2
    array-length v7, v1

    if-ge v3, v7, :cond_b

    .line 30
    aget-wide v7, v1, v3

    long-to-int v7, v7

    .line 31
    aget-wide v8, p0, v3

    long-to-int v8, v8

    sub-int/2addr v7, v5

    if-gez v7, :cond_9

    const-string v9, "Invalid strip offset value"

    .line 32
    invoke-static {v0, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_9
    int-to-long v9, v7

    .line 33
    invoke-virtual {p1, v9, v10}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;->seek(J)V

    add-int/2addr v5, v7

    .line 34
    new-array v7, v8, [B

    .line 35
    invoke-virtual {p1, v7}, Ljava/io/InputStream;->read([B)I

    add-int/2addr v5, v8

    .line 36
    invoke-static {v7, v4, v2, v6, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v6, v8

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 37
    :cond_a
    invoke-virtual {p0, p1, v0}, Landroid/support/media/ExifInterface;->handleThumbnailFromJfif(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;Ljava/util/HashMap;)V

    :cond_b
    :goto_3
    return-void
.end method

.method public final swapBasedOnImageSize(II)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v0, v0, p2

    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    iget-object v0, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v0, v0, p1

    const-string v1, "ImageLength"

    .line 3
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/media/ExifInterface$ExifAttribute;

    .line 4
    iget-object v2, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v2, v2, p1

    const-string v3, "ImageWidth"

    .line 5
    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/media/ExifInterface$ExifAttribute;

    .line 6
    iget-object v4, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v4, v4, p2

    .line 7
    invoke-virtual {v4, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/media/ExifInterface$ExifAttribute;

    .line 8
    iget-object v4, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v4, v4, p2

    .line 9
    invoke-virtual {v4, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/media/ExifInterface$ExifAttribute;

    if-eqz v0, :cond_3

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    if-eqz v1, :cond_3

    if-nez v3, :cond_2

    goto :goto_0

    .line 10
    :cond_2
    iget-object v4, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v4}, Landroid/support/media/ExifInterface$ExifAttribute;->getIntValue(Ljava/nio/ByteOrder;)I

    move-result v0

    .line 11
    iget-object v4, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    invoke-virtual {v2, v4}, Landroid/support/media/ExifInterface$ExifAttribute;->getIntValue(Ljava/nio/ByteOrder;)I

    move-result v2

    .line 12
    iget-object v4, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    invoke-virtual {v1, v4}, Landroid/support/media/ExifInterface$ExifAttribute;->getIntValue(Ljava/nio/ByteOrder;)I

    move-result v1

    .line 13
    iget-object v4, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    invoke-virtual {v3, v4}, Landroid/support/media/ExifInterface$ExifAttribute;->getIntValue(Ljava/nio/ByteOrder;)I

    move-result v3

    if-ge v0, v1, :cond_3

    if-ge v2, v3, :cond_3

    .line 14
    iget-object p0, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v0, p0, p1

    .line 15
    aget-object v1, p0, p2

    aput-object v1, p0, p1

    .line 16
    aput-object v0, p0, p2

    :cond_3
    :goto_0
    return-void
.end method

.method public final updateImageSizeValues(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;I)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v0, v0, p2

    const-string v1, "DefaultCropSize"

    .line 2
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/media/ExifInterface$ExifAttribute;

    .line 3
    iget-object v1, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v1, v1, p2

    const-string v2, "SensorTopBorder"

    .line 4
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/media/ExifInterface$ExifAttribute;

    .line 5
    iget-object v2, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v2, v2, p2

    const-string v3, "SensorLeftBorder"

    .line 6
    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/media/ExifInterface$ExifAttribute;

    .line 7
    iget-object v3, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v3, v3, p2

    const-string v4, "SensorBottomBorder"

    .line 8
    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/media/ExifInterface$ExifAttribute;

    .line 9
    iget-object v4, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v4, v4, p2

    const-string v5, "SensorRightBorder"

    .line 10
    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/media/ExifInterface$ExifAttribute;

    const-string v5, "ImageWidth"

    const-string v6, "ImageLength"

    if-eqz v0, :cond_5

    .line 11
    iget p1, v0, Landroid/support/media/ExifInterface$ExifAttribute;->format:I

    const/4 v1, 0x5

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x2

    const-string v7, "Invalid crop size values. cropSize="

    const-string v8, "ExifInterface"

    if-ne p1, v1, :cond_2

    .line 12
    iget-object p1, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 13
    invoke-virtual {v0, p1}, Landroid/support/media/ExifInterface$ExifAttribute;->getValue(Ljava/nio/ByteOrder;)Ljava/lang/Object;

    move-result-object p1

    .line 14
    check-cast p1, [Landroid/support/media/ExifInterface$Rational;

    if-eqz p1, :cond_1

    .line 15
    array-length v0, p1

    if-eq v0, v4, :cond_0

    goto :goto_0

    .line 16
    :cond_0
    aget-object v0, p1, v3

    iget-object v1, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 17
    invoke-static {v0, v1}, Landroid/support/media/ExifInterface$ExifAttribute;->createURational(Landroid/support/media/ExifInterface$Rational;Ljava/nio/ByteOrder;)Landroid/support/media/ExifInterface$ExifAttribute;

    move-result-object v0

    .line 18
    aget-object p1, p1, v2

    iget-object v1, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 19
    invoke-static {p1, v1}, Landroid/support/media/ExifInterface$ExifAttribute;->createURational(Landroid/support/media/ExifInterface$Rational;Ljava/nio/ByteOrder;)Landroid/support/media/ExifInterface$ExifAttribute;

    move-result-object p1

    goto :goto_1

    .line 20
    :cond_1
    :goto_0
    invoke-static {v7}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 21
    invoke-static {p1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 22
    invoke-static {v8, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 23
    :cond_2
    iget-object p1, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 24
    invoke-virtual {v0, p1}, Landroid/support/media/ExifInterface$ExifAttribute;->getValue(Ljava/nio/ByteOrder;)Ljava/lang/Object;

    move-result-object p1

    .line 25
    check-cast p1, [I

    if-eqz p1, :cond_4

    .line 26
    array-length v0, p1

    if-eq v0, v4, :cond_3

    goto :goto_2

    .line 27
    :cond_3
    aget v0, p1, v3

    iget-object v1, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 28
    invoke-static {v0, v1}, Landroid/support/media/ExifInterface$ExifAttribute;->createUShort(ILjava/nio/ByteOrder;)Landroid/support/media/ExifInterface$ExifAttribute;

    move-result-object v0

    .line 29
    aget p1, p1, v2

    iget-object v1, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 30
    invoke-static {p1, v1}, Landroid/support/media/ExifInterface$ExifAttribute;->createUShort(ILjava/nio/ByteOrder;)Landroid/support/media/ExifInterface$ExifAttribute;

    move-result-object p1

    .line 31
    :goto_1
    iget-object v1, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v1, v1, p2

    invoke-virtual {v1, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    iget-object p0, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object p0, p0, p2

    invoke-virtual {p0, v6, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_3

    .line 33
    :cond_4
    :goto_2
    invoke-static {v7}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 34
    invoke-static {p1}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 35
    invoke-static {v8, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_5
    if-eqz v1, :cond_6

    if-eqz v2, :cond_6

    if-eqz v3, :cond_6

    if-eqz v4, :cond_6

    .line 36
    iget-object p1, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    invoke-virtual {v1, p1}, Landroid/support/media/ExifInterface$ExifAttribute;->getIntValue(Ljava/nio/ByteOrder;)I

    move-result p1

    .line 37
    iget-object v0, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    invoke-virtual {v3, v0}, Landroid/support/media/ExifInterface$ExifAttribute;->getIntValue(Ljava/nio/ByteOrder;)I

    move-result v0

    .line 38
    iget-object v1, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    invoke-virtual {v4, v1}, Landroid/support/media/ExifInterface$ExifAttribute;->getIntValue(Ljava/nio/ByteOrder;)I

    move-result v1

    .line 39
    iget-object v3, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    invoke-virtual {v2, v3}, Landroid/support/media/ExifInterface$ExifAttribute;->getIntValue(Ljava/nio/ByteOrder;)I

    move-result v2

    if-le v0, p1, :cond_8

    if-le v1, v2, :cond_8

    sub-int/2addr v0, p1

    sub-int/2addr v1, v2

    .line 40
    iget-object p1, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 41
    invoke-static {v0, p1}, Landroid/support/media/ExifInterface$ExifAttribute;->createUShort(ILjava/nio/ByteOrder;)Landroid/support/media/ExifInterface$ExifAttribute;

    move-result-object p1

    .line 42
    iget-object v0, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 43
    invoke-static {v1, v0}, Landroid/support/media/ExifInterface$ExifAttribute;->createUShort(ILjava/nio/ByteOrder;)Landroid/support/media/ExifInterface$ExifAttribute;

    move-result-object v0

    .line 44
    iget-object v1, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v1, v1, p2

    invoke-virtual {v1, v6, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    iget-object p0, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object p0, p0, p2

    invoke-virtual {p0, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 46
    :cond_6
    iget-object v0, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v0, v0, p2

    .line 47
    invoke-virtual {v0, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/media/ExifInterface$ExifAttribute;

    .line 48
    iget-object v1, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v1, v1, p2

    .line 49
    invoke-virtual {v1, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/media/ExifInterface$ExifAttribute;

    if-eqz v0, :cond_7

    if-nez v1, :cond_8

    .line 50
    :cond_7
    iget-object v0, p0, Landroid/support/media/ExifInterface;->mAttributes:[Ljava/util/HashMap;

    aget-object v0, v0, p2

    const-string v1, "JPEGInterchangeFormat"

    .line 51
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/media/ExifInterface$ExifAttribute;

    if-eqz v0, :cond_8

    .line 52
    iget-object v1, p0, Landroid/support/media/ExifInterface;->mExifByteOrder:Ljava/nio/ByteOrder;

    .line 53
    invoke-virtual {v0, v1}, Landroid/support/media/ExifInterface$ExifAttribute;->getIntValue(Ljava/nio/ByteOrder;)I

    move-result v0

    .line 54
    invoke-virtual {p0, p1, v0, p2}, Landroid/support/media/ExifInterface;->getJpegAttributes(Landroid/support/media/ExifInterface$ByteOrderedDataInputStream;II)V

    :cond_8
    :goto_3
    return-void
.end method
