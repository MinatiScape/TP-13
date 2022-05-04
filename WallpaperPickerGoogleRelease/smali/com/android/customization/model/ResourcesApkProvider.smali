.class public abstract Lcom/android/customization/model/ResourcesApkProvider;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final mContext:Landroid/content/Context;

.field public final mStubApkResources:Landroid/content/res/Resources;

.field public final mStubPackageName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lcom/android/customization/model/ResourcesApkProvider;->mContext:Landroid/content/Context;

    .line 3
    iput-object p2, p0, Lcom/android/customization/model/ResourcesApkProvider;->mStubPackageName:Ljava/lang/String;

    .line 4
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 5
    iput-object v1, p0, Lcom/android/customization/model/ResourcesApkProvider;->mStubApkResources:Landroid/content/res/Resources;

    goto :goto_1

    .line 6
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    const v0, 0x100080

    .line 7
    invoke-virtual {p1, p2, v0}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object p2

    if-eqz p2, :cond_1

    .line 8
    invoke-virtual {p1, p2}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Landroid/content/pm/ApplicationInfo;)Landroid/content/res/Resources;

    move-result-object v1
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_0
    :try_start_1
    const-string p1, "ResourcesApkProvider"

    const-string p2, "Stub APK for %s not found."

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 9
    iget-object v3, p0, Lcom/android/customization/model/ResourcesApkProvider;->mStubPackageName:Ljava/lang/String;

    aput-object v3, v0, v2

    invoke-static {p2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 10
    :cond_1
    :goto_0
    iput-object v1, p0, Lcom/android/customization/model/ResourcesApkProvider;->mStubApkResources:Landroid/content/res/Resources;

    :goto_1
    return-void

    :goto_2
    iput-object v1, p0, Lcom/android/customization/model/ResourcesApkProvider;->mStubApkResources:Landroid/content/res/Resources;

    .line 11
    throw p1
.end method
