.class public Lcom/android/customization/model/grid/GridOption;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/android/customization/model/CustomizationOption;
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/customization/model/CustomizationOption<",
        "Lcom/android/customization/model/grid/GridOption;",
        ">;",
        "Landroid/os/Parcelable;"
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/android/customization/model/grid/GridOption;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final cols:I

.field public final mIconShapePath:Ljava/lang/String;

.field public final mIsCurrent:Z

.field public final mTileDrawable:Lcom/android/customization/widget/GridTileDrawable;

.field public final mTitle:Ljava/lang/String;

.field public final name:Ljava/lang/String;

.field public final previewImageUri:Landroid/net/Uri;

.field public final previewPagesCount:I

.field public final rows:I


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/customization/model/grid/GridOption$1;

    invoke-direct {v0}, Lcom/android/customization/model/grid/GridOption$1;-><init>()V

    sput-object v0, Lcom/android/customization/model/grid/GridOption;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 4

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/customization/model/grid/GridOption;->mTitle:Ljava/lang/String;

    .line 13
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/android/customization/model/grid/GridOption;->mIsCurrent:Z

    .line 14
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/customization/model/grid/GridOption;->mIconShapePath:Ljava/lang/String;

    .line 15
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/customization/model/grid/GridOption;->name:Ljava/lang/String;

    .line 16
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/android/customization/model/grid/GridOption;->rows:I

    .line 17
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/android/customization/model/grid/GridOption;->cols:I

    .line 18
    const-class v3, Landroid/net/Uri;

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v3

    check-cast v3, Landroid/net/Uri;

    iput-object v3, p0, Lcom/android/customization/model/grid/GridOption;->previewImageUri:Landroid/net/Uri;

    .line 19
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/android/customization/model/grid/GridOption;->previewPagesCount:I

    .line 20
    new-instance p1, Lcom/android/customization/widget/GridTileDrawable;

    invoke-direct {p1, v1, v2, v0}, Lcom/android/customization/widget/GridTileDrawable;-><init>(IILjava/lang/String;)V

    iput-object p1, p0, Lcom/android/customization/model/grid/GridOption;->mTileDrawable:Lcom/android/customization/widget/GridTileDrawable;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ZIILandroid/net/Uri;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/customization/model/grid/GridOption;->mTitle:Ljava/lang/String;

    .line 3
    iput-boolean p3, p0, Lcom/android/customization/model/grid/GridOption;->mIsCurrent:Z

    .line 4
    iput-object p8, p0, Lcom/android/customization/model/grid/GridOption;->mIconShapePath:Ljava/lang/String;

    .line 5
    new-instance p1, Lcom/android/customization/widget/GridTileDrawable;

    invoke-direct {p1, p4, p5, p8}, Lcom/android/customization/widget/GridTileDrawable;-><init>(IILjava/lang/String;)V

    iput-object p1, p0, Lcom/android/customization/model/grid/GridOption;->mTileDrawable:Lcom/android/customization/widget/GridTileDrawable;

    .line 6
    iput-object p2, p0, Lcom/android/customization/model/grid/GridOption;->name:Ljava/lang/String;

    .line 7
    iput p4, p0, Lcom/android/customization/model/grid/GridOption;->rows:I

    .line 8
    iput p5, p0, Lcom/android/customization/model/grid/GridOption;->cols:I

    .line 9
    iput-object p6, p0, Lcom/android/customization/model/grid/GridOption;->previewImageUri:Landroid/net/Uri;

    .line 10
    iput p7, p0, Lcom/android/customization/model/grid/GridOption;->previewPagesCount:I

    return-void
.end method


# virtual methods
.method public bindThumbnailTile(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 2
    invoke-virtual {p1}, Landroid/view/View;->isActivated()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 3
    iget-boolean v1, p0, Lcom/android/customization/model/grid/GridOption;->mIsCurrent:Z

    if-eqz v1, :cond_0

    const v1, 0x1010036

    goto :goto_0

    :cond_0
    const v1, 0x1010039

    goto :goto_0

    :cond_1
    const v1, 0x1010212

    .line 4
    :goto_0
    invoke-static {v0, v1}, Landroidx/transition/R$id;->getColorAttr(Landroid/content/Context;I)I

    move-result v0

    .line 5
    iget-object v1, p0, Lcom/android/customization/model/grid/GridOption;->mTileDrawable:Lcom/android/customization/widget/GridTileDrawable;

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v1, v0, v2}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    const v0, 0x7f0a010b

    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/android/customization/model/grid/GridOption;->mTileDrawable:Lcom/android/customization/widget/GridTileDrawable;

    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 8
    invoke-virtual {p1}, Landroid/view/View;->isActivated()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-boolean p0, p0, Lcom/android/customization/model/grid/GridOption;->mIsCurrent:Z

    if-nez p0, :cond_2

    const p0, 0x7f080101

    goto :goto_1

    :cond_2
    const p0, 0x7f0800fd

    :goto_1
    const v0, 0x7f0a018d

    .line 9
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    return-void
.end method

.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 1
    :cond_0
    instance-of v1, p1, Lcom/android/customization/model/grid/GridOption;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 2
    check-cast p1, Lcom/android/customization/model/grid/GridOption;

    .line 3
    iget-object v1, p0, Lcom/android/customization/model/grid/GridOption;->name:Ljava/lang/String;

    iget-object v3, p1, Lcom/android/customization/model/grid/GridOption;->name:Ljava/lang/String;

    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/android/customization/model/grid/GridOption;->cols:I

    iget v3, p1, Lcom/android/customization/model/grid/GridOption;->cols:I

    if-ne v1, v3, :cond_1

    iget p0, p0, Lcom/android/customization/model/grid/GridOption;->rows:I

    iget p1, p1, Lcom/android/customization/model/grid/GridOption;->rows:I

    if-ne p0, p1, :cond_1

    goto :goto_0

    :cond_1
    move v0, v2

    :goto_0
    return v0

    :cond_2
    return v2
.end method

.method public getLayoutResId()I
    .locals 0

    const p0, 0x7f0d0070

    return p0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/customization/model/grid/GridOption;->mTitle:Ljava/lang/String;

    return-object p0
.end method

.method public isActive(Lcom/android/customization/model/CustomizationManager;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/customization/model/CustomizationManager<",
            "Lcom/android/customization/model/grid/GridOption;",
            ">;)Z"
        }
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/android/customization/model/grid/GridOption;->mIsCurrent:Z

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    const/16 v0, 0x8

    new-array v0, v0, [Ljava/lang/Object;

    .line 1
    iget-object v1, p0, Lcom/android/customization/model/grid/GridOption;->mTitle:Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget-boolean v1, p0, Lcom/android/customization/model/grid/GridOption;->mIsCurrent:Z

    .line 2
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/android/customization/model/grid/GridOption;->mTileDrawable:Lcom/android/customization/widget/GridTileDrawable;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/android/customization/model/grid/GridOption;->name:Ljava/lang/String;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    iget v1, p0, Lcom/android/customization/model/grid/GridOption;->rows:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x4

    aput-object v1, v0, v2

    iget v1, p0, Lcom/android/customization/model/grid/GridOption;->cols:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x5

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/android/customization/model/grid/GridOption;->previewImageUri:Landroid/net/Uri;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    iget p0, p0, Lcom/android/customization/model/grid/GridOption;->previewPagesCount:I

    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const/4 v1, 0x7

    aput-object p0, v0, v1

    const-string p0, "GridOption{mTitle=\'%s\', mIsCurrent=%s, mTileDrawable=%s, name=\'%s\', rows=%d, cols=%d, previewImageUri=%s, previewPagesCount=%d}\n"

    .line 4
    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/customization/model/grid/GridOption;->mTitle:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 2
    iget-boolean v0, p0, Lcom/android/customization/model/grid/GridOption;->mIsCurrent:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 3
    iget-object v0, p0, Lcom/android/customization/model/grid/GridOption;->mIconShapePath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 4
    iget-object v0, p0, Lcom/android/customization/model/grid/GridOption;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 5
    iget v0, p0, Lcom/android/customization/model/grid/GridOption;->rows:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 6
    iget v0, p0, Lcom/android/customization/model/grid/GridOption;->cols:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 7
    iget-object v0, p0, Lcom/android/customization/model/grid/GridOption;->previewImageUri:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 8
    iget p0, p0, Lcom/android/customization/model/grid/GridOption;->previewPagesCount:I

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
