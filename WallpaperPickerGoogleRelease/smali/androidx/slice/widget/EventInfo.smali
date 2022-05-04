.class public Landroidx/slice/widget/EventInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public actionCount:I

.field public actionIndex:I

.field public actionPosition:I

.field public actionType:I

.field public rowIndex:I

.field public rowTemplateType:I

.field public sliceMode:I

.field public state:I


# direct methods
.method public constructor <init>(IIII)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "sliceMode",
            "actionType",
            "rowTemplateType",
            "rowIndex"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput p1, p0, Landroidx/slice/widget/EventInfo;->sliceMode:I

    .line 3
    iput p2, p0, Landroidx/slice/widget/EventInfo;->actionType:I

    .line 4
    iput p3, p0, Landroidx/slice/widget/EventInfo;->rowTemplateType:I

    .line 5
    iput p4, p0, Landroidx/slice/widget/EventInfo;->rowIndex:I

    const/4 p1, -0x1

    .line 6
    iput p1, p0, Landroidx/slice/widget/EventInfo;->actionPosition:I

    .line 7
    iput p1, p0, Landroidx/slice/widget/EventInfo;->actionIndex:I

    .line 8
    iput p1, p0, Landroidx/slice/widget/EventInfo;->actionCount:I

    .line 9
    iput p1, p0, Landroidx/slice/widget/EventInfo;->state:I

    return-void
.end method


# virtual methods
.method public setPosition(III)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "actionPosition",
            "actionIndex",
            "actionCount"
        }
    .end annotation

    .line 1
    iput p1, p0, Landroidx/slice/widget/EventInfo;->actionPosition:I

    .line 2
    iput p2, p0, Landroidx/slice/widget/EventInfo;->actionIndex:I

    .line 3
    iput p3, p0, Landroidx/slice/widget/EventInfo;->actionCount:I

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 10

    const-string v0, "mode="

    .line 1
    invoke-static {v0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 2
    iget v1, p0, Landroidx/slice/widget/EventInfo;->sliceMode:I

    sget-object v2, Landroidx/slice/widget/SliceView;->SLICE_ACTION_PRIORITY_COMPARATOR:Ljava/util/Comparator;

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eq v1, v3, :cond_2

    if-eq v1, v2, :cond_1

    const/4 v4, 0x3

    if-eq v1, v4, :cond_0

    const-string v4, "unknown mode: "

    .line 3
    invoke-static {v4, v1}, Landroid/support/media/ExifInterface$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const-string v1, "MODE SHORTCUT"

    goto :goto_0

    :cond_1
    const-string v1, "MODE LARGE"

    goto :goto_0

    :cond_2
    const-string v1, "MODE SMALL"

    .line 4
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", actionType="

    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroidx/slice/widget/EventInfo;->actionType:I

    const-string v4, "TIME_PICK"

    const-string v5, "DATE_PICK"

    const-string v6, "SELECTION"

    const-string v7, "SLIDER"

    const-string v8, "TOGGLE"

    packed-switch v1, :pswitch_data_0

    const-string v9, "unknown action: "

    .line 6
    invoke-static {v9, v1}, Landroid/support/media/ExifInterface$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    :pswitch_0
    move-object v1, v4

    goto :goto_1

    :pswitch_1
    move-object v1, v5

    goto :goto_1

    :pswitch_2
    move-object v1, v6

    goto :goto_1

    :pswitch_3
    const-string v1, "SEE MORE"

    goto :goto_1

    :pswitch_4
    const-string v1, "CONTENT"

    goto :goto_1

    :pswitch_5
    move-object v1, v7

    goto :goto_1

    :pswitch_6
    const-string v1, "BUTTON"

    goto :goto_1

    :pswitch_7
    move-object v1, v8

    .line 7
    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", rowTemplateType="

    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroidx/slice/widget/EventInfo;->rowTemplateType:I

    packed-switch v1, :pswitch_data_1

    const-string v4, "unknown row type: "

    .line 9
    invoke-static {v4, v1}, Landroid/support/media/ExifInterface$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v4

    goto :goto_2

    :pswitch_8
    move-object v4, v5

    goto :goto_2

    :pswitch_9
    move-object v4, v6

    goto :goto_2

    :pswitch_a
    const-string v4, "PROGRESS"

    goto :goto_2

    :pswitch_b
    move-object v4, v7

    goto :goto_2

    :pswitch_c
    move-object v4, v8

    goto :goto_2

    :pswitch_d
    const-string v4, "MESSAGING"

    goto :goto_2

    :pswitch_e
    const-string v4, "GRID"

    goto :goto_2

    :pswitch_f
    const-string v4, "LIST"

    goto :goto_2

    :pswitch_10
    const-string v4, "SHORTCUT"

    .line 10
    :goto_2
    :pswitch_11
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", rowIndex="

    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroidx/slice/widget/EventInfo;->rowIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", actionPosition="

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroidx/slice/widget/EventInfo;->actionPosition:I

    if-eqz v1, :cond_5

    if-eq v1, v3, :cond_4

    if-eq v1, v2, :cond_3

    const-string v2, "unknown position: "

    .line 13
    invoke-static {v2, v1}, Landroid/support/media/ExifInterface$$ExternalSyntheticOutline0;->m(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    goto :goto_3

    :cond_3
    const-string v1, "CELL"

    goto :goto_3

    :cond_4
    const-string v1, "END"

    goto :goto_3

    :cond_5
    const-string v1, "START"

    .line 14
    :goto_3
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", actionIndex="

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroidx/slice/widget/EventInfo;->actionIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", actionCount="

    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroidx/slice/widget/EventInfo;->actionCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", state="

    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Landroidx/slice/widget/EventInfo;->state:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch -0x1
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_11
    .end packed-switch
.end method
