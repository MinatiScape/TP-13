.class public final Landroidx/slice/SliceItemParcelizer;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static read(Landroidx/versionedparcelable/VersionedParcel;)Landroidx/slice/SliceItem;
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "parcel"
        }
    .end annotation

    .line 1
    new-instance v0, Landroidx/slice/SliceItem;

    invoke-direct {v0}, Landroidx/slice/SliceItem;-><init>()V

    .line 2
    iget-object v1, v0, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Landroidx/versionedparcelable/VersionedParcel;->readArray([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    iput-object v1, v0, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    .line 3
    iget-object v1, v0, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const/4 v2, 0x2

    invoke-virtual {p0, v1, v2}, Landroidx/versionedparcelable/VersionedParcel;->readString(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    .line 4
    iget-object v1, v0, Landroidx/slice/SliceItem;->mSubType:Ljava/lang/String;

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2}, Landroidx/versionedparcelable/VersionedParcel;->readString(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Landroidx/slice/SliceItem;->mSubType:Ljava/lang/String;

    .line 5
    iget-object v1, v0, Landroidx/slice/SliceItem;->mHolder:Landroidx/slice/SliceItemHolder;

    const/4 v2, 0x4

    invoke-virtual {p0, v1, v2}, Landroidx/versionedparcelable/VersionedParcel;->readVersionedParcelable(Landroidx/versionedparcelable/VersionedParcelable;I)Landroidx/versionedparcelable/VersionedParcelable;

    move-result-object p0

    check-cast p0, Landroidx/slice/SliceItemHolder;

    iput-object p0, v0, Landroidx/slice/SliceItem;->mHolder:Landroidx/slice/SliceItemHolder;

    const/4 v1, 0x0

    if-eqz p0, :cond_d

    .line 6
    iget-object v2, v0, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    .line 7
    sget-object v3, Landroidx/slice/SliceItemHolder;->sHandler:Landroidx/slice/SliceItemHolder$HolderHandler;

    if-eqz v3, :cond_0

    .line 8
    check-cast v3, Landroidx/slice/compat/SliceProviderCompat$2;

    invoke-virtual {v3, p0, v2}, Landroidx/slice/compat/SliceProviderCompat$2;->handle(Landroidx/slice/SliceItemHolder;Ljava/lang/String;)V

    .line 9
    :cond_0
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    const/4 v3, 0x0

    const/4 v4, -0x1

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v5

    sparse-switch v5, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    const-string v5, "slice"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    goto :goto_0

    :cond_1
    const/4 v4, 0x7

    goto :goto_0

    :sswitch_1
    const-string v5, "input"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    goto :goto_0

    :cond_2
    const/4 v4, 0x6

    goto :goto_0

    :sswitch_2
    const-string v5, "image"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    goto :goto_0

    :cond_3
    const/4 v4, 0x5

    goto :goto_0

    :sswitch_3
    const-string v5, "text"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4

    goto :goto_0

    :cond_4
    const/4 v4, 0x4

    goto :goto_0

    :sswitch_4
    const-string v5, "long"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_5

    goto :goto_0

    :cond_5
    const/4 v4, 0x3

    goto :goto_0

    :sswitch_5
    const-string v5, "int"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_6

    goto :goto_0

    :cond_6
    const/4 v4, 0x2

    goto :goto_0

    :sswitch_6
    const-string v5, "bundle"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_7

    goto :goto_0

    :cond_7
    const/4 v4, 0x1

    goto :goto_0

    :sswitch_7
    const-string v5, "action"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_8

    goto :goto_0

    :cond_8
    const/4 v4, 0x0

    :goto_0
    packed-switch v4, :pswitch_data_0

    .line 10
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Unrecognized format "

    invoke-static {v0, v2}, Landroidx/appcompat/view/SupportMenuInflater$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 11
    :pswitch_0
    iget-object p0, p0, Landroidx/slice/SliceItemHolder;->mParcelable:Landroid/os/Parcelable;

    goto :goto_3

    .line 12
    :pswitch_1
    iget-object p0, p0, Landroidx/slice/SliceItemHolder;->mVersionedParcelable:Landroidx/versionedparcelable/VersionedParcelable;

    goto :goto_3

    .line 13
    :pswitch_2
    iget-object v2, p0, Landroidx/slice/SliceItemHolder;->mStr:Ljava/lang/String;

    if-eqz v2, :cond_a

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_9

    goto :goto_1

    .line 14
    :cond_9
    iget-object p0, p0, Landroidx/slice/SliceItemHolder;->mStr:Ljava/lang/String;

    .line 15
    invoke-static {p0, v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;I)Landroid/text/Spanned;

    move-result-object p0

    goto :goto_3

    :cond_a
    :goto_1
    const-string p0, ""

    goto :goto_3

    .line 16
    :pswitch_3
    iget-wide v4, p0, Landroidx/slice/SliceItemHolder;->mLong:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    goto :goto_3

    .line 17
    :pswitch_4
    iget p0, p0, Landroidx/slice/SliceItemHolder;->mInt:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    goto :goto_3

    .line 18
    :pswitch_5
    iget-object p0, p0, Landroidx/slice/SliceItemHolder;->mBundle:Landroid/os/Bundle;

    goto :goto_3

    .line 19
    :pswitch_6
    iget-object v2, p0, Landroidx/slice/SliceItemHolder;->mParcelable:Landroid/os/Parcelable;

    if-nez v2, :cond_b

    iget-object v4, p0, Landroidx/slice/SliceItemHolder;->mVersionedParcelable:Landroidx/versionedparcelable/VersionedParcelable;

    if-nez v4, :cond_b

    move-object p0, v1

    goto :goto_3

    .line 20
    :cond_b
    new-instance v4, Landroidx/core/util/Pair;

    if-eqz v2, :cond_c

    goto :goto_2

    :cond_c
    move-object v2, v1

    :goto_2
    iget-object p0, p0, Landroidx/slice/SliceItemHolder;->mVersionedParcelable:Landroidx/versionedparcelable/VersionedParcelable;

    check-cast p0, Landroidx/slice/Slice;

    invoke-direct {v4, v2, p0}, Landroidx/core/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    move-object p0, v4

    .line 21
    :goto_3
    iput-object p0, v0, Landroidx/slice/SliceItem;->mObj:Ljava/lang/Object;

    .line 22
    iget-object p0, v0, Landroidx/slice/SliceItem;->mHolder:Landroidx/slice/SliceItemHolder;

    .line 23
    iget-object v2, p0, Landroidx/slice/SliceItemHolder;->mPool:Landroidx/slice/SliceItemHolder$SliceItemPool;

    if-eqz v2, :cond_e

    .line 24
    iput-object v1, p0, Landroidx/slice/SliceItemHolder;->mParcelable:Landroid/os/Parcelable;

    .line 25
    iput-object v1, p0, Landroidx/slice/SliceItemHolder;->mVersionedParcelable:Landroidx/versionedparcelable/VersionedParcelable;

    .line 26
    iput v3, p0, Landroidx/slice/SliceItemHolder;->mInt:I

    const-wide/16 v3, 0x0

    .line 27
    iput-wide v3, p0, Landroidx/slice/SliceItemHolder;->mLong:J

    .line 28
    iput-object v1, p0, Landroidx/slice/SliceItemHolder;->mStr:Ljava/lang/String;

    .line 29
    iget-object v2, v2, Landroidx/slice/SliceItemHolder$SliceItemPool;->mCached:Ljava/util/ArrayList;

    invoke-virtual {v2, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 30
    :cond_d
    iput-object v1, v0, Landroidx/slice/SliceItem;->mObj:Ljava/lang/Object;

    .line 31
    :cond_e
    :goto_4
    iput-object v1, v0, Landroidx/slice/SliceItem;->mHolder:Landroidx/slice/SliceItemHolder;

    return-object v0

    nop

    :sswitch_data_0
    .sparse-switch
        -0x54d081ca -> :sswitch_7
        -0x5220cf7e -> :sswitch_6
        0x197ef -> :sswitch_5
        0x32c67c -> :sswitch_4
        0x36452d -> :sswitch_3
        0x5faa95b -> :sswitch_2
        0x5fb57ca -> :sswitch_1
        0x6873d92 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static write(Landroidx/slice/SliceItem;Landroidx/versionedparcelable/VersionedParcel;)V
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
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    new-instance v0, Landroidx/slice/SliceItemHolder;

    iget-object v1, p0, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    iget-object v2, p0, Landroidx/slice/SliceItem;->mObj:Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Landroidx/slice/SliceItemHolder;-><init>(Ljava/lang/String;Ljava/lang/Object;Z)V

    iput-object v0, p0, Landroidx/slice/SliceItem;->mHolder:Landroidx/slice/SliceItemHolder;

    .line 4
    sget-object v0, Landroidx/slice/Slice;->NO_HINTS:[Ljava/lang/String;

    iget-object v1, p0, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 5
    iget-object v0, p0, Landroidx/slice/SliceItem;->mHints:[Ljava/lang/String;

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroidx/versionedparcelable/VersionedParcel;->writeArray([Ljava/lang/Object;I)V

    .line 6
    :cond_0
    iget-object v0, p0, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const-string v1, "text"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 7
    iget-object v0, p0, Landroidx/slice/SliceItem;->mFormat:Ljava/lang/String;

    const/4 v1, 0x2

    .line 8
    invoke-virtual {p1, v1}, Landroidx/versionedparcelable/VersionedParcel;->setOutputField(I)V

    .line 9
    invoke-virtual {p1, v0}, Landroidx/versionedparcelable/VersionedParcel;->writeString(Ljava/lang/String;)V

    .line 10
    :cond_1
    iget-object v0, p0, Landroidx/slice/SliceItem;->mSubType:Ljava/lang/String;

    if-eqz v0, :cond_2

    const/4 v1, 0x3

    .line 11
    invoke-virtual {p1, v1}, Landroidx/versionedparcelable/VersionedParcel;->setOutputField(I)V

    .line 12
    invoke-virtual {p1, v0}, Landroidx/versionedparcelable/VersionedParcel;->writeString(Ljava/lang/String;)V

    .line 13
    :cond_2
    iget-object p0, p0, Landroidx/slice/SliceItem;->mHolder:Landroidx/slice/SliceItemHolder;

    const/4 v0, 0x4

    .line 14
    invoke-virtual {p1, v0}, Landroidx/versionedparcelable/VersionedParcel;->setOutputField(I)V

    .line 15
    invoke-virtual {p1, p0}, Landroidx/versionedparcelable/VersionedParcel;->writeVersionedParcelable(Landroidx/versionedparcelable/VersionedParcelable;)V

    return-void
.end method
