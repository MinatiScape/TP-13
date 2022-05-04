.class public Landroidx/transition/R$id;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static getColorAttr(Landroid/content/Context;I)I
    .locals 2

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    aput p1, v0, v1

    .line 1
    invoke-virtual {p0, v0}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object p0

    .line 2
    :try_start_0
    invoke-virtual {p0, v1}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 4
    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p0

    return p0

    :catchall_0
    move-exception p1

    .line 5
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    .line 6
    throw p1
.end method

.method public static declared-synchronized merge(Ljava/util/List;Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/Category;",
            ">;",
            "Ljava/util/List<",
            "Lcom/android/wallpaper/model/Category;",
            ">;)V"
        }
    .end annotation

    const-class v0, Landroidx/transition/R$id;

    monitor-enter v0

    .line 1
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 2
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/wallpaper/model/Category;

    .line 3
    instance-of v3, v2, Lcom/android/wallpaper/model/WallpaperCategory;

    if-nez v3, :cond_1

    goto :goto_0

    .line 4
    :cond_1
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/4 v4, 0x1

    .line 5
    :cond_2
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 6
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/wallpaper/model/Category;

    .line 7
    instance-of v6, v5, Lcom/android/wallpaper/model/WallpaperCategory;

    if-nez v6, :cond_3

    goto :goto_1

    .line 8
    :cond_3
    iget-object v6, v5, Lcom/android/wallpaper/model/Category;->mCollectionId:Ljava/lang/String;

    .line 9
    iget-object v7, v2, Lcom/android/wallpaper/model/Category;->mCollectionId:Ljava/lang/String;

    .line 10
    invoke-static {v6, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 11
    check-cast v5, Lcom/android/wallpaper/model/WallpaperCategory;

    .line 12
    iget-object v3, v5, Lcom/android/wallpaper/model/WallpaperCategory;->mWallpapers:Ljava/util/List;

    .line 13
    move-object v4, v2

    check-cast v4, Lcom/android/wallpaper/model/WallpaperCategory;

    .line 14
    iget-object v4, v4, Lcom/android/wallpaper/model/WallpaperCategory;->mWallpapers:Ljava/util/List;

    .line 15
    invoke-interface {v3, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    const/4 v4, 0x0

    :cond_4
    if-eqz v4, :cond_0

    .line 16
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 17
    :cond_5
    invoke-interface {p0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static playTogether(Landroid/animation/AnimatorSet;Ljava/util/List;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/animation/AnimatorSet;",
            "Ljava/util/List<",
            "Landroid/animation/Animator;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    move v4, v1

    :goto_0
    if-ge v4, v0, :cond_0

    .line 2
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/animation/Animator;

    .line 3
    invoke-virtual {v5}, Landroid/animation/Animator;->getStartDelay()J

    move-result-wide v6

    invoke-virtual {v5}, Landroid/animation/Animator;->getDuration()J

    move-result-wide v8

    add-long/2addr v8, v6

    invoke-static {v2, v3, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    new-array v0, v0, [I

    .line 4
    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 5
    invoke-virtual {v0, v2, v3}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 6
    invoke-interface {p1, v1, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 7
    invoke-virtual {p0, p1}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    return-void

    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method
