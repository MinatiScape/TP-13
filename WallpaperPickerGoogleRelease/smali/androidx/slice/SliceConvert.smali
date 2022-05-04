.class public Landroidx/slice/SliceConvert;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static unwrap(Ljava/util/Set;)Ljava/util/Set;
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "supportedSpecs"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Landroidx/slice/SliceSpec;",
            ">;)",
            "Ljava/util/Set<",
            "Landroid/app/slice/SliceSpec;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroidx/collection/ArraySet;

    const/4 v1, 0x0

    .line 2
    invoke-direct {v0, v1}, Landroidx/collection/ArraySet;-><init>(I)V

    if-eqz p0, :cond_1

    .line 3
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/slice/SliceSpec;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_1

    .line 4
    :cond_0
    new-instance v2, Landroid/app/slice/SliceSpec;

    .line 5
    iget-object v3, v1, Landroidx/slice/SliceSpec;->mType:Ljava/lang/String;

    .line 6
    iget v1, v1, Landroidx/slice/SliceSpec;->mRevision:I

    .line 7
    invoke-direct {v2, v3, v1}, Landroid/app/slice/SliceSpec;-><init>(Ljava/lang/String;I)V

    move-object v1, v2

    .line 8
    :goto_1
    invoke-virtual {v0, v1}, Landroidx/collection/ArraySet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public static wrap(Landroid/app/slice/Slice;Landroid/content/Context;)Landroidx/slice/Slice;
    .locals 17
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "slice",
            "context"
        }
    .end annotation

    move-object/from16 v1, p1

    const-string v2, "The icon resource isn\'t available."

    const-string v3, "SliceConvert"

    const/4 v0, 0x0

    if-eqz p0, :cond_c

    .line 1
    invoke-virtual/range {p0 .. p0}, Landroid/app/slice/Slice;->getUri()Landroid/net/Uri;

    move-result-object v4

    if-nez v4, :cond_0

    goto/16 :goto_5

    .line 2
    :cond_0
    invoke-virtual/range {p0 .. p0}, Landroid/app/slice/Slice;->getUri()Landroid/net/Uri;

    move-result-object v4

    .line 3
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 4
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 5
    invoke-virtual/range {p0 .. p0}, Landroid/app/slice/Slice;->getHints()Ljava/util/List;

    move-result-object v7

    .line 6
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v8

    new-array v8, v8, [Ljava/lang/String;

    invoke-interface {v7, v8}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/String;

    .line 7
    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 8
    invoke-virtual/range {p0 .. p0}, Landroid/app/slice/Slice;->getSpec()Landroid/app/slice/SliceSpec;

    move-result-object v7

    if-nez v7, :cond_1

    goto :goto_0

    .line 9
    :cond_1
    new-instance v0, Landroidx/slice/SliceSpec;

    invoke-virtual {v7}, Landroid/app/slice/SliceSpec;->getType()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7}, Landroid/app/slice/SliceSpec;->getRevision()I

    move-result v7

    invoke-direct {v0, v8, v7}, Landroidx/slice/SliceSpec;-><init>(Ljava/lang/String;I)V

    :goto_0
    move-object v7, v0

    .line 10
    invoke-virtual/range {p0 .. p0}, Landroid/app/slice/Slice;->getItems()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/slice/SliceItem;

    .line 11
    invoke-virtual {v0}, Landroid/app/slice/SliceItem;->getFormat()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v9}, Ljava/lang/String;->hashCode()I

    move-result v10

    const-string v11, "slice"

    const-string v12, "input"

    const-string v13, "image"

    const-string v14, "text"

    const-string v15, "long"

    move-object/from16 p0, v8

    const-string v8, "int"

    move-object/from16 v16, v4

    const-string v4, "action"

    sparse-switch v10, :sswitch_data_0

    goto :goto_2

    :sswitch_0
    invoke-virtual {v9, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_2

    goto :goto_2

    :cond_2
    const/4 v9, 0x7

    goto :goto_3

    :sswitch_1
    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_3

    goto :goto_2

    :cond_3
    const/4 v9, 0x6

    goto :goto_3

    :sswitch_2
    invoke-virtual {v9, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_4

    goto :goto_2

    :cond_4
    const/4 v9, 0x5

    goto :goto_3

    :sswitch_3
    invoke-virtual {v9, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_5

    goto :goto_2

    :cond_5
    const/4 v9, 0x4

    goto :goto_3

    :sswitch_4
    invoke-virtual {v9, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_6

    goto :goto_2

    :cond_6
    const/4 v9, 0x3

    goto :goto_3

    :sswitch_5
    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_7

    goto :goto_2

    :cond_7
    const/4 v9, 0x2

    goto :goto_3

    :sswitch_6
    const-string v10, "bundle"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_8

    goto :goto_2

    :cond_8
    const/4 v9, 0x1

    goto :goto_3

    :sswitch_7
    invoke-virtual {v9, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_9

    goto :goto_2

    :cond_9
    const/4 v9, 0x0

    goto :goto_3

    :goto_2
    const/4 v9, -0x1

    :goto_3
    packed-switch v9, :pswitch_data_0

    goto/16 :goto_4

    .line 12
    :pswitch_0
    invoke-virtual {v0}, Landroid/app/slice/SliceItem;->getSlice()Landroid/app/slice/Slice;

    move-result-object v4

    invoke-static {v4, v1}, Landroidx/slice/SliceConvert;->wrap(Landroid/app/slice/Slice;Landroid/content/Context;)Landroidx/slice/Slice;

    move-result-object v4

    invoke-virtual {v0}, Landroid/app/slice/SliceItem;->getSubType()Ljava/lang/String;

    move-result-object v0

    .line 13
    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    new-instance v8, Landroidx/slice/SliceItem;

    .line 15
    iget-object v9, v4, Landroidx/slice/Slice;->mHints:[Ljava/lang/String;

    .line 16
    invoke-direct {v8, v4, v11, v0, v9}, Landroidx/slice/SliceItem;-><init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_4

    .line 17
    :pswitch_1
    invoke-virtual {v0}, Landroid/app/slice/SliceItem;->getRemoteInput()Landroid/app/RemoteInput;

    move-result-object v4

    invoke-virtual {v0}, Landroid/app/slice/SliceItem;->getSubType()Ljava/lang/String;

    move-result-object v8

    .line 18
    invoke-virtual {v0}, Landroid/app/slice/SliceItem;->getHints()Ljava/util/List;

    move-result-object v0

    .line 19
    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v9

    new-array v9, v9, [Ljava/lang/String;

    invoke-interface {v0, v9}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 21
    new-instance v9, Landroidx/slice/SliceItem;

    invoke-direct {v9, v4, v12, v8, v0}, Landroidx/slice/SliceItem;-><init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_4

    .line 22
    :pswitch_2
    :try_start_0
    invoke-virtual {v0}, Landroid/app/slice/SliceItem;->getIcon()Landroid/graphics/drawable/Icon;

    move-result-object v4

    invoke-static {v1, v4}, Landroidx/core/graphics/drawable/IconCompat;->createFromIcon(Landroid/content/Context;Landroid/graphics/drawable/Icon;)Landroidx/core/graphics/drawable/IconCompat;

    move-result-object v4

    .line 23
    invoke-virtual {v0}, Landroid/app/slice/SliceItem;->getSubType()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0}, Landroid/app/slice/SliceItem;->getHints()Ljava/util/List;

    move-result-object v0

    .line 24
    invoke-static {v4}, Landroidx/slice/Slice;->isValidIcon(Landroidx/core/graphics/drawable/IconCompat;)Z

    move-result v9

    if-eqz v9, :cond_a

    .line 25
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v9

    new-array v9, v9, [Ljava/lang/String;

    invoke-interface {v0, v9}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 26
    invoke-static {v4}, Landroidx/slice/Slice;->isValidIcon(Landroidx/core/graphics/drawable/IconCompat;)Z

    move-result v9

    if-eqz v9, :cond_a

    .line 27
    new-instance v9, Landroidx/slice/SliceItem;

    invoke-direct {v9, v4, v13, v8, v0}, Landroidx/slice/SliceItem;-><init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_4

    :catch_0
    move-exception v0

    .line 28
    invoke-static {v3, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_4

    :catch_1
    move-exception v0

    .line 29
    invoke-static {v3, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_4

    .line 30
    :pswitch_3
    invoke-virtual {v0}, Landroid/app/slice/SliceItem;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v0}, Landroid/app/slice/SliceItem;->getSubType()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0}, Landroid/app/slice/SliceItem;->getHints()Ljava/util/List;

    move-result-object v0

    .line 31
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v9

    new-array v9, v9, [Ljava/lang/String;

    invoke-interface {v0, v9}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 32
    new-instance v9, Landroidx/slice/SliceItem;

    invoke-direct {v9, v4, v14, v8, v0}, Landroidx/slice/SliceItem;-><init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_4

    .line 33
    :pswitch_4
    invoke-virtual {v0}, Landroid/app/slice/SliceItem;->getLong()J

    move-result-wide v8

    invoke-virtual {v0}, Landroid/app/slice/SliceItem;->getSubType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Landroid/app/slice/SliceItem;->getHints()Ljava/util/List;

    move-result-object v0

    .line 34
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v10

    new-array v10, v10, [Ljava/lang/String;

    invoke-interface {v0, v10}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 35
    new-instance v10, Landroidx/slice/SliceItem;

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-direct {v10, v8, v15, v4, v0}, Landroidx/slice/SliceItem;-><init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 36
    :pswitch_5
    invoke-virtual {v0}, Landroid/app/slice/SliceItem;->getInt()I

    move-result v4

    invoke-virtual {v0}, Landroid/app/slice/SliceItem;->getSubType()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0}, Landroid/app/slice/SliceItem;->getHints()Ljava/util/List;

    move-result-object v0

    .line 37
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v10

    new-array v10, v10, [Ljava/lang/String;

    invoke-interface {v0, v10}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 38
    new-instance v10, Landroidx/slice/SliceItem;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v10, v4, v8, v9, v0}, Landroidx/slice/SliceItem;-><init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 39
    :pswitch_6
    new-instance v4, Landroidx/slice/SliceItem;

    invoke-virtual {v0}, Landroid/app/slice/SliceItem;->getBundle()Landroid/os/Bundle;

    move-result-object v8

    invoke-virtual {v0}, Landroid/app/slice/SliceItem;->getFormat()Ljava/lang/String;

    move-result-object v9

    .line 40
    invoke-virtual {v0}, Landroid/app/slice/SliceItem;->getSubType()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0}, Landroid/app/slice/SliceItem;->getHints()Ljava/util/List;

    move-result-object v0

    .line 41
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v11

    new-array v11, v11, [Ljava/lang/String;

    invoke-interface {v0, v11}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    invoke-direct {v4, v8, v9, v10, v0}, Landroidx/slice/SliceItem;-><init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 42
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 43
    :pswitch_7
    invoke-virtual {v0}, Landroid/app/slice/SliceItem;->getAction()Landroid/app/PendingIntent;

    move-result-object v8

    invoke-virtual {v0}, Landroid/app/slice/SliceItem;->getSlice()Landroid/app/slice/Slice;

    move-result-object v9

    invoke-static {v9, v1}, Landroidx/slice/SliceConvert;->wrap(Landroid/app/slice/Slice;Landroid/content/Context;)Landroidx/slice/Slice;

    move-result-object v9

    .line 44
    invoke-virtual {v0}, Landroid/app/slice/SliceItem;->getSubType()Ljava/lang/String;

    move-result-object v0

    .line 45
    invoke-static {v8}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    invoke-static {v9}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    iget-object v10, v9, Landroidx/slice/Slice;->mHints:[Ljava/lang/String;

    .line 48
    new-instance v11, Landroidx/slice/SliceItem;

    .line 49
    new-instance v12, Landroidx/core/util/Pair;

    invoke-direct {v12, v8, v9}, Landroidx/core/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {v11, v12, v4, v0, v10}, Landroidx/slice/SliceItem;-><init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 50
    invoke-virtual {v5, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_a
    :goto_4
    move-object/from16 v8, p0

    move-object/from16 v4, v16

    goto/16 :goto_1

    :cond_b
    move-object/from16 v16, v4

    .line 51
    new-instance v0, Landroidx/slice/Slice;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    move-object/from16 v2, v16

    invoke-direct {v0, v5, v1, v2, v7}, Landroidx/slice/Slice;-><init>(Ljava/util/ArrayList;[Ljava/lang/String;Landroid/net/Uri;Landroidx/slice/SliceSpec;)V

    :cond_c
    :goto_5
    return-object v0

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
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
