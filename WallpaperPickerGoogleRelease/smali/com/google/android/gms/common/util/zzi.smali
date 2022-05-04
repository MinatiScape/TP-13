.class public final Lcom/google/android/gms/common/util/zzi;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static zzc:Ljava/lang/Boolean;

.field public static zzd:Ljava/lang/Boolean;

.field public static zze:Ljava/lang/Boolean;


# direct methods
.method public static zzb(Landroid/content/Context;)Z
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x18
    .end annotation

    .line 1
    sget-object v0, Lcom/google/android/gms/common/util/zzi;->zzd:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    .line 2
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v1, "cn.google"

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    .line 3
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/common/util/zzi;->zzd:Ljava/lang/Boolean;

    .line 4
    :cond_0
    sget-object v0, Lcom/google/android/gms/common/util/zzi;->zzd:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 5
    sget-object v0, Lcom/google/android/gms/common/util/zzi;->zzc:Ljava/lang/Boolean;

    if-nez v0, :cond_1

    .line 6
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const-string v0, "android.hardware.type.watch"

    invoke-virtual {p0, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    sput-object p0, Lcom/google/android/gms/common/util/zzi;->zzc:Ljava/lang/Boolean;

    .line 8
    :cond_1
    sget-object p0, Lcom/google/android/gms/common/util/zzi;->zzc:Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_2

    const/4 p0, 0x1

    return p0

    :cond_2
    const/4 p0, 0x0

    return p0
.end method
