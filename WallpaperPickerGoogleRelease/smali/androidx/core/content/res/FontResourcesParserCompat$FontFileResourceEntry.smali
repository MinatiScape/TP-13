.class public final Landroidx/core/content/res/FontResourcesParserCompat$FontFileResourceEntry;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/content/res/FontResourcesParserCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "FontFileResourceEntry"
.end annotation


# instance fields
.field public final mFileName:Ljava/lang/String;

.field public mItalic:Z

.field public mResourceId:I

.field public mTtcIndex:I

.field public mVariationSettings:Ljava/lang/String;

.field public mWeight:I


# direct methods
.method public constructor <init>(Ljava/lang/String;IZLjava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "fileName",
            "weight",
            "italic",
            "variationSettings",
            "ttcIndex",
            "resourceId"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Landroidx/core/content/res/FontResourcesParserCompat$FontFileResourceEntry;->mFileName:Ljava/lang/String;

    .line 3
    iput p2, p0, Landroidx/core/content/res/FontResourcesParserCompat$FontFileResourceEntry;->mWeight:I

    .line 4
    iput-boolean p3, p0, Landroidx/core/content/res/FontResourcesParserCompat$FontFileResourceEntry;->mItalic:Z

    .line 5
    iput-object p4, p0, Landroidx/core/content/res/FontResourcesParserCompat$FontFileResourceEntry;->mVariationSettings:Ljava/lang/String;

    .line 6
    iput p5, p0, Landroidx/core/content/res/FontResourcesParserCompat$FontFileResourceEntry;->mTtcIndex:I

    .line 7
    iput p6, p0, Landroidx/core/content/res/FontResourcesParserCompat$FontFileResourceEntry;->mResourceId:I

    return-void
.end method
