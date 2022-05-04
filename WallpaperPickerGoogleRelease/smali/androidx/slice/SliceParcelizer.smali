.class public final Landroidx/slice/SliceParcelizer;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static read(Landroidx/versionedparcelable/VersionedParcel;)Landroidx/slice/Slice;
    .locals 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "parcel"
        }
    .end annotation

    .line 1
    new-instance v0, Landroidx/slice/Slice;

    invoke-direct {v0}, Landroidx/slice/Slice;-><init>()V

    .line 2
    iget-object v1, v0, Landroidx/slice/Slice;->mSpec:Landroidx/slice/SliceSpec;

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Landroidx/versionedparcelable/VersionedParcel;->readVersionedParcelable(Landroidx/versionedparcelable/VersionedParcelable;I)Landroidx/versionedparcelable/VersionedParcelable;

    move-result-object v1

    check-cast v1, Landroidx/slice/SliceSpec;

    iput-object v1, v0, Landroidx/slice/Slice;->mSpec:Landroidx/slice/SliceSpec;

    .line 3
    iget-object v1, v0, Landroidx/slice/Slice;->mItems:[Landroidx/slice/SliceItem;

    const/4 v3, 0x2

    invoke-virtual {p0, v1, v3}, Landroidx/versionedparcelable/VersionedParcel;->readArray([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroidx/slice/SliceItem;

    iput-object v1, v0, Landroidx/slice/Slice;->mItems:[Landroidx/slice/SliceItem;

    .line 4
    iget-object v1, v0, Landroidx/slice/Slice;->mHints:[Ljava/lang/String;

    const/4 v3, 0x3

    invoke-virtual {p0, v1, v3}, Landroidx/versionedparcelable/VersionedParcel;->readArray([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    iput-object v1, v0, Landroidx/slice/Slice;->mHints:[Ljava/lang/String;

    .line 5
    iget-object v1, v0, Landroidx/slice/Slice;->mUri:Ljava/lang/String;

    const/4 v3, 0x4

    invoke-virtual {p0, v1, v3}, Landroidx/versionedparcelable/VersionedParcel;->readString(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    iput-object p0, v0, Landroidx/slice/Slice;->mUri:Ljava/lang/String;

    .line 6
    iget-object p0, v0, Landroidx/slice/Slice;->mItems:[Landroidx/slice/SliceItem;

    array-length p0, p0

    sub-int/2addr p0, v2

    :goto_0
    if-ltz p0, :cond_5

    .line 7
    iget-object v1, v0, Landroidx/slice/Slice;->mItems:[Landroidx/slice/SliceItem;

    aget-object v3, v1, p0

    iget-object v3, v3, Landroidx/slice/SliceItem;->mObj:Ljava/lang/Object;

    if-nez v3, :cond_4

    .line 8
    const-class v3, Landroidx/slice/SliceItem;

    aget-object v4, v1, p0

    const/4 v5, 0x0

    .line 9
    invoke-static {v1, v4}, Landroidx/slice/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    goto :goto_2

    .line 10
    :cond_0
    array-length v6, v1

    move v7, v5

    :goto_1
    if-ge v7, v6, :cond_3

    .line 11
    aget-object v8, v1, v7

    .line 12
    invoke-static {v8, v4}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    if-ne v6, v2, :cond_1

    const/4 v1, 0x0

    goto :goto_2

    :cond_1
    add-int/lit8 v4, v6, -0x1

    .line 13
    invoke-static {v3, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/Object;

    .line 14
    invoke-static {v1, v5, v3, v5, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v4, v7, 0x1

    sub-int/2addr v6, v7

    sub-int/2addr v6, v2

    .line 15
    invoke-static {v1, v4, v3, v7, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v1, v3

    goto :goto_2

    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 16
    :cond_3
    :goto_2
    check-cast v1, [Landroidx/slice/SliceItem;

    iput-object v1, v0, Landroidx/slice/Slice;->mItems:[Landroidx/slice/SliceItem;

    if-nez v1, :cond_4

    new-array v1, v5, [Landroidx/slice/SliceItem;

    .line 17
    iput-object v1, v0, Landroidx/slice/Slice;->mItems:[Landroidx/slice/SliceItem;

    :cond_4
    add-int/lit8 p0, p0, -0x1

    goto :goto_0

    :cond_5
    return-object v0
.end method

.method public static write(Landroidx/slice/Slice;Landroidx/versionedparcelable/VersionedParcel;)V
    .locals 2
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
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iget-object v0, p0, Landroidx/slice/Slice;->mSpec:Landroidx/slice/SliceSpec;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    .line 4
    invoke-virtual {p1, v1}, Landroidx/versionedparcelable/VersionedParcel;->setOutputField(I)V

    .line 5
    invoke-virtual {p1, v0}, Landroidx/versionedparcelable/VersionedParcel;->writeVersionedParcelable(Landroidx/versionedparcelable/VersionedParcelable;)V

    .line 6
    :cond_0
    sget-object v0, Landroidx/slice/Slice;->NO_ITEMS:[Landroidx/slice/SliceItem;

    iget-object v1, p0, Landroidx/slice/Slice;->mItems:[Landroidx/slice/SliceItem;

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 7
    iget-object v0, p0, Landroidx/slice/Slice;->mItems:[Landroidx/slice/SliceItem;

    const/4 v1, 0x2

    invoke-virtual {p1, v0, v1}, Landroidx/versionedparcelable/VersionedParcel;->writeArray([Ljava/lang/Object;I)V

    .line 8
    :cond_1
    sget-object v0, Landroidx/slice/Slice;->NO_HINTS:[Ljava/lang/String;

    iget-object v1, p0, Landroidx/slice/Slice;->mHints:[Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 9
    iget-object v0, p0, Landroidx/slice/Slice;->mHints:[Ljava/lang/String;

    const/4 v1, 0x3

    invoke-virtual {p1, v0, v1}, Landroidx/versionedparcelable/VersionedParcel;->writeArray([Ljava/lang/Object;I)V

    .line 10
    :cond_2
    iget-object p0, p0, Landroidx/slice/Slice;->mUri:Ljava/lang/String;

    if-eqz p0, :cond_3

    const/4 v0, 0x4

    .line 11
    invoke-virtual {p1, v0}, Landroidx/versionedparcelable/VersionedParcel;->setOutputField(I)V

    .line 12
    invoke-virtual {p1, p0}, Landroidx/versionedparcelable/VersionedParcel;->writeString(Ljava/lang/String;)V

    :cond_3
    return-void
.end method
