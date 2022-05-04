.class public final Landroidx/slice/SliceItemHolderParcelizer;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static sBuilder:Landroidx/slice/SliceItemHolder$SliceItemPool;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroidx/slice/SliceItemHolder$SliceItemPool;

    invoke-direct {v0}, Landroidx/slice/SliceItemHolder$SliceItemPool;-><init>()V

    sput-object v0, Landroidx/slice/SliceItemHolderParcelizer;->sBuilder:Landroidx/slice/SliceItemHolder$SliceItemPool;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static read(Landroidx/versionedparcelable/VersionedParcel;)Landroidx/slice/SliceItemHolder;
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "parcel"
        }
    .end annotation

    .line 1
    sget-object v0, Landroidx/slice/SliceItemHolderParcelizer;->sBuilder:Landroidx/slice/SliceItemHolder$SliceItemPool;

    .line 2
    iget-object v1, v0, Landroidx/slice/SliceItemHolder$SliceItemPool;->mCached:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 3
    iget-object v0, v0, Landroidx/slice/SliceItemHolder$SliceItemPool;->mCached:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/slice/SliceItemHolder;

    goto :goto_0

    .line 4
    :cond_0
    new-instance v1, Landroidx/slice/SliceItemHolder;

    invoke-direct {v1, v0}, Landroidx/slice/SliceItemHolder;-><init>(Landroidx/slice/SliceItemHolder$SliceItemPool;)V

    move-object v0, v1

    .line 5
    :goto_0
    iget-object v1, v0, Landroidx/slice/SliceItemHolder;->mVersionedParcelable:Landroidx/versionedparcelable/VersionedParcelable;

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Landroidx/versionedparcelable/VersionedParcel;->readVersionedParcelable(Landroidx/versionedparcelable/VersionedParcelable;I)Landroidx/versionedparcelable/VersionedParcelable;

    move-result-object v1

    iput-object v1, v0, Landroidx/slice/SliceItemHolder;->mVersionedParcelable:Landroidx/versionedparcelable/VersionedParcelable;

    .line 6
    iget-object v1, v0, Landroidx/slice/SliceItemHolder;->mParcelable:Landroid/os/Parcelable;

    const/4 v2, 0x2

    invoke-virtual {p0, v1, v2}, Landroidx/versionedparcelable/VersionedParcel;->readParcelable(Landroid/os/Parcelable;I)Landroid/os/Parcelable;

    move-result-object v1

    iput-object v1, v0, Landroidx/slice/SliceItemHolder;->mParcelable:Landroid/os/Parcelable;

    .line 7
    iget-object v1, v0, Landroidx/slice/SliceItemHolder;->mStr:Ljava/lang/String;

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2}, Landroidx/versionedparcelable/VersionedParcel;->readString(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Landroidx/slice/SliceItemHolder;->mStr:Ljava/lang/String;

    .line 8
    iget v1, v0, Landroidx/slice/SliceItemHolder;->mInt:I

    const/4 v2, 0x4

    invoke-virtual {p0, v1, v2}, Landroidx/versionedparcelable/VersionedParcel;->readInt(II)I

    move-result v1

    iput v1, v0, Landroidx/slice/SliceItemHolder;->mInt:I

    .line 9
    iget-wide v1, v0, Landroidx/slice/SliceItemHolder;->mLong:J

    const/4 v3, 0x5

    .line 10
    invoke-virtual {p0, v3}, Landroidx/versionedparcelable/VersionedParcel;->readField(I)Z

    move-result v3

    if-nez v3, :cond_1

    goto :goto_1

    .line 11
    :cond_1
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readLong()J

    move-result-wide v1

    .line 12
    :goto_1
    iput-wide v1, v0, Landroidx/slice/SliceItemHolder;->mLong:J

    .line 13
    iget-object v1, v0, Landroidx/slice/SliceItemHolder;->mBundle:Landroid/os/Bundle;

    const/4 v2, 0x6

    .line 14
    invoke-virtual {p0, v2}, Landroidx/versionedparcelable/VersionedParcel;->readField(I)Z

    move-result v2

    if-nez v2, :cond_2

    goto :goto_2

    .line 15
    :cond_2
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readBundle()Landroid/os/Bundle;

    move-result-object v1

    .line 16
    :goto_2
    iput-object v1, v0, Landroidx/slice/SliceItemHolder;->mBundle:Landroid/os/Bundle;

    return-object v0
.end method

.method public static write(Landroidx/slice/SliceItemHolder;Landroidx/versionedparcelable/VersionedParcel;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "obj",
            "parcel"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    iget-object v0, p0, Landroidx/slice/SliceItemHolder;->mVersionedParcelable:Landroidx/versionedparcelable/VersionedParcelable;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    .line 3
    invoke-virtual {p1, v1}, Landroidx/versionedparcelable/VersionedParcel;->setOutputField(I)V

    .line 4
    invoke-virtual {p1, v0}, Landroidx/versionedparcelable/VersionedParcel;->writeVersionedParcelable(Landroidx/versionedparcelable/VersionedParcelable;)V

    .line 5
    :cond_0
    iget-object v0, p0, Landroidx/slice/SliceItemHolder;->mParcelable:Landroid/os/Parcelable;

    if-eqz v0, :cond_1

    const/4 v1, 0x2

    .line 6
    invoke-virtual {p1, v1}, Landroidx/versionedparcelable/VersionedParcel;->setOutputField(I)V

    .line 7
    invoke-virtual {p1, v0}, Landroidx/versionedparcelable/VersionedParcel;->writeParcelable(Landroid/os/Parcelable;)V

    .line 8
    :cond_1
    iget-object v0, p0, Landroidx/slice/SliceItemHolder;->mStr:Ljava/lang/String;

    if-eqz v0, :cond_2

    const/4 v1, 0x3

    .line 9
    invoke-virtual {p1, v1}, Landroidx/versionedparcelable/VersionedParcel;->setOutputField(I)V

    .line 10
    invoke-virtual {p1, v0}, Landroidx/versionedparcelable/VersionedParcel;->writeString(Ljava/lang/String;)V

    .line 11
    :cond_2
    iget v0, p0, Landroidx/slice/SliceItemHolder;->mInt:I

    if-eqz v0, :cond_3

    const/4 v1, 0x4

    .line 12
    invoke-virtual {p1, v1}, Landroidx/versionedparcelable/VersionedParcel;->setOutputField(I)V

    .line 13
    invoke-virtual {p1, v0}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    :cond_3
    const-wide/16 v0, 0x0

    .line 14
    iget-wide v2, p0, Landroidx/slice/SliceItemHolder;->mLong:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_4

    const/4 v0, 0x5

    .line 15
    invoke-virtual {p1, v0}, Landroidx/versionedparcelable/VersionedParcel;->setOutputField(I)V

    .line 16
    invoke-virtual {p1, v2, v3}, Landroidx/versionedparcelable/VersionedParcel;->writeLong(J)V

    .line 17
    :cond_4
    iget-object p0, p0, Landroidx/slice/SliceItemHolder;->mBundle:Landroid/os/Bundle;

    if-eqz p0, :cond_5

    const/4 v0, 0x6

    .line 18
    invoke-virtual {p1, v0}, Landroidx/versionedparcelable/VersionedParcel;->setOutputField(I)V

    .line 19
    invoke-virtual {p1, p0}, Landroidx/versionedparcelable/VersionedParcel;->writeBundle(Landroid/os/Bundle;)V

    :cond_5
    return-void
.end method
