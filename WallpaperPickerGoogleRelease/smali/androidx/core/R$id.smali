.class public final Landroidx/core/R$id;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static getActionIconForType(I)I
    .locals 1

    const/4 v0, 0x2

    if-ne p0, v0, :cond_0

    const p0, 0x7f0800a1

    return p0

    .line 1
    :cond_0
    sget-object p0, Lcom/android/wallpaper/model/WallpaperInfo;->sExecutor:Ljava/util/concurrent/ExecutorService;

    const p0, 0x7f0800ac

    return p0
.end method

.method public static getActionLabelForType(I)I
    .locals 1

    const/4 v0, 0x2

    if-ne p0, v0, :cond_0

    const p0, 0x7f110045

    return p0

    .line 1
    :cond_0
    sget-object p0, Lcom/android/wallpaper/model/WallpaperInfo;->sExecutor:Ljava/util/concurrent/ExecutorService;

    const p0, 0x7f110080

    return p0
.end method

.method public static zza(Ljava/lang/Object;)Lcom/google/android/gms/common/internal/zzam;
    .locals 2

    .line 2
    new-instance v0, Lcom/google/android/gms/common/internal/zzam;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/common/internal/zzam;-><init>(Ljava/lang/Object;Landroidx/preference/R$layout;)V

    return-object v0
.end method

.method public static zza(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0

    if-eq p0, p1, :cond_1

    if-eqz p0, :cond_0

    .line 1
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method
