.class public final Lcom/android/customization/model/color/ColorUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static sFlagId:I

.field public static sSysuiRes:Landroid/content/res/Resources;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public static final isMonetEnabled(Landroid/content/Context;)Z
    .locals 5
    .param p0    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    const-string v1, "persist.systemui.flag_monet"

    .line 1
    invoke-static {v1, v0}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_3

    .line 2
    sget-object v2, Lcom/android/customization/model/color/ColorUtils;->sSysuiRes:Landroid/content/res/Resources;

    const-string v3, "com.android.systemui"

    if-nez v2, :cond_0

    .line 3
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const v2, 0x100080

    .line 4
    invoke-virtual {p0, v3, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 5
    invoke-virtual {p0, v2}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Landroid/content/pm/ApplicationInfo;)Landroid/content/res/Resources;

    move-result-object p0

    sput-object p0, Lcom/android/customization/model/color/ColorUtils;->sSysuiRes:Landroid/content/res/Resources;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string v2, "ColorUtils"

    const-string v4, "Couldn\'t read color flag, skipping section"

    .line 6
    invoke-static {v2, v4, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 7
    :cond_0
    :goto_0
    sget p0, Lcom/android/customization/model/color/ColorUtils;->sFlagId:I

    if-nez p0, :cond_2

    .line 8
    sget-object p0, Lcom/android/customization/model/color/ColorUtils;->sSysuiRes:Landroid/content/res/Resources;

    if-nez p0, :cond_1

    goto :goto_1

    :cond_1
    const-string v0, "flag_monet"

    const-string v2, "bool"

    invoke-virtual {p0, v0, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    :goto_1
    sput v0, Lcom/android/customization/model/color/ColorUtils;->sFlagId:I

    .line 9
    :cond_2
    sget p0, Lcom/android/customization/model/color/ColorUtils;->sFlagId:I

    if-lez p0, :cond_3

    .line 10
    sget-object p0, Lcom/android/customization/model/color/ColorUtils;->sSysuiRes:Landroid/content/res/Resources;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    sget v0, Lcom/android/customization/model/color/ColorUtils;->sFlagId:I

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1

    :cond_3
    return v1
.end method

.method public static final toColorString(I)Ljava/lang/String;
    .locals 3
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/Object;

    const v2, 0xffffff

    and-int/2addr p0, v2

    .line 1
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const/4 v2, 0x0

    aput-object p0, v1, v2

    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p0

    const-string v0, "%06X"

    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "java.lang.String.format(format, *args)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method
