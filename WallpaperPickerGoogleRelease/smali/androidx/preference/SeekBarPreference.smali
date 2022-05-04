.class public Landroidx/preference/SeekBarPreference;
.super Landroidx/preference/Preference;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/preference/SeekBarPreference$SavedState;
    }
.end annotation


# instance fields
.field public mMax:I

.field public mMin:I

.field public mSeekBarIncrement:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4

    const v0, 0x7f04030d

    const/4 v1, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0, v1}, Landroidx/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 2
    sget-object v2, Landroidx/preference/R$styleable;->SeekBarPreference:[I

    invoke-virtual {p1, p2, v2, v0, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, 0x3

    .line 3
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p2

    iput p2, p0, Landroidx/preference/SeekBarPreference;->mMin:I

    const/4 p2, 0x1

    const/16 v0, 0x64

    .line 4
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    .line 5
    iget v2, p0, Landroidx/preference/SeekBarPreference;->mMin:I

    if-ge v0, v2, :cond_0

    move v0, v2

    .line 6
    :cond_0
    iget v2, p0, Landroidx/preference/SeekBarPreference;->mMax:I

    if-eq v0, v2, :cond_1

    .line 7
    iput v0, p0, Landroidx/preference/SeekBarPreference;->mMax:I

    :cond_1
    const/4 v0, 0x4

    .line 8
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    .line 9
    iget v2, p0, Landroidx/preference/SeekBarPreference;->mSeekBarIncrement:I

    if-eq v0, v2, :cond_2

    .line 10
    iget v2, p0, Landroidx/preference/SeekBarPreference;->mMax:I

    iget v3, p0, Landroidx/preference/SeekBarPreference;->mMin:I

    sub-int/2addr v2, v3

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Landroidx/preference/SeekBarPreference;->mSeekBarIncrement:I

    :cond_2
    const/4 p0, 0x2

    .line 11
    invoke-virtual {p1, p0, p2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    const/4 p0, 0x5

    .line 12
    invoke-virtual {p1, p0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    const/4 p0, 0x6

    .line 13
    invoke-virtual {p1, p0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 14
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method


# virtual methods
.method public onGetDefaultValue(Landroid/content/res/TypedArray;I)Ljava/lang/Object;
    .locals 0

    const/4 p0, 0x0

    .line 1
    invoke-virtual {p1, p2, p0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method
