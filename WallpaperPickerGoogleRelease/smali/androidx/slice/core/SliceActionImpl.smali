.class public Landroidx/slice/core/SliceActionImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/slice/core/SliceAction;


# instance fields
.field public mActionItem:Landroidx/slice/SliceItem;

.field public mActionType:I

.field public mContentDescription:Ljava/lang/CharSequence;

.field public mIcon:Landroidx/core/graphics/drawable/IconCompat;

.field public mImageMode:I

.field public mIsChecked:Z

.field public mPriority:I

.field public mSliceItem:Landroidx/slice/SliceItem;

.field public mTitle:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Landroid/app/PendingIntent;Landroidx/core/graphics/drawable/IconCompat;ILjava/lang/CharSequence;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "action",
            "actionIcon",
            "imageMode",
            "actionTitle"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x5

    .line 2
    iput p1, p0, Landroidx/slice/core/SliceActionImpl;->mImageMode:I

    const/4 p1, 0x1

    .line 3
    iput p1, p0, Landroidx/slice/core/SliceActionImpl;->mActionType:I

    const/4 p1, -0x1

    .line 4
    iput p1, p0, Landroidx/slice/core/SliceActionImpl;->mPriority:I

    .line 5
    iput-object p2, p0, Landroidx/slice/core/SliceActionImpl;->mIcon:Landroidx/core/graphics/drawable/IconCompat;

    .line 6
    iput-object p4, p0, Landroidx/slice/core/SliceActionImpl;->mTitle:Ljava/lang/CharSequence;

    .line 7
    iput p3, p0, Landroidx/slice/core/SliceActionImpl;->mImageMode:I

    return-void
.end method

.method public constructor <init>(Landroidx/slice/SliceItem;)V
    .locals 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "slice"
        }
    .end annotation

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x5

    .line 9
    iput v0, p0, Landroidx/slice/core/SliceActionImpl;->mImageMode:I

    const/4 v0, 0x1

    .line 10
    iput v0, p0, Landroidx/slice/core/SliceActionImpl;->mActionType:I

    const/4 v1, -0x1

    .line 11
    iput v1, p0, Landroidx/slice/core/SliceActionImpl;->mPriority:I

    .line 12
    iput-object p1, p0, Landroidx/slice/core/SliceActionImpl;->mSliceItem:Landroidx/slice/SliceItem;

    const-string v2, "action"

    .line 13
    invoke-static {p1, v2}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/SliceItem;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    .line 14
    :cond_0
    iput-object p1, p0, Landroidx/slice/core/SliceActionImpl;->mActionItem:Landroidx/slice/SliceItem;

    .line 15
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->getAction()Landroid/app/PendingIntent;

    .line 16
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object v2

    const/4 v3, 0x0

    const-string v4, "image"

    .line 17
    invoke-static {v2, v4, v3, v3}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/Slice;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 18
    iget-object v4, v2, Landroidx/slice/SliceItem;->mObj:Ljava/lang/Object;

    check-cast v4, Landroidx/core/graphics/drawable/IconCompat;

    .line 19
    iput-object v4, p0, Landroidx/slice/core/SliceActionImpl;->mIcon:Landroidx/core/graphics/drawable/IconCompat;

    .line 20
    invoke-static {v2}, Landroidx/slice/core/SliceActionImpl;->parseImageMode(Landroidx/slice/SliceItem;)I

    move-result v2

    iput v2, p0, Landroidx/slice/core/SliceActionImpl;->mImageMode:I

    .line 21
    :cond_1
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object v2

    const-string v4, "text"

    const-string v5, "title"

    invoke-static {v2, v4, v5, v3}, Landroidx/slice/core/SliceQuery;->find(Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 22
    invoke-virtual {v2}, Landroidx/slice/SliceItem;->getSanitizedText()Ljava/lang/CharSequence;

    move-result-object v2

    iput-object v2, p0, Landroidx/slice/core/SliceActionImpl;->mTitle:Ljava/lang/CharSequence;

    .line 23
    :cond_2
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object v2

    const-string v3, "content_description"

    invoke-static {v2, v4, v3}, Landroidx/slice/core/SliceQuery;->findSubtype(Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 24
    iget-object v2, v2, Landroidx/slice/SliceItem;->mObj:Ljava/lang/Object;

    check-cast v2, Ljava/lang/CharSequence;

    .line 25
    iput-object v2, p0, Landroidx/slice/core/SliceActionImpl;->mContentDescription:Ljava/lang/CharSequence;

    .line 26
    :cond_3
    iget-object v2, p1, Landroidx/slice/SliceItem;->mSubType:Ljava/lang/String;

    if-nez v2, :cond_4

    .line 27
    iput v0, p0, Landroidx/slice/core/SliceActionImpl;->mActionType:I

    goto/16 :goto_2

    .line 28
    :cond_4
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v3

    const v5, -0x33c144ac    # -4.9999184E7f

    const/4 v6, 0x2

    if-eq v3, v5, :cond_9

    const v5, 0x2d3f6240

    if-eq v3, v5, :cond_7

    const v5, 0x4a87b63f    # 4447007.5f

    if-eq v3, v5, :cond_5

    goto :goto_0

    :cond_5
    const-string v3, "date_picker"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    goto :goto_0

    :cond_6
    move v2, v6

    goto :goto_1

    :cond_7
    const-string v3, "time_picker"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8

    goto :goto_0

    :cond_8
    move v2, v0

    goto :goto_1

    :cond_9
    const-string v3, "toggle"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_a

    :goto_0
    move v2, v1

    goto :goto_1

    :cond_a
    const/4 v2, 0x0

    :goto_1
    const-string v3, "millis"

    const-string v5, "long"

    if-eqz v2, :cond_d

    if-eq v2, v0, :cond_c

    if-eq v2, v6, :cond_b

    .line 29
    iput v0, p0, Landroidx/slice/core/SliceActionImpl;->mActionType:I

    goto :goto_2

    :cond_b
    const/4 v0, 0x3

    .line 30
    iput v0, p0, Landroidx/slice/core/SliceActionImpl;->mActionType:I

    .line 31
    invoke-static {p1, v5, v3}, Landroidx/slice/core/SliceQuery;->findSubtype(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v0

    if-eqz v0, :cond_e

    .line 32
    invoke-virtual {v0}, Landroidx/slice/SliceItem;->getLong()J

    goto :goto_2

    :cond_c
    const/4 v0, 0x4

    .line 33
    iput v0, p0, Landroidx/slice/core/SliceActionImpl;->mActionType:I

    .line 34
    invoke-static {p1, v5, v3}, Landroidx/slice/core/SliceQuery;->findSubtype(Landroidx/slice/SliceItem;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v0

    if-eqz v0, :cond_e

    .line 35
    invoke-virtual {v0}, Landroidx/slice/SliceItem;->getLong()J

    goto :goto_2

    .line 36
    :cond_d
    iput v6, p0, Landroidx/slice/core/SliceActionImpl;->mActionType:I

    .line 37
    iget-object v0, p1, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    const-string v2, "selected"

    invoke-static {v0, v2}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    .line 38
    iput-boolean v0, p0, Landroidx/slice/core/SliceActionImpl;->mIsChecked:Z

    .line 39
    :cond_e
    :goto_2
    iget-object v0, p0, Landroidx/slice/core/SliceActionImpl;->mSliceItem:Landroidx/slice/SliceItem;

    .line 40
    iget-object v0, v0, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    const-string v2, "activity"

    invoke-static {v0, v2}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 41
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object v0

    const-string v2, "int"

    const-string v3, "priority"

    invoke-static {v0, v2, v3}, Landroidx/slice/core/SliceQuery;->findSubtype(Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v0

    if-eqz v0, :cond_f

    .line 42
    invoke-virtual {v0}, Landroidx/slice/SliceItem;->getInt()I

    move-result v1

    :cond_f
    iput v1, p0, Landroidx/slice/core/SliceActionImpl;->mPriority:I

    .line 43
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->getSlice()Landroidx/slice/Slice;

    move-result-object p0

    const-string p1, "action_key"

    invoke-static {p0, v4, p1}, Landroidx/slice/core/SliceQuery;->findSubtype(Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object p0

    if-eqz p0, :cond_10

    .line 44
    iget-object p0, p0, Landroidx/slice/SliceItem;->mObj:Ljava/lang/Object;

    check-cast p0, Ljava/lang/CharSequence;

    .line 45
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    :cond_10
    return-void
.end method

.method public static parseImageMode(Landroidx/slice/SliceItem;)I
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "iconItem"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    const-string v1, "show_label"

    invoke-static {v0, v1}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x6

    return p0

    .line 2
    :cond_0
    iget-object v0, p0, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    const-string v1, "no_tint"

    invoke-static {v0, v1}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 p0, 0x0

    return p0

    .line 3
    :cond_1
    iget-object v0, p0, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    const-string v1, "raw"

    invoke-static {v0, v1}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "large"

    if-eqz v0, :cond_3

    .line 4
    iget-object p0, p0, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    invoke-static {p0, v1}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    const/4 p0, 0x4

    goto :goto_0

    :cond_2
    const/4 p0, 0x3

    :goto_0
    return p0

    .line 5
    :cond_3
    iget-object p0, p0, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    invoke-static {p0, v1}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4

    const/4 p0, 0x2

    return p0

    :cond_4
    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public getPriority()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/slice/core/SliceActionImpl;->mPriority:I

    return p0
.end method

.method public getSubtype()Ljava/lang/String;
    .locals 1

    .line 1
    iget p0, p0, Landroidx/slice/core/SliceActionImpl;->mActionType:I

    invoke-static {p0}, Landroidx/constraintlayout/solver/SolverVariable$Type$r8$EnumUnboxingUtility;->$enumboxing$ordinal(I)I

    move-result p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_2

    const/4 v0, 0x2

    if-eq p0, v0, :cond_1

    const/4 v0, 0x3

    if-eq p0, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const-string p0, "time_picker"

    return-object p0

    :cond_1
    const-string p0, "date_picker"

    return-object p0

    :cond_2
    const-string p0, "toggle"

    return-object p0
.end method

.method public isToggle()Z
    .locals 1

    .line 1
    iget p0, p0, Landroidx/slice/core/SliceActionImpl;->mActionType:I

    const/4 v0, 0x2

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
