.class public Lcom/android/customization/module/StatsLogUserEventLogger;
.super Lcom/android/wallpaper/module/NoOpUserEventLogger;
.source "SourceFile"

# interfaces
.implements Lcom/android/customization/module/ThemesUserEventLogger;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/wallpaper/module/NoOpUserEventLogger;-><init>()V

    return-void
.end method


# virtual methods
.method public final getCollectionIdHashCode(Ljava/lang/String;)I
    .locals 0

    if-eqz p1, :cond_0

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public logActionClicked(Ljava/lang/String;I)V
    .locals 13

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/customization/module/StatsLogUserEventLogger;->getCollectionIdHashCode(Ljava/lang/String;)I

    move-result v7

    const/16 v0, 0xb3

    const/16 v1, 0x8

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    .line 2
    invoke-static/range {v0 .. v12}, Lcom/android/systemui/shared/system/SysUiStatsLog;->write(IIIIIIIIIIIII)V

    return-void
.end method

.method public logAppLaunched(Landroid/content/Intent;)V
    .locals 17

    move-object/from16 v0, p1

    const-string v1, "com.android.wallpaper.LAUNCH_SOURCE"

    .line 1
    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x2

    const/4 v5, 0x3

    const/4 v6, 0x4

    const/4 v7, 0x0

    if-eqz v2, :cond_5

    .line 2
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, -0x1

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v2, "app_launched_suw"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    move v1, v6

    goto :goto_0

    :sswitch_1
    const-string v2, "app_launched_deeplink"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    move v1, v5

    goto :goto_0

    :sswitch_2
    const-string v2, "app_launched_tips"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    move v1, v4

    goto :goto_0

    :sswitch_3
    const-string v2, "app_launched_launcher"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_0

    :cond_3
    move v1, v3

    goto :goto_0

    :sswitch_4
    const-string v2, "app_launched_settings"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    goto :goto_0

    :cond_4
    move v1, v7

    :goto_0
    packed-switch v1, :pswitch_data_0

    goto :goto_2

    :pswitch_0
    move/from16 v16, v5

    goto :goto_3

    :pswitch_1
    const/4 v3, 0x7

    goto :goto_1

    :pswitch_2
    move/from16 v16, v6

    goto :goto_3

    :pswitch_3
    move/from16 v16, v4

    goto :goto_3

    :cond_5
    const-string v1, ":settings:fragment_args_key"

    .line 3
    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    const/16 v3, 0x8

    :goto_1
    :pswitch_4
    move/from16 v16, v3

    goto :goto_3

    .line 4
    :cond_6
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_7

    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    const-string v2, "android.service.wallpaper.CROP_AND_SET_WALLPAPER"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    const/4 v3, 0x6

    goto :goto_1

    .line 5
    :cond_7
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getCategories()Ljava/util/Set;

    move-result-object v1

    if-eqz v1, :cond_8

    .line 6
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getCategories()Ljava/util/Set;

    move-result-object v0

    const-string v1, "android.intent.category.LAUNCHER"

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v3, 0x5

    goto :goto_1

    :cond_8
    :goto_2
    move/from16 v16, v7

    :goto_3
    const/16 v4, 0xb3

    const/16 v5, 0x16

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    .line 7
    invoke-static/range {v4 .. v16}, Lcom/android/systemui/shared/system/SysUiStatsLog;->write(IIIIIIIIIIIII)V

    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        -0x7563406e -> :sswitch_4
        -0x1ec6ecf1 -> :sswitch_3
        0x8016627 -> :sswitch_2
        0x5a9b5a55 -> :sswitch_1
        0x7c211186 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_4
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public logCategorySelected(Ljava/lang/String;)V
    .locals 13

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/customization/module/StatsLogUserEventLogger;->getCollectionIdHashCode(Ljava/lang/String;)I

    move-result v7

    const/16 v0, 0xb3

    const/4 v1, 0x5

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    .line 2
    invoke-static/range {v0 .. v12}, Lcom/android/systemui/shared/system/SysUiStatsLog;->write(IIIIIIIIIIIII)V

    return-void
.end method

.method public logColorApplied(II)V
    .locals 13

    const/16 v0, 0xb3

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move v1, p1

    move v9, p2

    .line 1
    invoke-static/range {v0 .. v12}, Lcom/android/systemui/shared/system/SysUiStatsLog;->write(IIIIIIIIIIIII)V

    return-void
.end method

.method public logGridApplied(Lcom/android/customization/model/grid/GridOption;)V
    .locals 13

    .line 1
    iget v6, p1, Lcom/android/customization/model/grid/GridOption;->cols:I

    const/16 v0, 0xb3

    const/4 v1, 0x4

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-static/range {v0 .. v12}, Lcom/android/systemui/shared/system/SysUiStatsLog;->write(IIIIIIIIIIIII)V

    return-void
.end method

.method public logGridSelected(Lcom/android/customization/model/grid/GridOption;)V
    .locals 13

    .line 1
    iget v6, p1, Lcom/android/customization/model/grid/GridOption;->cols:I

    const/16 v0, 0xb3

    const/4 v1, 0x3

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-static/range {v0 .. v12}, Lcom/android/systemui/shared/system/SysUiStatsLog;->write(IIIIIIIIIIIII)V

    return-void
.end method

.method public logIndividualWallpaperSelected(Ljava/lang/String;)V
    .locals 13

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/customization/module/StatsLogUserEventLogger;->getCollectionIdHashCode(Ljava/lang/String;)I

    move-result v7

    const/16 v0, 0xb3

    const/4 v1, 0x6

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    .line 2
    invoke-static/range {v0 .. v12}, Lcom/android/systemui/shared/system/SysUiStatsLog;->write(IIIIIIIIIIIII)V

    return-void
.end method

.method public logResumed(ZZ)V
    .locals 13

    const/16 v0, 0xb3

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    .line 1
    invoke-static/range {v0 .. v12}, Lcom/android/systemui/shared/system/SysUiStatsLog;->write(IIIIIIIIIIIII)V

    return-void
.end method

.method public logStopped()V
    .locals 13

    const/16 v0, 0xb3

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    .line 1
    invoke-static/range {v0 .. v12}, Lcom/android/systemui/shared/system/SysUiStatsLog;->write(IIIIIIIIIIIII)V

    return-void
.end method

.method public logWallpaperSet(Ljava/lang/String;Ljava/lang/String;)V
    .locals 13

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/customization/module/StatsLogUserEventLogger;->getCollectionIdHashCode(Ljava/lang/String;)I

    move-result v7

    if-eqz p2, :cond_0

    .line 2
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    move v8, p0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/16 v0, 0xb3

    const/4 v1, 0x7

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 3
    invoke-static/range {v0 .. v12}, Lcom/android/systemui/shared/system/SysUiStatsLog;->write(IIIIIIIIIIIII)V

    return-void
.end method
