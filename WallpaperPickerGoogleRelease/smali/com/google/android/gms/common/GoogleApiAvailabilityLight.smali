.class public Lcom/google/android/gms/common/GoogleApiAvailabilityLight;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final GOOGLE_PLAY_SERVICES_VERSION_CODE:I


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/common/GooglePlayServicesUtilLight;->zza:Ljava/util/concurrent/atomic/AtomicBoolean;

    const v0, 0xbf2d68

    sput v0, Lcom/google/android/gms/common/GoogleApiAvailabilityLight;->GOOGLE_PLAY_SERVICES_VERSION_CODE:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getErrorResolutionIntent(Landroid/content/Context;ILjava/lang/String;)Landroid/content/Intent;
    .locals 2

    const/4 p0, 0x1

    const-string v0, "com.google.android.gms"

    if-eq p2, p0, :cond_1

    const/4 p0, 0x2

    if-eq p2, p0, :cond_1

    const/4 p0, 0x3

    const/4 p1, 0x0

    if-eq p2, p0, :cond_0

    return-object p1

    .line 1
    :cond_0
    sget p0, Lcom/google/android/gms/common/internal/zzs;->$r8$clinit:I

    const-string p0, "package"

    .line 2
    invoke-static {p0, v0, p1}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    .line 3
    new-instance p1, Landroid/content/Intent;

    const-string p2, "android.settings.APPLICATION_DETAILS_SETTINGS"

    invoke-direct {p1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 4
    invoke-virtual {p1, p0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    return-object p1

    :cond_1
    if-eqz p1, :cond_2

    .line 5
    invoke-static {p1}, Lcom/google/android/gms/common/util/zzi;->zzb(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_2

    .line 6
    sget p0, Lcom/google/android/gms/common/internal/zzs;->$r8$clinit:I

    .line 7
    new-instance p0, Landroid/content/Intent;

    const-string p1, "com.google.android.clockwork.home.UPDATE_ANDROID_WEAR_ACTION"

    invoke-direct {p0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string p1, "com.google.android.wearable.app"

    .line 8
    invoke-virtual {p0, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    return-object p0

    :cond_2
    const-string p0, "gcore_"

    .line 9
    invoke-static {p0}, Landroid/support/media/ExifInterface$ByteOrderedDataInputStream$$ExternalSyntheticOutline0;->m(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 10
    sget p2, Lcom/google/android/gms/common/GoogleApiAvailabilityLight;->GOOGLE_PLAY_SERVICES_VERSION_CODE:I

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, "-"

    .line 11
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 13
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    :cond_3
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p1, :cond_4

    .line 15
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    :cond_4
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p1, :cond_5

    .line 17
    :try_start_0
    invoke-static {p1}, Lcom/google/android/gms/internal/zzbmk;->zza(Landroid/content/Context;)Lcom/google/android/gms/internal/zzbmj;

    move-result-object p2

    .line 18
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    const/4 p3, 0x0

    .line 19
    iget-object p2, p2, Lcom/google/android/gms/internal/zzbmj;->zza:Landroid/content/Context;

    invoke-virtual {p2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p2

    invoke-virtual {p2, p1, p3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p1

    .line 20
    iget p1, p1, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    :catch_0
    :cond_5
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 22
    sget p1, Lcom/google/android/gms/common/internal/zzs;->$r8$clinit:I

    .line 23
    new-instance p1, Landroid/content/Intent;

    const-string p2, "android.intent.action.VIEW"

    invoke-direct {p1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string p2, "market://details"

    .line 24
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    .line 25
    invoke-virtual {p2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p2

    const-string p3, "id"

    .line 26
    invoke-virtual {p2, p3, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p2

    .line 27
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_6

    const-string p3, "pcampaignid"

    .line 28
    invoke-virtual {p2, p3, p0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 29
    :cond_6
    invoke-virtual {p2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    .line 30
    invoke-virtual {p1, p0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string p0, "com.android.vending"

    .line 31
    invoke-virtual {p1, p0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const/high16 p0, 0x80000

    .line 32
    invoke-virtual {p1, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    return-object p1
.end method

.method public getErrorResolutionPendingIntent(Landroid/content/Context;IILjava/lang/String;)Landroid/app/PendingIntent;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p4}, Lcom/google/android/gms/common/GoogleApiAvailabilityLight;->getErrorResolutionIntent(Landroid/content/Context;ILjava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const/high16 p2, 0x8000000

    .line 2
    invoke-static {p1, p3, p0, p2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    return-object p0
.end method

.method public isGooglePlayServicesAvailable(Landroid/content/Context;I)I
    .locals 10

    .line 1
    sget-object p0, Lcom/google/android/gms/common/GooglePlayServicesUtilLight;->zza:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f110061

    .line 3
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    const-string p0, "GooglePlayServicesUtil"

    const-string v0, "The Google Play services resources were not found. Check your project configuration to ensure that the resources are included."

    .line 4
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    const-string p0, "com.google.android.gms"

    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    const/4 v0, 0x1

    if-nez p0, :cond_4

    .line 6
    sget-object p0, Lcom/google/android/gms/common/GooglePlayServicesUtilLight;->zzf:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p0

    if-nez p0, :cond_4

    .line 7
    sget-object p0, Lcom/google/android/gms/common/internal/zzaj;->zza:Ljava/lang/Object;

    monitor-enter p0

    .line 8
    :try_start_1
    sget-boolean v1, Lcom/google/android/gms/common/internal/zzaj;->zzb:Z

    if-eqz v1, :cond_0

    .line 9
    monitor-exit p0

    goto :goto_2

    .line 10
    :cond_0
    sput-boolean v0, Lcom/google/android/gms/common/internal/zzaj;->zzb:Z

    .line 11
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 12
    invoke-static {p1}, Lcom/google/android/gms/internal/zzbmk;->zza(Landroid/content/Context;)Lcom/google/android/gms/internal/zzbmj;

    move-result-object v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    const/16 v3, 0x80

    .line 13
    :try_start_2
    iget-object v2, v2, Lcom/google/android/gms/internal/zzbmj;->zza:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v2, v1, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    .line 14
    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-nez v1, :cond_1

    .line 15
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_2

    :cond_1
    :try_start_4
    const-string v2, "com.google.app.id"

    .line 16
    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    const-string v2, "com.google.android.gms.version"

    .line 17
    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    sput v1, Lcom/google/android/gms/common/internal/zzaj;->zzd:I
    :try_end_4
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_1

    :catch_0
    move-exception v1

    :try_start_5
    const-string v2, "MetadataValueReader"

    const-string v3, "This should never happen."

    .line 18
    invoke-static {v2, v3, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 19
    :goto_1
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 20
    :goto_2
    sget p0, Lcom/google/android/gms/common/internal/zzaj;->zzd:I

    if-eqz p0, :cond_3

    const v1, 0xbf2d68

    if-ne p0, v1, :cond_2

    goto :goto_3

    .line 21
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const/16 p2, 0x140

    const-string v0, "The meta-data tag in your app\'s AndroidManifest.xml does not have the right value.  Expected "

    const-string v2, " but found "

    invoke-static {p2, v0, v1, v2, p0}, Lcom/bumptech/glide/gifdecoder/GifHeaderParser$$ExternalSyntheticOutline0;->m(ILjava/lang/String;ILjava/lang/String;I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p2, ".  You must have the following declaration within the <application> element:     <meta-data android:name=\"com.google.android.gms.version\" android:value=\"@integer/google_play_services_version\" />"

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 22
    :cond_3
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "A required meta-data tag in your app\'s AndroidManifest.xml does not exist.  You must have the following declaration within the <application> element:     <meta-data android:name=\"com.google.android.gms.version\" android:value=\"@integer/google_play_services_version\" />"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :catchall_1
    move-exception p1

    .line 23
    :try_start_6
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    throw p1

    .line 24
    :cond_4
    :goto_3
    invoke-static {p1}, Lcom/google/android/gms/common/util/zzi;->zzb(Landroid/content/Context;)Z

    move-result p0

    const/4 v1, 0x0

    if-nez p0, :cond_8

    .line 25
    sget-object p0, Lcom/google/android/gms/common/util/zzi;->zze:Ljava/lang/Boolean;

    if-nez p0, :cond_7

    .line 26
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const-string v2, "android.hardware.type.iot"

    invoke-virtual {p0, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_6

    .line 27
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const-string v2, "android.hardware.type.embedded"

    invoke-virtual {p0, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_5

    goto :goto_4

    :cond_5
    move p0, v1

    goto :goto_5

    :cond_6
    :goto_4
    move p0, v0

    .line 28
    :goto_5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    sput-object p0, Lcom/google/android/gms/common/util/zzi;->zze:Ljava/lang/Boolean;

    .line 29
    :cond_7
    sget-object p0, Lcom/google/android/gms/common/util/zzi;->zze:Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-nez p0, :cond_8

    move p0, v0

    goto :goto_6

    :cond_8
    move p0, v1

    :goto_6
    if-ltz p2, :cond_9

    move v2, v0

    goto :goto_7

    :cond_9
    move v2, v1

    .line 30
    :goto_7
    invoke-static {v2}, Landroidx/preference/R$string;->zzb(Z)V

    .line 31
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const/4 v3, 0x0

    const/16 v4, 0x9

    if-eqz p0, :cond_a

    :try_start_7
    const-string v3, "com.android.vending"

    const/16 v5, 0x2040

    .line 32
    invoke-virtual {v2, v3, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3
    :try_end_7
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_7 .. :try_end_7} :catch_1

    goto :goto_8

    :catch_1
    const-string p0, "GooglePlayServicesUtil"

    const-string p2, "Google Play Store is missing."

    .line 33
    invoke-static {p0, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_b

    :cond_a
    :goto_8
    :try_start_8
    const-string v5, "com.google.android.gms"

    const/16 v6, 0x40

    .line 34
    invoke-virtual {v2, v5, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v5
    :try_end_8
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_8 .. :try_end_8} :catch_3

    .line 35
    const-class v6, Lcom/google/android/gms/common/GoogleSignatureVerifier;

    monitor-enter v6

    .line 36
    :try_start_9
    sget-object v7, Lcom/google/android/gms/common/GoogleSignatureVerifier;->zza:Lcom/google/android/gms/common/GoogleSignatureVerifier;

    if-nez v7, :cond_c

    .line 37
    const-class v7, Lcom/google/android/gms/common/zze;

    monitor-enter v7
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .line 38
    :try_start_a
    sget-object v8, Lcom/google/android/gms/common/zze;->zzc:Landroid/content/Context;

    if-nez v8, :cond_b

    .line 39
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    sput-object v8, Lcom/google/android/gms/common/zze;->zzc:Landroid/content/Context;
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    :try_start_b
    monitor-exit v7
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    goto :goto_9

    :cond_b
    :try_start_c
    const-string v8, "GoogleCertificates"

    const-string v9, "GoogleCertificates has been initialized already"

    .line 40
    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 41
    :try_start_d
    monitor-exit v7

    .line 42
    :goto_9
    new-instance v7, Lcom/google/android/gms/common/GoogleSignatureVerifier;

    invoke-direct {v7, p1}, Lcom/google/android/gms/common/GoogleSignatureVerifier;-><init>(Landroid/content/Context;)V

    sput-object v7, Lcom/google/android/gms/common/GoogleSignatureVerifier;->zza:Lcom/google/android/gms/common/GoogleSignatureVerifier;

    goto :goto_a

    :catchall_2
    move-exception p0

    .line 43
    monitor-exit v7

    throw p0

    .line 44
    :cond_c
    :goto_a
    monitor-exit v6
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    .line 45
    invoke-static {v5, v0}, Lcom/google/android/gms/common/GoogleSignatureVerifier;->zza(Landroid/content/pm/PackageInfo;Z)Z

    move-result v6

    if-nez v6, :cond_d

    const-string p0, "GooglePlayServicesUtil"

    const-string p2, "Google Play services signature invalid."

    .line 46
    invoke-static {p0, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_b

    :cond_d
    if-eqz p0, :cond_f

    .line 47
    invoke-static {v3, v0}, Lcom/google/android/gms/common/GoogleSignatureVerifier;->zza(Landroid/content/pm/PackageInfo;Z)Z

    move-result p0

    if-eqz p0, :cond_e

    iget-object p0, v3, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    aget-object p0, p0, v1

    iget-object v3, v5, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    aget-object v3, v3, v1

    .line 48
    invoke-virtual {p0, v3}, Landroid/content/pm/Signature;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f

    :cond_e
    const-string p0, "GooglePlayServicesUtil"

    const-string p2, "Google Play Store signature invalid."

    .line 49
    invoke-static {p0, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_b
    move v0, v4

    goto :goto_f

    .line 50
    :cond_f
    iget p0, v5, Landroid/content/pm/PackageInfo;->versionCode:I

    const/4 v3, -0x1

    if-ne p0, v3, :cond_10

    move v4, v3

    goto :goto_c

    .line 51
    :cond_10
    div-int/lit16 v4, p0, 0x3e8

    :goto_c
    if-ne p2, v3, :cond_11

    goto :goto_d

    .line 52
    :cond_11
    div-int/lit16 v3, p2, 0x3e8

    :goto_d
    if-ge v4, v3, :cond_12

    const-string v0, "GooglePlayServicesUtil"

    const/16 v1, 0x4d

    .line 53
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v1, "Google Play services out of date.  Requires "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " but found "

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x2

    goto :goto_f

    .line 54
    :cond_12
    iget-object p0, v5, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-nez p0, :cond_13

    :try_start_e
    const-string p0, "com.google.android.gms"

    .line 55
    invoke-virtual {v2, p0, v1}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object p0
    :try_end_e
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_e .. :try_end_e} :catch_2

    goto :goto_e

    :catch_2
    move-exception p0

    const-string p2, "GooglePlayServicesUtil"

    const-string v1, "Google Play services missing when getting application info."

    .line 56
    invoke-static {p2, v1, p0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_f

    .line 57
    :cond_13
    :goto_e
    iget-boolean p0, p0, Landroid/content/pm/ApplicationInfo;->enabled:Z

    if-nez p0, :cond_14

    const/4 v0, 0x3

    goto :goto_f

    :cond_14
    move v0, v1

    goto :goto_f

    :catchall_3
    move-exception p0

    .line 58
    :try_start_f
    monitor-exit v6
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_3

    throw p0

    :catch_3
    const-string p0, "GooglePlayServicesUtil"

    const-string p2, "Google Play services is missing."

    .line 59
    invoke-static {p0, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    :goto_f
    invoke-static {p1, v0}, Lcom/google/android/gms/common/GooglePlayServicesUtilLight;->isPlayServicesPossiblyUpdating(Landroid/content/Context;I)Z

    move-result p0

    if-eqz p0, :cond_15

    const/16 v0, 0x12

    :cond_15
    return v0
.end method

.method public isUserResolvableError(I)Z
    .locals 1

    .line 1
    sget-object p0, Lcom/google/android/gms/common/GooglePlayServicesUtilLight;->zza:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 p0, 0x1

    if-eq p1, p0, :cond_0

    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    const/16 v0, 0x9

    if-eq p1, v0, :cond_0

    const/4 p0, 0x0

    :cond_0
    return p0
.end method
