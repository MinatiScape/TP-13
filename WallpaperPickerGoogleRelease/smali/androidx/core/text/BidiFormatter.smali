.class public final Landroidx/core/text/BidiFormatter;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/core/text/BidiFormatter$DirectionalityEstimator;
    }
.end annotation


# static fields
.field public static final DEFAULT_LTR_INSTANCE:Landroidx/core/text/BidiFormatter;

.field public static final DEFAULT_RTL_INSTANCE:Landroidx/core/text/BidiFormatter;

.field public static final DEFAULT_TEXT_DIRECTION_HEURISTIC:Landroidx/core/text/TextDirectionHeuristicCompat;

.field public static final LRM_STRING:Ljava/lang/String;

.field public static final RLM_STRING:Ljava/lang/String;


# instance fields
.field public final mDefaultTextDirectionHeuristicCompat:Landroidx/core/text/TextDirectionHeuristicCompat;

.field public final mFlags:I

.field public final mIsRtlContext:Z


# direct methods
.method public static constructor <clinit>()V
    .locals 4

    .line 1
    sget-object v0, Landroidx/core/text/TextDirectionHeuristicsCompat;->FIRSTSTRONG_LTR:Landroidx/core/text/TextDirectionHeuristicCompat;

    sput-object v0, Landroidx/core/text/BidiFormatter;->DEFAULT_TEXT_DIRECTION_HEURISTIC:Landroidx/core/text/TextDirectionHeuristicCompat;

    const/16 v1, 0x200e

    .line 2
    invoke-static {v1}, Ljava/lang/Character;->toString(C)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Landroidx/core/text/BidiFormatter;->LRM_STRING:Ljava/lang/String;

    const/16 v1, 0x200f

    .line 3
    invoke-static {v1}, Ljava/lang/Character;->toString(C)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Landroidx/core/text/BidiFormatter;->RLM_STRING:Ljava/lang/String;

    .line 4
    new-instance v1, Landroidx/core/text/BidiFormatter;

    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-direct {v1, v2, v3, v0}, Landroidx/core/text/BidiFormatter;-><init>(ZILandroidx/core/text/TextDirectionHeuristicCompat;)V

    sput-object v1, Landroidx/core/text/BidiFormatter;->DEFAULT_LTR_INSTANCE:Landroidx/core/text/BidiFormatter;

    .line 5
    new-instance v1, Landroidx/core/text/BidiFormatter;

    const/4 v2, 0x1

    invoke-direct {v1, v2, v3, v0}, Landroidx/core/text/BidiFormatter;-><init>(ZILandroidx/core/text/TextDirectionHeuristicCompat;)V

    sput-object v1, Landroidx/core/text/BidiFormatter;->DEFAULT_RTL_INSTANCE:Landroidx/core/text/BidiFormatter;

    return-void
.end method

.method public constructor <init>(ZILandroidx/core/text/TextDirectionHeuristicCompat;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "isRtlContext",
            "flags",
            "heuristic"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-boolean p1, p0, Landroidx/core/text/BidiFormatter;->mIsRtlContext:Z

    .line 3
    iput p2, p0, Landroidx/core/text/BidiFormatter;->mFlags:I

    .line 4
    iput-object p3, p0, Landroidx/core/text/BidiFormatter;->mDefaultTextDirectionHeuristicCompat:Landroidx/core/text/TextDirectionHeuristicCompat;

    return-void
.end method

.method public static getEntryDir(Ljava/lang/CharSequence;)I
    .locals 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "str"
        }
    .end annotation

    .line 1
    new-instance v0, Landroidx/core/text/BidiFormatter$DirectionalityEstimator;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroidx/core/text/BidiFormatter$DirectionalityEstimator;-><init>(Ljava/lang/CharSequence;Z)V

    .line 2
    iput v1, v0, Landroidx/core/text/BidiFormatter$DirectionalityEstimator;->charIndex:I

    const/4 p0, -0x1

    const/4 v2, 0x1

    move v3, v1

    move v4, v3

    move v5, v4

    .line 3
    :cond_0
    :goto_0
    iget v6, v0, Landroidx/core/text/BidiFormatter$DirectionalityEstimator;->charIndex:I

    iget v7, v0, Landroidx/core/text/BidiFormatter$DirectionalityEstimator;->length:I

    if-ge v6, v7, :cond_6

    if-nez v3, :cond_6

    .line 4
    iget-object v7, v0, Landroidx/core/text/BidiFormatter$DirectionalityEstimator;->text:Ljava/lang/CharSequence;

    invoke-interface {v7, v6}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v6

    iput-char v6, v0, Landroidx/core/text/BidiFormatter$DirectionalityEstimator;->lastChar:C

    .line 5
    invoke-static {v6}, Ljava/lang/Character;->isHighSurrogate(C)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 6
    iget-object v6, v0, Landroidx/core/text/BidiFormatter$DirectionalityEstimator;->text:Ljava/lang/CharSequence;

    iget v7, v0, Landroidx/core/text/BidiFormatter$DirectionalityEstimator;->charIndex:I

    invoke-static {v6, v7}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result v6

    .line 7
    iget v7, v0, Landroidx/core/text/BidiFormatter$DirectionalityEstimator;->charIndex:I

    invoke-static {v6}, Ljava/lang/Character;->charCount(I)I

    move-result v8

    add-int/2addr v8, v7

    iput v8, v0, Landroidx/core/text/BidiFormatter$DirectionalityEstimator;->charIndex:I

    .line 8
    invoke-static {v6}, Ljava/lang/Character;->getDirectionality(I)B

    move-result v6

    goto :goto_1

    .line 9
    :cond_1
    iget v6, v0, Landroidx/core/text/BidiFormatter$DirectionalityEstimator;->charIndex:I

    add-int/2addr v6, v2

    iput v6, v0, Landroidx/core/text/BidiFormatter$DirectionalityEstimator;->charIndex:I

    .line 10
    iget-char v6, v0, Landroidx/core/text/BidiFormatter$DirectionalityEstimator;->lastChar:C

    const/16 v7, 0x700

    if-ge v6, v7, :cond_2

    .line 11
    sget-object v7, Landroidx/core/text/BidiFormatter$DirectionalityEstimator;->DIR_TYPE_CACHE:[B

    aget-byte v6, v7, v6

    goto :goto_1

    :cond_2
    invoke-static {v6}, Ljava/lang/Character;->getDirectionality(C)B

    move-result v6

    :goto_1
    if-eqz v6, :cond_4

    if-eq v6, v2, :cond_3

    const/4 v7, 0x2

    if-eq v6, v7, :cond_3

    const/16 v7, 0x9

    if-eq v6, v7, :cond_0

    packed-switch v6, :pswitch_data_0

    goto :goto_2

    :pswitch_0
    add-int/lit8 v5, v5, -0x1

    move v4, v1

    goto :goto_0

    :pswitch_1
    add-int/lit8 v5, v5, 0x1

    move v4, v2

    goto :goto_0

    :pswitch_2
    add-int/lit8 v5, v5, 0x1

    move v4, p0

    goto :goto_0

    :cond_3
    if-nez v5, :cond_5

    goto :goto_4

    :cond_4
    if-nez v5, :cond_5

    goto :goto_5

    :cond_5
    :goto_2
    move v3, v5

    goto :goto_0

    :cond_6
    if-nez v3, :cond_7

    goto :goto_6

    :cond_7
    if-eqz v4, :cond_8

    move v1, v4

    goto :goto_6

    .line 12
    :cond_8
    :goto_3
    iget v4, v0, Landroidx/core/text/BidiFormatter$DirectionalityEstimator;->charIndex:I

    if-lez v4, :cond_a

    .line 13
    invoke-virtual {v0}, Landroidx/core/text/BidiFormatter$DirectionalityEstimator;->dirTypeBackward()B

    move-result v4

    packed-switch v4, :pswitch_data_1

    goto :goto_3

    :pswitch_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    :pswitch_4
    if-ne v3, v5, :cond_9

    :goto_4
    move v1, v2

    goto :goto_6

    :pswitch_5
    if-ne v3, v5, :cond_9

    :goto_5
    move v1, p0

    goto :goto_6

    :cond_9
    add-int/lit8 v5, v5, -0x1

    goto :goto_3

    :cond_a
    :goto_6
    return v1

    :pswitch_data_0
    .packed-switch 0xe
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xe
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method

.method public static getExitDir(Ljava/lang/CharSequence;)I
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "str"
        }
    .end annotation

    .line 1
    new-instance v0, Landroidx/core/text/BidiFormatter$DirectionalityEstimator;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroidx/core/text/BidiFormatter$DirectionalityEstimator;-><init>(Ljava/lang/CharSequence;Z)V

    .line 2
    iget p0, v0, Landroidx/core/text/BidiFormatter$DirectionalityEstimator;->length:I

    iput p0, v0, Landroidx/core/text/BidiFormatter$DirectionalityEstimator;->charIndex:I

    move p0, v1

    :goto_0
    move v2, p0

    .line 3
    :cond_0
    :goto_1
    iget v3, v0, Landroidx/core/text/BidiFormatter$DirectionalityEstimator;->charIndex:I

    const/4 v4, 0x1

    if-lez v3, :cond_6

    .line 4
    invoke-virtual {v0}, Landroidx/core/text/BidiFormatter$DirectionalityEstimator;->dirTypeBackward()B

    move-result v3

    if-eqz v3, :cond_4

    if-eq v3, v4, :cond_2

    const/4 v5, 0x2

    if-eq v3, v5, :cond_2

    const/16 v5, 0x9

    if-eq v3, v5, :cond_0

    packed-switch v3, :pswitch_data_0

    if-nez p0, :cond_0

    goto :goto_4

    :pswitch_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :pswitch_1
    if-ne p0, v2, :cond_1

    goto :goto_2

    :pswitch_2
    if-ne p0, v2, :cond_1

    goto :goto_3

    :cond_1
    add-int/lit8 v2, v2, -0x1

    goto :goto_1

    :cond_2
    if-nez v2, :cond_3

    :goto_2
    move v1, v4

    goto :goto_5

    :cond_3
    if-nez p0, :cond_0

    goto :goto_4

    :cond_4
    if-nez v2, :cond_5

    :goto_3
    const/4 v1, -0x1

    goto :goto_5

    :cond_5
    if-nez p0, :cond_0

    :goto_4
    move p0, v2

    goto :goto_0

    :cond_6
    :goto_5
    return v1

    :pswitch_data_0
    .packed-switch 0xe
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
